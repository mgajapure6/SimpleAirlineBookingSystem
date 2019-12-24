package Util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionUtil {

    private static String DB_URL = "jdbc:mysql://localhost:3306/airline";
    private static String DRIVER_CLASS_PATH = "com.mysql.jdbc.Driver";
    private static String DB_USERNAME = "root";
    private static String DB_PASSWORD = "";
    private static Connection con;

    public static Connection getConnection() {
	try {
	    Class.forName(DRIVER_CLASS_PATH);
	    try {
		con = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
	    } catch (SQLException ex) {
		System.out.println("Failed to create the database connection.");
	    }
	} catch (ClassNotFoundException ex) {
	    System.out.println("Driver not found.");
	}
	return con;
    }

}
