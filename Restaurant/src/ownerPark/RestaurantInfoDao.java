package ownerPark;
import java.sql.*;
import ownerPark.DriverDB;
import ownerPark.Restaurant;

public class RestaurantInfoDao {

	// 음식점 정보
	public Restaurant restaurantInfo(String ri) throws ClassNotFoundException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DriverDB db = new DriverDB();
		conn = db.driverDBcon();
		
		pstmt = conn.prepareStatement("select * from restaurant where r_code=?");
		pstmt.setString(1, ri);
		rs = pstmt.executeQuery();
		
		Restaurant info = new Restaurant();
		if(rs.next()) {
			info.setR_name(rs.getString("r_name"));
			info.setR_kind(rs.getString("r_kind"));
			info.setR_phone(rs.getString("r_phone"));
			info.setR_addr(rs.getString("r_addr"));
			info.setR_date(rs.getString("r_date"));
		}
		rs.close();
		pstmt.close();
		conn.close();
		return info;
	}
}
