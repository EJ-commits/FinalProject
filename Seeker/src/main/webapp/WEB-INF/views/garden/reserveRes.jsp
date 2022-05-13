<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<head>
<meta charset="UTF-8">

<script type="text/javascript">

</script>

<title>Insert title here</title>
</head>

<body>

${ nickname } 님은 ${ resinfo.gardenName} 에 예약되었습니다. 

예약일시: ${ resinfo.visitDate} 
<c:if test = "${ resinfo.visitTime} eq 'moring'">
오전
</c:if>
<c:if test = "${ resinfo.visitTime} eq 'afternoon'">
오후
</c:if>
<c:if test = "${ resinfo.visitTime} eq 'night'">
야간
</c:if>
예약인원: 성인 ${ resinfo.adultMem} 명, 유아 ${ resinfo.childMem} 명, 우대 ${ resinfo.disabMem} 명
지불예정금액: ${ resinfo.totalPrice} 원
 
입구에서 이 페이지 또는 아래의 QR 코드를 제시하세요.



정보가 다를 경우 관리자에게 문의하세요. 

</body>
</html>