package MegaDrive;



import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ProfileServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
         
        try{
                   int status=0;  
                   MegaDrive.DataConnection data = new MegaDrive.DataConnection();
                   Connection conn = data.getConnection();
                    HttpSession session = request.getSession(false);            
                   String userid = (String)session.getAttribute("userid");
String query = "Update userinfo set name=?,sname=?,password=?,birthdate=?,mobile=? where userid='"+userid+"' ";
                   PreparedStatement ps=conn.prepareStatement(query);
                     ps.setString(1,request.getParameter("fname"));  
                    ps.setString(2,request.getParameter("lname"));  
                    ps.setString(3,request.getParameter("password"));    
                    ps.setString(4,request.getParameter("date"));  
                    ps.setString(5,request.getParameter("phone"));
                   
                    status=ps.executeUpdate();  
                    System.out.println("========"+status);
                    if(status > 0)
                    {
                        request.getRequestDispatcher("Profile.jsp").include(request, response);  
                    }
                    else
                    {
                        request.getRequestDispatcher("Profile.jsp").include(request, response);  
                    }
                    
        }catch(Exception e){
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
