package ownerPark;
import java.sql.*;
import java.util.ArrayList;
import ownerPark.DriverDB;
import ownerPark.Member;

public class MemberSelectDao {
	
	//전체 회원 조회(memberSearchList.jsp)
	public ArrayList<Member> memberAllSelect() throws ClassNotFoundException, SQLException{
		System.out.println("memberAllSelect MemberDao.java");
	
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Member> alm = null;
		
		DriverDB db = new DriverDB();
		conn=db.driverDBcon();
		
		alm = new ArrayList<Member>();
		pstmt=conn.prepareStatement("select * from member");
		rs=pstmt.executeQuery();
		System.out.println(rs + "<--rs");
		
		while(rs.next()){
			Member m = new Member();
			System.out.println(m + "<--m");
			m.setM_id(rs.getString("m_id"));
			System.out.println(rs.getString("m_id") + "<--m_id");
			m.setM_pw(rs.getString("m_pw"));
			m.setM_name(rs.getString("m_name"));
			m.setM_level(rs.getString("m_level"));
			m.setM_email(rs.getString("m_email"));
			m.setM_addr(rs.getString("m_addr"));
			m.setM_phone(rs.getString("m_phone"));
			m.setM_date(rs.getString("m_date"));
			alm.add(m);
		}
		pstmt.close();
		conn.close();
		return alm;
	}
}
