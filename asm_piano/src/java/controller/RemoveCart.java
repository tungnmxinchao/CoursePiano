/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author TNO
 */
public class RemoveCart extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String idCourse = request.getParameter("idCourse");

        HttpSession session = request.getSession();

        HashMap<String, Integer> cartHashMap = (HashMap<String, Integer>) session.getAttribute("cartHashMap");

       if( deleteFromCart(idCourse, cartHashMap)){
           response.sendRedirect("cart");
       }

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

    private boolean deleteFromCart(String idCourse, HashMap<String, Integer> cartHashMap) {
        Iterator<Map.Entry<String, Integer>> iterator = cartHashMap.entrySet().iterator();
        while (iterator.hasNext()) {
            Map.Entry<String, Integer> entry = iterator.next();
            String[] key = entry.getKey().split(" ");
            String courseID = key[0];

            if (courseID.equalsIgnoreCase(idCourse)) {
                iterator.remove();
                return true;
            }
        }
        return false;
    }
}
