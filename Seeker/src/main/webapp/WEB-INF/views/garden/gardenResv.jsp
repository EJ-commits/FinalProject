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
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<head>

<script type="text/javascript">
	$.ajax({
		url:"/garden/getGardenList",
		type: "get",
		data:{},
		dataType: "json",
		success: function(map){
			console.log(map.gardenList)
			
		},
		error: function(){
			console.log("error")
		}
	})

	
</script>



<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

${gardenList}

${test}

<%-- <c:forEach var="i" items="${gardenList} "> --%>
<%-- </c:forEach> --%>
예매하기 


	<div class="btn-group-vertical">
		<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
		 
		 <div class="parkchoice"></div>
		 
		  <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked>
		  <label class="btn btn-outline-primary" for="btnradio1">서울수목원</label>
			 
	
	</div>
</div>


</body>
</html>