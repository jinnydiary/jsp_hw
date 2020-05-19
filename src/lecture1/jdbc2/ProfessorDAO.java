package lecture1.jdbc2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import lecture1.DB;

public class ProfessorDAO {

	public static Professor getProfessorFrom(ResultSet rs) throws SQLException {
		Professor professor = new Professor();
		professor.setId(rs.getInt("id"));
		professor.setProfessorName(rs.getString("professorName"));
		professor.setDepartmentId(rs.getInt("departmentId"));
		professor.setDepartmentName(rs.getString("departmentName"));
		return professor;
	}

	public static List<Professor> findAll() throws Exception {
		String sql = "SELECT p.*, d.departmentName " +
	                 "FROM professor p LEFT JOIN department d ON p.departmentId = d.id";
		try(Connection connection = DB.getConnection("student1");
			PreparedStatement pstmt = connection.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery()) {
			ArrayList<Professor> list = new ArrayList<Professor>();
			while(rs.next()) {
				list.add(getProfessorFrom(rs));
			}
			return list;
		}
	}

	public static Professor findByName(String name) throws Exception {
		String sql = "SELECT p.*, d.departmentName " +
                     "FROM professor p LEFT JOIN department d ON p.departmentId = d.id " +
				     "WHERE p.professorName = ?";
		try(Connection connection = DB.getConnection("student1");
			PreparedStatement pstmt = connection.prepareStatement(sql)) {
			pstmt.setString(1, name);
			try(ResultSet rs = pstmt.executeQuery()) {
				if(rs.next()) {
					return getProfessorFrom(rs);
				} else {
					return null;
				}
			}
		}

	}

	public static Professor findById(int id) throws Exception {
        String sql = "SELECT p.*, d.departmentName " +
                     "FROM professor p LEFT JOIN department d ON p.departmentId = d.id " +
                     "WHERE p.id = ?";
        try (Connection connection = DB.getConnection("student1");
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
        	pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next())
                    return getProfessorFrom(rs);
                else
                    return null;
            }
        }
    }

	public static void insert(Professor professor) throws Exception {
		String sql = "INSERT professor (id, professorName, departmentId) VALUES(?, ?, ?)";
		try(Connection connection = DB.getConnection("student1");
			PreparedStatement pstmt = connection.prepareStatement(sql)) {
			pstmt.setInt(1, professor.getId());
			pstmt.setString(2, professor.getProfessorName());
			pstmt.setInt(3, professor.getDepartmentId());
			pstmt.executeUpdate();
		}
	}

	public static void update(Professor professor) throws Exception {
		String sql = "UPDATE professor SET id=?, professorName=?, departmentId=?";
		try(Connection connection = DB.getConnection("student1");
			PreparedStatement pstmt = connection.prepareStatement(sql)) {
			pstmt.setInt(1, professor.getId());
			pstmt.setString(2, professor.getProfessorName());
			pstmt.setInt(3, professor.getDepartmentId());
			pstmt.executeUpdate();
		}
	}

}
