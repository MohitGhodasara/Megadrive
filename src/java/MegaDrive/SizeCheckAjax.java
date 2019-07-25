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

public class SizeCheckAjax extends HttpServlet {

 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
             DataConnection data = new DataConnection();            
            Connection conn = data.getConnection();
             Statement st = null;
                HttpSession session = request.getSession(false);            
                String userid = (String)session.getAttribute("userid");
         
                try{
                    
                                       
            String SizeQuery = "SELECT SUM(size) FROM data where userid='"+userid+"' ;";
            st = conn.createStatement();
            ResultSet rs = st.executeQuery(SizeQuery);
            rs.first();
            long FileSize = Long.parseLong(request.getParameter("size"));
            long TotalSize = rs.getLong(1);
            SizeServlet ss = new SizeServlet();
            //out.println((1024*1024*1024));
            long GB = 1024*1024*1024;
            if(TotalSize+FileSize<= GB)
            {
                out.print("Space");
            }
            else
            {
                out.print("NoSpace");
            }
                        
                }catch(Exception e)
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
