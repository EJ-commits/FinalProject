<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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

예약일시: 
<c:out value = "${fn: substring(resInfo.visitDate,0,10)} "/>

<c:if test = "${ resInfo.visitTime eq 'morning'}">
오전 </c:if>
<c:if test = "${ resInfo.visitTime eq 'afternoon'}">
오후 </c:if>
<c:if test = "${ resInfo.visitTime eq 'night'}">
야간 </c:if>
<br>
예약인원: 성인 ${ resInfo.adultMem} 명, 유아 ${ resInfo.childMem} 명, 우대 ${ resInfo.disabMem} 명<br>
지불예정금액: <fmt:formatNumber type="number" pattern="0" value="${ resInfo.totalPrice}"/> 원 <br>
 <br><br>
매표소에서 이 페이지 또는 아래의 QR 코드를 제시하세요.
<br><br><br><br>

	
정보가 다를 경우 관리자에게 문의하세요. 

</body>
</html>