package ownerPark;
import java.sql.*;
import java.util.ArrayList;
import ownerPark.DriverDB;
import ownerPark.Restaurant;

public class RestaurantSearchDao {
	//������ �˻�(restaurantSearchActionList.jsp)
	public ArrayList<Restaurant> restaurantSearch(String sel, String txt) throws ClassNotFoundException, SQLException{
		System.out.println("restaurantSearch RestaurantDao.java");
		System.out.println(sel + "����Ʈ �ڽ� �̸�");
		System.out.println(txt + "�ؽ�Ʈ �ڽ� �̸�");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Restaurant> allRestaurantList = null;
		
		DriverDB db = new DriverDB();
		conn = db.driverDBcon();
		
		allRestaurantList = new ArrayList<Restaurant>();
		System.out.println(allRestaurantList + "<---allRestaurantList");
		// ����Ʈ �ؽ�Ʈ �ڽ� ��� �Է��� �ȵǾ��� ��
		if(sel==null & txt==null) {
			pstmt = conn.prepareStatement("select * from restaurant");
		// ����Ʈ �ڽ��� �Է��� �Ǿ���, �ؽ�Ʈ �ڽ��� ������ ��
		}else if(sel!=null & txt.equals("")) {
			pstmt = conn.prepareStatement("select * from restaurant");
		// �Ѵ� �Է��� �Ǿ��� ��	
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
			System.out.println((rs.getString("r_code") + "<---����������� ������ ��ǰ�ڵ�"));
			allRestaurantList.add(restaurant);
		}
		rs.close();
		pstmt.close();
		conn.close();
		return allRestaurantList;
	}
}
