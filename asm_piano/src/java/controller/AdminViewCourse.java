/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.CourseDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Category;
import model.CourseResponseDTO;

/**
 *
 * @author TNO
 */
public class AdminViewCourse extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int idCourse = Integer.parseInt(request.getParameter("id"));
        
        CourseDAO courseDAO = new CourseDAO();
        
        CourseResponseDTO course = courseDAO.findCourseByID(idCourse);
        List<Category> listCategory = courseDAO.findAllCategory();
        
        int categoryOfCourse = course.getCategory();
        
        request.setAttribute("categoryOfCourse", categoryOfCourse);      
        request.setAttribute("listCategory", listCategory);
        request.setAttribute("course", course);
        request.getRequestDispatcher("adminViewDetailsCourse.jsp").forward(request, response);
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

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
