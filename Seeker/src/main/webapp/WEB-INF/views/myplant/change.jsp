<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">
#wrap-box > div {
	width : 600px;
	height : 600px;
	margin : auto;
	padding : 50px;
	border :1px solid black;
}

#profile-box-top {
	display : inline-flex;
	width : 500px;
	height : 250px;
}

#profile-box-top > div {
	width : 250px;
	height : 250px;
}

#profile-box-bottom {
	width : 500px;
	height : 250px;
}

img {
	width : 200px;
	height : 200px;
}

#upload-box {
	width : 250px;
	height :47px;
	padding : 10px;
}

label {
	margin : 0px;
}

label:hover {
	cursor : pointer;
}

#upload {
	visibility : hidden;
}

#img-name {
	width : 250px;
	height : 34px;
	padding : 0px 0px 0px 10px;
}

.table {
	margin : 0px 0px 0px 0px;
	text-align : left;
}

.table div {
	display: inline-block;
	width : 152px;
}

#empty {
	width : 250px;
	height : 60px;
}

#bottom-box {
	display : inline-flex;
}

#bottom {
	width : 400px;
	padding : 10px 50px 10px 10px;
}

#submit-box {
	width : 100px;
	height : 216px;
	padding : 142px 0px 0px 0px;
	text-align : center;
}

input {
	text-align : center;
}

#date {
	padding : 0px;
}

</style>

<div id="wrap-box-top">
	<div><a href="/myplant/list"><span class="glyphicon glyphicon-arrow-left"></span>&nbsp;나의 식물 목록</a></div>
	<div id="title-box">식물 등록하기</div>
	<div></div>
</div>

<form action="/myplant/write" method="post" enctype="multipart/form-data">
<div id="wrap-box">
	<div>
		<div id="profile-box-top">
			<div>
				<div id="img-box">
					<img src="/resources/img/default.jpg" class="img-thumbnail">
				</div>
				<div id="upload-box">
					<div class="bg-info">
						<label for="upload">
							사진 첨부&nbsp;<span class="glyphicon glyphicon-picture"></span>
						</label>
					</div>
					<input type="file" accept="image/gif, image/jpeg, image/png" id="upload" name="file" hidden="true">
				</div>
			</div>
			<div>
				<div id="empty">
				</div>
				<table class="table">
				<tr><td>학명 : </td></tr>
				<tr><td>
				<div><input type="text" class="form-control" name="bname" readonly></div>
				<button type="button" class="btn btn-default">검색</button>
				</td></tr>
				<tr><td>이름 : </td></tr>
				<tr><td><div><input type="text" name="nick" class="form-control"></div></td></tr>
				</table>	
			</div>
		</div>
		<div id="profile-box-bottom">
			<div id="img-name">
			</div>
			<div id="bottom-box">
				<div id="bottom">
					<table class="table">
					<tr><td>심은날 : </td></tr>
					<tr><td>
						<div><input type="date" class="form-control" name="birth" id="date"></div>
					</td></tr>
					<tr><td>물주기 날 간격 : </td></tr>
					<tr><td>
						<div><input type="text" class="form-control" name="water" placeholder="일"></div>
					</td></tr>
					</table>				
				</div>
				<div id="submit-box">
				<button type="submit" class="btn btn-success" id="submit">등록<br>완료</button>
				</div>
			</div>
		</div>
	</div>
</div>
</form>

<c:import url="/WEB-INF/views/layout/footer.jsp" />

<script type="text/javascript">
const upload = document.getElementById('upload');
const pbox = document.getElementById('img-box');
const nbox = document.getElementById('img-name');

upload.onchange = function() {
	
	pbox.innerHTML = '';
	nbox.textContent = '';
	
	const file = upload.files[0];
	const img = document.createElement('img');
	const url = URL.createObjectURL(file);
	
	img.src = url;
	img.style.width = '200px';
	img.style.height = '200px';
	img.className='img-thumbnail';
	
	pbox.appendChild(img);
	
	const name = file.name;
	
	nbox.innerHTML = name + '&nbsp;<span class="glyphicon glyphicon-remove-circle" id="remove-button"></span>';
	
	const remove = document.getElementById('remove-button');
	
	remove.onclick = function() {
			
		upload.value = '';
		img.src = '/resources/img/default.jpg';
		pbox.appendChild(img);
		nbox.textContent = '';
		
	};
	
};

</script>