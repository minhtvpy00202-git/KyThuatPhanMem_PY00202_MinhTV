package mini.expense.dao;

import mini.expense.model.Category;
import javax.sql.DataSource;
import java.sql.*;
import java.util.*;

public class CategoryDAO {
	private final DataSource ds;

	public CategoryDAO(DataSource ds) {
		this.ds = ds;
	}

	/**
	 * Danh sách theo loại (INCOME/EXPENSE), gồm cả danh mục global (userId IS NULL)
	 * và của user
	 */
	public List<Category> allForUser(String userId, String typeId) {
		String sql = """
				SELECT c.* FROM Category c
				WHERE c.categoryTypeId=? AND (c.userId IS NULL OR c.userId=?)
				ORDER BY c.name
				""";
		List<Category> list = new ArrayList<>();
		try (Connection cn = ds.getConnection(); PreparedStatement ps = cn.prepareStatement(sql)) {
			ps.setString(1, typeId);
			ps.setString(2, userId);
			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					Category c = new Category();
					c.id = rs.getString("id");
					c.userId = rs.getString("userId");
					c.categoryTypeId = rs.getString("categoryTypeId");
					c.name = rs.getString("name");
					list.add(c);
				}
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return list;
	}

	/** Tạo danh mục mới CHO USER (userId != null) */
	public void create(String userId, String typeId, String name) {
		String sql = "INSERT INTO Category(id,userId,categoryTypeId,name) VALUES (CONVERT(varchar(36),NEWID()),?,?,?)";
		try (Connection cn = ds.getConnection(); PreparedStatement ps = cn.prepareStatement(sql)) {
			ps.setString(1, userId);
			ps.setString(2, typeId);
			ps.setString(3, name);
			ps.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	/** Cập nhật tên danh mục (chỉ cho danh mục của user) */
	public void rename(String id, String userId, String newName) {
		String sql = "UPDATE Category SET name=? WHERE id=? AND userId=?"; // không cho sửa danh mục global
		try (Connection cn = ds.getConnection(); PreparedStatement ps = cn.prepareStatement(sql)) {
			ps.setString(1, newName);
			ps.setString(2, id);
			ps.setString(3, userId);
			ps.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	/** Xóa danh mục của user (không xóa global) */
	public void delete(String id, String userId) {
		String sql = "DELETE FROM Category WHERE id=? AND userId=?";
		try (Connection cn = ds.getConnection(); PreparedStatement ps = cn.prepareStatement(sql)) {
			ps.setString(1, id);
			ps.setString(2, userId);
			ps.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
