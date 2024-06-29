/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.CourseDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.CourseCart;
import utils.GetDataUtils;

public class ConfirmPurchase extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String arrayCourseRequest = request.getParameter("arrayCourse");

        String[] arrayCourse = arrayCourseRequest.split(",");

        CourseDAO courseDAO = new CourseDAO();
        HttpSession session = request.getSession();
        List<CourseCart> listCart = new ArrayList<>();

        HashMap<String, Integer> cartHashMap = (HashMap<String, Integer>) session.getAttribute("cartHashMap");
        List<String> messageList = new ArrayList<>();
        String msg = "";
        int totalAmount = 0;
        boolean confirmPurchase = true;

        for (String courseId : arrayCourse) {
            int quantityCourseByID = courseDAO.findCourseByID(Integer.parseInt(courseId)).getQuanity();

            for (Map.Entry<String, Integer> entry : cartHashMap.entrySet()) {
                String[] key = entry.getKey().split(" ");
                String idCourse = key[0];
                String courseName = key[1] + " " + key[2];
                Integer value = entry.getValue();

                if (courseId.equals(idCourse)) {
                    if (quantityCourseByID < value) {
                        msg = "Course " + courseName + " is out of stock";
                        messageList.add(msg);
                        confirmPurchase = false;
                    }
                }
            }

        }

        if (confirmPurchase == false) {
            //load lai list cart
            for (Map.Entry<String, Integer> entry : cartHashMap.entrySet()) {
                String[] key = entry.getKey().split(" ");
                String idCourse = key[0];
                String courseName = key[1] + " " + key[2];
                String fee = key[3] + key[4];
                Integer value = entry.getValue();

                totalAmount += (GetDataUtils.parsePrice(fee) * value);

                CourseCart course = new CourseCart(idCourse, courseName, fee, value);

                listCart.add(course);
            }

            request.setAttribute("totalAmount", GetDataUtils.formatToVND(totalAmount));
            request.setAttribute("listCart", listCart);

            request.setAttribute("messageList", msg);
            request.getRequestDispatcher("cart.jsp").forward(request, response);
        } else {
            
            //load lai list cart
            for (Map.Entry<String, Integer> entry : cartHashMap.entrySet()) {
                String[] key = entry.getKey().split(" ");
                String idCourse = key[0];
                String courseName = key[1] + " " + key[2];
                String fee = key[3] + key[4];
                Integer value = entry.getValue();

                totalAmount += (GetDataUtils.parsePrice(fee) * value);

                CourseCart course = new CourseCart(idCourse, courseName, fee, value);

                listCart.add(course);
            }
            
            request.setAttribute("totalAmount", GetDataUtils.formatToVND(totalAmount));
            request.setAttribute("listCart", listCart);
            request.getRequestDispatcher("orderCourses.jsp").forward(request, response);
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
