package article.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import article.dao.ArticleDao;
import article.model.Article;
import util.jdbc.ConnectionProvider;
import util.jdbc.JdbcUtil;

public class ListArticleService {

	private ArticleDao articleDao = new ArticleDao();
	private int size = 10;
	
	public ArticlePage getArticlePage(int pageNum) {
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			int total = articleDao.selectCount(conn);
			
			List<Article> content = articleDao.select(conn, (pageNum - 1) * size, size);
			
			return new ArticlePage(total, pageNum, size, content);
			
		} catch(SQLException e) {
			
			throw new RuntimeException(e);
			
		} finally {
			JdbcUtil.close(conn);
		}
	}
}
