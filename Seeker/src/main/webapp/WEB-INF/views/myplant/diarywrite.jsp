<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<link rel="stylesheet" href="/resources/css/diaryform.css">

<script type="text/javascript">
window.onload = function() {
	
	const upload = document.getElementById('upload-file');
	
	upload.onchange = function() {
		
		const file = upload.files[0];
		const name = file.name;
		const url = URL.createObjectURL(file);
		
		const pbox = document.getElementById('upload-photo-box');
		const img = document.createElement('img');
		const nbox = document.getElementById('upload-name');
		
		img.src = url;
		img.style.width = '130px';
		img.style.height = '130px';
		
		while (pbox.firstChild) {
			pbox.removeChild( pbox.firstChild);
		}
		
		pbox.appendChild(img);
		nbox.innerHTML = name + '&nbsp;<span class="glyphicon glyphicon-remove-circle" id="remove"></span>';
		
		const remove = document.getElementById('remove');
		
		remove.onclick = function() {
			
			upload.value = '';
			pbox.removeChild( pbox.firstChild);
			nbox.textContent = '';
			
		}
		
	}
	
	
};
</script>

<div id="wrap-box-top">
	<div><a href="/diary/calendar"><span class="glyphicon glyphicon-arrow-left"></span>&nbsp;일기 달력</a></div>
	<div id="title-box">일기 쓰기</div>
	<div></div>
</div>
<div id="wrap-box">
	<div id="profile-box">
		<div>
			<img src="/resources/photato.jpeg" class="img-thumbnail" id="plant-photo">
		</div>
		<div id="info-box">
			<table class="table" id="profile-table">
				<tr><td>학명 : </td><td>감자</td></tr>
				<tr><td>이름 : </td><td>감돌이</td></tr>
				<tr><td>심은날 : </td><td>2022년 04월 01일 (${date - 20220401}일째 되는 날)</td></tr>
			</table>	
		</div>
	</div>
		<div id="date-box">
			<span>${newDate}</span>
		</div>
		<form action="/diary/write" method="post" enctype="multipart/form-data">
			<div class="diary-box">
				<div class="write-box">
					<p>온도</p>
					<input type="text" class="form-control" name="temp">
				</div>
				<div class="tip-box">
				</div>
				<div class="write-box">
					<p>습도</p>
					<input type="text" class="form-control" name="humid">
				</div>
				<div class="tip-box">
				</div>
			</div>
			<div class="diary-box">
				<div class="write-box">
					<p>흙</p>
					<div class="btn-group" data-toggle="buttons">
  						<label class="btn btn-xs btn-info">
   							 <input type="radio" name="dirt" value="과습">과습
  						</label>
  						<label class="btn btn-xs btn-warning">
   							 <input type="radio" name="dirt" value="건조">건조
 						 </label>
					</div>
				</div>
				<div class="tip-box">
				</div>
				<div class="write-box" id="check-box">
					<table class="table" id="check-table">
						<tr>
							<td>물주기</td>
							<td><input type="checkbox" name="water"></td>
						</tr>
						<tr>
							<td>분갈이</td>
							<td><input type="checkbox" name="repot"></td>
						</tr>
					</table>
				</div>
				<div class="tip-box">
				</div>
			</div>
			<div id="content-con">
				<div id="content-box">
					<div class="title-box">일기 쓰기&nbsp;<span class="glyphicon glyphicon-menu-down"></span></div>
					<div id="text-box">
						<textarea class="form-control" rows="4" name="cmt"></textarea>
					</div>
				</div>
				<div id="upload-box">
					<div class="title-box">
						<label for="upload-file">
							사진 첨부&nbsp;<span class="glyphicon glyphicon-picture"></span>
						</label>
							<input type="file" accept="image/gif, image/jpeg, image/png" id="upload-file" name="file">
					</div>
					<div id="upload-photo-box"></div>
					<div>
						<div id="upload-name">
						</div>
						<div id="submit-box">
							<input type="text" name="ddate" value="${date}" hidden="true">
							<button type="submit" class="btn btn-success btn-sm" id="write-button">작성 완료</button>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
<c:import url="/WEB-INF/views/layout/footer.jsp" />
	