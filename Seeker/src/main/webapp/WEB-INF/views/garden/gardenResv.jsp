<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<!DOCTYPE html>
<html>

 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
 <link rel="stylesheet" href="/resources/css/calender.css">
 <link rel="stylesheet" href="/resources/css/custom-scrollbar.css">
 <link rel="stylesheet" href="/resources/js/custom-scrollbar.js">
 <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
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
	$.ajax({
		url:"/garden/getGardenList",
		type: "get",
		data:{},
		dataType: "json",
		success: function(res){
			console.log(res.gardenList.length)
				 
			var str = "";
			for(var i=0; i<res.gardenList.length; i++){
// 	 			str += '<input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked>'
	 			str += '<input type="radio" class="btn-check btn-block" name="btnradio" id="btnradio' 
 				str += i
 				str += '" autocomplete="off" checked>'
	 			str += '<label class="btn btn-secondary" style="width:100%; text-align:center" for="btnradio'
 				str += i
 				str += '">'
				str += res.gardenList[i]
				str += '</label><br>'
			}
// 				console.log(str)
				$("#parkChoice").html(str)
			
		},
		error: function(){
			console.log("error")
		}
	})

	
	
	$(document).ready(function() {
	  $(".container").customScrollbar();
	});
	
	$( function() {
	    $( "#datepicker" ).datepicker();
	  } );
</script>




<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


예매하기 
<div class="container modern-skin">
   <div id="gardenList" style=" width:33%" >
	  <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
		<ul>
		<li>
		 <div id="parkChoice"> </div>
		</li>	
		</ul>	 
	</div>
   </div>
	   
  <div id="dateContainer"  style=" width:33%; height:100%; float: left">
	<div id="date" style="height: 50%; width: 100%;float: left ">
		<input type="text" id="datepicker" style="width:100%">
	</div>
	<div id="ampm" style=" height: 50%; width: 100%">
		<input type="radio" class="btn-check" name="morning" id="morning" autocomplete="off" checked>
		<label class="btn btn-outline-primary" for="morning" style="width: 100%">오전
		</label><br>
		<input type="radio" class="btn-check" name="afternoon" id="afternoon" autocomplete="off" checked>
		<label class="btn btn-outline-primary" for="afternoon" style="width: 100%">오후
		</label><br>
		<input type="radio" class="btn-check" name="night" id="night" autocomplete="off" checked>
		<label class="btn btn-outline-primary" for="night" style="width: 100%">야간
		</label>
	</div>
  </div> 
	
	<div id="relDetail" style=" width:33%;  float: left ">
		<input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked>'
		<label class="btn btn-outline-primary" for="btnradio1" style="width: 100%">몇명?
		</label><br>
	</div>
</div>

</body>
</html>