package servlets;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.ConnectToDb;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/AddHumeur")
public class AddHumeur extends HttpServlet {

	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String token = request.getParameter("token");
	        request.setAttribute("token", token);
	        

	        // Continue processing and forward to "AddHumeur.jsp"
	        RequestDispatcher view = request.getRequestDispatcher("WEB-INF/views/AddHumeur.jsp");
	        view.forward(request, response);
	    }

	  


    // Other methods for handling POST requests, if needed

	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
	        Connection conn = null;

	        try {
	            // Create a database connection
	            conn = ConnectToDb.getConnection();

	            String humeur = request.getParameter("humeur");
	            String tokenn = request.getParameter("tokenn");

	            boolean tokenExists = checkTokenExistsInDatabase(tokenn);
	            System.out.println(tokenn);
	            System.out.print(tokenExists);

	            if (tokenExists) {
	                response.sendRedirect("error.html");
	            } else {
	                // Insert both tokenn and humeur
	                insertTokenAndSentimentIntoDatabase(conn, tokenn, humeur);
	                response.sendRedirect("success");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            response.sendRedirect("error");
	        } finally {
	            if (conn != null) {
	                try {
	                    conn.close();
	                } catch (SQLException e) {
	                    e.printStackTrace();
	                }
	            }
	        }
	    }

	    private boolean checkTokenExistsInDatabase(String token) {
	        Connection conn = null;
	        boolean tokenExists = false;

	        try {
	            conn = ConnectToDb.getConnection();
	            String sql = "SELECT COUNT(*) FROM humeur WHERE token = ?";
	            PreparedStatement preparedStatement = conn.prepareStatement(sql);
	            preparedStatement.setString(1, token);

	            ResultSet resultSet = preparedStatement.executeQuery();

	            if (resultSet.next() && resultSet.getInt(1) > 0) {
	                tokenExists = true;
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            if (conn != null) {
	                try {
	                    conn.close();
	                } catch (SQLException e) {
	                    e.printStackTrace();
	                }
	            }
	        }
	        return tokenExists;
	    }

	    private void insertTokenAndSentimentIntoDatabase(Connection conn, String token, String sentiment) {
	        try {
	            String sql = "INSERT INTO humeur (token, sentiment) VALUES (?, ?)";
	            PreparedStatement preparedStatement = conn.prepareStatement(sql);
	            preparedStatement.setString(1, token);
	            preparedStatement.setString(2, sentiment);

	            preparedStatement.executeUpdate();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
   }
}
