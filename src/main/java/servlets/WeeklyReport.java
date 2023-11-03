package servlets;


import java.io.IOException;

import java.sql.SQLException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import models.Temps;
import models.TimeDAO;
import java.time.LocalDate;
import java.time.DayOfWeek;
import java.time.temporal.WeekFields;
import java.util.Locale;


//@WebServlet("/weekly-report")
public class WeeklyReport extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Create a TimeDAO instance to fetch data from the database
        TimeDAO timeDAO = new TimeDAO();

        // Replace 'employeeId' with the actual employee's ID
        String employeeIdParam = request.getParameter("employeeId");
        String employeeNom= request.getParameter("nom");
        String employeePrenom = request.getParameter("prenom");

        int employeeId = Integer.parseInt(employeeIdParam);
        int weekNumberForEmployee = 0;
        try {
            weekNumberForEmployee = timeDAO.getWeekNumberForEmployee(employeeId);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        
        // Calculate the start and end dates of the current week
        LocalDate currentDate = LocalDate.now();
        int currentWeekNumber = currentDate.get(WeekFields.of(Locale.US).weekOfWeekBasedYear());
        request.setAttribute("currentWeekNumber", currentWeekNumber);
       /* LocalDate currentDate = LocalDate.now();
        LocalDate startDate = currentDate.with(DayOfWeek.MONDAY);
        LocalDate endDate = currentDate.with(DayOfWeek.SATURDAY);*/        
        // Get the weekly report data
        List<Temps> weeklyReport = null;
		try {
			weeklyReport = timeDAO.getWeeklyReport(employeeId, currentWeekNumber);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		 // Set the weekly report data as an attribute to be passed to the JSP
        request.setAttribute("weeklyReport", weeklyReport);
        request.setAttribute("employeeId", employeeId);
        request.setAttribute("employeeNom", employeeNom);
        request.setAttribute("employeePrenom", employeePrenom);
        request.setAttribute("currentWeekNumber", weekNumberForEmployee); // Set the week number



		// Debugging statement to check the weeklyReport data
		System.out.println("Weekly Report Data: " + weeklyReport);
        // Forward the request to the JSP for rendering
        request.getRequestDispatcher("/WEB-INF/views/WeeklyReport.jsp").forward(request, response);
    }
}