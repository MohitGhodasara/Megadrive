package MegaDrive;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.FileInputStream;
import java.io.File;
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


public class DownloadServlet extends HttpServlet {

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            MegaDrive.DataConnection data = new MegaDrive.DataConnection();
            Connection conn = data.getConnection();
            Statement stmt = null;
   try{
              stmt = conn.createStatement();
              String sql;
              HttpSession session=request.getSession(false);  
              String userid =(String)session.getAttribute("userid");
            //  String location = request.getParameter("location");
              String FileID = request.getParameter("FileID");
                    sql = "SELECT * FROM data where fileid='"+FileID+"' and userid='"+userid+"'";
                    ResultSet rs = stmt.executeQuery(sql);
                    rs.first();
                        if(rs.getString("path").equalsIgnoreCase("dir"))
                        {
                            
                        }
                    
                        
                        
                  response.setContentType("text/html");  
                
                  //String filepath = "c:\\";   
                  response.setContentType("APPLICATION/OCTET-STREAM");   
                  response.setHeader("Content-Disposition","attachment; filename=\"" + rs.getString("name") + "\"");   

                  FileInputStream fileInputStream = new FileInputStream(rs.getString("path"));  

                  int j;   
                  while ((j=fileInputStream.read()) != -1) {  
                  out.write(j);   
                  }   
                  fileInputStream.close();   
                  out.close();   
                  
              
    }catch(Exception e) {
        System.out.println(e);
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
