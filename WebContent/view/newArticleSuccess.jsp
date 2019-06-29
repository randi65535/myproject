<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="top.jsp"></jsp:include>
<div class=container>
	<div class="alert alert-success">
		<strong>Success!</strong> 게시글을 등록했습니다.
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
					<a href="${ctxPath }/article/read.do?articleNo=${newArticleNo}">
					<img class="center-block" width="100px;" height="100px" src="${ctxPath }/css/success-icon.svg">
					</a>
				</td>
			</tr>
		</table>
	</div>	
</div>

</body>
</html>