/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import static constant.constant.RECORD_PER_PAGE;
import dal.CourseDAO;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.OrderResponse;
import model.PageControl;
import model.Users;

public class TrackingOrdersByUserController extends HttpServlet {

    private static final String TRACKING_ORDERS_PAGE = "trackingOrderByUser.jsp";
    private static final String VIEW_DETAILS_ORDERS = "viewDetailsOrders";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");

        HttpSession session = request.getSession();
        PageControl pageControl = new PageControl();
        List<OrderResponse> listOrder = null;
        String url = null;
        int idUser = 0;

        Users user = (Users) session.getAttribute("user");

        if (user == null) {
            request.getRequestDispatcher("Login.jsp").forward(request, response);
            return;
        } else {
            idUser = user.getId();
        }

        if (action == null) {
            listOrder = pagination(request, pageControl, idUser);
            request.setAttribute("pageControl", pageControl);
            request.setAttribute("listOrder", listOrder);
            url = TRACKING_ORDERS_PAGE;
        }

        try {
            switch (action) {
                case "viewDetailsOrder":
                    url = VIEW_DETAILS_ORDERS;
                    break;
                case "search":
                    listOrder = pagination(request, pageControl, idUser);
                    request.setAttribute("pageControl", pageControl);
                    request.setAttribute("listOrder", listOrder);
                    url = TRACKING_ORDERS_PAGE;
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
    }

    private List<OrderResponse> pagination(HttpServletRequest request, PageControl pageControl, int idUser) {
        //get page
        String pageRaw = request.getParameter("page");
        CourseDAO courseDAO = new CourseDAO();

        //valid page
        int page;
        try {
            page = Integer.parseInt(pageRaw);
        } catch (NumberFormatException e) {
            page = 1;
        }
        int totalRecord = 0;
        List<OrderResponse> listOrder = null;
        String name = "";
        String action = request.getParameter("action") == null
                ? "defaultFindAll"
                : request.getParameter("action");
        switch (action) {
            case "search":
                int orderID = Integer.parseInt(request.getParameter("orderID"));
                totalRecord = courseDAO.findTotalOrderBySearch(idUser, orderID);
                listOrder = courseDAO.findOrderBySearchAndPage(page, idUser, orderID);

                pageControl.setUrlPattern("trackingOrderByUser?orderID=" + orderID + "&action=search&");

                break;
            case "category":
                break;
            default:
                totalRecord = courseDAO.findTotalOrdersRecord(idUser);
                listOrder = courseDAO.findOrderByPage(page, idUser);

                pageControl.setUrlPattern("trackingOrderByUser?");

        }

        //tìm kiếm xem tổng có bao nhiêu page
        int totalPage = (totalRecord % RECORD_PER_PAGE) == 0
                ? (totalRecord / RECORD_PER_PAGE)
                : (totalRecord / RECORD_PER_PAGE) + 1;
        //set những giá trị vào pageControl
        pageControl.setPage(page);
        pageControl.setTotalPage(totalPage);
        pageControl.setTotalRecord(totalRecord);

        return listOrder;
    }

}
