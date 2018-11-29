/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import controller.AddressJpaController;
import controller.CustomerJpaController;
import controller.exceptions.NonexistentEntityException;
import controller.exceptions.RollbackFailureException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;
import model.Address;
import model.Customer;

/**
 *
 * @author kanisorn
 */
public class AddAddressServlet extends HttpServlet {

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
        HttpSession session = request.getSession();
        if (session != null) {
            Customer customer = (Customer) session.getAttribute("customer");
            AddressJpaController addJpaCtrl = new AddressJpaController(utx, emf);
            CustomerJpaController cusJpaCtrl = new CustomerJpaController(utx, emf);
            String receivername = request.getParameter("receivername");
            String addressLine1 = request.getParameter("addressline1");
            String addressLine2 = request.getParameter("addressline2");
            String district = request.getParameter("district");
            String city = request.getParameter("city");
            String province = request.getParameter("province");
            String postalCode = request.getParameter("postalcode");
            Address newAddress = new Address();
            newAddress.setReceivername(receivername);
            newAddress.setAddressline1(addressLine1);
            newAddress.setAddressline2(addressLine2);
            newAddress.setDistrict(district);
            newAddress.setCity(city);
            newAddress.setProvince(province);
            newAddress.setPostalcode(postalCode);
            customer.setLastaddress(newAddress);
            
            try {
                addJpaCtrl.create(newAddress);
                cusJpaCtrl.edit(customer);
                session.setAttribute("customer", customer);
                session.setAttribute("address", newAddress);
                getServletContext().getRequestDispatcher("Cart").forward(request, response);
            } catch (NonexistentEntityException ex) {
                Logger.getLogger(AddAddressServlet.class.getName()).log(Level.SEVERE, null, ex);
            } catch (RollbackFailureException ex) {
                Logger.getLogger(AddAddressServlet.class.getName()).log(Level.SEVERE, null, ex);
            } catch (Exception ex) {
                Logger.getLogger(AddAddressServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            
        }else{
        getServletContext().getRequestDispatcher("/Login").forward(request, response);
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
