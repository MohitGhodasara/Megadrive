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


public class GetInfoServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
          DataConnection data = new DataConnection();            
            Connection conn = data.getConnection();
             Statement st = null;
              
              
                
        try
        {
            
            HttpSession session = request.getSession(false);            
            String userid = (String)session.getAttribute("userid");
            String FileID = request.getParameter("FileID");
            String Query = "Select * from data where fileid='"+FileID+"' AND userid='"+userid+"' ";
            st = conn.createStatement();
            ResultSet rs = st.executeQuery(Query);
            rs.first();
            String path = rs.getString("path");
            String ext = rs.getString("extensions");
            
            if(ext.equalsIgnoreCase("jpg") || ext.equalsIgnoreCase("bmp") || ext.equalsIgnoreCase("gif")  || ext.equalsIgnoreCase("png"))
            {
               String image[] = path.split("DataFile");
               path="DataFile"+image[1];
            }
            else
            {
                 path= "Img/"+ext+".png"; 
            }
            
            SizeServlet ss = new SizeServlet();
            String FullSize = ss.getSize(Integer.parseInt(rs.getString("size")));
            
            
            String info = "<div class=\"profile-userpic \">\n" +
"    <img src='"+path+"' onerror=\"this.src='Img/other.png'\"  style=\"padding: 5px;border-radius: 20px; height: 50%;width: 100%; \" alt=\"\">\n" +
"        </div>\n" +
"\n" +
"<div class=\"profile-usermenu\">\n" +
"        <ul class=\"nav wrap \">\n" +
"                <li class=\"active \">\n" +
"                        <a onclick=\"renameBox()\" >\n" +
"                            <i class=\"glyphicon glyphicon-pencil\" style=\"padding-right: 3px;\"></i>\n" +
"                            <b> "+rs.getString("name")+"</b> </a>\n" +
"                </li>\n" +
"                <li>\n" +
"                        <a >\n" +
"                        <i class=\"glyphicon glyphicon-retweet\" style=\"padding-right: 3px;\"></i>\n" +
"                        <b>Size : </b> "+FullSize+" </a>\n" +
"                </li>\n" +
"                <li>\n" +
"                        <a target=\"_blank\">\n" +
"                        <i class=\"glyphicon glyphicon-file \" style=\"padding-right: 3px;\"></i>\n" +
"                        <b>Type :</b> "+ext+" </a>\n" +
"                </li>\n" +

"        </ul>\n" +
"</div>\n" +
"\n" +
"\n" +
"            ";
            
            out.println(info);
            
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
