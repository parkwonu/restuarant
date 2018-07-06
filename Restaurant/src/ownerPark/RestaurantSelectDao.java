package ownerPark;
import java.sql.*;
import java.util.ArrayList;
import ownerPark.DriverDB;
import ownerPark.Restaurant;

public class RestaurantSelectDao {
	
	//전체 회원 조회(memberSearchList.jsp)
	public ArrayList<Restaurant> restaurantAllSelect() throws ClassNotFoundException, SQLException{
		System.out.println("restaurantAllSelect RestaurantSelectDao.java");
	
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Restaurant> alr = null;
		
		DriverDB db = new DriverDB();
		conn=db.driverDBcon();
		
		alr = new ArrayList<Restaurant>();
		pstmt=conn.prepareStatement("select * from restaurant");
		rs=pstmt.executeQuery();
		System.out.println(rs + "<--rs");
		
		while(rs.next()){
			Restaurant restaurant = new Restaurant();
			System.out.println(restaurant + "<--restaurant");
			
			restaurant.setR_code(rs.getString("r_code"));
			restaurant.setR_name(rs.getString("r_name"));
			restaurant.setR_kind(rs.getString("r_kind"));
			restaurant.setR_phone(rs.getString("r_phone"));
			restaurant.setR_addr(rs.getString("r_addr"));
			restaurant.setR_date(rs.getString("r_date"));
			System.out.println(rs.getString("r_code") + "<--r_code");
			alr.add(restaurant);
		}
		pstmt.close();
		conn.close();
		return alr;
	}
}
