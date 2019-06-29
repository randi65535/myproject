package article.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import article.exception.ArticleNotFoundException;
import article.exception.PermissionDeniedException;
import article.service.DeleteArticleService;
import article.service.DeleteRequest;
import auth.service.User;
import util.CommandHandler;
import util.PermissionChecker;

public class DeleteArticleHandler implements CommandHandler{

	private DeleteArticleService deleteService = new DeleteArticleService();
	
	@Override
	public String Process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		
		User authUser = (User) req.getSession().getAttribute("authUser");
		
		String noVal = req.getParameter("no");
		int no = Integer.parseInt(noVal);
		
		DeleteRequest delReq = new DeleteRequest(authUser.getId(), no);
		req.setAttribute("delReq", delReq);
		
		try {
			System.out.println("DeleteArticleHandler ÀÇ ");
			deleteService.delete(delReq);
			return "/view/deleteSuccess.jsp";
			
		} catch (ArticleNotFoundException e) {
			
			req.getServletContext().log("no article", e);
			res.sendError(HttpServletResponse.SC_NOT_FOUND);
			return null;
			
		} catch (PermissionDeniedException e){
			res.sendError(HttpServletResponse.SC_FORBIDDEN);
			return null;
		}

	}

}
