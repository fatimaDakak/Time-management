package servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.User;
import models.UserDao;

import java.io.IOException;
import java.sql.SQLException;

/**
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 RequestDispatcher view = request.getRequestDispatcher("WEB-INF/views/Login.jsp");
	        view.forward(request, response);	
	        }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 UserDao user1 = new UserDao();
		    boolean loginSuccessful = false;
		    String email = request.getParameter("email_user");
		    String password = request.getParameter("mdp");  
		    try {
		        loginSuccessful = user1.checkLogin(email, password, request);
		        if(loginSuccessful) {
		            HttpSession session = request.getSession();
		            User user = user1.getUserByEmail(email); // Get the user object
		            session.setAttribute("id_user", user.getId()); 
		            session.setAttribute("user", user); // Set the User object in the session with the key "user"
		            if (user.getRole().equals("admin")) {
		                response.sendRedirect("Dashboard"); // Redirect to admin dashboard
		            } else if (user.getRole().equals("employee")) {
		                response.sendRedirect("WorkHours"); // Redirect to employee work hours page
		            }
		        }
			else {
				 String error = "Email or password are incorrects";
			        request.setAttribute("alertType", "danger");
			        request.setAttribute("message", error);
			        request.getRequestDispatcher("/WEB-INF/views/Login.jsp").forward(request, response);
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
            // Close resources in a finally block to ensure they are always closed
            
		
	    
		}
	}
}

