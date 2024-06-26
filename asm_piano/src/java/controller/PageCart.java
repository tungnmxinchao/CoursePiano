/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.CourseCart;
import utils.GetDataUtils;

/**
 *
 * @author TNO
 */
@WebServlet(name = "PageCart", urlPatterns = {"/cart"})
public class PageCart extends HttpServlet {

    private static final String PAGE_CART = "cart.jsp";
    private static final String REMOVE_CART_CONTROLLER = "removeCart";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");

        HttpSession session = request.getSession();
        List<CourseCart> listCart = new ArrayList<>();

        String url = null;
        if (action == null) {
            HashMap<String, Integer> cartHashMap = (HashMap<String, Integer>) session.getAttribute("cartHashMap");
            int totalAmount = 0;

            for (Map.Entry<String, Integer> entry : cartHashMap.entrySet()) {
                String[] key = entry.getKey().split(" ");
                String idCourse = key[0];
                String courseName = key[1] + " " + key[2];
                String fee = key[3] + key[4];
                Integer value = entry.getValue();
                
                totalAmount += ( GetDataUtils.parsePrice(fee) * value );
                
                CourseCart course = new CourseCart(idCourse, courseName, fee, value);

                listCart.add(course);
            }
            
            request.setAttribute("totalAmount", GetDataUtils.formatToVND(totalAmount));
            request.setAttribute("listCart", listCart);
            url = PAGE_CART;
        }
        try {
            switch (action) {
                case "removeCart":
                    url = REMOVE_CART_CONTROLLER;
                    break;
                default:
                    throw new AssertionError();
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
    }// </editor-fold>

}
