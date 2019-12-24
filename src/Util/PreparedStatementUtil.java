package Util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class PreparedStatementUtil {
    
    public static PreparedStatement getPrepareStatement(String sql) {
	Connection con = ConnectionUtil.getConnection();
	try {
	    return con.prepareStatement(sql);
	} catch (SQLException e) {
	    e.printStackTrace();
	}
	return null;
    }

}
