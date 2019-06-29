package article.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import article.service.ArticlePage;
import article.service.ListArticleService;
import util.CommandHandler;

public class ListArticleHandler implements CommandHandler{

	private ListArticleService listService = new ListArticleService();
	
	@Override
	public String Process(HttpServletRequest req, HttpServletResponse res) throws Exception {

		String pageNoVal = req.getParameter("pageNo");
		
		int pageNo = 1;
		
		if(pageNoVal != null) {
			pageNo = Integer.parseInt(pageNoVal);
		}
		
		ArticlePage articlePage = listService.getArticlePage(pageNo);
		
		req.setAttribute("articlePage", articlePage);
		return "/view/listArticle.jsp";
	}

	
}
