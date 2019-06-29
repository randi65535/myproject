<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<tf:bootstrapCDN />
<title>Insert title here</title>
</head>
<body>

<jsp:include page="top.jsp" />

<div class=container>
	<div class="alert alert-success">
		<strong>Success!</strong> 게시글을 수정했습니다.
	</div>
	<div class="jumbotron">	
		${ctxPath = pageContext.request.contextPath ; '' }
		<table class="table">
			<tr>
				<td>
					<a href="${ctxPath }/article/list.do">
					<img class="center-block" width="100px;" height="100px" src="${ctxPath }/css/leftArrow.svg">
					</a>
				</td>
				<td>
					<a href="${ctxPath }/article/read.do?articleNo=${modReq.articleNumber}">
					<img class="center-block" width="100px;" height="100px" src="${ctxPath }/css/success-icon.svg">
					</a>
				</td>
			</tr>
		</table>
	</div>	
</div>
</body>
</html>