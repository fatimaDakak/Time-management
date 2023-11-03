package models;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.http.HttpServletRequest;


public class UserDao {

    
    public static boolean checkLogin(String email, String password,HttpServletRequest request) throws SQLException, ClassNotFoundException {
        
        Connection connection = ConnectToDb.getConnection();
        String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, email);
        statement.setString(2, password);

        ResultSet result = statement.executeQuery();

        User user = null;

        if (result.next()) {
            user = new User();
            user.setId(result.getInt("id_user"));
            user.setNom(result.getString("nom"));
            user.setNom(result.getString("prénom"));
            user.setEmail(email);
            user.setRole(result.getString("role"));
            System.out.println(user.getRole());
// Add this line to retrieve the user's role
 
        }
        else {
        	String error="password or email are incorrect";
            request.setAttribute("error", error);
            return false;
        	
        }
        connection.close();

        return true;
    }
    
    public User getUserByEmail(String email) throws SQLException, ClassNotFoundException {
        Connection connection = ConnectToDb.getConnection();
        String sql = "SELECT * FROM users WHERE email = ? ";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, email);

        ResultSet result = statement.executeQuery();

        User user = null;

        if (result.next()) {
            user = new User();
            user.setId(result.getInt("id_user"));
            user.setNom(result.getString("nom"));
            user.setPrenom(result.getString("prénom"));
            user.setEmail(email);
            user.setRole(result.getString("role"));

        }

        connection.close();

        return user;
    }
}

