package article.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;

import article.dao.ArticleContentDao;
import article.dao.ArticleDao;
import article.model.Article;
import article.model.ArticleContent;
import util.jdbc.ConnectionProvider;
import util.jdbc.JdbcUtil;

public class WriteArticleService {

	private ArticleDao articleDao = new ArticleDao();
	private ArticleContentDao contentDao = new ArticleContentDao();
	
	public Integer write(WriteRequest req){
		
		Connection conn = null;
		try {
			
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			Article article = createArticle(req);
			
			Article savedArticle = articleDao.insert(conn, article);
			if(savedArticle == null) {
				throw new RuntimeException();
			}
			
			ArticleContent content = new ArticleContent(
										savedArticle.getNumber(),
										req.getContent()
									);
			
			ArticleContent savedContent = contentDao.insert(conn, content);
			if(savedContent == null) {
				throw new RuntimeException();
			}
			
			conn.commit();
			
			return savedArticle.getNumber();
			
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException();
			
		} catch (RuntimeException e) {
			JdbcUtil.rollback(conn);
			throw e;
			
		} finally {
			JdbcUtil.close(conn);
		}
	}
	
	private Article createArticle(WriteRequest req) {
		return new Article(null, req.getWriter(), req.getTitle(), new Date(), new Date(), 0 );
	}
}
