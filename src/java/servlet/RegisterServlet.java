/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import controller.AccountJpaController;
import controller.AddressJpaController;
import controller.CustomerJpaController;
import controller.exceptions.RollbackFailureException;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;
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
import model.Account;
import model.Address;
import model.Customer;

/**
 *
 * @author kanisorn
 */
public class RegisterServlet extends HttpServlet {

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
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        String phoneNumber = request.getParameter("phonenumber");
        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        String addressLine1 = request.getParameter("addressline1");
        String addressLine2 = request.getParameter("addressline2");
        String district = request.getParameter("district");
        String city = request.getParameter("city");
        String province = request.getParameter("province");
        String postalCode = request.getParameter("postalcode");

        HttpSession session = request.getSession(false);
        if (email != null && password != null && confirmPassword != null && phoneNumber != null && firstName != null && lastName != null & addressLine1 != null && district != null && city != null && province != null && postalCode != null) {
            password = cryptWithMD5(password);
            confirmPassword = cryptWithMD5(confirmPassword);
            if (password.equals(confirmPassword)) {

                if (email != null) {
                    AccountJpaController accJpaCtrl = new AccountJpaController(utx, emf);
                    AddressJpaController addJpaCtrl = new AddressJpaController(utx, emf);
                    CustomerJpaController cusJpaCtrl = new CustomerJpaController(utx, emf);
                    List<Account> accountInDatabase = accJpaCtrl.findAccountEntities();
                    for (Account account : accountInDatabase) {
                        if (account.getEmail().equalsIgnoreCase(email)) {
                            request.setAttribute("message", "อีเมลนี้ได้ถูกใช้งานแล้ว กรุณาเปลี่ยนอีเมล");
                            getServletContext().getRequestDispatcher("/register.jsp").forward(request, response);
                        }
                    }
                    Account newAccount = new Account();
                    Address newAddress = new Address();
                    Customer newCustomer = new Customer();
                    newAddress.setAddressline1(addressLine1);
                    newAddress.setAddressline2(addressLine2);
                    newAddress.setDistrict(district);
                    newAddress.setCity(city);
                    newAddress.setProvince(province);
                    newAddress.setPostalcode(postalCode);
                    newCustomer.setFirstname(firstName);
                    newCustomer.setLastname(lastName);
                    newCustomer.setPhonenumber(phoneNumber);
                    newCustomer.setLastaddress(newAddress);
                    newAccount.setEmail(email);
                    newAccount.setPassword(password);

                    try {
                        addJpaCtrl.create(newAddress);
                        cusJpaCtrl.create(newCustomer);
                        accJpaCtrl.create(newAccount);
                        session.setAttribute("newaccount", newAccount);
                        getServletContext().getRequestDispatcher("/registercomplete.jsp").forward(request, response);
                    } catch (RollbackFailureException ex) {
                        Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
                    } catch (Exception ex) {
                        Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }

            } else {
                request.setAttribute("message", "รหัสผ่านของคุณทั้งสองช่องไม่ตรงกัน");
                getServletContext().getRequestDispatcher("/register.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("message", "คุณยังกรอกข้อมูลไม่ครบถ้วน");
            getServletContext().getRequestDispatcher("/register.jsp").forward(request, response);
        }
    }

    public static String cryptWithMD5(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] passBytes = password.getBytes();
            md.reset();
            byte[] digested = md.digest(passBytes);
            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < digested.length; i++) {
                sb.append(Integer.toHexString(0xff & digested[i]));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException ex) {
            System.out.println(ex);
        }
        return null;
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
