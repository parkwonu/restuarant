package ownerPark;
import java.sql.*;
import ownerPark.DriverDB;
import ownerPark.Member;

public class MemberUpdateDao {
	//회원 수정 화면(memberUpdateForm.jsp)
	public Member memberUpdateForm(String m_id) throws ClassNotFoundException, SQLException {
		System.out.println("memberUpdateForm MemberDao.java");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DriverDB db=new DriverDB();
		conn=db.driverDBcon();
		
		pstmt=conn.prepareStatement("select * from member where m_id=?");
		pstmt.setString(1, m_id);
		rs=pstmt.executeQuery();
		
		Member m = new Member();
		System.out.println(m + "<--m");
		if(rs.next()) {
			m.setM_id(rs.getString("m_id"));
			m.setM_pw(rs.getString("m_pw"));
			m.setM_name(rs.getString("m_name"));
			m.setM_level(rs.getString("m_level"));
			m.setM_email(rs.getString("m_email"));
			m.setM_phone(rs.getString("m_phone"));
			m.setM_addr(rs.getString("m_addr"));
		}
		rs.close();
		pstmt.close();
		conn.close();
		return m;
	}
	//수정 액션(memberUpdateAction.jsp)
	public void memberUpdateAction(Member m) throws ClassNotFoundException, SQLException {
		System.out.println("memberUpdateAction MemberDao.java");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		DriverDB db=new DriverDB();
		conn=db.driverDBcon();
		
		pstmt=conn.prepareStatement("update member set m_pw=?, m_name=?, m_level=?, m_email=?, m_addr=?, m_phone=?, m_date=? where m_id=?");
		pstmt.setString(1, m.getM_pw());
		pstmt.setString(2, m.getM_name());
		pstmt.setString(3, m.getM_level());
		pstmt.setString(4, m.getM_email());
		pstmt.setString(5, m.getM_addr());
		pstmt.setString(6, m.getM_phone());
		pstmt.setString(7, m.getM_date());
		pstmt.setString(8, m.getM_id());
		System.out.println(m.getM_pw() + "<--비밀번호");
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
}
