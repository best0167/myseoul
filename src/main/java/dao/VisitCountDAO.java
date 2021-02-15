package dao;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import dto.AccDTO;

public class VisitCountDAO {
	
	public VisitCountDAO() {
		// TODO Auto-generated constructor stub
	}
	
	public static Connection getConnection() {
		Connection conn = null;
		String url = "jdbc:oracle:thin://@172.16.5.5:1521:xe";
		String id = "sm";
		String pw = "oracle4U";
		try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection(url, id, pw);
            /*System.out.println("db연결됨");*/
            return conn;
        } catch (Exception e) {
            System.out.println("DBUtil.getConnection() : " + e.toString());
        }
        return null;
	}
	
	
	// 방문자수 쌓기
	public void insertVisitor(AccDTO dto) throws Exception{
		Connection conn = null;
        PreparedStatement pstmt = null;
        
        String sql = "insert into acc(acc_num,acc_session,acc_ip,acc_uid) "
        				+ "values(acc_seq.nextval,?,?,?)";
        conn = VisitCountDAO.getConnection();
        pstmt = conn.prepareStatement(sql);
        
        pstmt.setString(1, dto.getAcc_session());
        pstmt.setString(2, dto.getAcc_ip());
        pstmt.setString(3, dto.getAcc_uid());
        pstmt.executeUpdate();
        
        pstmt.close();
        conn.close();
	}
	
}
