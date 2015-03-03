package gui;

import java.awt.Dimension;
import java.awt.Toolkit;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;
import java.util.Vector;

import javax.swing.JFrame;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

import util.ConnectionFactory;
import util.ConnectionFactoryImpl;
import util.PropertyStorage;


public class EditItemList extends JFrame {

	private static final long serialVersionUID = -133935619073015602L;

	public EditItemList()
	{
	super();
	Properties	p=PropertyStorage.getFrameProperties("frameConfig");	
	setTitle(p.getProperty("defaultName"));
	setSize(Integer.parseInt(p.getProperty("width")),Integer.parseInt(p.getProperty("height")));
	Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
    double width = screenSize.getWidth();
    double height = screenSize.getHeight(); 
    setLocation((int)width/3 ,(int) height/3);
    
    
    ConnectionFactory connFactory=new ConnectionFactoryImpl();
    Connection con=connFactory.getConnection(); // create connection to database
    try
    {
    Statement stm=con.createStatement();
    ResultSet rs=stm.executeQuery("select * from item limit 10");
    JTable table = new JTable(buildTableModel(rs));
    table.setEnabled(false);
    getContentPane().add(table);
    }
    catch(SQLException e)
    {
    	
    }
    
    }
    
	public static DefaultTableModel buildTableModel(ResultSet rs)
	        throws SQLException {

	    ResultSetMetaData metaData = rs.getMetaData();

	    // names of columns
	    Vector<String> columnNames = new Vector<String>();
	    int columnCount = metaData.getColumnCount();
	    for (int column = 1; column <= columnCount; column++) {
	        columnNames.add(metaData.getColumnName(column));
	    }

	    // data of the table
	    Vector<Vector<Object>> data = new Vector<Vector<Object>>();
	    while (rs.next()) {
	        Vector<Object> vector = new Vector<Object>();
	        for (int columnIndex = 1; columnIndex <= columnCount; columnIndex++) {
	            vector.add(rs.getObject(columnIndex));
	        }
	        data.add(vector);
	    }

	    return new DefaultTableModel(data, columnNames);

	}
	
	}
	

