<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<script type="text/javascript">
var testuser = 'testuser' // ${ session.userid }
</script>


<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="/chat/rooms" method="get">

<button>입장</button>
</form>

<form action="/chat/room11" method="post">
<button>입장</button>
</form>
</body>
</html>