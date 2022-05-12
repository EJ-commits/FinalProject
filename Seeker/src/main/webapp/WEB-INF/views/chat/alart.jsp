<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<!-- SOCKJS -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.0/sockjs.min.js"></script>
<!-- STOMP -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	var username = ${id}
	
	//클라이언트 소켓 만들기 
	var sockJS = new SockJS("/alart")
	var stomp = Stomp.over(sockJS);
	
	stomp.connect({},function(){
		stomp.subscribe("/sub/alart"+username, onAlarm)
		var content = onAlarm.body 
		stomp.disconnect();
		console.log("alarm websocket closed")
		$("#alarm1").append(content)
		}) // 유저네임으로 수용
		
		
		
	

})
</script>


<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


</body>
</html>