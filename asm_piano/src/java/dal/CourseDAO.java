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
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import model.CourseCart;
import model.CourseResponseDTO;
import model.OrderDetailsResponse;
import model.OrderResponse;
import utils.GetDataUtils;

/**
 *
 * @author TNO
 */
public class CourseDAO extends DBContext {

    private PreparedStatement ps;
    private ResultSet rs;
    private List<CourseResponseDTO> listCourse;
    private List<OrderResponse> listOrder;
    private List<OrderDetailsResponse> listOrderDetails;

    public CourseDAO() {
        listCourse = new ArrayList<>();
        listOrder = new ArrayList<>();
        listOrderDetails = new ArrayList<>();
    }

    public int findTotalRecord() {
        String sql = "select count(c.courseId) from Courses c\n"
                + "where c.[status] = 1 and c.quantity > 0";
        try (Connection connection = new DBContext().connection) {
            ps = connection.prepareStatement(sql);

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

    public int findTotalRecordSearchByName(String name) {
        String sql = "select count(c.courseId) from Courses c\n"
                + "where c.[status] = 1 and c.quantity > 0 and c.[name] like ?";
        try (Connection connection = new DBContext().connection) {
            ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + name + "%");

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
        try (Connection connection = new DBContext().connection) {
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
        } finally {
            DBContext.closeResultSetAndStatement(rs, ps);
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
        try (Connection connection = new DBContext().connection) {
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
        } finally {
            DBContext.closeResultSetAndStatement(rs, ps);
        }
        return listCourse;

    }

    public int findTotalRecordSearchByCategory(String name, int category) {
        String sql = "select count(c.courseId) from Courses c\n"
                + "where c.[status] = 1 and c.quantity > 0 and c.[name] like ? and c.categoryId = ?";
        try (Connection connection = new DBContext().connection) {
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
        try (Connection connection = new DBContext().connection) {
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
        try (Connection connection = new DBContext().connection) {
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

    public boolean insertOrderAndOrderDetails(String fullName, String address,
            String phone, int totalMoney, int idUser, List<CourseCart> listPianoOrder) {
        String sql = "INSERT INTO [dbo].[Orders]\n"
                + "           ([full_name], [phone_number], [address], [user_id], [total_cost], [status])\n"
                + "     VALUES (?, ?, ?, ?, ?, ?);";

        String sqlInsertOrderDetails = "INSERT INTO [dbo].[OrderDetails]\n"
                + "           ([course_id], [course_price], [amount], [order_id])\n"
                + "     VALUES (?, ?, ?, ?);";
        String msg = "";

        try (Connection connection = new DBContext().connection) {

            ps = connection.prepareStatement(sql, ps.RETURN_GENERATED_KEYS);

            ps.setString(1, fullName);
            ps.setString(2, phone);
            ps.setString(3, address);
            ps.setInt(4, idUser);
            ps.setInt(5, totalMoney);
            ps.setInt(6, 1);

            int rowAffected = ps.executeUpdate();

            try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    int idOrder = generatedKeys.getInt(1);
                    for (int i = 0; i < listPianoOrder.size(); i++) {
                        ps = connection.prepareStatement(sqlInsertOrderDetails);
                        ps.setString(1, listPianoOrder.get(i).getId());
                        ps.setInt(2, GetDataUtils.parsePrice(listPianoOrder.get(i).getFee()));
                        ps.setInt(3, listPianoOrder.get(i).getTotal());
                        ps.setInt(4, idOrder);

                        int rowOrderDetailsAffected = ps.executeUpdate();

                        if (rowOrderDetailsAffected < 0) {
                            return false;
                        }
                    }
                }
            }

            if (rowAffected > 0) {
                return true;
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            DBContext.closeResultSetAndStatement(rs, ps);
        }

        return false;

    }

    public int findTotalOrdersRecord(int idUser) {
        String sql = "select count(o.order_id) from Orders o\n"
                + "where o.[user_id] = ?";
        try (Connection connection = new DBContext().connection) {
            ps = connection.prepareStatement(sql);

            ps.setInt(1, idUser);

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

    public List<OrderResponse> findOrderByPage(int page, int userID) {
        String sql = "select * from Orders o\n"
                + "where o.[user_id] = ?\n"
                + "order by o.order_id desc\n"
                + "OFFSET ? ROWS\n"
                + "FETCH NEXT ? ROWS ONLY";

        try (Connection connection = new DBContext().connection) {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, userID);
            ps.setInt(2, (page - 1) * RECORD_PER_PAGE);
            ps.setInt(3, RECORD_PER_PAGE);

            rs = ps.executeQuery();

            while (rs.next()) {
                int order_id = rs.getInt(1);
                Timestamp orderDate = rs.getTimestamp(2);
                String fullName = rs.getString(3);
                String phone = rs.getString(4);
                String address = rs.getString(5);
                int idUser = rs.getInt(6);
                int totalCost = rs.getInt(7);
                int status = rs.getInt(8);

                OrderResponse order = new OrderResponse(order_id, orderDate, fullName,
                        phone, address, userID, GetDataUtils.formatToVND(totalCost), status);

                listOrder.add(order);

            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            DBContext.closeResultSetAndStatement(rs, ps);
        }

        return listOrder;

    }

    public List<OrderDetailsResponse> findOrderDetailsByOrderID(int orderIdInput) {
        String sql = "select o.order_details_id, o.course_id, o.course_price, o.amount,\n"
                + "o.order_id, c.[image], c.[name], c.[description] from OrderDetails o\n"
                + "join Courses c\n"
                + "on o.course_id = c.courseId\n"
                + "where o.order_id = ?";
        try (Connection connection = new DBContext().connection) {
            ps = connection.prepareStatement(sql);

            ps.setInt(1, orderIdInput);

            rs = ps.executeQuery();

            while (rs.next()) {
                int orderDetailsID = rs.getInt(1);
                int courseID = rs.getInt(2);
                int coursePrice = rs.getInt(3);
                int amount = rs.getInt(4);
                int orderID = rs.getInt(5);
                String image = rs.getString(6);
                String nameCourse = rs.getString(7);
                String description = rs.getString(8);

                OrderDetailsResponse orderDetails = new OrderDetailsResponse(orderDetailsID,
                        courseID, GetDataUtils.formatToVND(coursePrice), amount, orderID,
                        image, nameCourse, description);

                listOrderDetails.add(orderDetails);
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            DBContext.closeResultSetAndStatement(rs, ps);
        }
        return listOrderDetails;
    }

    public int findTotalOrderBySearch(int idUser, int orderID) {
        String sql = "select count(o.order_id) from Orders o\n"
                + "where o.[user_id] = ? and  o.order_id = ?";
        try (Connection connection = new DBContext().connection) {
            ps = connection.prepareStatement(sql);

            ps.setInt(1, idUser);
            ps.setInt(2, orderID);

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

    public List<OrderResponse> findOrderBySearchAndPage(int page, int idUserInput, int orderID) {
        String sql = "select * from Orders o\n"
                + "where o.[user_id] = ? and o.order_id = ?\n"
                + "order by o.order_id desc\n"
                + "OFFSET ? ROWS\n"
                + "FETCH NEXT ? ROWS ONLY";

        try (Connection connection = new DBContext().connection) {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, idUserInput);
            ps.setInt(2, orderID);
            ps.setInt(3, (page - 1) * RECORD_PER_PAGE);
            ps.setInt(4, RECORD_PER_PAGE);

            rs = ps.executeQuery();

            while (rs.next()) {
                int order_id = rs.getInt(1);
                Timestamp orderDate = rs.getTimestamp(2);
                String fullName = rs.getString(3);
                String phone = rs.getString(4);
                String address = rs.getString(5);
                int idUser = rs.getInt(6);
                int totalCost = rs.getInt(7);
                int status = rs.getInt(8);

                OrderResponse order = new OrderResponse(order_id, orderDate, fullName,
                        phone, address, idUser, GetDataUtils.formatToVND(totalCost), status);

                listOrder.add(order);

            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            DBContext.closeResultSetAndStatement(rs, ps);
        }

        return listOrder;
    }

}
