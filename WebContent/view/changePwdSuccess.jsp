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
	<div class="container" align="center">
		<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3"></div>
			<div class="jumbotron col-xs-6 col-sm-6 col-md-6  col-lg-6 center-block" style="padding-top:20px;">
				<p>암호를 변경했습니다.</p>
				<a class="btn btn-primary" href="${pageContext.request.contextPath }/index.jsp" >이동하기</a>				
			</div>
		<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3"></div>
	</div>

</body>
</html>