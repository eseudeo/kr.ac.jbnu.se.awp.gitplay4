package data;

import java.util.*;
import java.sql.*;
import data.Constants;

public class DatabaseAccess {
	private Connection conn;
	private PreparedStatement pstmt;
	
	private DatabaseAccess() {
		try {
			Class.forName(Constants.JDBC_DRIVER);
		}catch(Exception e) {
			System.out.println(e);
		}
	}
	
	private static class Singleton{
		private static final DatabaseAccess instance = new DatabaseAccess();
	}
	
	public static DatabaseAccess getInstance() {
		return Singleton.instance;
	}
	
	public boolean setData(String sqlQuery, List values) {
		int numberOfQm = countQm(sqlQuery);
		if(numberOfQm != values.size()) {
			System.out.println("ë¬¼ìŒ?‘œ ê°??ˆ˜?‘ ?†?„±ê°? ê°??ˆ˜ê°? ?‹¬?¼");
			return false;
		}
		try {
			conn = DriverManager.getConnection(Constants.DB_URL, Constants.DB_USER, Constants.DB_PASSWORD);
			pstmt = conn.prepareStatement(sqlQuery);
			for(int count = 0; count < numberOfQm ; count++) {
				pstmt.setString(count + 1, values.get(count).toString());
			}
			pstmt.executeUpdate();
		}catch(SQLException SQLe) {
			System.out.println(SQLe);
			return false;
		}finally {
			try {
				pstmt.clearParameters();
				pstmt.close();
				conn.close();
			}catch(SQLException SQLe) {
				System.out.println(SQLe);
				return false;
			}
		}
		return true;
	}	
	
	public List <Map> getData(String sqlQuery){
		List<Map> values = new ArrayList();
		return getData(sqlQuery,values);
	}
	public List <Map> getData(String sqlQuery, List values){
		List<Map> result = new ArrayList<Map>();
		int numberOfQm = countQm(sqlQuery);
		if(numberOfQm != values.size()) {
			System.out.println("ë¬¼ìŒ?‘œ ê°??ˆ˜?‘ ?†?„±ê°? ê°??ˆ˜ê°? ?‹¬?¼");
			return null;
		}
		try {
			conn = DriverManager.getConnection(Constants.DB_URL, Constants.DB_USER, Constants.DB_PASSWORD);
			pstmt = conn.prepareStatement(sqlQuery);
			for(int count = 0; count < numberOfQm; count++) {
				pstmt.setString(count + 1,  values.get(count).toString());
			}
			ResultSet rs = pstmt.executeQuery();

			while(rs.next()) {
				ResultSetMetaData metadata = rs.getMetaData();
				Map index = new HashMap();
				for(int count = 0; count < metadata.getColumnCount(); count++) {
					index.put(metadata.getColumnLabel(count+1).toString(), rs.getObject(metadata.getColumnLabel(count+1).toString())); //ë¬¸ì œ? 
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
