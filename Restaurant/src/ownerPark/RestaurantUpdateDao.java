//2018.07.06 ¹Ú¿ø¿ì
package ownerPark;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RestaurantUpdateDao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public Restaurant restaurantUpdateForm(String r_code) throws ClassNotFoundException, SQLException {
		Restaurant r = null;
		
		DriverDB db = new DriverDB();
		conn = db.driverDBcon();
		
		pstmt=conn.prepareStatement("select * from restaurant where r_code=?");
		pstmt.setString(1, r_code);
		
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			r = new Restaurant();
			r.setR_code(rs.getString("r_code"));
			r.setR_name(rs.getString("r_name"));
			r.setR_kind(rs.getString("r_kind"));
			r.setR_phone1(rs.getString("r_phone"));
			r.setR_addr(rs.getString("r_addr"));
			r.setR_date(rs.getString("r_date"));
		}
		rs.close();
		pstmt.close();
		conn.close();
		return r;
	}
	
	public void restaurantUpdateAction(Restaurant r) throws ClassNotFoundException, SQLException {
		DriverDB db = new DriverDB();
		conn = db.driverDBcon();
		
		pstmt = conn.prepareStatement("update restaurant set r_name=?, r_kind=?, r_phone=?, r_addr=? where r_code=?");
		pstmt.setString(1, r.getR_name());
		pstmt.setString(2, r.getR_kind());
		pstmt.setString(3, r.getR_addr());
		pstmt.setString(4, r.getR_code());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
}
