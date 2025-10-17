package mini.expense.dao;
import mini.expense.model.User;
import javax.sql.DataSource;
import java.sql.*;

public class AuthDAO {
  private final DataSource ds;
  public AuthDAO(DataSource ds){ this.ds = ds; }
  public User login(String username, String password){
    String sql="SELECT * FROM [User] WHERE username=? AND password=?";
    try(Connection cn=ds.getConnection(); PreparedStatement ps=cn.prepareStatement(sql)){
      ps.setString(1, username); ps.setString(2, password);
      try(ResultSet rs=ps.executeQuery()){
        if(rs.next()){
          User u = new User();
          u.id = rs.getString("id"); u.username = rs.getString("username");
          u.password = rs.getString("password"); u.roleId = rs.getString("roleId");
          return u;
        }
      }
    } catch(SQLException e){ throw new RuntimeException(e); }
    return null;
  }
  public boolean checkPassword(String userId, String plain){
	  String sql="SELECT 1 FROM [User] WHERE id=? AND password=?";
	  try (Connection cn=ds.getConnection(); PreparedStatement ps=cn.prepareStatement(sql)){
	    ps.setString(1, userId); ps.setString(2, plain);
	    try(ResultSet rs=ps.executeQuery()){ return rs.next(); }
	  } catch (SQLException e){ throw new RuntimeException(e); }
	}

	public void changePassword(String userId, String newPlain){
	  String sql="UPDATE [User] SET password=? WHERE id=?";
	  try (Connection cn=ds.getConnection(); PreparedStatement ps=cn.prepareStatement(sql)){
	    ps.setString(1, newPlain); ps.setString(2, userId);
	    ps.executeUpdate();
	  } catch (SQLException e){ throw new RuntimeException(e); }
	}

}
