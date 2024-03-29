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
  	<jsp:include page="/view/top.jsp"/>

	
<div class="container">
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
        <img src="css/i1.jpg" alt="" style="width:100%; height:500px">
      	<div class="carousel-caption">
      		<h3>우송대학교</h3>
      	</div>
      </div>

      <div class="item">
        <img src="css/i2.jpg" alt="" style="width:100%; height:500px">
      	<div class="carousel-caption">
      	<h3>김원 교수님의</h3>
     	</div>
      </div>
    
      <div class="item">
        <img src="css/i3.jpg" alt="" style="width:100%; height:500px">
      	<div class="carousel-caption">
      		<h3>러닝콘서트!</h3>
     	</div>
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
	
<tf:notLogin>


</tf:notLogin>

</body>
</html>