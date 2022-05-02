<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<html>
<script type="text/javascript"> 
 $(document).ready(function(){



  $("createBtn").on("click", function (e){

      var roomName =$("#roomName").val();
      console.log(roomName);

      if(roomName == "")
          alert("Please write the name.")
      else
          $("form").submit();
      

  if(roomName != null)
      alert(roomName + "방이 개설되었습니다.");
  });

 });
</script>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach items="${list }" var="room" >
room : ${room.roomName}
 <li><a href="/chat/room?roomId=${room.roomId}">${room.roomName}</a></li>
</c:forEach>
   <form action="/chat/room" method="post">
            <input type="text" name="roomName">
            <button name="createBtn">개설</button>
</body>
</html>