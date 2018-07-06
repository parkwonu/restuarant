//2018.07.06 ¹Ú¿ø¿ì
package ownerPark;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;

public class MenuInsertDao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	public void menuInsert(Menu n, String r_code) throws ClassNotFoundException, SQLException {
		DriverDB db = new DriverDB();
		conn = db.driverDBcon();
		
		pstmt = conn.prepareStatement("insert into menu VALUES (?, ?, ?)");
		pstmt.setString(1, n.getF_name());
		pstmt.setString(2, n.getF_price());
		pstmt.setString(1, n.getR_code());

		pstmt.executeUpdate();

		pstmt.close();
		conn.close();
	}
}
