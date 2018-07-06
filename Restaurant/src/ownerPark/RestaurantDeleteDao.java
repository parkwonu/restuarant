//2018.07.06 ¹Ú¿ø¿ì
package ownerPark;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class RestaurantDeleteDao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	public void restaurantDelete(String r_code) throws ClassNotFoundException, SQLException {
		DriverDB db=new DriverDB();
		conn=db.driverDBcon();
		
		pstmt=conn.prepareStatement("delete from restaurant where r_code=?");
		pstmt.setString(1, r_code);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
}
