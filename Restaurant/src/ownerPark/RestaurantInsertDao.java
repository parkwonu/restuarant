package ownerPark;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import ownerPark.DriverDB;
import ownerPark.Restaurant;

public class RestaurantInsertDao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public void restaurantInsert(Restaurant r) throws ClassNotFoundException, SQLException {
		DriverDB db = new DriverDB();
		conn = db.driverDBcon();
		System.out.println(conn+ "<-- conn");
		
		String phone = r.getR_phone1() +"-"+ r.getR_phone2() +"-"+ r.getR_phone3();
		
		pstmt = conn.prepareStatement("select max(CAST(substring(r_code,7) AS DECIMAL)) as maxcol from restaurant");
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			System.out.println("01 RestaurantInsertDao.java");
			String r_code = "r_code" + (rs.getInt("maxcol")+1);

			pstmt = conn.prepareStatement("insert into restaurant VALUES (?, ?, ?, ?, ?, now())");
			pstmt.setString(1, r_code);
			pstmt.setString(2, r.getR_name());
			pstmt.setString(3, r.getR_kind());
			pstmt.setString(4, phone);
			pstmt.setString(5, r.getR_addr());
			pstmt.executeUpdate();
		}
		
		pstmt.close();
		conn.close();
	}
}
