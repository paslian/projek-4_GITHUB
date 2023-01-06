/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import Controller.ProductController;
import Controller.TransactionController;
import Model.ProductModel;
import Model.TransactionModel;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author hp
 */
public class TransactionServlet extends HttpServlet {
    ProductModel productModel = new ProductModel();
    ProductController controllerProduct = new ProductController();
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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            RequestDispatcher dispatch = request.getRequestDispatcher("/views/transaction.jsp");
            dispatch.forward(request, response);
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
        try {
            String customer = request.getParameter("customer");
            String id_product = request.getParameter("id");
            String amount = request.getParameter("amount");
            String order = request.getParameter("order");

            TransactionModel model = new TransactionModel();
            model.setCustomer(customer);
            model.setId_product(id_product);
            model.setTotalamount(amount);
            model.setTotalorder(order);

            TransactionController tc = new TransactionController();
            Boolean res = tc.create(model);

            if (res) {
                Integer stock, total_orderr, remaining_stock;
                String product_id;

                product_id = request.getParameter("id");
                stock = Integer.parseInt(request.getParameter("stock"));
                total_orderr = Integer.parseInt(request.getParameter("order"));
                remaining_stock = (stock - total_orderr);
                productModel.setRemaining_stock(String.valueOf(remaining_stock));

                controllerProduct.update_stock(product_id, productModel);
                response.sendRedirect("history");
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
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
