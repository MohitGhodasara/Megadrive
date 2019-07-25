package MegaDrive;


import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

public class FileUploadServlet extends HttpServlet {
	 protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
         
         DataConnection data = new DataConnection();            
            Connection conn = data.getConnection();
             Statement st = null;

	        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
            if (isMultipart) {
	        	// Create a factory for disk-based file items
	        	FileItemFactory factory = new DiskFileItemFactory();

	        	// Create a new file upload handler
	        	ServletFileUpload upload = new ServletFileUpload(factory);
                
                HttpSession session = request.getSession(false);            
                String userid = (String)session.getAttribute("userid");
	 
	            try {
	            	// Parse the request
	            	List /* FileItem */ items = upload.parseRequest(request);

	                Iterator iterator = items.iterator();
	                while (iterator.hasNext()) {
	                    FileItem item = (FileItem) iterator.next();    
	                    if (!item.isFormField()) {
	                        String fileName = item.getName();	 
String uniqueID = UUID.randomUUID().toString();                                                
String ext = FilenameUtils.getExtension(fileName);
	                        String root = getServletContext().getRealPath("/");
	                        File path = new File(root + "/DataFile/"+userid);
	                        if (!path.exists()) {
	                            boolean status = path.mkdirs();
	                        }
	 
	                        File uploadedFile = new File(path + "/" + uniqueID+"."+ext);
	                        System.out.println(uploadedFile.getAbsolutePath());
	                        item.write(uploadedFile);
                            long size = item.getSize();
            
            
            String location = request.getParameter("location");
            System.out.println("locatuion="+location);
            
            String datapath = "DataFile\\"+userid+"\\"+uniqueID+"."+ext;
            String ChangePath = path + "\\" +uniqueID+"."+ext;
                       

            
            
           
           // st = conn.createStatement();
            String Query  = "insert into data (userid,name,fileid,extensions,size,location,path) values(?,?,?,?,?,?,?)";        
            PreparedStatement ps = conn.prepareStatement(Query);
               ps.setString(1, userid);
               ps.setString(2, fileName);
               ps.setString(3, uniqueID);
               ps.setString(4, ext);
               ps.setLong(5, size);
               ps.setString(6, location);
               ps.setString(7, ChangePath.replace("\\", "/"));
            ps.executeUpdate();
                    
	                    }
	                }
	            } catch (FileUploadException e) {
	                e.printStackTrace();
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        }
	    }

}