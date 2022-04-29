<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<link rel="stylesheet" href="/resources/css/diaryform.css">

<script type="text/javascript">
window.onload = function() {
	
	const alter = document.getElementById('alter-button');
	const upload = document.getElementById('upload-file');
	const drop = document.getElementById('drop-button');
	
	alter.onclick = function() {
		
		const input = document.getElementsByClassName('form-control');
		const check = document.getElementById('check-table');
		const hidden = document.getElementsByClassName('hidden-box');

		input[2].parentNode.removeChild(input[2]);
		alter.parentNode.removeChild(alter);
		drop.parentNode.removeChild(drop);
		check.hidden = true;
		
		for( let i = 0; i < input.length; ++i) {
			
			input[i].disabled = false;
			
		}
		
		for( let i = 0; i < hidden.length; ++i) {
			
			hidden[i].hidden = false;
			
		}
		
	}
	
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
	
	drop.onclick = function() {
		
		const date = document.getElementById('diary-date').value;
		location.href= '/diary/delete?date=' + date;
		
	}
	
}
</script>

<div id="wrap-box-top">
	<div><a href="/diary/calendar"><span class="glyphicon glyphicon-arrow-left"></span>&nbsp;일기 달력</a></div>
	<div id="title-box">일기 보기</div>
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
				<tr><td>심은날 : </td><td>2022년 04월 01일 (${diary.ddate - 20220401}일째 되는 날)</td></tr>
			</table>	
		</div>
	</div>
		<div id="date-box">
			<span>${newDate}</span>
		</div>
		<form action="/diary/alter" method="post" enctype="multipart/form-data">
			<div class="diary-box">
				<div class="write-box">
					<p class="text-danger">온도</p>
					<input type="text" class="form-control" name="temp" value="${diary.temp}" disabled>
				</div>
				<div class="tip-box">
				</div>
				<div class="write-box">
					<p class="text-primary">습도</p>
					<input type="text" class="form-control" name="humid" value="${diary.humid}" disabled>
				</div>
				<div class="tip-box">
				</div>
			</div>
			<div class="diary-box">
				<div class="write-box">
					<p class="text-warning">흙</p>
					<input type="text" class="form-control" name="dirt" value="${diary.dirt}" disabled>
					<div class="hidden-box" hidden="true">
						<div class="btn-group" data-toggle="buttons">
							<c:choose>
								<c:when test="${diary.dirt eq '과습'}">
  								<label class="btn btn-xs btn-info active">
   									<input type="radio" name="dirt" value="과습" checked>과습
	  							</label>
	  							</c:when>
	  							<c:otherwise>
	  							<label class="btn btn-xs btn-info">
   									<input type="radio" name="dirt" value="과습">과습
	  							</label>
	  							</c:otherwise>
	  						</c:choose>
	   						<c:choose>
								<c:when test="${diary.dirt eq '건조'}">
	  							<label class="btn btn-xs btn-warning active">
	   								<input type="radio" name="dirt" value="건조" checked>건조
	 							 </label>
	 							 </c:when>
	   							<c:otherwise>
	   							<label class="btn btn-xs btn-warning">
	   								<input type="radio" name="dirt" value="건조">건조
	 							 </label>
	 							</c:otherwise>
	 						</c:choose>
						</div>
					</div>
				</div>
				<div class="tip-box">
				</div>
				<div class="write-box" id="check-box">
					<table class="table" id="check-table">
						<tr>
							<td>물주기</td>
							<td>
							<c:if test="${diary.water eq '1'}">
							<span class="glyphicon glyphicon-ok"></span>
							</c:if>
							<c:if test="${diary.water eq '0'}">
							<span class="glyphicon glyphicon-remove"></span>
							</c:if>
							</td>
						</tr>
						<tr>
							<td>분갈이</td>
							<td>
							<c:if test="${diary.repot eq '1'}">
							<span class="glyphicon glyphicon-ok"></span>
							</c:if>
							<c:if test="${diary.repot eq '0'}">
							<span class="glyphicon glyphicon-remove"></span>
							</c:if>
							</td>
						</tr>
						</table>
					<div class="hidden-box" hidden="true">	
						<table class="table" id="check-table">
						<tr>
							<td>물주기</td>
							<td>
							<c:if test="${diary.water eq '1'}">
							<td><input type="checkbox" name="water" checked></td>
							</c:if>
							<c:if test="${diary.water eq '0'}">
							<td><input type="checkbox" name="water"></td>
							</c:if>
							</td>
						</tr>
						<tr>
							<td>분갈이</td>
							<td>
							<c:if test="${diary.repot eq '1'}">
							<td><input type="checkbox" name="repot" checked></td>
							</c:if>
							<c:if test="${diary.repot eq '0'}">
							<td><input type="checkbox" name="repot"></td>
							</c:if>
							</td>
						</tr>
						</table>
					</div>
				</div>
				<div class="tip-box">
				</div>
			</div>
			<div id="content-con">
				<div id="content-box">
					<div class="title-box">일기 쓰기&nbsp;<span class="glyphicon glyphicon-menu-down"></span></div>
					<textarea class="form-control" rows="4" name="cmt" disabled>${diary.cmt}</textarea>
				</div>
				<div id="upload-box">
					<div class="title-box">
						<label for="upload-file">
							사진 첨부&nbsp;<span class="glyphicon glyphicon-picture"></span>
						</label>
							<input type="file" accept="image" class="form-control" id="upload-file" name="file" disabled>
					</div>
					<div id="upload-photo-box">
						<c:if test="${!empty diary.origin}">
							<img src="/upload/${diary.stored}" style="width:130px; height:130px;">
						</c:if>
					</div>
					<div>
						<div id="upload-name">
							${diary.origin}
						</div>
						<div id="submit-box">
							<input type="text" name="ddate" id="diary-date" value="${diary.ddate}" hidden="true">
							<button type="button" class="btn btn-success btn-sm" id="alter-button">수정 하기</button>
							<button type="button" class="btn btn-warning btn-sm" id="drop-button">삭제 하기</button>
							<div class="hidden-box" hidden="true">
								<button type="submit" class="btn btn-success btn-sm" id="write-button">작성 완료</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
<c:import url="/WEB-INF/views/layout/footer.jsp" />