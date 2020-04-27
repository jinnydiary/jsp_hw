package lecture1.jdbc1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import lecture1.DB;

public class UserDAO2 {

	public static List<User> findAll() throws Exception {
		String sql = "SELECT u.*, d.departmentName " +
	                 "FROM user u LEFT JOIN department d on u.departmentId = d.id";
		try (Connection connection = DB.getConnection("student1");
				PreparedStatement statement = connection.prepareStatement(sql);
				ResultSet rs = statement.executeQuery()) {
			ArrayList<User> list = new ArrayList<User>();
			while (rs.next()) {
				User user = new User();
				user.setId(rs.getInt("id"));
				user.setUserid(rs.getString("userid"));
				user.setPassword(rs.getString("password"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setDepartmentId(rs.getInt("departmentId"));
				user.setDepartmentName(rs.getString("departmentName"));
				user.setEnabled(rs.getBoolean("enabled"));
				user.setUserType(rs.getString("userType"));
				list.add(user);
			}
			return list;
		}
	}

	public static List<User> findByName(String name) throws Exception {
		String sql = "SELECT u.*, d.departmentName " +
	                 "FROM user u LEFT JOIN department d on u.departmentId = d.id " +
				     "WHERE u.name LIKE ?";
		try (Connection connection = DB.getConnection("student1");
				PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setString(1, name + "%");
			try (ResultSet rs = statement.executeQuery()) {
				ArrayList<User> list = new ArrayList<User>();
				while (rs.next()) {
					User user = new User();
					user.setId(rs.getInt("id"));
					user.setUserid(rs.getString("userid"));
					user.setPassword(rs.getString("password"));
					user.setName(rs.getString("name"));
					user.setEmail(rs.getString("email"));
					user.setDepartmentId(rs.getInt("departmentId"));
					user.setDepartmentName(rs.getString("departmentName"));
					user.setEnabled(rs.getBoolean("enabled"));
					user.setUserType(rs.getString("userType"));
					list.add(user);
				}
				return list;
			}
		}
	}
}
