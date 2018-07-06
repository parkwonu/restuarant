package ownerPark;

import ownerPark.DriverDB;
import ownerPark.Member;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberLoginDao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	ArrayList<Member> alm = null;
	
	//로그인 체크 메서드
	public String mLoginCheck(String in_id,String in_pw) throws ClassNotFoundException, SQLException {
		String i = null;
		
		DriverDB db = new DriverDB();
		conn = db.driverDBcon();
		
		pstmt = conn.prepareStatement("select m_pw from member where m_id=?");
		pstmt.setString(1, in_id);
		
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			if(in_pw.equals(rs.getString("m_pw"))) {
				System.out.println("01로그인 성공");
				 i = "01로그인성공";
			}else{
				System.out.println("03비번 불일치");
				i = "03비번불일치";
			}
		}else{
			System.out.println("02아이디 불일치");
			i = "02아이디불일치";
		}
		return i;
	}
	//로그인 세션 메서드
	public Member mGetForSession(String in_id) throws ClassNotFoundException, SQLException{
		Member m = null; 
		
		DriverDB db = new DriverDB();
		conn = db.driverDBcon();
		
		pstmt = conn.prepareStatement("select m_id,m_level,m_name from member where m_id=?");
		pstmt.setString(1, in_id);
		
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			m = new Member();
			m.setM_id(rs.getString("m_id"));
			m.setM_name(rs.getString("m_name"));
			m.setM_level(rs.getString("m_level"));
		}
		return m;
	}
	//검색 메서드
	public ArrayList<Member> mSearch(String sk,String sv) throws ClassNotFoundException, SQLException{
		DriverDB db = new DriverDB();
		conn = db.driverDBcon();
		
		alm = new ArrayList<Member>();
		
		if(sk == null & sv == null){
			System.out.println("01 sk 널 sv 널");
			System.out.println("select * from member");
			pstmt = conn.prepareStatement("select * from member");
			
		}else if(sk != null & sv.equals("")){
			System.out.println("02 sk 널 sv 공백");
			System.out.println("select * from member");	
			pstmt = conn.prepareStatement("select * from member");

		}else if(sk != null & sv != null){
			System.out.println("03 sk 있고 sv 있고");
			System.out.println("03_01 m_id 조건");
			pstmt = conn.prepareStatement("select * from member where "+sk+ "=?");
			pstmt.setString(1, sv);
		}
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			Member m = new Member();
			
			m.setM_id(rs.getString("m_id"));
			m.setM_pw(rs.getString("m_pw"));
			m.setM_name(rs.getString("m_name"));
			m.setM_level(rs.getString("m_level"));
			m.setM_email1(rs.getString("m_email"));
			m.setM_addr(rs.getString("m_addr"));
			m.setM_phone1(rs.getString("m_phone"));
			
			alm.add(m);
		}
		pstmt.close();
		conn.close();
		return alm;
	}
	
	public Member memberInfo(String send_id) throws ClassNotFoundException, SQLException {
		DriverDB db = new DriverDB();
		conn = db.driverDBcon();
		
		Member m = null;
		
		pstmt = conn.prepareStatement("select * from member where m_id=?");
		pstmt.setString(1, send_id);
		
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			m = new Member();
			
			m.setM_id(rs.getString("m_id"));
			m.setM_pw(rs.getString("m_pw"));
			m.setM_name(rs.getString("m_name"));
			m.setM_level(rs.getString("m_level"));
			m.setM_email1(rs.getString("m_email"));
			m.setM_addr(rs.getString("m_addr"));
			m.setM_phone1(rs.getString("m_phone"));
			m.setM_date(rs.getString("m_date"));
		}
		return m;
	}
}	
