//2018.07.06 ¹Ú¿ø¿ì
package ownerPark;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MenuUpdateDao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public Menu menuUpdateForm(String r_code) throws ClassNotFoundException, SQLException {
		Menu n = null;
		
		DriverDB db=new DriverDB();
		conn=db.driverDBcon();
		
		pstmt=conn.prepareStatement("select * from menu where r_code=?");
		pstmt.setString(1, r_code);
		
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			n = new Menu();
			n.setR_code(rs.getString("r_code"));
			n.setF_name(rs.getString("f_name"));
			n.setF_price(rs.getString("f_price"));
		}
		rs.close();
		pstmt.close();
		conn.close();
		return n;
	}
	public void menuUpdateAction(Menu n) throws ClassNotFoundException, SQLException {
		DriverDB db=new DriverDB();
		conn = db.driverDBcon();
		
		pstmt = conn.prepareStatement("update menu set f_name=?, f_price=? where r_code=?");
		pstmt.setString(1, n.getF_name());
		pstmt.setString(2, n.getF_price());
		pstmt.setString(3, n.getR_code());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
}
