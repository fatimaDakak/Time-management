package servlets;

import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import java.util.Base64;


import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmployeeEmailRetrieval {
	
	
	// Retrieving the emails from the Database

    public List<String> retrieveEmployeeEmails() {
        List<String> emailAddresses = new ArrayList<>();

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            // 1. Set up the database connection (replace with your database details)
            String url = "jdbc:mysql://localhost:3306/employee_management";
            String username = "root";
            String password = "";
            
            connection = DriverManager.getConnection(url, username, password);

            // 2. Execute the SQL query
            String sql = "SELECT email FROM employes";
            preparedStatement = connection.prepareStatement(sql);

            // 3. Retrieve the data
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                String email = resultSet.getString("email");
                emailAddresses.add(email);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 4. Close the database resources
            try {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return emailAddresses;
    }
    
    
    /// Sending the Email
    
    
    public void sendEmailToEmployees(List<String> emailAddresses) {
        // Configure your email server settings
        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        // Create a mail session
        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("funny.bunn.team@gmail.com", "xmfp babd mrvs cpie ");
            }
        });
        
        

        try {
            // Create a message
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("funny.bunn.team@gmail.com"));
            message.setSubject("Your One-Time Access Link");

            // Generate a unique one-time access token
            String token = generateOneTimeToken();
            String link = "http://localhost:8081/Time-management/AddHumeur?token=" + token;

            // Build the email content with the link
            String emailContent = "Click on the following link to access the resource: <a href='" + link + "'>" + link + "</a>";

            message.setContent(emailContent, "text/html");

            // Send the email to each address in the list
            for (String toEmail : emailAddresses) {
                message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));

                // Send the email
                Transport.send(message);
                System.out.println("Email sent to: " + toEmail);
            }
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    // Generate a unique one-time access token
    private String generateOneTimeToken() {
        SecureRandom random = new SecureRandom();
        byte[] tokenBytes = new byte[32];
        random.nextBytes(tokenBytes);
        return Base64.getEncoder().encodeToString(tokenBytes);
        /*try {
            // Create a message
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("funny.bunn.team@gmail.com"));
            message.setSubject("test");
            message.setText("Sent in time");
            // Send the email to each address in the list
            for (String toEmail : emailAddresses) {
                message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));

                // Send the email
                Transport.send(message);
                System.out.println("Email sent to: " + toEmail);
            }
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        */
    }
    
    
    public static void main(String[] args) {
        EmployeeEmailRetrieval retrieval = new EmployeeEmailRetrieval();
        List<String> emailAddresses = retrieval.retrieveEmployeeEmails();

        for (String email : emailAddresses) {
            System.out.println(email);
        }
        
     // Send email to the retrieved addresses
        retrieval.sendEmailToEmployees(emailAddresses);
    }
}
