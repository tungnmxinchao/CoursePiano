/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import model.Users;

/**
 *
 * @author TNO
 */
public class UserDAO extends DBContext {

    private PreparedStatement ps;
    private ResultSet rs;

    public Users login(String usernameInput, String pass) {
        String sql = "select * from Users u \n"
                + "where u.username = ? and u.[password] = ?";

        Users user = null;

        try ( Connection connection = new DBContext().connection) {
            ps = connection.prepareStatement(sql);
            ps.setString(1, usernameInput);
            ps.setString(2, pass);
            rs = ps.executeQuery();

            if (rs.next()) {
                int id = rs.getInt(1);
                String username = rs.getString(2);
                String password = rs.getString(3);
                int role = rs.getInt(4);

                user = new Users(id, username, password, role);

            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return user;
    }
}
