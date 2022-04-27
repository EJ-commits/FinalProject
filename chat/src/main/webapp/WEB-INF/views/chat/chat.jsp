<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>


<script type="text/javascript">

$(document).ready(function(){
	
	//const username = ${sessionScope.testuser}

	var username ="${testuser}"
	console.log(username)
	var msg = $("#messages");
	console.log(msg.val())
	
	//const는 let과 다르게 재할당 불가 
	
	 	if(username==null){
		alart('로그인되지 않았습니다')	
		
		}
	
	
	 	/* 
        $("#disconn").on("click", (e) => {
            disconnect();
        })
        
	 	  $("#disconn").on(click,(e) => {
	    	 disconnect();
		});
	 	
	 	*/
	 	
		 $("#sendButton").click(send)
		 $("#disconn").click(onClose)
		 			
		
		// 클라이언트 소켓 만들기
		const websocket = new WebSocket("ws://localhost:8088/ws/chat");
	 	console.log("웹소켓 호출")
		//소켓 동작별로 호출되는 함수들 정의
		websocket.onmessage  = onMessage;
		websocket.onopen  = onOpen;
		websocket.onclose = onClose;
	//	webSocket.onerror = onError;
		
		//메시지 보내기
		console.log(msg)
	 	function send(){
			msg = $("#messages")
			console.log("messages" + msg)
			websocket.send(username + ":" + msg.val());
			msg.val('') //초기화
		}
	 	
		//입장
		function onOpen(e){
			console.log("onOpen()")
			var entmsg = username + "입장"
			websocket.send(entmsg);
		}
		
		//퇴장
		function onClose(e){
			console.log("onClose()")
			var exitmsg = username + "퇴장"
			websocket.send(exitmsg);
			window.location.replace("/chat/enter")
		}
		
		 function onError(e){
			console.log("onError()")
			alart('에러가 발생하였습니다')
			history.go(-1)
		} 
		
		
		//채팅창 줄 구분
		function writeResponse(text){
			messeges.innerHTML += "<br/>"+text;
		}
				
		//접속자와 다른 접속자 구별 
		function onMessage(e){
			var data = e.data;
			var sessionId = null; // 소켓에 접속한 사람, 메시지를 보내는 사람 
			var message = null;
			var arr = data.split(":");
			
			sessionId = arr[0];
			message = arr[1];
			
			//나(로그인한 사람)
			var cur_session = username;
			//화면 출력을 다르게 함 
			if(sessionId = username){
			var str = $("<div>").html(sessionId + " : " + message)
			$("#msgArea").append(str);	$("<div>") // 태그객체 
			}else{
			var str = $("<div>").html(sessionId + " : " + message)
			$("#msgArea").append( str );	
			}		
		
	 	
		}
})

</script>



<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<button type="button" id="disconn" >대화방 나가기</button>
<div class="container">

<label>채팅방</label>

<div id="msgArea"></div>
<div>
<input type="text" id="messages" placeholder="메시지를 입력하세요.">
<button type="button" id="sendButton">전송</button>
</div>
</div>


</body>
</html>