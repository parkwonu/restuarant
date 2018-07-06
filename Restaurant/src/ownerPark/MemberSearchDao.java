package ownerPark;
import java.sql.*;
import java.util.ArrayList;
import ownerPark.DriverDB;
import ownerPark.Member;

public class MemberSearchDao {
	//회원 검색(memberSearchActionList.jsp)
	public ArrayList<Member> memberSearch(String sel, String txt) throws ClassNotFoundException, SQLException{
		System.out.println("memberSearch MemberDao.java");
		System.out.println(sel + "셀렉트 박스 이름");
		System.out.println(txt + "텍스트 박스 이름");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Member> allMemberList = null;
		
		DriverDB db = new DriverDB();
		conn = db.driverDBcon();
		
		allMemberList = new ArrayList<Member>();
		// 셀렉트 텍스트 박스 모두 입력이 안되었을 때
		if(sel==null & txt==null) {
			pstmt = conn.prepareStatement("select * from member");
		// 셀렉트 박스는 입력이 되었고, 텍스트 박스는 공백일 때
		}else if(sel!=null & txt.equals("")) {
			pstmt = conn.prepareStatement("select * from member");
		// 둘다 입력이 되었을 때	
		}else if(sel!=null & txt!=null) {
			if(sel.equals("m_id")) {
				pstmt=conn.prepareStatement("select * from member where m_id=?");
				pstmt.setString(1, txt);
			}else if(sel.equals("m_name")) {
				pstmt=conn.prepareStatement("select * from member where m_name=?");
				pstmt.setString(1, txt);
			}else if(sel.equals("m_level")) {
				pstmt=conn.prepareStatement("select * from member where m_level=?");
				pstmt.setString(1, txt);
			}else if(sel.equals("m_email")) {
				pstmt=conn.prepareStatement("select * from member where m_email=?");
				pstmt.setString(1, txt);
			}else if(sel.equals("m_addr")) {
				pstmt=conn.prepareStatement("select * from member where m_addr=?");
				pstmt.setString(1, txt);
			}
		}
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Member member = new Member();
			member.setM_id(rs.getString("m_id"));
			member.setM_pw(rs.getString("m_pw"));
			member.setM_name(rs.getString("m_name"));
			member.setM_level(rs.getString("m_level"));
			member.setM_email(rs.getString("m_email"));
			member.setM_addr(rs.getString("m_addr"));
			member.setM_phone(rs.getString("m_phone"));
			member.setM_date(rs.getString("m_date"));
			System.out.println((rs.getString("m_id") + "<---멤버에서 게팅한 아이디"));
			allMemberList.add(member);
		}
		rs.close();
		pstmt.close();
		conn.close();
		return allMemberList;
	}
}
