package dao;

import java.sql.PreparedStatement;
import java.util.HashMap;
import java.util.Map;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import Util.FetchDBDataUtil;
import Util.PreparedStatementUtil;

public class LoginDao {

    public Map<String, Object> processLogin(String role, String username, String password) {
	Map<String, Object> respMap = new HashMap<String, Object>();
	String sql = null;
	if (role.toLowerCase().equals("admin")) {
	    sql = "Select * from admin where username = ? and password = ?";
	} else if (role.toLowerCase().equals("manager")) {
	    sql = "Select * from manager where username = ? and password = ?";
	} else {
	    sql = "Select * from customer where username = ? and password = ?";
	}

	System.out.println("sql:" + sql);
	try {
	    PreparedStatement ps = PreparedStatementUtil.getPrepareStatement(sql);
	    ps.setString(1, username);
	    ps.setString(2, password);
	    JsonArray fdata = FetchDBDataUtil.getFetchedData(ps);
	    if (fdata.size() > 0) {
		System.out.println("Record found");
		JsonObject obj = (JsonObject) fdata.get(0);
		if (obj.get("username").getAsString().equals(username)
			&& obj.get("password").getAsString().equals(password)) {
		    respMap.put("found", true);
		    respMap.put("data", obj);
		    return respMap;
		} else {
		    respMap.put("found", false);
		    return respMap;
		}
	    } else {
		System.out.println("Record not found");
		respMap.put("found", false);
		return respMap;
	    }
	} catch (Exception e) {
	    e.printStackTrace();
	    respMap.put("found", false);
	    return respMap;
	}
    }

    public static void main(String[] args) {
	LoginDao loginDao = new LoginDao();
	loginDao.processLogin("admin", "admin", "admin");
    }
}
