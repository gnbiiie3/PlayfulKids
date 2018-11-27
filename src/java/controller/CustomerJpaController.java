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
import model.Account;
import model.Address;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.transaction.UserTransaction;
import model.Customer;

/**
 *
 * @author kanisorn
 */
public class CustomerJpaController implements Serializable {

    public CustomerJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Customer customer) throws IllegalOrphanException, PreexistingEntityException, RollbackFailureException, Exception {
        List<String> illegalOrphanMessages = null;
        Account accountOrphanCheck = customer.getAccount();
        if (accountOrphanCheck != null) {
            Customer oldCustomerOfAccount = accountOrphanCheck.getCustomer();
            if (oldCustomerOfAccount != null) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("The Account " + accountOrphanCheck + " already has an item of type Customer whose account column cannot be null. Please make another selection for the account field.");
            }
        }
        if (illegalOrphanMessages != null) {
            throw new IllegalOrphanException(illegalOrphanMessages);
        }
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Account account = customer.getAccount();
            if (account != null) {
                account = em.getReference(account.getClass(), account.getEmail());
                customer.setAccount(account);
            }
            Address lastaddress = customer.getLastaddress();
            if (lastaddress != null) {
                lastaddress = em.getReference(lastaddress.getClass(), lastaddress.getAddressid());
                customer.setLastaddress(lastaddress);
            }
            em.persist(customer);
            if (account != null) {
                account.setCustomer(customer);
                account = em.merge(account);
            }
            if (lastaddress != null) {
                lastaddress.getCustomerList().add(customer);
                lastaddress = em.merge(lastaddress);
            }
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            if (findCustomer(customer.getEmail()) != null) {
                throw new PreexistingEntityException("Customer " + customer + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Customer customer) throws IllegalOrphanException, NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Customer persistentCustomer = em.find(Customer.class, customer.getEmail());
            Account accountOld = persistentCustomer.getAccount();
            Account accountNew = customer.getAccount();
            Address lastaddressOld = persistentCustomer.getLastaddress();
            Address lastaddressNew = customer.getLastaddress();
            List<String> illegalOrphanMessages = null;
            if (accountNew != null && !accountNew.equals(accountOld)) {
                Customer oldCustomerOfAccount = accountNew.getCustomer();
                if (oldCustomerOfAccount != null) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("The Account " + accountNew + " already has an item of type Customer whose account column cannot be null. Please make another selection for the account field.");
                }
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            if (accountNew != null) {
                accountNew = em.getReference(accountNew.getClass(), accountNew.getEmail());
                customer.setAccount(accountNew);
            }
            if (lastaddressNew != null) {
                lastaddressNew = em.getReference(lastaddressNew.getClass(), lastaddressNew.getAddressid());
                customer.setLastaddress(lastaddressNew);
            }
            customer = em.merge(customer);
            if (accountOld != null && !accountOld.equals(accountNew)) {
                accountOld.setCustomer(null);
                accountOld = em.merge(accountOld);
            }
            if (accountNew != null && !accountNew.equals(accountOld)) {
                accountNew.setCustomer(customer);
                accountNew = em.merge(accountNew);
            }
            if (lastaddressOld != null && !lastaddressOld.equals(lastaddressNew)) {
                lastaddressOld.getCustomerList().remove(customer);
                lastaddressOld = em.merge(lastaddressOld);
            }
            if (lastaddressNew != null && !lastaddressNew.equals(lastaddressOld)) {
                lastaddressNew.getCustomerList().add(customer);
                lastaddressNew = em.merge(lastaddressNew);
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
                String id = customer.getEmail();
                if (findCustomer(id) == null) {
                    throw new NonexistentEntityException("The customer with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(String id) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Customer customer;
            try {
                customer = em.getReference(Customer.class, id);
                customer.getEmail();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The customer with id " + id + " no longer exists.", enfe);
            }
            Account account = customer.getAccount();
            if (account != null) {
                account.setCustomer(null);
                account = em.merge(account);
            }
            Address lastaddress = customer.getLastaddress();
            if (lastaddress != null) {
                lastaddress.getCustomerList().remove(customer);
                lastaddress = em.merge(lastaddress);
            }
            em.remove(customer);
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

    public List<Customer> findCustomerEntities() {
        return findCustomerEntities(true, -1, -1);
    }

    public List<Customer> findCustomerEntities(int maxResults, int firstResult) {
        return findCustomerEntities(false, maxResults, firstResult);
    }

    private List<Customer> findCustomerEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Customer.class));
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

    public Customer findCustomer(String id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Customer.class, id);
        } finally {
            em.close();
        }
    }

    public int getCustomerCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Customer> rt = cq.from(Customer.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
