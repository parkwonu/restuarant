//2018.07.06 �ڿ���
package ownerPark;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class MenuDeleteDao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	public void menuDelete(String r_code) throws ClassNotFoundException, SQLException {
		DriverDB db=new DriverDB();
		conn=db.driverDBcon();
		
		pstmt=conn.prepareStatement("delete from menu where r_code=?");
		pstmt.setString(1, r_code);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
}
