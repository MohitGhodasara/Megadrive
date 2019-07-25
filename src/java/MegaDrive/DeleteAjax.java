package MegaDrive;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;
import javafx.scene.web.WebEvent;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.sql.ResultSet;

public class DeleteAjax extends HttpServlet {


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
                        String Files = request.getParameter("SelectData");
                        String[] FileID = Files.split("!-!");
                    st = conn.createStatement();
                     final String dir = System.getProperty("user.dir");
        System.out.println("current dir = " + dir);
                    for(int i=0;i<FileID.length;i++)
                    {
                       String Query  = "Select * from data where fileid='"+FileID[i]+"' and userid='"+userid+"'";
                       ResultSet rs = st.executeQuery(Query);
                       rs.first();
                       
                            if(rs.getString("path").equalsIgnoreCase("dir"))
                            {
                                String SelectFolder  = "Select * from data where location='"+FileID[i]+"' and userid='"+userid+"'";
                                ResultSet rsSelect = st.executeQuery(SelectFolder);
                                while(rsSelect.next())
                                {
                                    new File(rsSelect.getString("path")).delete();
                                }
                               String DeleteFile  = "Delete from data where location='"+FileID[i]+"' and userid='"+userid+"'";
                                st.executeUpdate(DeleteFile);
                                System.out.println("Fileid ==== "+FileID[i]);
//                                String DeleteFolder  = "Delete from data where fileid='"+FileID[i]+"' and userid='"+userid+"'";
//                                        st.executeUpdate(DeleteFolder);
//                                      
                                      //     new File(rs.getString("path")).delete();
                                      
                                      
                            }
                            else
                            {
                                new File(rs.getString("path")).delete();
                            }
                        
                    }
                    for(int i=0;i<FileID.length;i++)
                    {
                       String Query  = "Delete from data where fileid='"+FileID[i]+"' and userid='"+userid+"'";
                       st.executeUpdate(Query);
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
