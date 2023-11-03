package servlets;

import java.util.Timer;
import java.util.TimerTask;
import java.util.Calendar;
import java.util.List;


public class EmailSenderTask extends TimerTask {

	 @Override
	    public void run() {
	        Calendar now = Calendar.getInstance();
	        int dayOfWeek = now.get(Calendar.DAY_OF_WEEK);
	        int hourOfDay = now.get(Calendar.HOUR_OF_DAY);
	        int minuteOfDay = now.get(Calendar.MINUTE);
	        
	        
	        

	        // Check if the time is 18:40
	        if (dayOfWeek >= Calendar.MONDAY && dayOfWeek <= Calendar.FRIDAY &&  hourOfDay == 02 && minuteOfDay == 18) {
	            try {
	                EmployeeEmailRetrieval retrieval = new EmployeeEmailRetrieval();
	                List<String> emailAddresses = retrieval.retrieveEmployeeEmails();

	                for (String email : emailAddresses) {
	                    System.out.println(email);
	                }

	                // Send email to the retrieved addresses
	                retrieval.sendEmailToEmployees(emailAddresses);
	                System.out.println("Emails sent successfully.");
	            } catch (Exception e) {
	                e.printStackTrace();
	                System.err.println("Error sending emails: " + e.getMessage());
	            }
	        
	        
/*
	        // Check if it's a weekday (Monday to Friday) and the time is 17:00
	        if (dayOfWeek >= Calendar.MONDAY && dayOfWeek <= Calendar.SUNDAY && hourOfDay == 18 && minuteOfDay == 35) {
	        	   EmployeeEmailRetrieval retrieval = new EmployeeEmailRetrieval();
	               List<String> emailAddresses = retrieval.retrieveEmployeeEmails();

	               for (String email : emailAddresses) {
	                   System.out.println(email);
	               }
	               
	            // Send email to the retrieved addresses
	               retrieval.sendEmailToEmployees(emailAddresses);
	               
	               */
	        	
	        	
	        	/*EmployeeEmailRetrieval retrieval = new EmployeeEmailRetrieval();
	            List<String> emailAddresses = retrieval.retrieveEmployeeEmails();
	            retrieval.sendEmailToEmployees(emailAddresses);
	            */
	        }
	    }
	 
	 
	 public static void main(String[] args) {
		 
		 	Timer timer = new Timer();
		    EmailSenderTask task = new EmailSenderTask();

		    // Schedule the task to run every minute
		    timer.scheduleAtFixedRate(task, 0, 60000);
	 }
}
