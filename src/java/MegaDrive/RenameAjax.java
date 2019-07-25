package MegaDrive;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class RenameAjax extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
        
                    DataConnection data = new DataConnection();            
            Connection conn = data.getConnection();
             Statement st = null;
  
                try{
                    
                    out.println("<script> alrt('hello'); </script>");
                    
                        HttpSession session = request.getSession(false);            
            String userid = (String)session.getAttribute("userid");
            String name = request.getParameter("name");
            String Files = request.getParameter("SelectData");
            String[] FileID = Files.split("!-!");
            String MultipleName="";
                    for(int i=0;i<FileID.length;i++)
                    {
                        
                        if(i > 0)
                        {
                            
                            MultipleName = new StringBuilder().append(" (").append(i).append(")").toString();
                      
                        }
                        String Select  = "Select * from data where userid=? and fileid=?";
                        PreparedStatement psSelect = conn.prepareStatement(Select);
                        psSelect.setString(1, userid);
                        psSelect.setString(2, FileID[i]);
                        ResultSet rs = psSelect.executeQuery();
                        rs.next();
                        String DotExt="";
                        
                        
                        String Query  = "Update data set name=? where userid=? and fileid=?";
                        PreparedStatement ps = conn.prepareStatement(Query);
                        if(!rs.getString("extensions").equalsIgnoreCase("dir"))
                        {
                            DotExt= "."+rs.getString("extensions");
                        }
                        if(name.indexOf(".")>0)
                        {
                            DotExt="";
                        }
                        ps.setString(1, name+MultipleName+DotExt);
                        ps.setString(2, userid);
                        ps.setString(3, FileID[i]);
                        ps.executeUpdate();
                        MultipleName="";
                    }
            
                }
                catch(Exception e)
                {
                    out.println(e);
                }
            
            
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
