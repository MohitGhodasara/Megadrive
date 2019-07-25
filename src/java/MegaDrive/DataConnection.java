package MegaDrive;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class DataConnection
{
    final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
    final String DB_URL = "jdbc:mysql://localhost/Megadrive";

   final String USER = "root";
   final String PASS = "";
   
    Connection conn = null;
   Statement stmt = null;
   
      //STEP 2: Register JDBC driver
      
   
    public  Connection getConnection()
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");

            //STEP 3: Open a connection
            System.out.println("Connecting to database...");
            conn = DriverManager.getConnection(DB_URL,USER,PASS);    
        }
        catch(Exception e)
        {
            System.out.println(e.getMessage());
        }
        return conn;
    }

    public Statement createStatement() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
