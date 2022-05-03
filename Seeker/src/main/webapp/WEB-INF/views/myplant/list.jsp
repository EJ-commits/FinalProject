<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">
#post-box {
	height: 30px;
	width : 1000px;
	text-align : right;
}

.calendar-box {
	width : 1000px;
	height : 25px;
	padding : 0px 700px 0px 100px;
}

.profile-box {
	display : inline-flex;
	width : 800px;
	height : 150px;
	margin : 0px 100px 5px 100px;
	padding : 10px 5px 10px 5px;
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

.img-box > img {
	width : 130px;
	height : 130px;
	padding : 0px;
}

.profile {
	width : 580px;
	height : 130px;
}

.button-box {
	width : 90px;
	height : 130px;
	text-align : right;
}

</style>

<script type="text/javascript">
window.onload = function() {
	
	const profile = document.getElementsByClassName('profile-box');
	const calendar = document.getElementsByClassName('calendar');
	const number = document.getElementsByClassName('number');
	
	for(let i = 0; i < profile.length; ++i){
		profile[i].onmouseover = function(){
			calendar[i].hidden = false;
		}
		profile[i].onmouseout = function(){
			calendar[i].hidden = true;
		}
		profile[i].onclick = function(){
			location.href = '/diary/calendar?no=' + number[i].textContent;
		}
	}
	
	
};
</script>

<div id="wrap-box-top">
	<div></div>
	<div id="title-box">나의 식물 목록</div>
	<div></div>
</div>
<div id="wrap-box">
	<div id="post-box">
	<span class="text-muted">식물은 3개까지 등록할 수 있어요!&nbsp;</span>
	<a href="/myplant/write"><button type="button" class="btn btn-success btn-sm">식물 등록 하기</button></a>
	</div>
	<c:forEach items="${list}" var="MyPlant">
	<div id="list-box">
		<div class="calendar-box">
			<div class="calendar bg-success" hidden="true">
				<span>캘린더 보기</span>
			</div>
		</div>
		<div class="profile-box">
			<div class="img-box">
				<img src="/upload/${MyPlant.stored}" class="img-thumbnail">
			</div>
			<div class="profile">
				<table class="table">
					<tr><td>학명 : </td><td>${MyPlant.bname}</td></tr>
					<tr><td>이름 : </td><td>${MyPlant.nick}</td></tr>
					<tr><td>심은날 : </td><td>${MyPlant.birth}</td></tr>
				</table>	
			</div>
			<div class="button-box">
				<a href="/myplant/alter?no=${MyPlant.myPlantNo}">
				<button type="button" class="btn btn-info btn-sm">변경</button>
				</a>
				<a href="/myplant/delete?no=${MyPlant.myPlantNo}">
				<button type="button" class="btn btn-warning btn-sm">삭제</button>
				</a>
			</div>
		</div>
		<span class="number" hidden="true">${MyPlant.myPlantNo}</span>
	</div>
	</c:forEach>
</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />
