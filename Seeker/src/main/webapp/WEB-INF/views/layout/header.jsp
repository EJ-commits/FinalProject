<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">

<!-- SOCKJS -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.0/sockjs.min.js"></script>
<!-- STOMP -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
*{
 	font-family :'Do Hyeon', sans-serif; 
 	font-size : 18px;
}

body {
	width : 1200px;
	height : 900px;
	margin : auto;
}

#header {
	width : 1200px;
	height :130px;
}

#header d{
	height : 100px;
}

#header-box {
	display : inline-flex;
	width : 1200px;
	margin : 0px 0px 0px 0px;
	border-bottom : 2px solid black;
}

#header-logo-box {
	display : inline-flex;
}

.header-lmg-box {
	width : 70px;
	height : 90px;
	padding : 40px 0px 10px 0px;
}

.header-img {
	width : 70px;
	height : 40px;
}

#header-logo {
	width : 150px;
	height : 90px;
	padding : 35px 0px 0px 0px;
	text-align : center;
}

#header-logo h2{
	font-size : 50px;
	margin : 0px 0px 0px 0px;
}

#header-logo-black{
	width : 290px;
	height : 9px;
	background-color : black;
}

#header-center {
	width : 90px;
}

.header-menu-box {
	width : 120px;
	padding : 53px 0px 0px 0px;
	text-align : right;
}

.header-menu-box > a:hover{
	text-decoration-line : none;
	color : black;
}

.header-menu-box > a{
	font-size : 30px;
	color : #688331;
}

#header-login-box {
	width : 75px;
	padding : 20px 0px 0px 0px;
	text-align : right;
}

#header-login-box > a:hover {
	text-decoration-line : none;
	color : black;
}

.header-menu-text-sm {
	font-size : 20px;
}

.header-menu-text-xs {
	font-size : 17px;
}

#hidden-menu-box {
	width : 1200px;
	height : 25px;
	margin : 0px 0px 5px 0px;
}

#hidden-menu-board {
	display : none;
	margin: 0px 0px 0px 480px;
}

#hidden-menu-board > a:hover {
	text-decoration-line : none;
}

#hidden-menu-board > a > span:hover {
	text-decoration-line : none;
	color : black;
}

#hidden-menu-board > a > span {
	margin : 0px 10px 0px 0px;
	padding : 5px 0px 0px 0px;
	color : #688331;
	font-size : 20px;
}

#wrap-con {
	width : 1200px;
	height : 680px;
	margin : auto;
}

#wrap-con::after {
	content : "";
	position : absolute;
	left : 0;
	top : 0;
	width : 100%;
	height : 680px;
	margin : 130px 0px 0px 0px;
	background-color: #ECF8E0;
	background-size : cover; z-index : -1;
	opacity : 0.5;
}

#wrap-box-top {
	display : inline-flex;
	height : 30px;
	font-size : 20px;
	margin : 0px 0px 10px 0px;
	border-top : 1px solid black;
	border-bottom : 1px solid black;
}

#wrap-box-top > div {
	width : 390px;
	height : 30px;
	margin : 0px 5px 0px 5px;
	padding : 4px 0px 0px 0px;
}

#title-box {
	text-align : center;
}

#wrap-box-bottom {
	height : 30px;
	font-size : 20px;
	margin : 10px 0px 0px 0px;
	padding : 0px 0px 0px 0px;
	border-bottom : 1px solid black;
}

#wrap-box {
	width :1100px;
	height : 600px;
	margin : auto;
	padding : 0px 50px 0px 50px;
	text-align : center;
}
</style>


<script type="text/javascript">
var testuser = 'testuser' // ${ session.userid }

$(document).ready(function(){
	var username = testuser
	
	//클라이언트 소켓 만들기 
	var sockJS = new SockJS("/notice")
	var stomp = Stomp.over(sockJS);
	
	stomp.connect({},function(){
		stomp.subscribe("/sub/notice"+username, function(notice){
		
		var alArray = JSON.parse(notice.body)	
		
		stomp.disconnect();
		
		$(".dropdown").eq(0).find("#alarm1").html(alArray[0])
		$(".dropdown").eq(0).find("#alarm2").html(alArray[1])
		$(".dropdown").eq(0).find("#alarm3").html(alArray[2])
		
		})
		
	$.ajax({
		url: "/notice",
		type: "get",
		asnyc: false,
		data: {username:testuser},
// 		dataType:"JSON"
	})
	
  })
})
</script>




</head>

<body>
<header id="header">
	<div id="header-box">
		<div id="header-logo-con">
			<div id="header-logo-box">
				<div class="header-lmg-box">
					<img class="header-img" src="/resources/img/headerleft.png">
				</div>
				<div id="header-logo">
					<h2>Seeker</h2>
				</div>
				<div class="header-lmg-box">
					<img class="header-img" src="/resources/img/headerright.png">
				</div>
			</div>
			<div id="header-logo-black">
			</div>
		</div>
		<div id="header-center"></div>
		<div class="header-menu-box">
			<a href="/myplant/list">나의 식물</a>
		</div>
		<div class="header-menu-box" id="menu-box-board">
			<a id="menu-board">게시판</a>
		</div>	
		<div class="header-menu-box">
			<a href="/garden/gardenMap">수목원</a>
		</div>
		<div class="header-menu-box">
			<a href="">스토어</a>
		</div>
		<div class="header-menu-box" >
		<div style="height: 4px"></div>
			<div class="dropdown" style="list-style: none;" > 
				<span class="material-icons">alarm_on</span>
				<span class="header-menu-text-sm" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" style="cursor:pointer;">알람
				</span> 
				<ul class="dropdown-menu" role="menu" >
			    	<li class="dropdown-header">Nav header</li>
				    <li><div class="dropdown-item" id="alarm1" ></div></li>
				    <li><div class="dropdown-item" id="alarm2" ></div></li>
				    <li><div class="dropdown-item" id="alarm3" ></div></li>
			    	<li class="divider"></li>
			 	</ul>
			</div>
		</div>				
			
		<div class="header-menu-box">
			<a href="/chat/rooms" >
			<span class="material-icons">chat_bubble_outline</span>
			<span class="header-menu-text-sm">오픈채팅</span>
			</a>
		</div>
		<div id="header-login-box">
		<c:choose>
			<c:when test="${empty login }">
				<a href="/member/login"><span class="header-menu-text-xs">로그인</span></a>
			</c:when>
			<c:when test="${login eq true }">
				<a href="/member/logout"><span class="header-menu-text-xs">로그아웃</span></a>
			</c:when>
		</c:choose>
		</div>
		<div id="header-login-box">
			<a href="/member/join"><span class="header-menu-text-xs">회원가입</span></a>
		</div>
	</div>
	<div id="hidden-menu-box">
		<div id="hidden-menu-board">
			<a href=""><span>자유 게시판</span></a>
			<a href=""><span>사진 게시판</span></a>
		</div>
	</div>
	
	
	

    


	
</header>
<div id='wrap-con'>
