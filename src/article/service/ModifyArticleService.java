package article.service;

import java.sql.Connection;
import java.sql.SQLException;

import article.dao.ArticleContentDao;
import article.dao.ArticleDao;
import article.exception.ArticleNotFoundException;
import article.exception.PermissionDeniedException;
import article.model.Article;
import util.PermissionChecker;
import util.jdbc.ConnectionProvider;
import util.jdbc.JdbcUtil;

public class ModifyArticleService {

	private ArticleDao articleDao = new ArticleDao();
	private ArticleContentDao contentDao = new ArticleContentDao();
	
	public void modify(ModifyRequest modReq) { 
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			Article article = articleDao.selectById(conn, modReq.getArticleNumber());

			if(article == null) {
				throw new ArticleNotFoundException();
			}
			
			if(!PermissionChecker.canModify(modReq.getUserId(), article)) {
				throw new PermissionDeniedException();
			}
			
			articleDao.update(conn, modReq.getArticleNumber(), modReq.getTitle());
			contentDao.update(conn, modReq.getArticleNumber(), modReq.getContent());
			
			conn.commit();
			
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
		
}
