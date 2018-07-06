//2018.07.06 �ڿ���
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
	PreparedStatement pstmt1 = null;
	ResultSet rs = null;
	ResultSet rs1 = null;
	ArrayList<Member> alm = null;
	
	//�α��� üũ �޼���
	public String mLoginCheck(String in_id,String in_pw) throws ClassNotFoundException, SQLException {
		String i = null;
		
		DriverDB db = new DriverDB();
		conn = db.driverDBcon();
		
		pstmt = conn.prepareStatement("select m_pw from member where m_id=?");
		pstmt.setString(1, in_id);
		
		rs = pstmt.executeQuery();
		
		pstmt1 = conn.prepareStatement("select a_pw from admin where a_id=?");
		pstmt1.setString(1, in_id);
		
		rs1 = pstmt1.executeQuery();
		
		if(rs.next()){
			if(in_pw.equals(rs.getString("m_pw"))) {
				System.out.println("01�α��� ����");
				 i = "01�α��μ���";
			}else{
				System.out.println("03��� ����ġ");
				i = "03�������ġ";
			}
		}else if(rs1.next()){
			if(in_pw.equals(rs1.getString("a_pw"))) {
				System.out.println("01�α��� ����");
				 i = "01�α��μ���";
			}else{
				System.out.println("03��� ����ġ");
				i = "03�������ġ";
			}
		}else{
			System.out.println("02���̵� ����ġ");
			i = "02���̵����ġ";
		}
		return i;
	}
	//�α��� ���� �޼���
	public Member mGetForSession(String in_id) throws ClassNotFoundException, SQLException{
		Member m = null; 
		
		DriverDB db = new DriverDB();
		conn = db.driverDBcon();
		
		pstmt = conn.prepareStatement("select m_id,m_level,m_name from member where m_id=?");
		pstmt.setString(1, in_id);
		
		rs = pstmt.executeQuery();
		
		pstmt1 = conn.prepareStatement("select a_id,a_level,a_name from admin where a_id=?");
		pstmt1.setString(1, in_id);
		
		rs1 = pstmt1.executeQuery();
		
		if(rs.next()) {
			m = new Member();
			m.setM_id(rs.getString("m_id"));
			m.setM_name(rs.getString("m_name"));
			m.setM_level(rs.getString("m_level"));
		}
		if(rs1.next()) {
			m = new Member();
			m.setM_id(rs1.getString("a_id"));
			m.setM_name(rs1.getString("a_name"));
			m.setM_level(rs1.getString("a_level"));
		}
		return m;
	}
	
	public Member memberInfo(String send_id) throws ClassNotFoundException, SQLException {
		DriverDB db = new DriverDB();
		conn = db.driverDBcon();
		
		Member m = null;
		
		pstmt = conn.prepareStatement("select * from member where m_id=?");
		pstmt.setString(1, send_id);
		
		rs = pstmt.executeQuery();
		
		pstmt1 = conn.prepareStatement("select * from admin where a_id=?");
		pstmt1.setString(1, send_id);
		
		rs1 = pstmt1.executeQuery();
		
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
		}else if(rs1.next()) {
			m = new Member();
			
			m.setM_id(rs1.getString("a_id"));
			m.setM_pw(rs1.getString("a_pw"));
			m.setM_name(rs1.getString("a_name"));
			m.setM_level(rs1.getString("a_level"));
		}
		return m;
	}
}	
