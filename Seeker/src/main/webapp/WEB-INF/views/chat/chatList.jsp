<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){

    var roomName = ${roomName};

    if(roomName != null)
      alert( roomName.name+ "방이 개설되었습니다.");

    $(".btn-create").on("click", function (e){
      e.preventDefault();

      var name = $("input[name='name']").val();

      if(name == "")
        alert("Please write the name.")
      else
        $("form").submit();
    });

  });
</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  room : ${list}
        <li><a th:href="/chat/room/roomId?=${room.roomId}">[[${room.name}]]</a></li>
  <form action="/chat/room" method="post">
    <input type="text" name="name" class="form-control">
    <button class="btn btn-secondary">개설하기</button>
  </form>
</body>
</html>