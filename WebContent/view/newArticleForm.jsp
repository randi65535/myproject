<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<jsp:include page="top.jsp"></jsp:include>
<body>
<div class="container">
	<div class="row">
		<form action="write.do"	method="post">
				<table class="table table-striped">
					<thead>
						<tr>
							<th style="background-color: #eeeeee; text-align:center;">글쓰기 양식</th>
						</tr>
					</thead>

					<tbody>
						<tr>
							<td>제목 : <input type="text" class="form-control" placeholder="글 제목" name="title" value="${param.title }"></td>
						</tr>
						<tr>
							<td>내용 : <textarea class="form-control" style="min-height: 300px;" placeholder="내용" name="content" rows="5" cols="30">${param.content }</textarea></td>
						</tr>
					</tbody>
				</table>	
			<input type="submit" class="btn btn-primary pull-right" value="글쓰기">	
		</form>
	</div>	
</div>

</body>
</html>