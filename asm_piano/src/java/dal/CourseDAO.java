/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import static constant.constant.RECORD_PER_PAGE;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.CourseResponseDTO;
import utils.GetDataUtils;

/**
 *
 * @author TNO
 */
public class CourseDAO extends DBContext {

    private PreparedStatement ps;
    private ResultSet rs;
    private List<CourseResponseDTO> listCourse;

    public CourseDAO() {
        listCourse = new ArrayList<>();
    }

    public int findTotalRecord() {
        String sql = "select count(c.courseId) from Courses c\n"
                + "where c.[status] = 1 and c.quantity > 0";
        try ( Connection connection = new DBContext().connection) {
            ps = connection.prepareStatement(sql);

            rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return -1;

    }

    public int findTotalRecordSearchByName(String name) {
        String sql = "select count(c.courseId) from Courses c\n"
                + "where c.[status] = 1 and c.quantity > 0 and c.[name] like ?";
        try ( Connection connection = new DBContext().connection) {
            ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + name + "%");

            rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return -1;
    }

    public List<CourseResponseDTO> findCourseByPage(int page) {
        String sql = "select c.courseId, c.[name], c.[image], c.[description], c.tuition_fee, \n"
                + "c.[start_date], c.end_date, c.categoryId, c.createdBy, c.[status], c.quantity, \n"
                + "u.username, cg.category_name from Courses c\n"
                + "join Users u\n"
                + "on c.createdBy = u.id\n"
                + "join Category cg\n"
                + "on c.categoryId = cg.id\n"
                + "where c.[status] = 1 and c.quantity > 0\n"
                + "order by c.courseId\n"
                + "OFFSET ? ROWS\n"
                + "FETCH NEXT ? ROWS ONLY";
        try ( Connection connection = new DBContext().connection) {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, (page - 1) * RECORD_PER_PAGE);
            ps.setInt(2, RECORD_PER_PAGE);

            rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String image = rs.getString(3);
                String description = rs.getString(4);
                int fee = rs.getInt(5);
                Date stardDate = rs.getDate(6);
                Date endDate = rs.getDate(7);
                int category = rs.getInt(8);
                int createdBy = rs.getInt(9);
                boolean status = rs.getBoolean(10);
                int quantity = rs.getInt(11);
                String userCreated = rs.getString(12);
                String categoryName = rs.getString(13);

                CourseResponseDTO c = new CourseResponseDTO(id, name, image,
                        description, GetDataUtils.formatToVND(fee), stardDate, endDate, category, createdBy,
                        status, quantity, userCreated, categoryName);

                listCourse.add(c);
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return listCourse;

    }

    public List<CourseResponseDTO> findCourseByName(int page, String nameInput) {
        String sql = "select c.courseId, c.[name], c.[image], c.[description], c.tuition_fee, \n"
                + "c.[start_date], c.end_date, c.categoryId, c.createdBy, c.[status], c.quantity, \n"
                + "u.username, cg.category_name from Courses c\n"
                + "join Users u\n"
                + "on c.createdBy = u.id\n"
                + "join Category cg\n"
                + "on c.categoryId = cg.id\n"
                + "where c.[status] = 1 and c.quantity > 0 and c.[name] like ?\n"
                + "order by c.courseId\n"
                + "OFFSET ? ROWS\n"
                + "FETCH NEXT ? ROWS ONLY";
        try ( Connection connection = new DBContext().connection) {
            ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + nameInput + "%");
            ps.setInt(2, (page - 1) * RECORD_PER_PAGE);
            ps.setInt(3, RECORD_PER_PAGE);

            rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String image = rs.getString(3);
                String description = rs.getString(4);
                int fee = rs.getInt(5);
                Date stardDate = rs.getDate(6);
                Date endDate = rs.getDate(7);
                int category = rs.getInt(8);
                int createdBy = rs.getInt(9);
                boolean status = rs.getBoolean(10);
                int quantity = rs.getInt(11);
                String userCreated = rs.getString(12);
                String categoryName = rs.getString(13);

                CourseResponseDTO c = new CourseResponseDTO(id, name, image,
                        description, GetDataUtils.formatToVND(fee), stardDate, endDate, category, createdBy,
                        status, quantity, userCreated, categoryName);

                listCourse.add(c);
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return listCourse;

    }

    public int findTotalRecordSearchByCategory(String name, int category) {
        String sql = "select count(c.courseId) from Courses c\n"
                + "where c.[status] = 1 and c.quantity > 0 and c.[name] like ? and c.categoryId = ?";
        try ( Connection connection = new DBContext().connection) {
            ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + name + "%");
            ps.setInt(2, category);

            rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            DBContext.closeResultSetAndStatement(rs, ps);
        }
        return -1;
    }

    public List<CourseResponseDTO> findCourseByCategory(int page, String nameInput, int categoryInput) {
        String sql = "select c.courseId, c.[name], c.[image], c.[description], c.tuition_fee, \n"
                + "c.[start_date], c.end_date, c.categoryId, c.createdBy, c.[status], c.quantity, \n"
                + "u.username, cg.category_name from Courses c\n"
                + "join Users u\n"
                + "on c.createdBy = u.id\n"
                + "join Category cg\n"
                + "on c.categoryId = cg.id\n"
                + "where c.[status] = 1 and c.quantity > 0 and c.[name] like ? and c.categoryId = ?\n"
                + "order by c.courseId\n"
                + "OFFSET ? ROWS\n"
                + "FETCH NEXT ? ROWS ONLY";
        try ( Connection connection = new DBContext().connection) {
            ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + nameInput + "%");
            ps.setInt(2, categoryInput);
            ps.setInt(3, (page - 1) * RECORD_PER_PAGE);
            ps.setInt(4, RECORD_PER_PAGE);

            rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String image = rs.getString(3);
                String description = rs.getString(4);
                int fee = rs.getInt(5);
                Date stardDate = rs.getDate(6);
                Date endDate = rs.getDate(7);
                int category = rs.getInt(8);
                int createdBy = rs.getInt(9);
                boolean status = rs.getBoolean(10);
                int quantity = rs.getInt(11);
                String userCreated = rs.getString(12);
                String categoryName = rs.getString(13);

                CourseResponseDTO c = new CourseResponseDTO(id, name, image,
                        description, GetDataUtils.formatToVND(fee), stardDate, endDate, category, createdBy,
                        status, quantity, userCreated, categoryName);

                listCourse.add(c);
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            DBContext.closeResultSetAndStatement(rs, ps);
        }
        return listCourse;

    }

    public CourseResponseDTO findCourseByID(int idCourse) {
        String sql = "select c.courseId, c.[name], c.[image], c.[description], c.tuition_fee, \n"
                + "c.[start_date], c.end_date, c.categoryId, c.createdBy, c.[status], c.quantity, \n"
                + "u.username, cg.category_name from Courses c\n"
                + "join Users u\n"
                + "on c.createdBy = u.id\n"
                + "join Category cg\n"
                + "on c.categoryId = cg.id\n"
                + "where c.[status] = 1 and c.quantity > 0 and c.courseId = ?";

        CourseResponseDTO course = null;
        try ( Connection connection = new DBContext().connection) {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, idCourse);

            rs = ps.executeQuery();

            if (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String image = rs.getString(3);
                String description = rs.getString(4);
                int fee = rs.getInt(5);
                Date stardDate = rs.getDate(6);
                Date endDate = rs.getDate(7);
                int category = rs.getInt(8);
                int createdBy = rs.getInt(9);
                boolean status = rs.getBoolean(10);
                int quantity = rs.getInt(11);
                String userCreated = rs.getString(12);
                String categoryName = rs.getString(13);

                course = new CourseResponseDTO(id, name, image,
                        description, GetDataUtils.formatToVND(fee), stardDate, endDate, category, createdBy,
                        status, quantity, userCreated, categoryName);

            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            DBContext.closeResultSetAndStatement(rs, ps);
        }
        return course;
    }
    
    public static void main(String[] args) {
        CourseDAO cdao = new CourseDAO();
        CourseResponseDTO c = cdao.findCourseByID(1);
        System.out.println(c);
    }

}
