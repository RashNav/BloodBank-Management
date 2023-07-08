package dao;
import java.sql.*;

public class ConnectionProvider {
    private static final String jdbcURL = "jdbc:mysql://localhost:3306/bloodbankdbnew?useSSL=false";
    private static final String jdbcUsername = "root";
    private static final String jdbcPassword = "";
    private static final String jdbcDriver = "com.mysql.cj.jdbc.Driver";

    public static Connection getCon() {
        Connection connection = null;
        try {
            Class.forName(jdbcDriver);
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }
}
