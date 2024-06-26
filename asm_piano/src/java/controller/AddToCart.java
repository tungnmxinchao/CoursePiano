/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CourseDAO;
import java.io.IOException;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.CourseResponseDTO;

/**
 *
 * @author TNO
 */
public class AddToCart extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int idCourse = Integer.parseInt(request.getParameter("idCourse"));

        CourseDAO courseDAO = new CourseDAO();
        HttpSession session = request.getSession();

        CourseResponseDTO course = courseDAO.findCourseByID(idCourse);

        HashMap<String, Integer> cartHashMap = (HashMap<String, Integer>) session.getAttribute("cartHashMap");

        String key = course.getId() + " " + course.getName() + " " + course.getFee();
        int total = cartHashMap.getOrDefault(key, 0);

        cartHashMap.put(key, total + 1);

        session.setAttribute("cartHashMap", cartHashMap);
        
        response.sendRedirect("cart");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

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
