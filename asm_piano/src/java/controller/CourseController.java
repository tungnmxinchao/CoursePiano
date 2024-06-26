/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
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
import model.CourseResponseDTO;
import model.PageControl;

/**
 *
 * @author TNO
 */
public class CourseController extends HttpServlet {

    private static final String COURSE_PAGE = "course.jsp";
    private static final String VIEW_DETAILS_CONTROLLER = "courseDetails";
    private static final String ADD_TO_CART_CONTROLLER = "addToCart";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");

        PageControl pageControl = new PageControl();
        List<CourseResponseDTO> listCourse = null;


        String url = null;
        if (action == null) {
            listCourse = pagination(request, pageControl);
            request.setAttribute("pageControl", pageControl);
            request.setAttribute("listCourse", listCourse);
            url = COURSE_PAGE;
        }
        try {
            switch (action) {
                case "search":
                    listCourse = pagination(request, pageControl);
                    request.setAttribute("pageControl", pageControl);
                    request.setAttribute("listCourse", listCourse);
                    url = COURSE_PAGE;
                    break;
                case "category":
                    listCourse = pagination(request, pageControl);
                    request.setAttribute("pageControl", pageControl);
                    request.setAttribute("listCourse", listCourse);
                    url = COURSE_PAGE;
                    break;
                case "viewCourseDetails":
                    url = VIEW_DETAILS_CONTROLLER;
                    break;
                case "addToCart":
                    url = ADD_TO_CART_CONTROLLER;
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

    private List<CourseResponseDTO> pagination(HttpServletRequest request, PageControl pageControl) {
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
        List<CourseResponseDTO> listCourse = null;
        String name = "";
        String action = request.getParameter("action") == null
                ? "defaultFindAll"
                : request.getParameter("action");
        switch (action) {
            case "search":
                name = request.getParameter("name");

                totalRecord = courseDAO.findTotalRecordSearchByName(name);
                listCourse = courseDAO.findCourseByName(page, name);

                pageControl.setUrlPattern("course?name=" + name + "&action=search&");

                break;
            case "category":
                name = request.getParameter("name");
                int category = Integer.parseInt(request.getParameter("category"));

                totalRecord = courseDAO.findTotalRecordSearchByCategory(name, category);
                listCourse = courseDAO.findCourseByCategory(page, name, category);

                pageControl.setUrlPattern("course?name=" + name + "&category=" + category + "&action=category&");
                break;
            default:
                totalRecord = courseDAO.findTotalRecord();
                listCourse = courseDAO.findCourseByPage(page);

                pageControl.setUrlPattern("course?");

        }

        //tìm kiếm xem tổng có bao nhiêu page
        int totalPage = (totalRecord % RECORD_PER_PAGE) == 0
                ? (totalRecord / RECORD_PER_PAGE)
                : (totalRecord / RECORD_PER_PAGE) + 1;
        //set những giá trị vào pageControl
        pageControl.setPage(page);
        pageControl.setTotalPage(totalPage);
        pageControl.setTotalRecord(totalRecord);

        return listCourse;
    }

}
