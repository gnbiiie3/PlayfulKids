/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import controller.HistorydetailJpaController;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;
import model.Account;
import model.History;
import model.Historydetail;

/**
 *
 * @author kanisorn
 */
public class HistoryServlet extends HttpServlet {

    @PersistenceUnit(unitName = "PlayfulKidsPU")
    EntityManagerFactory emf;

    @Resource
    UserTransaction utx;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        HistorydetailJpaController hisDJpaCtrl = new HistorydetailJpaController(utx, emf);
        if (account == null) {
            getServletContext().getRequestDispatcher("/Login").forward(request, response);
            return;
        }
        List<History> order = account.getHistoryList();
        List<History> order_new = new ArrayList<>();

        List<Historydetail> allHistoryDetail = hisDJpaCtrl.findHistorydetailEntities();
        List<Historydetail> listhistorylist = new ArrayList<>();

        for (History historyorder : order) {
            if (historyorder.getEmail().equals(account.getEmail())) {
                order_new.add(historyorder);
                for (Historydetail historyDetail :allHistoryDetail) {
                    if (historyDetail.getHistoryid().equals(historyorder)) {
                        listhistorylist.add(historyDetail);
                    }
                }
            }

        }
        session.setAttribute("history", order_new);
        session.setAttribute("historydetail", listhistorylist);
        System.out.println(order);
        getServletContext().getRequestDispatcher("/history.jsp").forward(request, response);
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
