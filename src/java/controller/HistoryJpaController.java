/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import controller.exceptions.IllegalOrphanException;
import controller.exceptions.NonexistentEntityException;
import controller.exceptions.RollbackFailureException;
import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import model.Account;
import model.Historydetail;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.transaction.UserTransaction;
import model.History;

/**
 *
 * @author kanisorn
 */
public class HistoryJpaController implements Serializable {

    public HistoryJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(History history) throws RollbackFailureException, Exception {
        if (history.getHistorydetailList() == null) {
            history.setHistorydetailList(new ArrayList<Historydetail>());
        }
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Account email = history.getEmail();
            if (email != null) {
                email = em.getReference(email.getClass(), email.getEmail());
                history.setEmail(email);
            }
            List<Historydetail> attachedHistorydetailList = new ArrayList<Historydetail>();
            for (Historydetail historydetailListHistorydetailToAttach : history.getHistorydetailList()) {
                historydetailListHistorydetailToAttach = em.getReference(historydetailListHistorydetailToAttach.getClass(), historydetailListHistorydetailToAttach.getProductbuyid());
                attachedHistorydetailList.add(historydetailListHistorydetailToAttach);
            }
            history.setHistorydetailList(attachedHistorydetailList);
            em.persist(history);
            if (email != null) {
                email.getHistoryList().add(history);
                email = em.merge(email);
            }
            for (Historydetail historydetailListHistorydetail : history.getHistorydetailList()) {
                History oldHistoryidOfHistorydetailListHistorydetail = historydetailListHistorydetail.getHistoryid();
                historydetailListHistorydetail.setHistoryid(history);
                historydetailListHistorydetail = em.merge(historydetailListHistorydetail);
                if (oldHistoryidOfHistorydetailListHistorydetail != null) {
                    oldHistoryidOfHistorydetailListHistorydetail.getHistorydetailList().remove(historydetailListHistorydetail);
                    oldHistoryidOfHistorydetailListHistorydetail = em.merge(oldHistoryidOfHistorydetailListHistorydetail);
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

    public void edit(History history) throws IllegalOrphanException, NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            History persistentHistory = em.find(History.class, history.getHistoryid());
            Account emailOld = persistentHistory.getEmail();
            Account emailNew = history.getEmail();
            List<Historydetail> historydetailListOld = persistentHistory.getHistorydetailList();
            List<Historydetail> historydetailListNew = history.getHistorydetailList();
            List<String> illegalOrphanMessages = null;
            for (Historydetail historydetailListOldHistorydetail : historydetailListOld) {
                if (!historydetailListNew.contains(historydetailListOldHistorydetail)) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("You must retain Historydetail " + historydetailListOldHistorydetail + " since its historyid field is not nullable.");
                }
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            if (emailNew != null) {
                emailNew = em.getReference(emailNew.getClass(), emailNew.getEmail());
                history.setEmail(emailNew);
            }
            List<Historydetail> attachedHistorydetailListNew = new ArrayList<Historydetail>();
            for (Historydetail historydetailListNewHistorydetailToAttach : historydetailListNew) {
                historydetailListNewHistorydetailToAttach = em.getReference(historydetailListNewHistorydetailToAttach.getClass(), historydetailListNewHistorydetailToAttach.getProductbuyid());
                attachedHistorydetailListNew.add(historydetailListNewHistorydetailToAttach);
            }
            historydetailListNew = attachedHistorydetailListNew;
            history.setHistorydetailList(historydetailListNew);
            history = em.merge(history);
            if (emailOld != null && !emailOld.equals(emailNew)) {
                emailOld.getHistoryList().remove(history);
                emailOld = em.merge(emailOld);
            }
            if (emailNew != null && !emailNew.equals(emailOld)) {
                emailNew.getHistoryList().add(history);
                emailNew = em.merge(emailNew);
            }
            for (Historydetail historydetailListNewHistorydetail : historydetailListNew) {
                if (!historydetailListOld.contains(historydetailListNewHistorydetail)) {
                    History oldHistoryidOfHistorydetailListNewHistorydetail = historydetailListNewHistorydetail.getHistoryid();
                    historydetailListNewHistorydetail.setHistoryid(history);
                    historydetailListNewHistorydetail = em.merge(historydetailListNewHistorydetail);
                    if (oldHistoryidOfHistorydetailListNewHistorydetail != null && !oldHistoryidOfHistorydetailListNewHistorydetail.equals(history)) {
                        oldHistoryidOfHistorydetailListNewHistorydetail.getHistorydetailList().remove(historydetailListNewHistorydetail);
                        oldHistoryidOfHistorydetailListNewHistorydetail = em.merge(oldHistoryidOfHistorydetailListNewHistorydetail);
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
                Integer id = history.getHistoryid();
                if (findHistory(id) == null) {
                    throw new NonexistentEntityException("The history with id " + id + " no longer exists.");
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
            History history;
            try {
                history = em.getReference(History.class, id);
                history.getHistoryid();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The history with id " + id + " no longer exists.", enfe);
            }
            List<String> illegalOrphanMessages = null;
            List<Historydetail> historydetailListOrphanCheck = history.getHistorydetailList();
            for (Historydetail historydetailListOrphanCheckHistorydetail : historydetailListOrphanCheck) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This History (" + history + ") cannot be destroyed since the Historydetail " + historydetailListOrphanCheckHistorydetail + " in its historydetailList field has a non-nullable historyid field.");
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            Account email = history.getEmail();
            if (email != null) {
                email.getHistoryList().remove(history);
                email = em.merge(email);
            }
            em.remove(history);
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

    public List<History> findHistoryEntities() {
        return findHistoryEntities(true, -1, -1);
    }

    public List<History> findHistoryEntities(int maxResults, int firstResult) {
        return findHistoryEntities(false, maxResults, firstResult);
    }

    private List<History> findHistoryEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(History.class));
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

    public History findHistory(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(History.class, id);
        } finally {
            em.close();
        }
    }

    public int getHistoryCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<History> rt = cq.from(History.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
