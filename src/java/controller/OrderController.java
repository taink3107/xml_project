/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Orders;
import helper.HtmlHelper;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;
import service.OrderService;

/**
 *
 * @author taink
 */
public class OrderController extends HttpServlet {

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
        try {
            String url1 = "http://localhost:8084/RSS_project/order";
            JAXBContext jaxbContext = JAXBContext.newInstance(Orders.class);
            Unmarshaller jaxbUnmarshaller = jaxbContext.createUnmarshaller();
            OrderService service = new OrderService();
            int pagesize = 6;
            String raw_pageindex = request.getParameter("page");
            if (raw_pageindex == null) {
                raw_pageindex = "1";
            }
            int pageindex = Integer.parseInt(raw_pageindex);

            int count = service.count();
            int pagecount = (count % pagesize == 0) ? count / pagesize : count / pagesize + 1;
            url1 = url1.concat("?index="+pageindex);
            url1 = url1.concat("&size="+pagesize);
            URL url = new URL(url1);
            Orders orders = (Orders) jaxbUnmarshaller.unmarshal(url);
            request.setAttribute("pagging", HtmlHelper.pager(pageindex, pagecount, 2));
            request.setAttribute("list", orders.getOrders());
            request.getRequestDispatcher("manageOrder.jsp").forward(request, response);
        } catch (JAXBException ex) {
            Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
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
