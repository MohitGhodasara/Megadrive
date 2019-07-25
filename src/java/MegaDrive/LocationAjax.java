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

public class LocationAjax extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try{
                DataConnection data = new DataConnection();
                            Connection conn = data.getConnection();
                            Statement st = conn.createStatement();
                            String Query;
                            String Location = request.getParameter("Location");
                            String id = request.getParameter("id");
                            if(Location.equalsIgnoreCase("state"))
                            {
                                Query = "Select * from state where countryid='"+id+"' ";
                                
                                String state="<select class=\"form-control\" required name=\"state\" onchange=\"getLocation('city',this.value,countryID.value);\" >\n" +
"                  <option selected disabled >State</option>";
                                out.println(state);
                            }
                           else
                            {
                                String city="<select class=\"form-control\" required name=\"city\"   >\n" +
"                   <option selected disabled>City</option>";
                                out.println(city);
                                String countryID = request.getParameter("countryID");
                                Query = "Select * from city where stateid='"+id+"' and countryid='"+countryID+"' ";
                            }
                            
                            ResultSet rs = st.executeQuery(Query);
                            
                            
                            while(rs.next())
                            {
                                String option = "<option value="+rs.getString(1)+">"+rs.getString(2)+"</option>";
                                
                                out.println(option);
                            }
                            out.println("</select>");
        }catch(Exception e )
        {
            out.println(e);
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
