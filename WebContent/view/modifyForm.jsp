<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tf" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<tf:bootstrapCDN />
<title>Insert title here</title>
</head>
<body>
<jsp:include page="top.jsp" flush="false" />

<div class="container">
	<div class="row">
		<form action="modify.do" method="post">
		
				<table class="table table-striped">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align:center;">글수정 양식</th>
						</tr>
					</thead>

					<tbody>
						<tr>
							<td>글 번호</td><td><c:out value="${modReq.articleNumber }"/></td>
						</tr>
						
						<tr>
							<td>글 작성자</td><td><c:out value="${modReq.userId }" /></td>
						</tr>
						<tr>
							<td colspan="2">제목 : <input type="text" class="form-control" placeholder="글 제목" name="title" value="${modReq.title }"></td>
						</tr>
						<tr>
							<td colspan="2">내용 : <textarea class="form-control" style="min-height: 300px;" placeholder="내용" name="content" rows="5" cols="30">${modReq.content }</textarea></td>
						</tr>
					</tbody>
				</table>	
				
			<input type="hidden" name="no" value="${modReq.articleNumber }">
			<input type="submit" class="btn btn-primary pull-right" value="수정">	
		</form>
	</div>	
</div>

</body>
</html>