package MegaDrive;


import MegaDrive.DataConnection;
import static com.sun.xml.bind.util.CalendarConv.formatter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class RegistrationServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try{
                   int status=0;  
                   DataConnection data = new DataConnection();
                   Connection conn = data.getConnection();
String query = "INSERT INTO userinfo (name,sname,userid,emailid,password,gender,birthdate,mobile,countryid,stateid,city) values(?,?,?,?,?,?,?,?,?,?,?)";
                   PreparedStatement ps=conn.prepareStatement(query);
                     ps.setString(1,request.getParameter("fname"));  
                    ps.setString(2,request.getParameter("lname"));  
                    ps.setString(3,request.getParameter("username")); 
                    ps.setString(4,request.getParameter("email"));  
                    ps.setString(5,request.getParameter("password"));  
                    ps.setString(6,request.getParameter("gender"));     
                    ps.setString(7,request.getParameter("date"));  
                    ps.setString(8,request.getParameter("phone"));  
                    ps.setString(9,request.getParameter("country"));  
                    ps.setString(10,request.getParameter("state"));  
                    ps.setString(11,request.getParameter("city")); 
                   
                    status=ps.executeUpdate();  
                    if(status > 0)
                    {
                        request.getRequestDispatcher("Data.jsp").include(request, response);  
                    }
                    else
                    {
                        out.println("error .... place Check Data");
                    }
   
        }catch(Exception e){
        out.println(e);
        } 
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
