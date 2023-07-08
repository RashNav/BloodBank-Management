package dao;

import bean.Requester;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class RequesterDao {
    private static final String INSERT_REQUESTER_SQL = "INSERT INTO bloodRequest VALUES(?,?,?,?,?)";

    public static void insertDonor(Requester requester, HttpServletResponse response) throws ServletException, IOException {
        System.out.println(INSERT_REQUESTER_SQL);
        try (Connection con = ConnectionProvider.getCon();
             PreparedStatement preparedStatement = con.prepareStatement(INSERT_REQUESTER_SQL)) {
            preparedStatement.setString(1, requester.getRequesterName());
            preparedStatement.setString(2, requester.getMobileNumber());
            preparedStatement.setString(3, requester.getEmail());
            preparedStatement.setString(4, requester.getBloodGroup());
            preparedStatement.setString(5, requester.getStatus());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
            response.sendRedirect("index.jsp?msg=valid");
        } catch (SQLException e) {
            response.sendRedirect("index.jsp?msg=invalid");
        }
    }
}
