<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib tagdir="/WEB-INF/tags" prefix="tf" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
<tf:bootstrapCDN />
<title>index</title>
</head>
<body>
  	
	<nav class="navbar navbar-inverse">
		
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target ="#navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="${pageContext.request.contextPath }/index.jsp">Hello JSP</a>
		</div>
		
		<div class="collapse navbar-collapse" id="#navbar-collapse-1">
		
			<ul class="nav navbar-nav">
				<li><a href="${pageContext.request.contextPath }/article/list.do">게시판</a></li>
			</ul>
			
			<ul class="nav navbar-nav navbar-right">
				<tf:notLogin>
					<li class="active"> <a href="${pageContext.request.contextPath }/view/loginForm.jsp">로그인</a></li>
					<li><a href="${pageContext.request.contextPath }/view/joinForm.jsp">회원가입</a></li>
				</tf:notLogin>
				<tf:isLogin>
					<li><a href="${pageContext.request.contextPath }/logout.do">로그아웃</a></li>
					<li><a href="${pageContext.request.contextPath }/changePwd.do">암호변경</a></li>
				</tf:isLogin>					
			</ul>
		</div>		
	</nav>
	
	
</body>
</html>