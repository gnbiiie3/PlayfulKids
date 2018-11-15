/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import controller.exceptions.NonexistentEntityException;
import controller.exceptions.RollbackFailureException;
import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import model.Customer;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.transaction.UserTransaction;
import model.Address;

/**
 *
 * @author kanisorn
 */
public class AddressJpaController implements Serializable {

    public AddressJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Address address) throws RollbackFailureException, Exception {
        if (address.getCustomerList() == null) {
            address.setCustomerList(new ArrayList<Customer>());
        }
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            List<Customer> attachedCustomerList = new ArrayList<Customer>();
            for (Customer customerListCustomerToAttach : address.getCustomerList()) {
                customerListCustomerToAttach = em.getReference(customerListCustomerToAttach.getClass(), customerListCustomerToAttach.getCustomerid());
                attachedCustomerList.add(customerListCustomerToAttach);
            }
            address.setCustomerList(attachedCustomerList);
            em.persist(address);
            for (Customer customerListCustomer : address.getCustomerList()) {
                Address oldLastaddressOfCustomerListCustomer = customerListCustomer.getLastaddress();
                customerListCustomer.setLastaddress(address);
                customerListCustomer = em.merge(customerListCustomer);
                if (oldLastaddressOfCustomerListCustomer != null) {
                    oldLastaddressOfCustomerListCustomer.getCustomerList().remove(customerListCustomer);
                    oldLastaddressOfCustomerListCustomer = em.merge(oldLastaddressOfCustomerListCustomer);
                }
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

    public void edit(Address address) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Address persistentAddress = em.find(Address.class, address.getAddressid());
            List<Customer> customerListOld = persistentAddress.getCustomerList();
            List<Customer> customerListNew = address.getCustomerList();
            List<Customer> attachedCustomerListNew = new ArrayList<Customer>();
            for (Customer customerListNewCustomerToAttach : customerListNew) {
                customerListNewCustomerToAttach = em.getReference(customerListNewCustomerToAttach.getClass(), customerListNewCustomerToAttach.getCustomerid());
                attachedCustomerListNew.add(customerListNewCustomerToAttach);
            }
            customerListNew = attachedCustomerListNew;
            address.setCustomerList(customerListNew);
            address = em.merge(address);
            for (Customer customerListOldCustomer : customerListOld) {
                if (!customerListNew.contains(customerListOldCustomer)) {
                    customerListOldCustomer.setLastaddress(null);
                    customerListOldCustomer = em.merge(customerListOldCustomer);
                }
            }
            for (Customer customerListNewCustomer : customerListNew) {
                if (!customerListOld.contains(customerListNewCustomer)) {
                    Address oldLastaddressOfCustomerListNewCustomer = customerListNewCustomer.getLastaddress();
                    customerListNewCustomer.setLastaddress(address);
                    customerListNewCustomer = em.merge(customerListNewCustomer);
                    if (oldLastaddressOfCustomerListNewCustomer != null && !oldLastaddressOfCustomerListNewCustomer.equals(address)) {
                        oldLastaddressOfCustomerListNewCustomer.getCustomerList().remove(customerListNewCustomer);
                        oldLastaddressOfCustomerListNewCustomer = em.merge(oldLastaddressOfCustomerListNewCustomer);
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
                Integer id = address.getAddressid();
                if (findAddress(id) == null) {
                    throw new NonexistentEntityException("The address with id " + id + " no longer exists.");
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
            Address address;
            try {
                address = em.getReference(Address.class, id);
                address.getAddressid();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The address with id " + id + " no longer exists.", enfe);
            }
            List<Customer> customerList = address.getCustomerList();
            for (Customer customerListCustomer : customerList) {
                customerListCustomer.setLastaddress(null);
                customerListCustomer = em.merge(customerListCustomer);
            }
            em.remove(address);
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

    public List<Address> findAddressEntities() {
        return findAddressEntities(true, -1, -1);
    }

    public List<Address> findAddressEntities(int maxResults, int firstResult) {
        return findAddressEntities(false, maxResults, firstResult);
    }

    private List<Address> findAddressEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Address.class));
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

    public Address findAddress(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Address.class, id);
        } finally {
            em.close();
        }
    }

    public int getAddressCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Address> rt = cq.from(Address.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
