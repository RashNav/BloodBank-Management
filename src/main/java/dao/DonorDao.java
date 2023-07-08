package dao;

import bean.Donor;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import static dao.ConnectionProvider.getCon;

public class DonorDao {
    private static final String INSERT_DONORS_SQL = "INSERT INTO donor VALUES(?,?,?,?,?,?,?,?,?)";
    private static final String UPDATE_DONORS_SQL = "UPDATE donor SET name=?,father=?,mother=?,mobileNumber=?,email=?,address=? WHERE id=?";

    public static void insertDonor(Donor user, HttpServletResponse response) throws ServletException, IOException {
        System.out.println(INSERT_DONORS_SQL);
        try (Connection connection = getCon();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_DONORS_SQL)) {
            preparedStatement.setString(1, user.getDonorId());
            preparedStatement.setString(2, user.getDonorName());
            preparedStatement.setString(3, user.getFather());
            preparedStatement.setString(4, user.getMother());
            preparedStatement.setString(5, user.getMobileNumber());
            preparedStatement.setString(6, user.getGender());
            preparedStatement.setString(7, user.getEmail());
            preparedStatement.setString(8, user.getBloodGroup());
            preparedStatement.setString(9, user.getAddress());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
            response.sendRedirect("addNewDonor.jsp?msg=valid");
        } catch (SQLException e) {
            response.sendRedirect("addNewDonor.jsp?msg=invalid");
        }
    }

    public static void updateDonor(Donor user, HttpServletResponse response) throws ServletException, IOException {
        System.out.println(UPDATE_DONORS_SQL);
        try (Connection connection = getCon();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_DONORS_SQL)) {
            preparedStatement.setString(1, user.getDonorName());
            preparedStatement.setString(2, user.getFather());
            preparedStatement.setString(3, user.getMother());
            preparedStatement.setString(4, user.getMobileNumber());
            preparedStatement.setString(5, user.getEmail());
            preparedStatement.setString(6, user.getAddress());
            preparedStatement.setString(7, user.getDonorId());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
            response.sendRedirect("editDeleteList.jsp?msg=valid");
        } catch (SQLException e) {
            response.sendRedirect("editDeleteList.jsp?msg=invalid");
        }
    }

    public static void deleteDonor(String id, HttpServletResponse response) throws ServletException, IOException {

        try {
            Connection connection = getCon();
            Statement st = connection.createStatement();
            st.executeUpdate("DELETE FROM donor WHERE id='"+id+"'");
            response.sendRedirect("editDeleteList.jsp?msg=deleted");
        }catch (Exception e){
            response.sendRedirect("editDeleteList.jsp?msg=invalid");
        }
    }
}
