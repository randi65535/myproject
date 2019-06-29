package member.service;

import java.sql.Connection;
import java.sql.SQLException;

import member.dao.MemberDao;
import member.exception.InvaildPasswordException;
import member.exception.MemberNotFoundException;
import member.model.Member;
import util.jdbc.ConnectionProvider;
import util.jdbc.JdbcUtil;

public class ChangePasswordService {

	private MemberDao memberDao = new MemberDao();
	
	public void changePassword(String userId, String curPwd, String newPwd){
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			Member member = memberDao.selectById(conn, userId);
			
			if(member == null) {
				throw new MemberNotFoundException();
			}
			
			if(!member.matchPassword(curPwd)) {
				throw new InvaildPasswordException();
			}
			
			member.changePassword(newPwd);
			memberDao.update(conn, member);
		
			conn.commit();
			
		} catch(SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException();
		} finally {
			JdbcUtil.close(conn);
		}
	}
	
}
