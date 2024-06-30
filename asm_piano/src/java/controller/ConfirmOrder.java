/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.CourseDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.CourseCart;
import model.Users;
import utils.GetDataUtils;

/**
 *
 * @author TNO
 */
public class ConfirmOrder extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String fullName = request.getParameter("name");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");

        HttpSession session = request.getSession();
        int totalMoney = 0;
        CourseDAO courseDAO = new CourseDAO();
        int idUser = 0;
        String msg = "";

        List<CourseCart> listPianoOrder = (List<CourseCart>) session.getAttribute("listPianoOrder");

        for (CourseCart o : listPianoOrder) {
            totalMoney += (GetDataUtils.parsePrice(o.getFee()) * o.getTotal());
        }

        Users user = (Users) session.getAttribute("user");

        if (user != null) {
            idUser = user.getId();
        }

        if(courseDAO.insertOrderAndOrderDetails(fullName, address, phone, totalMoney, idUser, listPianoOrder)){
            msg = "Order Successfully!";
        }else{
             msg = "Order Failed!";
        }
        
        request.setAttribute("msg", msg);
        request.getRequestDispatcher("orderCourses.jsp").forward(request, response);

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
