<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/headerm.jsp" />

<style type="text/css">
#wrap-box > div {
	display : inline-flex;
	width : 600px;
	height : 600px;
	margin : auto;
	padding : 50px;
}

#wrap-box > div > div {
	width : 250px;
	height : 500px;
}

#upload {
	visibility : hidden;
}
</style>

<div id="wrap-box-top">
	<div><a href="/myplant/list"><span class="glyphicon glyphicon-arrow-left"></span>&nbsp;나의 식물 목록</a></div>
	<div id="title-box">식물 등록하기</div>
	<div></div>
</div>
<div id="wrap-box">
	<div>
		<div>
			<label for="upload">
				사진 첨부&nbsp;<span class="glyphicon glyphicon-picture"></span>
			</label>
			<input type="file" accept="image/gif, image/jpeg, image/png" id="upload" name="file">
		</div>
		<div>
		</div>
	</div>





</div>

<c:import url="/WEB-INF/views/layout/footerm.jsp" />
