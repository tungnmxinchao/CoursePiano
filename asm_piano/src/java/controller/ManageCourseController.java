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
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.CourseResponseDTO;
import model.PageControl;
import model.Users;

/**
 *
 * @author TNO
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB

public class ManageCourseController extends HttpServlet {

    private static final String PAGE_MANAGE_COURSE = "manageCourse.jsp";
    private static final String PAGE_ADD_COURSE = "pageAddCourse";
    private static final String ADD_COURSE_CONTROLLER = "addCourse";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");

        HttpSession session = request.getSession();
        PageControl pageControl = new PageControl();
        List<CourseResponseDTO> listCourse = null;
        String url = null;
        int idUser = 0;

        Users user = (Users) session.getAttribute("user");

        if (user == null || user.getRole() != 1) {
            request.getRequestDispatcher("Login.jsp").forward(request, response);
            return;
        }

        if (action == null) {
            listCourse = pagination(request, pageControl);
            request.setAttribute("pageControl", pageControl);
            request.setAttribute("listCourse", listCourse);
            url = PAGE_MANAGE_COURSE;
        }

        try {
            switch (action) {
                case "displayPageAddCourse":
                    url = PAGE_ADD_COURSE;
                    break;
                case "addCourse":
                    url = ADD_COURSE_CONTROLLER;
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
                break;
            case "category":
                break;
            default:
                totalRecord = courseDAO.findTotalRecord();
                listCourse = courseDAO.findCourseByPage(page);

                pageControl.setUrlPattern("manageCourse?");

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
