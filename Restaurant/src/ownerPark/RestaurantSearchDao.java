package ownerPark;
import java.sql.*;
import java.util.ArrayList;
import ownerPark.DriverDB;
import ownerPark.Restaurant;

public class RestaurantSearchDao {
	//음식점 검색(restaurantSearchActionList.jsp)
	public ArrayList<Restaurant> restaurantSearch(String sel, String txt) throws ClassNotFoundException, SQLException{
		System.out.println("restaurantSearch RestaurantDao.java");
		System.out.println(sel + "셀렉트 박스 이름");
		System.out.println(txt + "텍스트 박스 이름");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Restaurant> allRestaurantList = null;
		
		DriverDB db = new DriverDB();
		conn = db.driverDBcon();
		
		allRestaurantList = new ArrayList<Restaurant>();
		System.out.println(allRestaurantList + "<---allRestaurantList");
		// 셀렉트 텍스트 박스 모두 입력이 안되었을 때
		if(sel==null & txt==null) {
			pstmt = conn.prepareStatement("select * from restaurant");
		// 셀렉트 박스는 입력이 되었고, 텍스트 박스는 공백일 때
		}else if(sel!=null & txt.equals("")) {
			pstmt = conn.prepareStatement("select * from restaurant");
		// 둘다 입력이 되었을 때	
		}else if(sel!=null & txt!=null) {
			if(sel.equals("r_name")) {
				pstmt=conn.prepareStatement("select * from restaurant where r_name=?");
				pstmt.setString(1, txt);
			}else if(sel.equals("r_kind")) {
				pstmt=conn.prepareStatement("select * from restaurant where r_kind=?");
				pstmt.setString(1, txt);
			}
		}
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Restaurant restaurant = new Restaurant();
			restaurant.setR_code(rs.getString("r_code"));
			restaurant.setR_name(rs.getString("r_name"));
			restaurant.setR_kind(rs.getString("r_kind"));
			restaurant.setR_phone(rs.getString("r_phone"));
			restaurant.setR_addr(rs.getString("r_addr"));
			restaurant.setR_date(rs.getString("r_date"));
			System.out.println((rs.getString("r_code") + "<---레스토랑에서 게팅한 상품코드"));
			allRestaurantList.add(restaurant);
		}
		rs.close();
		pstmt.close();
		conn.close();
		return allRestaurantList;
	}
}
