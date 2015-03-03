package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

import javax.swing.JOptionPane;

public class ConnectionFactoryImpl implements  ConnectionFactory{

	@Override
	public Connection getConnection() {
		Properties	p=PropertyStorage.getFrameProperties("databaseConfig");
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
        //
        return conn;
     }
	
	

	

}
