package util;

import article.model.Article;

public class PermissionChecker {
	
	public static boolean canModify(String userId, Article article){
		return userId.equals(article.getWriter().getId());
	}
	
	public static boolean canDelete(String userId, Article article){
		return userId.equals(article.getWriter().getId());
	}
}
