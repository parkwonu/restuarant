package ownerPark;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CommentDao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public void commentInsert(Comment c) throws ClassNotFoundException, SQLException {
		DriverDB db = new DriverDB();
		conn = db.driverDBcon();
		System.out.println(conn+ "<-- conn");
		
		pstmt = conn.prepareStatement("insert into comment values(?, ?, ?, now())");
		pstmt.setString(1, c.getF_name());
		pstmt.setString(2, c.getId());
		pstmt.setString(3, c.getComment_content());
		
		pstmt.close();
		conn.close();
	}
}
