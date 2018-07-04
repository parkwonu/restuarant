package ownerPark;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DriverDB {
	public Connection driverDBcon() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver");
		
		String jdbcDriver = "jdbc:mysql://localhost:3306/foodmarket?" +
				"useUnicode=true&characterEncoding=euckr";
		String dbUser = "foodmarketid";
		String dbPass = "foodmarketpw";
		
		Connection reconn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		return reconn;
	}
}
