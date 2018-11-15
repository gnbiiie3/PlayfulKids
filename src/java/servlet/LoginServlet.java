/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import controller.AccountJpaController;
import java.io.IOException;
import java.io.PrintWriter;
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

/**
 *
 * @author Sarita
 */
public class LoginServlet extends HttpServlet {
    @PersistenceUnit (unitName = "PlayfulPU")
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
        String accountid = request.getParameter("id");
        String password = request.getParameter("pass");
        int id = 0 ;
        
        AccountJpaController accCtrl = new AccountJpaController(utx, emf);
        HttpSession session = request.getSession(true);
        Account acc;
        
        if(accountid != null && accountid.trim().length() > 0 &&
           password != null && password.trim().length() > 0){
                id = Integer.valueOf(accountid);
        
        
     
            acc = accCtrl.findAccount(id);
            
            if(session != null){
                if(acc != null){
                    if(id == acc.getAccountid()){
                        if(password.equalsIgnoreCase(acc.getPassword())){
                            session.setAttribute("account", acc);
                            getServletContext().getRequestDispatcher("/MyAccount.jsp").forward(request, response);
                            return;
                        }
                        request.setAttribute("message", "Try again");
                        getServletContext().getRequestDispatcher("/Login.jsp").forward(request, response);
                        return;
                    }
                    request.setAttribute("message", "Try again");
                    getServletContext().getRequestDispatcher("/Login.jsp").forward(request, response);
                    return;
                }
                request.setAttribute("message", "Try again");
                getServletContext().getRequestDispatcher("/Login.jsp").forward(request, response);
                return;
            }
            getServletContext().getRequestDispatcher("/Login.jsp").forward(request, response);
        }
            
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
