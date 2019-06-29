package article.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.fabric.Response;

import article.exception.ArticleContentNotFoundException;
import article.exception.ArticleNotFoundException;
import article.service.ArticleData;
import article.service.ReadArticleService;
import util.CommandHandler;

public class ReadArticleHandler implements CommandHandler{

	private ReadArticleService readService = new ReadArticleService();
	
	@Override
	public String Process(HttpServletRequest req, HttpServletResponse res) throws Exception {
	
		String noVal = req.getParameter("articleNo");
		int articleNo = Integer.parseInt(noVal);
		
		try {
		
			ArticleData articleData = readService.getArticle(articleNo, true);
			req.setAttribute("articleData", articleData);
			return "/view/readArticle.jsp";

		} catch(ArticleNotFoundException | ArticleContentNotFoundException e) {
			
			req.getServletContext().log("no article", e);
			res.sendError(HttpServletResponse.SC_NOT_FOUND);
			return null;
		
		}
	}

}
