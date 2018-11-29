/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import controller.exceptions.NonexistentEntityException;
import controller.exceptions.RollbackFailureException;
import java.io.Serializable;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import javax.transaction.UserTransaction;
import model.History;
import model.Historydetail;
import model.Product;

/**
 *
 * @author kanisorn
 */
public class HistorydetailJpaController implements Serializable {

    public HistorydetailJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Historydetail historydetail) throws RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            History historyid = historydetail.getHistoryid();
            if (historyid != null) {
                historyid = em.getReference(historyid.getClass(), historyid.getHistoryid());
                historydetail.setHistoryid(historyid);
            }
            Product productid = historydetail.getProductid();
            if (productid != null) {
                productid = em.getReference(productid.getClass(), productid.getProductid());
                historydetail.setProductid(productid);
            }
            em.persist(historydetail);
            if (historyid != null) {
                historyid.getHistorydetailList().add(historydetail);
                historyid = em.merge(historyid);
            }
            if (productid != null) {
                productid.getHistorydetailList().add(historydetail);
                productid = em.merge(productid);
            }
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

    public void edit(Historydetail historydetail) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Historydetail persistentHistorydetail = em.find(Historydetail.class, historydetail.getProductbuyid());
            History historyidOld = persistentHistorydetail.getHistoryid();
            History historyidNew = historydetail.getHistoryid();
            Product productidOld = persistentHistorydetail.getProductid();
            Product productidNew = historydetail.getProductid();
            if (historyidNew != null) {
                historyidNew = em.getReference(historyidNew.getClass(), historyidNew.getHistoryid());
                historydetail.setHistoryid(historyidNew);
            }
            if (productidNew != null) {
                productidNew = em.getReference(productidNew.getClass(), productidNew.getProductid());
                historydetail.setProductid(productidNew);
            }
            historydetail = em.merge(historydetail);
            if (historyidOld != null && !historyidOld.equals(historyidNew)) {
                historyidOld.getHistorydetailList().remove(historydetail);
                historyidOld = em.merge(historyidOld);
            }
            if (historyidNew != null && !historyidNew.equals(historyidOld)) {
                historyidNew.getHistorydetailList().add(historydetail);
                historyidNew = em.merge(historyidNew);
            }
            if (productidOld != null && !productidOld.equals(productidNew)) {
                productidOld.getHistorydetailList().remove(historydetail);
                productidOld = em.merge(productidOld);
            }
            if (productidNew != null && !productidNew.equals(productidOld)) {
                productidNew.getHistorydetailList().add(historydetail);
                productidNew = em.merge(productidNew);
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
                Integer id = historydetail.getProductbuyid();
                if (findHistorydetail(id) == null) {
                    throw new NonexistentEntityException("The historydetail with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(Integer id) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Historydetail historydetail;
            try {
                historydetail = em.getReference(Historydetail.class, id);
                historydetail.getProductbuyid();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The historydetail with id " + id + " no longer exists.", enfe);
            }
            History historyid = historydetail.getHistoryid();
            if (historyid != null) {
                historyid.getHistorydetailList().remove(historydetail);
                historyid = em.merge(historyid);
            }
            Product productid = historydetail.getProductid();
            if (productid != null) {
                productid.getHistorydetailList().remove(historydetail);
                productid = em.merge(productid);
            }
            em.remove(historydetail);
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

    public List<Historydetail> findHistorydetailEntities() {
        return findHistorydetailEntities(true, -1, -1);
    }

    public List<Historydetail> findHistorydetailEntities(int maxResults, int firstResult) {
        return findHistorydetailEntities(false, maxResults, firstResult);
    }

    private List<Historydetail> findHistorydetailEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Historydetail.class));
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

    public Historydetail findHistorydetail(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Historydetail.class, id);
        } finally {
            em.close();
        }
    }

    public int getHistorydetailCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Historydetail> rt = cq.from(Historydetail.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
