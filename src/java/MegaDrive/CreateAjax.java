package MegaDrive;


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
import java.util.UUID;

public class CreateAjax extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            DataConnection data = new DataConnection();            
            Connection conn = data.getConnection();
             Statement st = null;
  
                try{                   
                        HttpSession session = request.getSession(false);            
            String userid = (String)session.getAttribute("userid");
            String name = request.getParameter("name");
            String ext = "dir";
            String location = request.getParameter("location");
            String path = "dir";
            String uniqueID = UUID.randomUUID().toString();            
            st = conn.createStatement();
            String Query  = "insert into data (userid,name,fileid,extensions,location,path) values('"+userid+"','"+name+"','"+uniqueID+"','"+ext+"','"+location+"','"+path+"')";
            st.executeUpdate(Query);
            
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
    }// </editor-fold>

}
