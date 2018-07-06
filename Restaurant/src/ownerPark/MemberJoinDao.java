package ownerPark;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import ownerPark.DriverDB;
import ownerPark.Member;

public class MemberJoinDao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	//아이디 중복확인
	public int check(String m) throws ClassNotFoundException, SQLException {
		DriverDB db = new DriverDB();
		conn = db.driverDBcon();
		System.out.println(conn+ "<-- conn");
		System.out.println(m+"<--m_id");
		
		int re = 0;
		
		pstmt = conn.prepareStatement("select * from admin where a_id=?");
		pstmt.setString(1, m);
		rs = pstmt.executeQuery();
		
		if(!m.equals("") && !m.matches(".*"+"[~!@#$%^&*()_+|<>?:{}ㄱ-ㅎㅏ-ㅣ가-힝]"+".*")) {
			if(!rs.next()) {
				pstmt = conn.prepareStatement("select * from member where m_id=?");
				pstmt.setString(1, m);
				rs = pstmt.executeQuery();
				if(!rs.next()) {
					re = 1;
				} else {
					re = 4;
				}
			} else {
				re = 4;
			}
		} else if(m.equals("")) {
			re = 2;
		} else if(m.matches(".*"+"[~!@#$%^&*()_+|<>?:{}ㄱ-ㅎㅏ-ㅣ가-힝]"+".*")) {
			re = 3;
		}
		pstmt.close();
		conn.close();
		return re;
	}
	
	//회원가입
	public void join(Member m) throws ClassNotFoundException, SQLException {
		
		DriverDB db = new DriverDB();
		conn = db.driverDBcon();
		System.out.println(conn+ "<-- conn");
		
		String email = m.getM_email1() +"@"+ m.getM_email2();
		String phone = m.getM_phone1() +"-"+ m.getM_phone2() +"-"+ m.getM_phone3();
		
		System.out.println("join Memberdao.java");
		pstmt = conn.prepareStatement("insert into member VALUES (?, ?, ?, ?, ?, ?, ?, now())");
		pstmt.setString(1, m.getM_id());
		pstmt.setString(2, m.getM_pw());
		pstmt.setString(3, m.getM_name());
		pstmt.setString(4, m.getM_level());
		pstmt.setString(5, email);
		pstmt.setString(6, m.getM_addr());
		pstmt.setString(7, phone);
		pstmt.executeUpdate();
			
		pstmt.close();
		conn.close();
	}
}
