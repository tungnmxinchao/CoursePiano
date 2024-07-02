/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.CourseDAO;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Timestamp;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import model.Users;

/**
 *
 * @author TNO
 */

public class AddCourse extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        int fee = Integer.parseInt(request.getParameter("fee"));
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        int status = Integer.parseInt(request.getParameter("status"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        String uploadFolder = getServletContext().getRealPath("") + "../../web/img";

        File folder = new File(uploadFolder);
        if (!folder.exists()) {
            folder.mkdirs();
        }

        Part filePart = request.getPart("image");
        String fileName = getSubmittedFileName(filePart);
        String imagePath = "img/" + fileName;

        OutputStream out = null;
        InputStream fileContent = null;

        try {
            out = new FileOutputStream(new File(uploadFolder + File.separator + fileName));
            fileContent = filePart.getInputStream();

            int read = 0;
            final byte[] bytes = new byte[1024];

            while ((read = fileContent.read(bytes)) != -1) {
                out.write(bytes, 0, read);
            }

        } catch (FileNotFoundException fne) {
            fne.printStackTrace();
        } finally {
            if (out != null) {
                out.close();
            }
            if (fileContent != null) {
                fileContent.close();
            }
        }

        CourseDAO courseDAO = new CourseDAO();
        HttpSession session = request.getSession();
        String msg = "";

        Users user = (Users) session.getAttribute("user");
        int idUser = 0;

        if (user == null || user.getRole() != 1) {
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        } else {
            idUser = user.getId();
        }

        Timestamp currentTime = new Timestamp(System.currentTimeMillis());

        if(courseDAO.addCourse(name, imagePath, description, fee, startDate, endDate,
                categoryId, idUser, status, quantity, currentTime.toString())){
            msg = "Add successfully!";
        }else{
            msg = "Add failed!";
        }
        
        request.setAttribute("msg", msg);
        request.getRequestDispatcher("pageAddCourse.jsp").forward(request, response);

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

    private String getSubmittedFileName(Part part) {
        for (String cd : part.getHeader("content-disposition").split(";")) {
            if (cd.trim().startsWith("filename")) {
                return cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }

}
