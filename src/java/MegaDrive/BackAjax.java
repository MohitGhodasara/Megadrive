package MegaDrive;


import MegaDrive.DataConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/BackAjax"})
public class BackAjax extends HttpServlet {
    
     public void fileCreate(PrintWriter out,String name,String fileid,String path,String DoubleClick) 
     {
         
        out.print("<a  data-toggle=\"tooltip\" FileName='"+name+"' title='"+name+"' "+DoubleClick+" id='"+fileid+"' class=\"navbar-brand col-sm-2 folder\" >\n" +
"        <span ><img src='"+path+"' onerror=\"this.src='Img/other.png'\"  class=\"imgstyle\" /></div></span>\n" +
"       "+name+"\n" +
"    </a>");
         
    }  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        
    DataConnection data = new DataConnection();
    Connection conn = data.getConnection();
   Statement stmt = null;
    
   try{
       
      stmt = conn.createStatement();
      String sql;
       HttpSession session=request.getSession(false);  
      String userid =(String)session.getAttribute("userid");
      String location = request.getParameter("location");
      sql = "SELECT * FROM data where userid='"+userid+"' and location='"+location+"'";
      ResultSet rs = stmt.executeQuery(sql);

     
      while(rs.next()){
         int id  = rs.getInt("id");
         String name = rs.getString("name");
         String fileid = rs.getString("fileid");
         String ext = rs.getString("extensions");
         String loc = rs.getString("location");
         String path = rs.getString("path");
         String DoubleClick="";
         if(!path.equalsIgnoreCase("dir"))
         {
             
             if(ext.equalsIgnoreCase("jpg") || ext.equalsIgnoreCase("bmp") || ext.equalsIgnoreCase("gif") || ext.equalsIgnoreCase("png"))
             {
                 String image[] = path.split("DataFile");
                 path="DataFile"+image[1];
             }
             else
             {
                 path= "Img/"+ext+".png"; 
             }
         }
         else
         {
             path= "Img/"+ext+".png";
             DoubleClick="ondblclick=\"location.href='Data.jsp?location="+fileid+"'\""; 
         }
       
        
         fileCreate(out,name,fileid,path,DoubleClick);
   }
    
      rs.close();
      stmt.close();
      conn.close();
   }catch(SQLException se){
   
      se.printStackTrace();
   }catch(Exception e){
      
      e.printStackTrace();
   }finally{
     
      try{
         if(stmt!=null)
            stmt.close();
      }catch(SQLException se2){
      }// nothing we can do
      try{
         if(conn!=null)
            conn.close();
      }catch(SQLException se){
         se.printStackTrace();
      }//end finally try
   }//end try
   System.out.println("Complite!");
        
        
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
