package article.service;

import java.sql.Connection;
import java.sql.SQLException;

import article.dao.ArticleDao;
import article.exception.ArticleNotFoundException;
import article.exception.PermissionDeniedException;
import article.model.Article;
import util.PermissionChecker;
import util.jdbc.ConnectionProvider;
import util.jdbc.JdbcUtil;

public class DeleteArticleService {

	private ArticleDao articleDao = new ArticleDao();
	
	
	public void delete(DeleteRequest delReq) {
		Connection conn = null;
		
		try {
			
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			Article article = articleDao.selectById(conn, delReq.getArticleNumber());
			
			if(article == null) {
				throw new ArticleNotFoundException();
			}
			
			if(!PermissionChecker.canDelete(delReq.getUserId(), article)){
				throw new PermissionDeniedException();
			}
			
			articleDao.delete(conn, delReq.getArticleNumber());
			
			conn.commit();
			
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
}
