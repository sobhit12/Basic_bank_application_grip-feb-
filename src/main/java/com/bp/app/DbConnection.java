package com.bp.app;

import java.io.InputStream;
import java.sql.Connection;
import java.util.Properties;

import com.mysql.cj.jdbc.MysqlDataSource;


public class DbConnection {
	 static Connection con;
	 
	 public  static Connection getConnect() {
   	  String jdbc_url=null,username=null,password=null;
   	  try {
   		  InputStream is=DbConnection.class.getResourceAsStream("db.properties");
   		  Properties p=new Properties();
   		  p.load(is);//loaded iostream object :
   		  
   		 jdbc_url=p.getProperty("jdbc-url");
   		 username=p.getProperty("username");
   		 password=p.getProperty("password");
   		  
			
		} catch (Exception e) {
		e.printStackTrace();
		}
   	  try {
   		//Connection Pool:
     		MysqlDataSource ds=new MysqlDataSource();
     		
     		ds.setUrl(jdbc_url);
     		ds.setUser(username);
     		ds.setPassword(password);
     		con=ds.getConnection();
   	  
   	  } catch (Exception e) {
			e.printStackTrace(); 
		}
   	  return con;
     }
	
}
