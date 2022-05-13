<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<!DOCTYPE html>
<html>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/css/calender.css">
<link rel="stylesheet" href="/resources/css/custom-scrollbar.css">
<link rel="stylesheet" href="/resources/js/custom-scrollbar.js">
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>

<head>

<style type="text/css">
.select {
    padding: 15px 10px;
}
.select input[type=radio]{
    display: none;
}
.select input[type=radio]+label{
    display: inline-block;
    cursor: pointer;
    height: 24px;
    width: 90px;
    border: 1px solid #333;
    line-height: 24px;
    text-align: center;
    font-weight:bold;
    font-size:13px;
}
.select input[type=radio]+label{
    background-color: #fff;
    color: #333;
}
.select input[type=radio]:checked+label{
    background-color: #333;
    color: #fff;
}

 #ampm #relDetail{
 	overflow: hidden;
    -webkit-text-size-adjust: 100%;
    letter-spacing: 0;
    line-height: 1.5;
    font-size: 15px;
    color: #444;
    font-weight: 400;
    box-sizing: border-box;
    float: left;
    width: 33%;
    padding: 0 20px 17px 20px;
    border-right: 1px solid #d8d9db;
}    
 .container { height:600px; max-height: 600px;}
 #gardenList {float: left}
 #ampm {float: left ; position: relative; }
 #relDetail { position: relative;}
 
    </style>
    
    

<script type="text/javascript">

 $(document).ready(function() {

	$( function() {
	    $( "#datepicker" ).datepicker();
	  } );

	  
//   	$("#calcBtn").click(function(){
// 		var formValues = $("#totalThey").serialize();
// 	  	console.log("calcBtn click");

//   	 	console.log("formValues",formValues)
// 		$.ajax({
// 		  		url:"/garden/reserveCalc",
// 		  		type: "post",
// 		  		data: formValues,
// 		  		dataType: "json",
// 		  		success: function(res){
// 		  			console.log("calcBtn success")
// 		  			console.log(res)
// 		  			$("#totalPrice").html(res.Info.totalPrice)
// 		  		},
// 		  		error: console.log("calcBtn error")
//   		})
  		
// 	})
 
 
 // DB 연동하여 수목원 리스트 표시 
	$.ajax({
		url:"/garden/getGardenList",
		type: "get",
		data:{},
		dataType: "json",
		success: function(res){
			console.log(res.gardenList.length)
			var str = "";
			for(var i=0; i<res.gardenList.length; i++){
	 			str += '<input type="radio" class="btn-check btn-block" name="gardenName" id="gardenName' 
 				str += i
 				str += '" value="'
 				str += res.gardenList[i]
 				str += '" autocomplete="off" checked>'
	 			str += '<label class="btn btn-secondary" style="width:100%; text-align:center" for="gardenName'
 				str += i
 				str += '">'
				str += res.gardenList[i]
				str += '</label><br>'
			}
				$("#parkChoice").html(str)
			
		},
		error: function(){
			console.log(" getGardenList error")
		}
	})

	
	//인원조정 버튼 클릭시
	
// 	$("#container input[type='button'], #container input[type='radio']")
	$("#container").find("input[type='button'], input[type='radio']").click(function() {
		var formValues = $("#totalThey").serialize();
	  	console.log("relDetail click");

  	 	console.log("formValues",formValues)
		$.ajax({
		  		url:"/garden/reserveCalc",
		  		type: "post",
		  		data: formValues,
// 		  		dataType: "json",
		  		success: function(res){
		  			console.log("calcBtn success")
		  			console.log(res)
		  			$("#totalPrice").html(res.totalPrice)
		  		},
		  		error: console.log("calcBtn error")
  		})
	})

 //예약하기 버튼을 누르면 예약정보를 DB에 저장, 동시에 예약 결과 화면으로 이동한다. 
 	$("#goToRes").click(function(){
	  	console.log("goToRes click");
 		var formValues = $("#totalThey").serialize();

  	 	console.log("formValues",formValues)
		$.ajax({
		  		url:"/garden/saveReserve",
		  		type: "post",
		  		data: formValues,
		  		dataType: "json",
		  		success: function(res){
		  			console.log("calcBtn success")
		  		},
		  		error: console.log("calcBtn error")
  		})
 	})
 
 
 }) //document.ready end
 
 
 
  	function adultCount(type)  {
	  let number = $("#adultTotal").text();
	  if(type === 'plus') {
	    number = parseInt(number) + 1;
	  }else if(type === 'minus')  {
	    number = parseInt(number) - 1;
	  }
	  if(number > 0){
	  	$("#adultTotal").text(number);
		$("#adult").attr('value',number)}
	  else {
		$("#adultTotal").text(0); 
		$("#adult").attr('value','0')}
 }
 
	function childCount(type)  {
		  let number = $("#childTotal").text();
		  if(type === 'plus') {
		    number = parseInt(number) + 1;
		  }else if(type === 'minus')  {
		    number = parseInt(number) - 1;
		  }
		  if(number > 0){
		  	$("#childTotal").text(number);
			$("#child").attr('value',number)}
		  else{
			$("#childTotal").text(0);  
			$("#child").attr('value','0')}
		}
	 
  	function disabCount(type)  {
  	  let number = $("#disabTotal").text();
  	  if(type === 'plus') {
  	    number = parseInt(number) + 1;
  	  }else if(type === 'minus')  {
  	    number = parseInt(number) - 1;
  	  }
  	  if(number > 0){
  	  	$("#disabTotal").text(number);
		$("#disability").attr('value',number)}
  	  else{
  		$("#disabTotal").text(0);  
		$("#disability").attr('value','0')}
  	}
   
 
	

</script>


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<form name="totalThey" id="totalThey">
	<div id="container" class="container modern-skin">
	   <div id="gardenList" style=" width:33%; " >
		  <div class="btn-group" role="group" aria-label="Basic radio toggle button group" style=" overflow: auto; width: 100%;">
			 <div id="parkChoice" style=" height: 600px; " > </div>
			 
		</div>
	   </div>
		   
	  <div id="dateCon"  style=" width:33%; height:100%; float: left">
		<div id="resDate" style="height: 50%; width: 100%;float: left ">
			<input type="text" name="datepicker" id="datepicker" style="width:100%">
		</div>
		<div id="ampm" style=" height: 50%; width: 100%">
			<input type="radio" class="btn-check" name="time" id="morning" value="morning" autocomplete="off" checked>
			<label class="btn btn-outline-primary" for="morning" style="width: 100%">오전
			</label><br>
			<input type="radio" class="btn-check" name="time" id="afternoon" value="afternoon" autocomplete="off" checked>
			<label class="btn btn-outline-primary" for="afternoon" style="width: 100%">오후
			</label><br>
			<input type="radio" class="btn-check" name="time" id="night" value="night" autocomplete="off" checked>
			<label class="btn btn-outline-primary" for="night" style="width: 100%">야간
			</label>
		</div>
	  </div> 
		
		<div id="relDetail" style=" width:33%;  float: left ">
			몇명?
			
			어른
			<input type='button' onclick='adultCount("plus")' value='+'/>
			<input type='button' onclick='adultCount("minus")' value='-'/>
			<div id='adultTotal'>0</div>
			<input type="hidden" name="adult" id="adult" value="0">
			
			소아
			<input type='button' onclick='childCount("plus")' value='+'/>
			<input type='button' onclick='childCount("minus")' value='-'/>
			<div id='childTotal'>0</div>
			<input type="hidden" name="child" id="child" value="0">
			
			
			우대
			<input type='button' onclick='disabCount("plus")' value='+'/>
			<input type='button' onclick='disabCount("minus")' value='-'/>
			<div id='disabTotal'>0</div>
			<input type="hidden" name="others" id="disability" value="0">
			
		</div>
	</div>
	

</form>


총합
<div id="totalPrice"></div>
<button id="goToRes"> 예약하기 </button>






<form action="/garden/reserveRes">
<input type="hidden">
</form> 
</body>
</html>