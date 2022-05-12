<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function() {
	$("#cancel").click(function() {
		history.go(-1)
	})
	
	$("#id").focus();
})
</script>

<div class="container">

<h1>회원 가입</h1>
<hr>

<div>
<form action="/member/join" method="post" class="form-horizontal">

<div class="form-group">
	<label for="id" class="control-label col-xs-2" style="maring-left: 70px;">아이디</label><br><br>
	<div class="col-xs-8" style="width: 250px;">
		<input type="text" id="id" name="id" class="form-control" style="width: 200px; margin-left: 120px;">
		<div style="width: 300px; margin-left: 97px;">
			<span id="duplMsg_id" style="position: relative; width: 300px; top: 10px; right: 100px; margin-left: 130px; margin-bottom: -10px;"></span>
		</div>
	</div>
	<button type="button" class="col-xs-2" id="btnDuplicate_id" style="margin-left: 110px; width: 120px; height: 33.99px; background: #FF792A; color: white; border: 0; border-radius: 5px;"><b>중복 검사</b></button>
</div>

<div class="form-group">
	<label for="pw" class="control-label col-xs-2" style="margin-left: 13px;">비밀번호</label><br><br>
	<div class="col-xs-10">
		<input type="password" id="pw" name="pw" class="form-control" style="width: 346px;  margin-left: 120px;">
	</div>
</div>

<div class="form-group">
	<label for="pw_check" class="control-label col-xs-3" style="margin-left: -52px;">비밀번호 확인</label><br><br>
	<div class="col-xs-9">
		<input type="password" id="pw_check" name="pw_check" class="form-control" style="width: 346px;  margin-left: 120px;">
	</div>
</div>

<div class="form-group">
	<label for="nick" class="control-label col-xs-2">닉네임</label><br><br>
	<div class="col-xs-8" style="width: 250px;">
		<input type="text" id="nick" name="nick" class="form-control" style="width: 200px;  margin-left: 120px;">
		<div style="width: 300px; margin-left: 97px;">
			<span id="duplMsg_nick" style="position: relative; width: 300px; top: 10px; right: 100px; margin-left: 130px; margin-bottom: -10px;"></span>
		</div>
	</div>
		<button type="button" class="col-xs-2" id="btnDuplicate_nick" style="margin-left: 110px; width: 120px; height: 33.99px; background: #FF792A; color: white; border: 0; border-radius: 5px;"><b>중복 검사</b></button>
</div>

<div class="form-group">
	<label for="name" class="control-label col-xs-2">이름</label><br><br>
	<div class="col-xs-8" style="width: 250px;">
		<input type="text" id="name" name="name" class="form-control" style="width: 200px;  margin-left: 120px;">	
	</div>
</div>	

<div class="form-group">
	<label for="email" class="control-label col-xs-2">이메일</label><br><br>
	<div class="col-xs-10" style="margin-right: 10px;">
		<input type="text" id="email" name="email" class="form-control" style="width: 346px;  margin-left: 120px;">
		<div style="width: 300px; margin-left: 97px; display: inline-block;">
			<span id="duplMsg_email" style="position: relative; width: 0px; top: 12px; right: 99px; margin-left: 130px; margin-bottom: -10px;"></span>
		</div>
	</div>
		<button type="button" class="col-xs-2" id="btnDuplicate_email" style="display: inline-block; position:relative; right: 480px; width: 120px; height: 33.99px; background: #FF792A; color: white; border: 0; border-radius: 5px;"><b>중복 검사</b></button>
</div>	

<div class="form-group">
	<label for="phone" class="control-label col-xs-2" style="margin-left: 13px;">전화번호</label><br><br>
	<div class="col-xs-10">
		<input type="text" id="phone" name="phone" class="form-control" style="width: 346px;  margin-left: 120px;">
	</div>
</div>	

<div class="form-group">
	<label for="addr1" class="control-label col-xs-2" style="margin-left: 13px;">주소1</label><br><br>
	<div class="col-xs-10">
		<input type="text" id="addr1" name="addr1" class="form-control" style="width: 346px;  margin-left: 120px;">
	</div>
</div>	

<div class="form-group">
	<label for="addr2" class="control-label col-xs-2" style="margin-left: 13px;">주소2</label><br><br>
	<div class="col-xs-10">
		<input type="text" id="addr2" name="addr2" class="form-control" style="width: 346px;  margin-left: 120px;">
	</div>
</div>

<div class="form-group">
	<label for="addr3" class="control-label col-xs-2" style="margin-left: 13px;">주소3</label><br><br>
	<div class="col-xs-10">
		<input type="text" id="addr3" name="addr3" class="form-control" style="width: 346px;  margin-left: 120px;">
	</div>
</div>

<br>

<div class="form-group">
	<div class="col-sm-offset-5">
		<button class="btn btn-primary">회원 가입</button>
		<input type="reset" id="cancel" class="btn btn-danger" value="취소" />
	</div>	
</div>

</form>
</div>

</div><!-- .container end -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />


