/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.ProductJpaController;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.transaction.UserTransaction;
import model.Product;

/**
 *
 * @author kanisorn
 */
public class ProductListServlet extends HttpServlet {

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
        String receiverParameter = request.getParameter("category");
        response.setContentType("text/html;charset=UTF-8");
        ProductJpaController proJpaCtrl = new ProductJpaController(utx, emf);
        List<Product> allProduct = proJpaCtrl.findProductEntities();

        if (receiverParameter == null) {
            request.setAttribute("product", allProduct);
            getServletContext().getRequestDispatcher("/productPage.jsp").forward(request, response);
        } else {
            int category = Integer.parseInt(receiverParameter);
            switch (category) {
                case 1: {
                    List<Product> productType = new ArrayList<Product>();
                    for (Product thisProduct : allProduct) {
                        if (thisProduct.getProductcategory().getCategoryid() == category) {
                            productType.add(thisProduct);
                        }
                    }
                    request.setAttribute("product", productType);
                    break;
                }
                case 2: {
                    List<Product> productType = new ArrayList<Product>();
                    for (Product thisProduct : allProduct) {
                        if (thisProduct.getProductcategory().getCategoryid() == category) {
                            productType.add(thisProduct);
                        }
                    }
                    request.setAttribute("product", productType);
                    break;
                }
                case 3: {
                    List<Product> productType = new ArrayList<Product>();
                    for (Product thisProduct : allProduct) {
                        if (thisProduct.getProductcategory().getCategoryid() == category) {
                            productType.add(thisProduct);
                        }
                    }
                    request.setAttribute("product", productType);
                    break;
                }
                case 4: {
                    List<Product> productType = new ArrayList<Product>();
                    for (Product thisProduct : allProduct) {
                        if (thisProduct.getProductcategory().getCategoryid() == category) {
                            productType.add(thisProduct);
                        }
                    }
                    request.setAttribute("product", productType);
                    break;
                }
                default: {
                    request.setAttribute("product", allProduct);
                }
                break;
            }
            getServletContext().getRequestDispatcher("/productPage.jsp").forward(request, response);
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
