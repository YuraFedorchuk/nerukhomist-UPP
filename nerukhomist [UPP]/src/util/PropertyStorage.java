package util;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

public class PropertyStorage {
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
