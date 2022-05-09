<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>

	<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<!-- SOCKJS -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.0/sockjs.min.js"></script>
<!-- STOMP -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<!-- bootStrap -->
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style>
	.dropdown-item { height: 20px}
</style>

<script type="text/javascript">
// var testuser = 'testuser' 
var testuser = ${ session.id }
$(document).ready(function(){
	var username = ${session.nick}
	
	//클라이언트 소켓 만들기 
	var sockJS = new SockJS("/notice")
	var stomp = Stomp.over(sockJS);
	
	stomp.connect({},function(){
		stomp.subscribe("/sub/notice"+username, function(notice){
		
		var alArray = JSON.parse(notice.body)	
		console.log(alArray[0])
		console.log(alArray[1])
		console.log(alArray[2])
		
		$(".dropdown").eq(0).find("#alarm1").html(alArray[0])
		$(".dropdown").eq(0).find("#alarm2").html(alArray[1])
		$(".dropdown").eq(0).find("#alarm3").html(alArray[2])
		
		})
		
	$.ajax({
		url: "/notice",
		type: "post",
		asnyc: false,
		data: {username:id},
// 		data: {username:testuser},
// 		dataType:"JSON"
	})
	
	})
		
	

})
</script>



<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="/chat/rooms" method="get">

<button>입장</button>
</form>

<!-- <form action="/chat/room11" method="post"> -->
<form action="/chat/room11" method="get">
<button>입장</button>


<!-- <li class="dropdown"> -->
<!--   <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Dropdown <span class="caret"></span></a> -->
<!--   <ul class="dropdown-menu" role="menu"> -->
<!--     <li class="dropdown-header">Nav header</li> -->

<%--    <c:forEach items="${str }" var="i" begin="0"> --%>
<%--     <li><div class="dropdown-item" id="alarm${i }" ></li> --%>
<%--   </c:forEach> --%>

<!--     <li class="divider"></li> -->
<!--   </ul> -->
<!-- </li> -->



<li class="dropdown">
  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Dropdown <span class="caret"></span></a>
  <ul class="dropdown-menu" role="menu">
    <li class="dropdown-header">Nav header</li>
    
    <li><div class="dropdown-item" id="alarm1" ></div></li>
    <li><div class="dropdown-item" id="alarm2" ></div></li>
    <li><div class="dropdown-item" id="alarm3" ></div></li>
    
    <li class="divider"></li>
  </ul>
</li>



</form>
</body>
</html>