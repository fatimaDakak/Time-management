package servlets;

import jakarta.servlet.RequestDispatcher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import models.User;
import models.ConnectToDb;

import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Servlet implementation class AjouterContact
 */
public class ReportList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//private static final Logger logger = Logger.getLogger(ReportList.class.getName());

    /**
     * @see HttpServlet#HttpServlet()
     */


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Connection con = ConnectToDb.getConnection();

            if (con != null) {
                String sql = "SELECT * FROM users";
                PreparedStatement pstmt = con.prepareStatement(sql);
                ResultSet rs = pstmt.executeQuery();
                ArrayList<User> users = new ArrayList<>();
                while (rs.next()) {
                    User user = new User();
                    user.setId(rs.getInt("id_user"));
                    user.setNom(rs.getString("nom"));
                    user.setPrenom(rs.getString("prénom"));
                    user.setEmail(rs.getString("email"));
                    user.setMdp(rs.getString("password"));
                    user.setRole(rs.getString("role"));
                    users.add(user);
                }

                rs.close();
                pstmt.close();

                request.setAttribute("users", users);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/ReportList.jsp");
                dispatcher.forward(request, response);
            } else {
                response.getWriter().write("Database connection is null. Check your connection setup.");
            }
        } catch (SQLException ex) {
            //logger.log(Level.SEVERE, "SQL Exception", ex);
            throw new ServletException(ex);
        }
    }

    

}
