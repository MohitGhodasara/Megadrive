package MegaDrive;


import MegaDrive.DataConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
              
    DataConnection data = new DataConnection();
    Connection conn = data.getConnection();
   Statement stmt = null;
        try (PrintWriter out = response.getWriter()) {
            String Username = request.getParameter("username");
            String Password = request.getParameter("password");
            
           
        try
        {
            
                          stmt = conn.createStatement();
                          String sql = "select * from userinfo where userid='" + Username + "' and password='" + Password + "'";
                          ResultSet rs = stmt.executeQuery(sql);
                          

                 if (rs.next()) 
                 {
                            String role=rs.getString("role");  
                            if(role.equalsIgnoreCase("admin"))
                            {  
                                   out.print("Welcome, "+Username);  
                                   HttpSession session=request.getSession();  
                                   session.setAttribute("userid",Username); 
                                   response.sendRedirect("./Admin/Access/UserList.jsp");
                            }  
                            else
                            {  
                                   out.print("Welcome, "+Username);  
                                   HttpSession session=request.getSession();  
                                  session.setAttribute("userid", Username);  
                                   response.sendRedirect("index.jsp");  
                            }

                }
                else 
                {
out.println("<div style=\"padding-top:60px;padding-left:20px\">Invalid password ..   <a> try again</a></div>");
                            request.getRequestDispatcher("Login.jsp").include(request, response);  
                }
      }
      catch(Exception e)
      {
          out.println(e);
      }
          
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
