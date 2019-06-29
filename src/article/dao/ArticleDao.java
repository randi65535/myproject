package article.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import article.model.Article;
import article.model.Writer;
import util.jdbc.JdbcUtil;

public class ArticleDao {

	public Article insert(Connection conn, Article article) throws SQLException {
		
		PreparedStatement pstmt = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "insert into article ("
							+"writer_id, " 
							+"writer_name, "
							+"title, "
							+"regdate, "
							+"moddate, "
							+"read_cnt )"
							+"values (?,?,?,?,?,0)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, article.getWriter().getId());
			pstmt.setString(2, article.getWriter().getName());
			pstmt.setString(3, article.getTitle());
			pstmt.setTimestamp(4, toTimestamp(article.getRegDate()));
			pstmt.setTimestamp(5, toTimestamp(article.getModDate()));
			
			int insertedCount = pstmt.executeUpdate();
			if(insertedCount > 0) {
				stmt = conn.createStatement();
				rs = stmt.executeQuery("select last_insert_id() from article");
				
				if(rs.next()) {
					//1
					Integer newNum = rs.getInt(1);
					return new Article(newNum,
							article.getWriter(),
							article.getTitle(),
							article.getRegDate(),
							article.getModDate(),
							0
							);
				}
			}
			
			return null;
			
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
			JdbcUtil.close(pstmt);
		}
	}
	
	private Timestamp toTimestamp(Date date) {
		return new Timestamp(date.getTime());
	}
	
	public int selectCount(Connection conn) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from article");
			
			if(rs.next()) {
				return rs.getInt(1);
			}
			
			return 0;
			
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
	}
	
	public List<Article> select(Connection conn, int startRow, int size) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			
			pstmt = conn.prepareStatement("select * from article order by article_no desc limit ?,?");
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, size);
			rs = pstmt.executeQuery();
			
			List<Article> result = new ArrayList<>();
			while(rs.next()){
				result.add(convertArticle(rs));
			}
			
			return result;
			
		} finally {
			
		}
	}

	private Article convertArticle(ResultSet rs) throws SQLException {
		return new Article(
					rs.getInt("article_no"),
					new Writer(rs.getString("writer_id"), rs.getString("writer_name")),
					rs.getString("title"),
					toDate(rs.getTimestamp("regDate")),
					toDate(rs.getTimestamp("modDate")),
					rs.getInt("read_cnt")
				);
	}
	
	private Date toDate(Timestamp tmp) {
		return new Date(tmp.getTime());
	}
	
	public int update(Connection conn, int no, String title) throws SQLException{
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement("update article set title = ?, moddate = now() " +
					"where article_no = ?");
			pstmt.setString(1, title);
			pstmt.setInt(2, no);
			return pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
	}
	
	public Article selectById(Connection conn, int articleNo) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null; 
		
		try {
			pstmt = conn.prepareStatement("select * from article where article_no = ?");
			pstmt.setInt(1, articleNo);
			rs = pstmt.executeQuery();
				
			Article article = null;
			if(rs.next()) {
				article = convertArticle(rs);
			}
			
			return article;
			
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	public void increaseReadCount(Connection conn, int articleNo) throws SQLException {
		
		PreparedStatement pstmt = null;
		
		try{
			
			pstmt = conn.prepareStatement("update article set read_cnt = read_cnt + 1 where article_no = ?");
			pstmt.setInt(1, articleNo);
			pstmt.executeUpdate();
			
		} finally {
			JdbcUtil.close(pstmt);
		}
	}
	
	public void delete(Connection conn, int articleNo) throws SQLException{
		
		PreparedStatement pstmt = null;
		
		try {
			
			pstmt = conn.prepareStatement("delete from article where article_no = ?");
			pstmt.setInt(1, articleNo);
			pstmt.executeUpdate();
			
		} finally {
			JdbcUtil.close(pstmt);
		}
		
	}
}
