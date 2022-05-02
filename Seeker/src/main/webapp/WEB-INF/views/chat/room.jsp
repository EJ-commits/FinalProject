<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.0/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

<script type="text/javascript">

$(document).ready(function(){
	//웹소켓 설정을 위한 준비 작업 
	//const username = ${sessionScope.testuser}
	var username ="${testuser}"
	var namelength = username.length;
	console.log(username)
	var msg = $("#messages");
	console.log(msg.val())
	
 	if(username==null){
	alart('로그인되지 않았습니다')	
	}
	
	//-----------------------------------------
	// 클라이언트 소켓 만들기
// 	const websocket = new WebSocket("ws://localhost:8088/ws/chat ", null, {transports: ["websocket", "xhr-streaming", "xhr-polling"]}); 	
// 	const websocket = new WebSocket("ws://localhost:8088/chat");
	var sockJS = new SockJS("/chat")
	var stomp = Stomp.over(sockJS);
	

   var roomName = '${room.roomName}';
   var roomId = '${room.roomId}';
   
	stomp.connect({},function(){
		console.log("stomp 호출")
		//subscribe(path, callback)
		stomp.subscribe("/sub/chat/room"+roomId, function(chat){
			console.log(chat)
  		   var content = JSON.parse(chat.body)
			var chatLog = content.chatLog
			var writer = content.userid;
	 		var message = content.chatLog
			var str = writer + ":" + message 
			
			$("#msgArea").append(str);
			$("#msgArea").append("<br>");
			console.log("chat"+str)
		})//subscribe end
		
		//send(path, header, message)
		stomp.send('/pub/chat/enter', {}, 
				JSON.stringify({roomId: roomId, 
					userid: username,
					chatLog: '입장'
					}))
		
	})//connect end
	
// 	console.log("웹소켓 호출")
	//소켓 동작별로 호출되는 함수들 정의
// 	websocket.onmessage  = onMessage;
// 	websocket.onopen  = onOpen;
// 	websocket.onclose = onClose;
// 	websocket.onerror = onError;
		
	//메시지 보내기
 	function send(){
		msg = $("#messages")
		if(msg.val().length!=0){ // 입력되지 않으면 send하지 않음
		websocket.send(username + ":" + msg.val());
		}
		msg.val('') //초기화
	}
	 	
	//입장
	function onOpen(e){
		console.log("onOpen()")
	var entmsg = username + " 입장"
		websocket.send(entmsg);
	}
		
		//퇴장
	function onClose(e){
//		clearInterval(websocket.interval);
		console.log("onClose()")
		window.location.replace("/chat/rooms")
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
		
		//메시지 분할 과정
		var data = e.data;
		console.log(e.data)
		var sessionId = null; 
		var message = null;
		var msglength = data.length - namelength
		
		sessionId = data.substring(0,username);
		message = data.substring(namelength);
		
		//나(로그인한 사람)
		var cur_session = username;
		//화면 출력을 다르게 함  (아직 미구현)
		if(sessionId = username){
		var str = $("<div>").html(sessionId + message)
		$("#msgArea").append(str);	$("<div>") // 태그객체 
		}else{
		var str = $("<div>").html(sessionId + message)
		$("#msgArea").append( str );	
		}		
	
 	
	}
		
// 		----------------------
//DOM 요소들의 동작


	 $("#sendButton").click(function(e){
		 var msg = $("#messages")
		 console.log("messages "+msg)
         stomp.send('/pub/chat/enter', {}, 
 				JSON.stringify({roomId: roomId, 
 					userid: username,
 					chatLog: msg.val()
 					}))
         msg.value = '';
	 
	 })
	 
	  $("#disconn").click(function(){
		function pro1(){
			stomp.send('/pub/chat/exit', {}, 
					JSON.stringify({roomId: roomId, 
						userid: username,
						chatLog: '퇴장'
						}))
			console.log("here1")
		}
		
		function pro3() {
						console.log("here3")
						if (typeof window !== 'undefined') { alert('채팅을 종료합니다.') }
						onClose();	// 개발 위해 잠시 주석 처리
		}
		
		function pro2(){
			console.log("here2")
			
			 $.ajax({
					url: "/chat/logdown",
					type: "post",
					async: false,
					data: {userid:username}, //username은 위에서 선언한 var 
// 					dataType: "json",
	                success: function (data) {
	                    var blob = new Blob([data], { type: "application/octet-stream" });
	 					var fileName = "ChatLog.txt";
	 					
	                    var isIE = false || !!document.documentMode;
	                    if (isIE) {
	                        window.navigator.msSaveBlob(blob, fileName);
	                    } else {
	                        var url = window.URL || window.webkitURL;
	                        link = url.createObjectURL(blob);
	                        
	                        var a = $("<a />");
	                        a.attr("download", fileName);
	                        a.attr("href", link);
	                        
	                        $("body").append(a);
	                        a[0].click();
	                        a.remove();
	                    }
	                    pro3()
	                }
					,error:function(){
						console.log("저장실패")
						pro3();
					}
					 })
		}
			 
		if(!confirm("저장?")){ // 저장안함
			forcheckSaveDiv.click() 
		} else { // 저장함 
			pro1();
			pro2();
	    	onClose();
		}		
	 
	  })//disconn end
	
	  $("#forcheckSaveDiv").click(function(){
          		if (confirm("종료?")){ //종료함
     		    	onClose();
          		}
	  })	
	  
	$("#checkparts").click(function(){
		$.ajax({
			url:"/chat/participant",
			type:"post",
			data:{},
			dataType:"json",
			success:function(map){
			var participant = map["participant"]
			console.log("참여자명 "+participant);
			$("#participants").html(participant)
			},
			error:function(result){
			console.log("에러");
				$('#participants').val('error')
			}
		})
	})
	
	
})

</script>


<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<button type="button" id="disconn" >대화방 나가기</button>
<div class="container">

<label>채팅방 ${room.roomName}</label>

<div id="msgArea"></div>
<div>
<input type="text" id="messages" placeholder="메시지를 입력하세요.">
<button type="button" id="sendButton">전송</button>
<div id="forcheckSaveDiv"></div>

<button type="button" id="checkparts">참가자 확인</button>
<div id="participants">참여자 목록</div>
</div>
</body>
</html>