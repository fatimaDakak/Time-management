package servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.ConnectToDb;
import models.Temps;
import models.User;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Servlet implementation class TimeAdd
 */
public class WorkHours extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(WorkHours.class.getName());


    /**
     * Default constructor. 
     */
    public WorkHours() {
        // TODO Auto-generated constructor stub
    }

	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Connection con = ConnectToDb.getConnection();

            if (con != null) {
                HttpSession session = request.getSession();
                if (session == null || session.getAttribute("id_user") == null) {
                    response.sendRedirect("Login");
                    return;
                }
                User user=(User) session.getAttribute("user");
               Time heure_debut = ReturnWorkHours(user.getId()).getHeure_debut();
               Time heure_fin = ReturnWorkHours(user.getId()).getHeure_fin();
               Time pause_debut = ReturnWorkHours(user.getId()).getPause_debut();
               Time pause_fin = ReturnWorkHours(user.getId()).getPause_fin();
               String start_message = "You have started your work at: <b>" + heure_debut + "</b>";
               String end_message = "You ended your work at: <b>" + heure_fin + "</b>";

               String start_message_pause = "You have started your pause at: <b>" + pause_debut + "</b>";
               String end_message_pause = "You have ended your pause at: <b>" + pause_fin + "</b>";


                request.setAttribute("heure_fin", heure_fin);
                request.setAttribute("ended", end_message);
                request.setAttribute("heure_debut", heure_debut);
                request.setAttribute("started", start_message);
                
                request.setAttribute("pause_fin", pause_fin);
                request.setAttribute("endedPause", end_message_pause);
                request.setAttribute("pause_debut", pause_debut);
                request.setAttribute("startedPause", start_message_pause);
                
                System.out.print(heure_debut);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/WorkHours.jsp");
                dispatcher.forward(request, response);
            } else {
                response.getWriter().write("Database connection is null. Check your connection setup.");
            }
        } catch (SQLException ex) {
            logger.log(Level.SEVERE, "SQL Exception", ex);
            throw new ServletException(ex);
        }
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection con = null;
        PreparedStatement ps = null;
        String hiddenParameter=request.getParameter("hidden");
        try {
            con = ConnectToDb.getConnection();
            if("start".equals(hiddenParameter)) {
            String id_user = request.getParameter("id_user");
            String startTime = request.getParameter("start-time");
            String startDate = request.getParameter("start-date");

            insertStartTime(con, id_user, startTime, startDate);

        }
            if("end".equals(hiddenParameter)) {
                String id_user = request.getParameter("id_user");
                String endTime = request.getParameter("end-time");
                System.out.println(endTime);
                insertEndTime(con, id_user, endTime);
                
            }
            
            if("startps".equals(hiddenParameter)) {
                String id_user = request.getParameter("id_user");
                String startPause = request.getParameter("start-pause");
                System.out.println(startPause);
                insertStartPause(con, id_user, startPause);
                
            
            }
            
            if("endps".equals(hiddenParameter)) {
                String id_user = request.getParameter("id_user");
                String endPause = request.getParameter("end-pause");
                System.out.println(endPause);
                insertEndPause(con, id_user, endPause);
                
            
            }
            
            
        }
        catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        // Redirect the user to an appropriate page after data insertion
        response.sendRedirect("WorkHours");

    }
  
    private Temps ReturnWorkHours(int userId) {
        Temps temps = new Temps();
        try (Connection connection = ConnectToDb.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM temps WHERE id_employé = ? and date_j = ?")) {

        	LocalDate currentDate = LocalDate.now();
            Date todayDate = java.sql.Date.valueOf(currentDate);            
            preparedStatement.setInt(1, userId);
            preparedStatement.setDate(2, (java.sql.Date) todayDate);
            System.out.print(todayDate);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    temps.setHeure_debut(resultSet.getTime("heure_debut"));            
                    temps.setHeure_fin(resultSet.getTime("heure_fin"));
                    temps.setPause_debut(resultSet.getTime("pause_debut"));
                    temps.setPause_fin(resultSet.getTime("pause_fin"));
                    temps.setDate_j(resultSet.getDate("date_j"));
                    temps.setId_employé(userId);
                }
            }
        } catch (SQLException e) {
            // Handle any database-related exceptions
            e.printStackTrace();
        }
        
        return temps;
    }
    
    
    private void insertStartTime(Connection con, String id_user, String startTime, String startDate) throws SQLException {
        String stm = "INSERT INTO temps (date_j, heure_debut, id_employé) VALUES (?, ?, ?)";
        PreparedStatement ps = con.prepareStatement(stm);
        ps.setString(1, startDate);
        ps.setString(2, startTime);
        ps.setString(3, id_user);

        int rowsInserted = ps.executeUpdate();
        if (rowsInserted > 0) {
            System.out.println("Data saved successfully");
        } else {
            System.out.println("Data insertion failed");
        }
    }

    private void insertEndTime(Connection con, String id_user, String endTime) throws SQLException {
        String stm = "UPDATE temps SET heure_fin = ? WHERE id_employé = ? AND date_j IS NOT NULL";
        PreparedStatement ps = con.prepareStatement(stm);
        ps.setString(1, endTime);
        ps.setString(2, id_user);

        int rowsInserted = ps.executeUpdate();
        if (rowsInserted > 0) {
            System.out.println("Data saved successfully");
        } else {
            System.out.println("Data insertion failed");
        }
    }
    
    
    private void insertStartPause(Connection con, String id_user, String startPause) throws SQLException {
        String stm = "UPDATE temps SET pause_debut = ? WHERE id_employé = ? AND date_j IS NOT NULL";
        PreparedStatement ps = con.prepareStatement(stm);
        ps.setString(1, startPause);
        ps.setString(2, id_user);

        int rowsInserted = ps.executeUpdate();
        if (rowsInserted > 0) {
            System.out.println("Data saved successfully");
        } else {
            System.out.println("Data insertion failed");
        }
    }
    
    private void insertEndPause(Connection con, String id_user, String endPause) throws SQLException {
        String stm = "UPDATE temps SET pause_fin = ? WHERE id_employé = ? AND date_j IS NOT NULL";
        PreparedStatement ps = con.prepareStatement(stm);
        ps.setString(1, endPause);
        ps.setString(2, id_user);

        int rowsInserted = ps.executeUpdate();
        if (rowsInserted > 0) {
            System.out.println("Data saved successfully");
        } else {
            System.out.println("Data insertion failed");
        }
    }
}