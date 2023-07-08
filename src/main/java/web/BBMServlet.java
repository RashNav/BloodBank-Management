package web;

import bean.Donor;
import bean.Requester;
import dao.ConnectionProvider;
import dao.DonorDao;
import dao.RequesterDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

@WebServlet(name = "helloServlet", value = "/")
public class BBMServlet extends HttpServlet {

    public void init() {}

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doGet(request,response);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");

        String action = request.getServletPath();

        try {
            switch (action) {
                case "/indexAction":
                    addRequester(request, response);
                    break;
                case "/loginAction":
                    adminCheck(request, response);
                    break;
                case "/addNewDonorAction":
                    addDonor(request, response);
                    break;
                case "/updateDonorAction":
                    updateDonor(request, response);
                    break;
                case "/deleteDonorAction":
                    deleteDonor(request, response);
                    break;
                case "/manageStockAction":
                    updateStock(request, response);
                    break;
                case "/reqAcceptAction":
                    acceptRequest(request, response);
                    break;
                case "/reqDeclineAction":
                    declineRequest(request, response);
                    break;
            }
        } catch (ServletException ex) {
            throw new ServletException(ex);
        }
    }

    private void addRequester(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String name = request.getParameter("name");
        String mobileNumber = request.getParameter("mobileNumber");
        String email = request.getParameter("email");
        String bloodGroup = request.getParameter("bloodGroup");
        String status = "pending";

        Requester newRequester = new Requester(name,mobileNumber,email,bloodGroup,status);
        RequesterDao.insertDonor(newRequester,response);
    }

    private void adminCheck(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if ("admin".equals(username) && "admin".equals(password)){
            response.sendRedirect("addNewDonor.jsp");
        }
        else{
            response.sendRedirect("adminLogin.jsp?msg=invalid");
        }
    }

    private void addDonor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String father = request.getParameter("father");
        String mother = request.getParameter("mother");
        String mobileNumber = request.getParameter("mobileNumber");
        String gender = request.getParameter("gender");
        String email = request.getParameter("email");
        String bloodGroup = request.getParameter("bloodGroup");
        String address = request.getParameter("address");

        Donor newDonor = new Donor(id,name,father,mother,mobileNumber,gender,email,bloodGroup,address);
        DonorDao.insertDonor(newDonor, response);
    }

    private void updateDonor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String father = request.getParameter("father");
        String mother = request.getParameter("mother");
        String mobileNumber = request.getParameter("mobileNumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");

        Donor newDonor = new Donor(name,father,mother,mobileNumber,email,address,id);
        DonorDao.updateDonor(newDonor, response);
    }

    private void deleteDonor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id = request.getParameter("id");
        DonorDao.deleteDonor(id,response);
    }

    private void updateStock(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String bloodGroup = request.getParameter("bloodGroup");
        String state = request.getParameter("state");
        String units = request.getParameter("units");

        try {
            Connection con = ConnectionProvider.getCon();
            Statement st = con.createStatement();
            if (state.equals("increment")){
                st.executeUpdate("UPDATE stock set units=units+'"+units+"'WHERE bloodgroup='"+bloodGroup+"'");
            }
            else{
                st.executeUpdate("UPDATE stock set units=units-'"+units+"'WHERE bloodgroup='"+bloodGroup+"'");
            }
            response.sendRedirect("manageStock.jsp?msg.valid");
        }catch (Exception e){
            response.sendRedirect("manageStock.jsp?msg.invalid");
        }
    }

    private void acceptRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String mobileNumber = request.getParameter("mobileNumber");
        try {
            Connection con = ConnectionProvider.getCon();
            PreparedStatement ps = con.prepareStatement("UPDATE bloodrequest SET status='approved' WHERE mobilenumber=?");
            ps.setString(1,mobileNumber);
            ps.executeUpdate();
            response.sendRedirect("bloodRequestList.jsp");
        }catch (Exception e){
            System.out.println(e);
        }
    }

    private void declineRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String mobileNumber = request.getParameter("mobileNumber");
        try {
            Connection con = ConnectionProvider.getCon();
            Statement st = con.createStatement();
            st.executeUpdate("DELETE FROM bloodrequest WHERE mobilenumber='"+mobileNumber+"'");
            response.sendRedirect("bloodRequestList.jsp");
        }catch (Exception e){
            System.out.println(e);
        }
    }

    public void destroy() {
    }
}