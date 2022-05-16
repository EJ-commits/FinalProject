<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">

<!-- SOCKJS -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.0/sockjs.min.js"></script>
<!-- STOMP -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
*{
 	font-family :'Do Hyeon', sans-serif; 
 	font-size : 18px;
}

body {
	width : 1200px;
	margin : auto;
}

#header {
	width : 1200px;
	height :130px;
}

#header d{
	height : 100px;
}

#header-box {
	display : inline-flex;
	width : 1200px;
	margin : 0px 0px 0px 0px;
	border-bottom : 2px solid black;
}

#header-logo-box {
	display : inline-flex;
}

.header-lmg-box {
	width : 70px;
	height : 90px;
	padding : 40px 0px 10px 0px;
}

.header-img {
	width : 70px;
	height : 40px;
}

#header-logo {
	width : 150px;
	height : 90px;
	padding : 35px 0px 0px 0px;
	text-align : center;
}

#header-logo h2{
	font-size : 50px;
	margin : 0px 0px 0px 0px;
}

#header-logo-black{
	width : 290px;
	height : 9px;
	background-color : black;
}

#header-logo-con:hover {
	cursor : pointer;
}

.header-menu-box {
	width : 130px;
	padding : 53px 0px 0px 0px;
	text-align : right;
}

.header-menu-box > a:hover{
	text-decoration-line : none;
	color : black;
}

.header-menu-box > a{
	font-size : 30px;
	color : #688331;
}

.dropdown > span {
	font-size : 30px;
	color : #688331;
}

.dropdown > span:hover{
	color : black;
}

.dropdown > ul {
	color : black;
}

#header-chat-box {
	width : 130px;
	padding : 8px 0px 0px 0px;
	text-align : right;
}

#header-chat-box > a:hover{
	text-decoration-line : none;
	color : black;
}

#header-chat-box > a{
	font-size : 30px;
	color : #688331;
}

#header-login-box {
	width : 130px;
	padding : 20px 0px 0px 0px;
	text-align : right;
}

#header-login-box > a{
	margin : 0px 0px 0px 5px;
}

#header-login-box > a:hover {
	text-decoration-line : none;
	color : black;
}

.header-menu-text-sm {
	font-size : 20px;
}

.header-menu-text-xs {
	font-size : 17px;
}

#hidden-menu-box {
	width : 1200px;
	height : 25px;
	margin : 0px 0px 5px 0px;
}

#hidden-menu-board {
	display : none;
	margin: 0px 0px 0px 430px;
}

#hidden-menu-board > a:hover {
	text-decoration-line : none;
}

#hidden-menu-board > a > span:hover {
	text-decoration-line : none;
	color : black;
}

#hidden-menu-board > a > span {
	margin : 0px 10px 0px 0px;
	padding : 5px 0px 0px 0px;
	color : #688331;
	font-size : 20px;
}

#wrap-con {
	width : 1200px;
	margin : auto;
	position : relative;
}
#wrap-con::after {
	content : "";
	position : absolute;
	left : 0;
	top : 0;
	width : 100%;
	height : 100%;
	background-color: #ECF8E0;
	background-size : 100%; z-index : -1;
	opacity : 0.3;
}

#wrap-box-top {
	display : inline-flex;
	height : 30px;
	font-size : 20px;
	margin : 0px 0px 10px 0px;
	border-top : 1px solid black;
	border-bottom : 1px solid black;
}

#wrap-box-top > div {
	width : 390px;
	height : 30px;
	margin : 0px 5px 0px 5px;
	padding : 4px 0px 0px 0px;
}

#title-box {
	text-align : center;
}

#wrap-box-bottom {
	height : 30px;
	font-size : 20px;
	margin : 10px 0px 0px 0px;
	padding : 0px 0px 0px 0px;
	border-bottom : 1px solid black;
}

#wrap-box {
	width :1100px;
	margin : auto;
	padding : 0px 50px 0px 50px;
	text-align : center;
}

.dp48 {
	margin : 6px 0px 0px 0px;
}



/* 여기부터 화상통화===================================== */
#video-call-div {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    display: none;
}

#local-video {
    position: absolute;
    top: 0;
    left: 0;
    margin: 16px;
    border-radius: 16px;
    max-width: 20%;
    max-height: 20%;
    background: #ffffff;
}

#remote-video {
    background: #000000;
    width: 100%;
    height: 100%;
}

.call-action-div {
    position: absolute;
    left: 45%;
    bottom: 32px;
}

button {
    cursor: pointer;
}

#video_modal {
    display: none;
    width: 600px;
    height:600px;
    padding: 20px 60px;
    background-color: #fefefe;
    border: 1px solid #888;
    border-radius: 3px;
    overflow:scroll;
}
/* 여기까지 화상통화===================================== */
</style>


<script type="text/javascript">
var testuser = 'testuser' // ${ session.userid }

$(document).ready(function(){
	var username = testuser
	
	//클라이언트 소켓 만들기 
	var sockJS = new SockJS("/notice")
	var stomp = Stomp.over(sockJS);
	
	stomp.connect({},function(){
		stomp.subscribe("/sub/notice"+username, function(notice){
		
		var alArray = JSON.parse(notice.body)	
		
		stomp.disconnect();
		
		$(".dropdown").eq(0).find("#alarm1").html(alArray[0])
		$(".dropdown").eq(0).find("#alarm2").html(alArray[1])
		$(".dropdown").eq(0).find("#alarm3").html(alArray[2])
		
		})
		
	$.ajax({
		url: "/notice",
		type: "get",
		asnyc: false,
		data: {username:testuser},
// 		dataType:"JSON"
	})
	
  })
})



//----------------------------------여기부터 화상통화--------------------------------------

var receiverId;
let myId = '${sessionScope.id }';

var eventData
var webSocket

webSocket = new WebSocket("ws://localhost:8088/videows/video")


webSocket.onmessage = (event) => {
    eventData = JSON.parse(event.data);
    receiverId = eventData.senderId;

	console.log(JSON.parse(event.data))
	
	//통화요청 알림
    let $socketAlert = $('div#socketAlert');
    $socketAlert.text(eventData.senderId+"님의 화상통화 요청");
    $socketAlert.css('display', 'block');
    
    handleSignallingData(JSON.parse(event.data))
    
}
	

function handleSignallingData(data) {
    switch (data.type) {
        case "send_answer":
        	console.log("---send_answer---")
            peerConn.setRemoteDescription(data.answer)
        	console.log("---send_answer---")
            break;
        case "candidate":
        	console.log("---candidate---")
            peerConn.addIceCandidate(data.candidate)
        	console.log("---candidate---")
    }
}

function sendData(data) {
    webSocket.send(JSON.stringify(data))
}

let localStream
let peerConn
function startCall() {
 	var	videoModal = "<div id='video-call-div'><video muted id='local-video' autoplay></video>"
		videoModal += "<video id='remote-video' autoplay></video><div class='call-action-div'>"
		videoModal += "<button onclick='muteVideo()'>화면 끄기</button>"
		videoModal += "<button onclick='muteAudio()'>오디오 끄기</button>"
		videoModal += "<button class='modal_close_btn'>나가기</button></div></div>"
		
    $("#video_modal").html(videoModal);
	modalStart('video_modal');
		
    document.getElementById("video-call-div").style.display = "inline"

//     navigator.getUserMedia({
//         video: {
//             frameRate: 24,
//             width: {
//                 min: 480, ideal: 720, max: 1280
//             },
//             aspectRatio: 1.33333
//         },
//         audio: true
//     }, (stream) => {
//         localStream = stream
//         document.getElementById("local-video").srcObject = localStream

//         let configuration = {
//             iceServers: [
//                 {
//                     "urls": ["stun:stun.l.google.com:19302", 
//                     "stun:stun1.l.google.com:19302", 
//                     "stun:stun2.l.google.com:19302"]
//                 }
//             ]
//         }

//         peerConn = new RTCPeerConnection(configuration)
//         peerConn.addStream(localStream)

//         peerConn.onaddstream = (e) => {
//             document.getElementById("remote-video").srcObject = e.stream
//         }

//         peerConn.onicecandidate = ((e) => {
//             if (e.candidate == null)
//                 return;
//             sendData({
//             	receiverId: receiverId,
//             	senderId: myId,
//                 type: "store_candidate",
//                 candidate: e.candidate
//             })
//         })

//         createAndSendOffer()
//     }, (error) => {
//         console.log(error);
//     })

		const constraints = {
		    'video': true,
		    'audio': true
		}
		navigator.mediaDevices.getUserMedia(constraints)
		    .then(stream => {
		        console.log('Got MediaStream:', stream);
		 	    localStream = stream
		 	    document.getElementById("local-video").srcObject = localStream
		        
		     let configuration = {
		     iceServers: [
		         {
		             "urls": ["stun:stun.l.google.com:19302", 
		             "stun:stun1.l.google.com:19302", 
		             "stun:stun2.l.google.com:19302"]
		         }
		     ]
		 }
		
		 peerConn = new RTCPeerConnection(configuration)
		 peerConn.addStream(localStream)
		
		 peerConn.onaddstream = (e) => {
		     document.getElementById("remote-video").srcObject = e.stream
		 }
		
		 peerConn.onicecandidate = ((e) => {
		     if (e.candidate == null)
		         return;
		     sendData({
		     	receiverId: receiverId,
		     	senderId: myId,
		         type: "store_candidate",
		         candidate: e.candidate
		     })
		 })
		
		 createAndSendOffer()
		 	    
		})
		.catch(error => {
		    console.error('Error accessing media devices.', error);
		});
    
};   
    

function createAndSendOffer() {
    peerConn.createOffer((offer) => {
        sendData({
        	receiverId: receiverId,
        	senderId: myId,
            type: "store_offer",
            offer: offer
        })

        peerConn.setLocalDescription(offer)
    }, (error) => {
        console.log(error)
    })
};

let isAudio = true
function muteAudio() {
    isAudio = !isAudio
    localStream.getAudioTracks()[0].enabled = isAudio
}

let isVideo = true
function muteVideo() {
    isVideo = !isVideo
    localStream.getVideoTracks()[0].enabled = isVideo
};



var modal
var bg
function modalStart(id) {
    var zIndex = 9999;
    modal = document.getElementById(id);

    // 모달 div 뒤에 희끄무레한 레이어
    bg = document.createElement('div');
    bg.setStyle({
        position: 'fixed',
        zIndex: zIndex,
        left: '0px',
        top: '0px',
        width: '100%',
        height: '100%',
        overflow: 'auto',
        // 레이어 색갈은 여기서 바꾸면 됨
        backgroundColor: 'rgba(0,0,0,0.4)'
    });
    document.body.append(bg);

    // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
    modal.querySelector('.modal_close_btn').addEventListener('click', function() {
    	bg.remove();
        modal.style.display = 'none';
        $('#socketAlert').css('display', 'none');
    });

    modal.setStyle({
        position: 'fixed',
        display: 'block',
        boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

        // 시꺼먼 레이어 보다 한칸 위에 보이기
        zIndex: zIndex + 1,

        // div center 정렬
        top: '50%',
        left: '50%',
        transform: 'translate(-50%, -50%)',
        msTransform: 'translate(-50%, -50%)',
        webkitTransform: 'translate(-50%, -50%)'
//	        overflow:'hidden'
    });
}

// Element 에 style 한번에 오브젝트로 설정하는 함수 추가
Element.prototype.setStyle = function(styles) {
    for (var k in styles) this.style[k] = styles[k];
    return this;
};

function okCall(){

	if (confirm("영상통화를 시작하시겠습니까?") == true){    //확인

		startCall()

	}else{   //취소
		$('#socketAlert').css('display', 'none');
		sendData({
        	receiverId: receiverId,
        	senderId: myId,
            type: "cancle"
        })
	    return;

	}

}

//----------------------------------여기부터 화상통화--------------------------------------
</script>
</head>

<body>

<!-- ===========화상통화 알림창============ -->
<div id="socketAlert" class="alert alert-success" role="alert" style="display:none;" onClick="okCall()"></div>

<div>
	<span id="video_modal"></span>
</div>
<!-- ===========화상통화 알림창============ -->

<header id="header">
	<div id="header-box">
		<div id="header-logo-con" onClick="location.href='/'">
			<div id="header-logo-box">
				<div class="header-lmg-box">
					<img class="header-img" src="/resources/img/headerleft.png">
				</div>
				<div id="header-logo">
					<h2>Seeker</h2>
				</div>
				<div class="header-lmg-box">
					<img class="header-img" src="/resources/img/headerright.png">
				</div>
			</div>
			<div id="header-logo-black">
			</div>
		</div>
		<div id="header-center"></div>
		<div class="header-menu-box">
			<a href="/myplant/list">나의 식물</a>
		</div>
		<div class="header-menu-box" id="menu-box-board">
			<a id="menu-board">게시판</a>
		</div>	
		<div class="header-menu-box">
			<a href="/garden/gardenMap">수목원</a>
		</div>
		<div class="header-menu-box">
			<a href="/shop/home">스토어</a>
		</div>
		<div class="header-menu-box dropdown" >
			<span class="dropdown-toggle" data-toggle="dropdown" role="button" style="cursor:pointer;">
			<i class="material-icons dp48">alarm_on</i>
			<span class="header-menu-text-sm">알람</span> 
			</span>
			<ul class="dropdown-menu" role="menu" >
			    <li class="dropdown-header">Nav header</li>
				<li><div class="dropdown-item" id="alarm1" ></div></li>
				<li><div class="dropdown-item" id="alarm2" ></div></li>
				<li><div class="dropdown-item" id="alarm3" ></div></li>
			    <li class="divider"></li>
			</ul>
		</div>
		<div class="header-menu-box">
			<a href="" >
				<i class="material-icons dp48">shopping_cart</i>
				<span class="header-menu-text-sm">장바구니</span>
			</a>
		</div>	
		<div>
			<div id="header-login-box">
				<c:choose>
					<c:when test="${empty login }">
						<a href="/member/login"><span class="header-menu-text-xs">로그인</span></a>
					</c:when>
					<c:when test="${login eq true }">
						<a href="/member/logout"><span class="header-menu-text-xs">로그아웃</span></a>
					</c:when>
				</c:choose>
				<a href="/member/join"><span class="header-menu-text-xs">회원가입</span></a>
			</div>
			<div id="header-chat-box">
			<a href="/chat/rooms" >
			<i class="material-icons dp48">chat_bubble</i>
			<span class="header-menu-text-sm">오픈채팅</span>
			</a>
			</div>
		</div>
	</div>
	<div id="hidden-menu-box">
		<div id="hidden-menu-board">
			<a href=""><span>자유 게시판</span></a>
			<a href=""><span>사진 게시판</span></a>
		</div>
	</div>
</header>
<div id='wrap-con'>