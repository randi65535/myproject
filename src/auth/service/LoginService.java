package auth.service;

import java.sql.Connection;
import java.sql.SQLException;

import auth.exception.LoginFailException;
import member.dao.MemberDao;
import member.model.Member;
import util.jdbc.ConnectionProvider;
import util.jdbc.JdbcUtil;

public class LoginService {

	private MemberDao memberDao = new MemberDao();
	
	public User login(String id, String password) {
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			Member member = memberDao.selectById(conn, id);
			
			if(member == null) {
				throw new LoginFailException();
			}
			
			if(!member.matchPassword(password)) {
				throw new LoginFailException();
			}
			
			return new User(member.getId(), member.getName());
			
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
}
