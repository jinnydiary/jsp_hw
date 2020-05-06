package lecture1.midterm;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import lecture1.DB;

public class BookDAO {

	public static List<Book> findAll() throws Exception {
		String sql = "SELECT b.*, c.categoryName " +
	                 "FROM book b LEFT JOIN category c ON b.categoryId = c.id";
		try(Connection connection = DB.getConnection("book");
			PreparedStatement pstmt = connection.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery()) {
			ArrayList<Book> list = new ArrayList<Book>();
			while(rs.next()) {
				Book book = new Book();
				book.setId(rs.getInt("id"));
				book.setTitle(rs.getString("title"));
				book.setAuthor(rs.getString("author"));
				book.setCategoryId(rs.getInt("categoryId"));
				book.setCategoryName(rs.getString("categoryName"));
				book.setPrice(rs.getInt("price"));
				book.setPublisher(rs.getString("publisher"));
				list.add(book);
			}
			return list;
		}

	}

	public static List<Book> findByAuthor(String author) throws Exception {
		String sql = "SELECT b.*, c.categoryName " +
                "FROM book b LEFT JOIN category c ON b.categoryId = c.id " +
				"WHERE b.author LIKE ?";
		try(Connection connection = DB.getConnection("book");
			PreparedStatement pstmt = connection.prepareStatement(sql)) {
			pstmt.setString(1, author+"%");
			try(ResultSet rs = pstmt.executeQuery()) {
				ArrayList<Book> list = new ArrayList<Book>();
				while(rs.next()) {
					Book book = new Book();
					book.setId(rs.getInt("id"));
					book.setTitle(rs.getString("title"));
					book.setAuthor(rs.getString("author"));
					book.setCategoryId(rs.getInt("categoryId"));
					book.setCategoryName(rs.getString("categoryName"));
					book.setPrice(rs.getInt("price"));
					book.setPublisher(rs.getString("publisher"));
					list.add(book);
				}
				return list;
			}
		}
	}

}
