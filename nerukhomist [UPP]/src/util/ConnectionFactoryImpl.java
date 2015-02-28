package util;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

import javax.swing.JOptionPane;

public class ConnectionFactoryImpl implements  ConnectionFactory{

	@Override
	public Connection getConnection() {
		Properties	p=getFrameProperties("databaseConfig");
	    String databaseProtocol =p.getProperty("databaseProtocol");
	    String dbName=p.getProperty("dbName");
        String driver =p.getProperty("driver");
        String user=p.getProperty("user");
        String password=p.getProperty("password");
        Connection conn = null;
        String jdbcURL = databaseProtocol+dbName+"?autoReconnect=true&relaxAutoCommit=true";
       
        System.setProperty("jdbc.drivers", driver);
        //Do Connection
        try {
     	   
        conn = DriverManager.getConnection(jdbcURL, user,password);
        
        }
             catch (SQLException se) 
             {
             	JOptionPane.showMessageDialog(null,
             		    se,
             		    "SQL Error: ",
             		    JOptionPane.ERROR_MESSAGE);
             System.out.println("SQL Error: "+se);
             }
        
        return conn;
     }
	
	
	public static Properties getFrameProperties(String a)
	{
	
		Properties	_prop = new Properties();
		
		 try {
			_prop.load(new FileInputStream("Resources/"+a+".properties"));
		} 
		 catch (FileNotFoundException e) {
	
			e.printStackTrace();
		} catch (IOException e) {

			e.printStackTrace();
		}

		
	return _prop;
}
	

}
