<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">
#button-box {
	height: 30px;
	width : 1000px;
	text-align : right;
}
.profile-box {
	display : inline-flex;
	width : 790px;
	height : 140px;
	margin : 5px 100px 5px 100px;
	padding : 5px;
	border : 1px solid black;
}
.profile-box:hover {
	border : 3px solid green;
	cursor : pointer;
}
.img-box {
	width : 130px;
	height : 130px;
}
.img-box> img {
	width :130px;
	height :130px;
	padding : 0px;
}
.profile {
	width : 650px;
	hegith : 130px;
}
.btn {
	border-radius : 10px;
}
</style>

<div id="wrap-box-top">
	<div></div>
	<div id="title-box">나의 식물 목록</div>
	<div></div>
</div>
<div id="wrap-box">
	<div id="button-box">
	<button type="button" class="btn btn-success btn-sm">등록 하기</button>
	</div>
	<div class="profile-box">
		<div class="img-box">
			<img src="/resources/photato.jpeg" class="img-thumbnail">
		</div>
		<div class="profile">
			<table class="table">
				<tr><td>학명 : </td><td>감자</td></tr>
				<tr><td>이름 : </td><td>감돌이</td></tr>
				<tr><td>심은날 : </td><td>2022년 04월 01일</td></tr>
			</table>	
		</div>
	</div>
</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />
