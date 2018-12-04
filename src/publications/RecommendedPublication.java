package publications;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.*;

import data.Constants;
import data.DatabaseAccess;
import data.PostColumn;

public class RecommendedPublication {
	DatabaseAccess dba;
	Connection conn;
	PreparedStatement pstmt;
	public RecommendedPublication() {
		dba = DatabaseAccess.getInstance();
	}
	public List getPublications(String category, int indexNum) {
		List values = new ArrayList();
		String condition = new StringBuilder("select * from ")
				.append(data.DBTable.POST).append(" where ")
				.append(PostColumn.CATEGORY).append(" = ? limit ?").toString();
		values.add(category);
		values.add(indexNum);
		return getData(condition,values);
	}
	public List <Map> getData(String sqlQuery, List values){
		List<Map> result = new ArrayList<Map>();
		int numberOfQm = countQm(sqlQuery);
		try {
			conn = DriverManager.getConnection(Constants.DB_URL, Constants.DB_USER, Constants.DB_PASSWORD);
			pstmt = conn.prepareStatement(sqlQuery);
			pstmt.setString(1,  values.get(0).toString());
			pstmt.setInt(2, Integer.valueOf(values.get(1).toString()));
			ResultSet rs = pstmt.executeQuery();

			while(rs.next()) {
				ResultSetMetaData metadata = rs.getMetaData();
				Map index = new HashMap();
				for(int count = 0; count < metadata.getColumnCount(); count++) {
					index.put(metadata.getColumnLabel(count+1).toString(), rs.getObject(metadata.getColumnLabel(count+1).toString()));
				}
				result.add(index);
			}
		}catch(SQLException SQLe) {
			System.out.println(SQLe);
			return null;
		}finally {
			try{
				pstmt.clearParameters();
				pstmt.close();
				conn.close();
			}catch(SQLException SQLe) {
				System.out.println(SQLe);
				return null;
			}
		}
		return result;
	}
	private int countQm(String clone) {
		int numberOfQm = 0;
		int length = clone.length();
		for(int count = 0; count < length; count++) 
			if(clone.charAt(count) == '?') 
				numberOfQm++;
		return numberOfQm;
	}
}
