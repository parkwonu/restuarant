package ownerPark;
import java.sql.*;
import java.util.ArrayList;
import ownerPark.DriverDB;
import ownerPark.Member;

public class MemberSearchDao {
	//ȸ�� �˻�(memberSearchActionList.jsp)
	public ArrayList<Member> memberSearch(String sel, String txt) throws ClassNotFoundException, SQLException{
		System.out.println("memberSearch MemberDao.java");
		System.out.println(sel + "����Ʈ �ڽ� �̸�");
		System.out.println(txt + "�ؽ�Ʈ �ڽ� �̸�");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Member> allMemberList = null;
		
		DriverDB db = new DriverDB();
		conn = db.driverDBcon();
		
		allMemberList = new ArrayList<Member>();
		// ����Ʈ �ؽ�Ʈ �ڽ� ��� �Է��� �ȵǾ��� ��
		if(sel==null & txt==null) {
			pstmt = conn.prepareStatement("select * from member");
		// ����Ʈ �ڽ��� �Է��� �Ǿ���, �ؽ�Ʈ �ڽ��� ������ ��
		}else if(sel!=null & txt.equals("")) {
			pstmt = conn.prepareStatement("select * from member");
		// �Ѵ� �Է��� �Ǿ��� ��	
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
			System.out.println((rs.getString("m_id") + "<---������� ������ ���̵�"));
			allMemberList.add(member);
		}
		rs.close();
		pstmt.close();
		conn.close();
		return allMemberList;
	}
}
