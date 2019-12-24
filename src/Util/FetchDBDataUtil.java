package Util;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

public class FetchDBDataUtil {

    public static JsonArray getFetchedData(PreparedStatement ps) {
	Gson gson = new Gson();
	JsonArray json = new JsonArray();
	try {
	    ResultSet rs = ps.executeQuery();
	    ResultSetMetaData rsmd = rs.getMetaData();
	    while (rs.next()) {
		int numColumns = rsmd.getColumnCount();
		JsonObject obj = new JsonObject();
		for (int i = 1; i < numColumns + 1; i++) {
		    String column_name = rsmd.getColumnName(i);

		    switch (rsmd.getColumnType(i)) {
		    case java.sql.Types.ARRAY:
			obj.addProperty(column_name, gson.toJson(rs.getArray(column_name)));
			break;
		    case java.sql.Types.BIGINT:
			obj.addProperty(column_name, rs.getInt(column_name));
			break;
		    case java.sql.Types.BOOLEAN:
			obj.addProperty(column_name, rs.getBoolean(column_name));
			break;
		    case java.sql.Types.BLOB:
			obj.addProperty(column_name, gson.toJson(rs.getBlob(column_name)));
			break;
		    case java.sql.Types.DOUBLE:
			obj.addProperty(column_name, rs.getDouble(column_name));
			break;
		    case java.sql.Types.FLOAT:
			obj.addProperty(column_name, rs.getFloat(column_name));
			break;
		    case java.sql.Types.INTEGER:
			obj.addProperty(column_name, rs.getInt(column_name));
			break;
		    case java.sql.Types.NVARCHAR:
			obj.addProperty(column_name, rs.getNString(column_name));
			break;
		    case java.sql.Types.VARCHAR:
			obj.addProperty(column_name, rs.getString(column_name));
			break;
		    case java.sql.Types.TINYINT:
			obj.addProperty(column_name, rs.getInt(column_name));
			break;
		    case java.sql.Types.SMALLINT:
			obj.addProperty(column_name, rs.getInt(column_name));
			break;
		    case java.sql.Types.DATE:
			obj.addProperty(column_name, gson.toJson(rs.getDate(column_name)));
			break;
		    case java.sql.Types.TIMESTAMP:
			obj.addProperty(column_name, gson.toJson(rs.getTimestamp(column_name)));
			break;
		    default:
			obj.addProperty(column_name, gson.toJson(rs.getObject(column_name)));
			break;
		    }
		}
		json.add(obj);
	    }
	    ps.getConnection().close();
	} catch (Exception e) {
	    e.printStackTrace();
	    try {
		ps.getConnection().close();
	    } catch (SQLException e1) {
		e1.printStackTrace();
	    }
	    return json;
	}
	return json;
    }

}
