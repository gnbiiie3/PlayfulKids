/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import controller.exceptions.IllegalOrphanException;
import controller.exceptions.NonexistentEntityException;
import controller.exceptions.PreexistingEntityException;
import controller.exceptions.RollbackFailureException;
import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import model.Category;
import model.Historydetail;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.transaction.UserTransaction;
import model.Product;

/**
 *
 * @author kanisorn
 */
public class ProductJpaController implements Serializable {

    public ProductJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Product product) throws PreexistingEntityException, RollbackFailureException, Exception {
        if (product.getHistorydetailList() == null) {
            product.setHistorydetailList(new ArrayList<Historydetail>());
        }
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Category productcategory = product.getProductcategory();
            if (productcategory != null) {
                productcategory = em.getReference(productcategory.getClass(), productcategory.getCategoryid());
                product.setProductcategory(productcategory);
            }
            List<Historydetail> attachedHistorydetailList = new ArrayList<Historydetail>();
            for (Historydetail historydetailListHistorydetailToAttach : product.getHistorydetailList()) {
                historydetailListHistorydetailToAttach = em.getReference(historydetailListHistorydetailToAttach.getClass(), historydetailListHistorydetailToAttach.getProductbuyid());
                attachedHistorydetailList.add(historydetailListHistorydetailToAttach);
            }
            product.setHistorydetailList(attachedHistorydetailList);
            em.persist(product);
            if (productcategory != null) {
                productcategory.getProductList().add(product);
                productcategory = em.merge(productcategory);
            }
            for (Historydetail historydetailListHistorydetail : product.getHistorydetailList()) {
                Product oldProductidOfHistorydetailListHistorydetail = historydetailListHistorydetail.getProductid();
                historydetailListHistorydetail.setProductid(product);
                historydetailListHistorydetail = em.merge(historydetailListHistorydetail);
                if (oldProductidOfHistorydetailListHistorydetail != null) {
                    oldProductidOfHistorydetailListHistorydetail.getHistorydetailList().remove(historydetailListHistorydetail);
                    oldProductidOfHistorydetailListHistorydetail = em.merge(oldProductidOfHistorydetailListHistorydetail);
                }
            }
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            if (findProduct(product.getProductid()) != null) {
                throw new PreexistingEntityException("Product " + product + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Product product) throws IllegalOrphanException, NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Product persistentProduct = em.find(Product.class, product.getProductid());
            Category productcategoryOld = persistentProduct.getProductcategory();
            Category productcategoryNew = product.getProductcategory();
            List<Historydetail> historydetailListOld = persistentProduct.getHistorydetailList();
            List<Historydetail> historydetailListNew = product.getHistorydetailList();
            List<String> illegalOrphanMessages = null;
            for (Historydetail historydetailListOldHistorydetail : historydetailListOld) {
                if (!historydetailListNew.contains(historydetailListOldHistorydetail)) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("You must retain Historydetail " + historydetailListOldHistorydetail + " since its productid field is not nullable.");
                }
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            if (productcategoryNew != null) {
                productcategoryNew = em.getReference(productcategoryNew.getClass(), productcategoryNew.getCategoryid());
                product.setProductcategory(productcategoryNew);
            }
            List<Historydetail> attachedHistorydetailListNew = new ArrayList<Historydetail>();
            for (Historydetail historydetailListNewHistorydetailToAttach : historydetailListNew) {
                historydetailListNewHistorydetailToAttach = em.getReference(historydetailListNewHistorydetailToAttach.getClass(), historydetailListNewHistorydetailToAttach.getProductbuyid());
                attachedHistorydetailListNew.add(historydetailListNewHistorydetailToAttach);
            }
            historydetailListNew = attachedHistorydetailListNew;
            product.setHistorydetailList(historydetailListNew);
            product = em.merge(product);
            if (productcategoryOld != null && !productcategoryOld.equals(productcategoryNew)) {
                productcategoryOld.getProductList().remove(product);
                productcategoryOld = em.merge(productcategoryOld);
            }
            if (productcategoryNew != null && !productcategoryNew.equals(productcategoryOld)) {
                productcategoryNew.getProductList().add(product);
                productcategoryNew = em.merge(productcategoryNew);
            }
            for (Historydetail historydetailListNewHistorydetail : historydetailListNew) {
                if (!historydetailListOld.contains(historydetailListNewHistorydetail)) {
                    Product oldProductidOfHistorydetailListNewHistorydetail = historydetailListNewHistorydetail.getProductid();
                    historydetailListNewHistorydetail.setProductid(product);
                    historydetailListNewHistorydetail = em.merge(historydetailListNewHistorydetail);
                    if (oldProductidOfHistorydetailListNewHistorydetail != null && !oldProductidOfHistorydetailListNewHistorydetail.equals(product)) {
                        oldProductidOfHistorydetailListNewHistorydetail.getHistorydetailList().remove(historydetailListNewHistorydetail);
                        oldProductidOfHistorydetailListNewHistorydetail = em.merge(oldProductidOfHistorydetailListNewHistorydetail);
                    }
                }
            }
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = product.getProductid();
                if (findProduct(id) == null) {
                    throw new NonexistentEntityException("The product with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(Integer id) throws IllegalOrphanException, NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Product product;
            try {
                product = em.getReference(Product.class, id);
                product.getProductid();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The product with id " + id + " no longer exists.", enfe);
            }
            List<String> illegalOrphanMessages = null;
            List<Historydetail> historydetailListOrphanCheck = product.getHistorydetailList();
            for (Historydetail historydetailListOrphanCheckHistorydetail : historydetailListOrphanCheck) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Product (" + product + ") cannot be destroyed since the Historydetail " + historydetailListOrphanCheckHistorydetail + " in its historydetailList field has a non-nullable productid field.");
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            Category productcategory = product.getProductcategory();
            if (productcategory != null) {
                productcategory.getProductList().remove(product);
                productcategory = em.merge(productcategory);
            }
            em.remove(product);
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Product> findProductEntities() {
        return findProductEntities(true, -1, -1);
    }

    public List<Product> findProductEntities(int maxResults, int firstResult) {
        return findProductEntities(false, maxResults, firstResult);
    }

    private List<Product> findProductEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Product.class));
            Query q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public Product findProduct(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Product.class, id);
        } finally {
            em.close();
        }
    }

    public int getProductCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Product> rt = cq.from(Product.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
