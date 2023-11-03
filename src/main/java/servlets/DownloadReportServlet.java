package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Locale;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Date;

//@WebServlet("/DownloadReportServlet")
public class DownloadReportServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/csv");
        response.setHeader("Content-Disposition", "attachment; filename=\"report.csv\"");
        
        PrintWriter writer = response.getWriter();

        // Write the header row
        writer.println("Day of Week,Start Time,End Time,Pause Start,Pause End,Total Working Hours,Total Supplementary Hours");

        // Retrieve data and write to CSV
        List<models.Temps> weeklyReport = (List<models.Temps>) request.getAttribute("weeklyReport");
        for (models.Temps time : weeklyReport) {
            // Extract data and format as CSV row
            Date date_j = time.getDate_j();
            SimpleDateFormat dateFormat = new SimpleDateFormat("EEEE", Locale.US);
            String dayOfWeek = dateFormat.format(date_j);
            
            String startTime = new SimpleDateFormat("HH:mm").format(time.getHeure_debut());
            String endTime = new SimpleDateFormat("HH:mm").format(time.getHeure_fin());
            String pauseStartTime = new SimpleDateFormat("HH:mm").format(time.getPause_debut());
            String pauseEndTime = new SimpleDateFormat("HH:mm").format(time.getPause_fin());

            long workingHoursInMillis = time.getHeure_fin().getTime() - time.getHeure_debut().getTime() - (time.getPause_fin().getTime() - time.getPause_debut().getTime());
            double workingHoursInHours = workingHoursInMillis / (60.0 * 60 * 1000);
            double supplementaryHours = Math.max(0, workingHoursInHours - 8);

            int workingHours = (int) workingHoursInHours;
            int workingMinutes = (int) ((workingHoursInHours - workingHours) * 60);

            int supplementaryHoursInt = (int) supplementaryHours;
            int supplementaryMinutes = (int) ((supplementaryHours - supplementaryHoursInt) * 60);

            String csvRow = String.format("%s,%s,%s,%s,%s,%dh%02dmin,%dh%02dmin", 
                    dayOfWeek, startTime, endTime, pauseStartTime, pauseEndTime, 
                    workingHours, workingMinutes, supplementaryHoursInt, supplementaryMinutes);

            writer.println(csvRow);
        }
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
