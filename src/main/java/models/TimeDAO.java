package models;


import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.time.LocalDate;
import java.sql.Date;
import models.ConnectToDb;

public class TimeDAO {
	public List<Temps> getWeeklyReport(int employeeId, int currentWeekNumber) throws SQLException {
        List<Temps> weeklyReport = new ArrayList<>();
       
        Connection connection= null;
        try {
            connection =ConnectToDb.getConnection();
            String query = "SELECT * FROM temps WHERE id_employé = ? AND WEEK(date_j, 1) = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, employeeId);
            preparedStatement.setInt(2, currentWeekNumber);
           /* preparedStatement.setDate(2, Date.valueOf(startDate));
            preparedStatement.setDate(3, Date.valueOf(endDate));*/
            ResultSet resultSet = preparedStatement.executeQuery();     


            while (resultSet.next()) {
                Temps time = new Temps();
                time.setId(resultSet.getInt("id"));
                time.setDate_j(resultSet.getDate("date_j"));
                time.setHeure_debut(resultSet.getTime("heure_debut"));
                time.setHeure_fin(resultSet.getTime("heure_fin"));
                time.setPause_debut(resultSet.getTime("pause_debut"));
                time.setPause_fin(resultSet.getTime("pause_fin"));
                weeklyReport.add(time);
            }


        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return weeklyReport;
	}

public int getWeekNumberForEmployee(int employeeId) throws SQLException {
    Connection connection = null;
    int weekNumber = 0;

    try {
        connection = ConnectToDb.getConnection();
        String query = "SELECT CEIL(DATEDIFF(NOW(), MIN(date_j)) / 7) as current_week FROM temps WHERE id_employé = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        preparedStatement.setInt(1, employeeId);
        ResultSet resultSet = preparedStatement.executeQuery();

        if (resultSet.next()) {
            weekNumber = resultSet.getInt("current_week");
        }

    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    return weekNumber;
}
}
