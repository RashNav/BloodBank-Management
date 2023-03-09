package project;
import java.sql.*;

public class ConnectionProvider {
    public static Connection getCon(){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection("jdbc:mysql://localhost:8888/bloodbank?useSSL=false","root","");
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }
}
