# Time Management System

This repository contains a Java web application designed for tracking the work hours of employees. The system offers several functionalities:

## Features:

- **Work Hour Tracking:** Employees can log their work hours by starting and ending their work sessions, as well as starting and ending pause times.

- **Mood Tracking:** An anonymous form is automatically sent to every employee after 6 PM to track their mood, providing insights into employee well-being.

- **Admin Dashboard:** Administrators have access to statistics and reports. They can view comprehensive data including:
    - Weekly reports for each employee showcasing their work hours, supplementary hours, and more.
    - Overall statistics to analyze and manage work hour trends, productivity, and employee engagement.

## Usage:

To utilize this application, follow these steps:
1. Clone this repository to your local environment.
2. Set up the necessary dependencies and environment configurations as outlined in the documentation.
3. Deploy the application to a Java web server.
4. Configure the admin panel and employee access accounts.
5. Access the system through the appropriate URLs and interfaces.

## Running with Docker Compose:

This application also supports Docker for deployment. To run using Docker Compose, follow these steps:

1. Make sure you have Docker and Docker Compose installed on your system.
2. Navigate to the root directory of this repository in your terminal.
3. Use the following command to build and run the application:
   ```
   docker-compose up
   ```
4. Access the system through the defined ports and interfaces according to your Docker setup.

## System Requirements:

- Java Runtime Environment (JRE)
- Web server capable of running Java web applications
- Database system for storing employee information and work hour data

