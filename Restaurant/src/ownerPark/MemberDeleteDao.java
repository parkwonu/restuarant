package ownerPark;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class MemberDeleteDao {

	//회원 삭제
	public void MemberDelete(String memberDelete) throws ClassNotFoundException, SQLException {
		System.out.println("MemberDelete MemberDao.java");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		DriverDB db=new DriverDB();
		conn=db.driverDBcon();
		
		pstmt=conn.prepareStatement("delete from member where m_id=?");
		pstmt.setString(1, memberDelete);
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
}
