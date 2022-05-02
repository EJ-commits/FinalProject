<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<c:import url ="../../layout/header.jsp" ></c:import>

<style>
#container_box table {width: 900px;}
#container_box table th {font-size: 20px; font-weight: bold;
							text-align: center; padding: 10px; border-bottom: 2px solid #666;}
#container_box table tr:hover {background: #eee;}
#container_box table td { padding: 10px; text-align: center; }
#container_box table img {width: 150px; height: auto;}

 ul { padding:0; margin:0; list-style:none;  }

 div#root { width:90%; margin:0 auto; }
 
 
 nav#nav { padding:10px; text-align:right; }
 nav#nav ul li { display:inline-block; margin-left:10px; }

/*  section#container { padding:20px 0; border-top:2px solid #eee; border-bottom:2px solid #eee; }
 section#container::after { content:""; display:block; clear:both; } */
 aside { float:left; width:200px; }
/*  div#container_box { float:right; width:calc(100% - 200px - 20px); } */
 
 aside ul li { text-align:center; margin-bottom:10px; }
 aside ul li a { display:block; width:100%; padding:10px 0;}
 aside ul li a:hover { background:#eee; }
 

</style>


<div id="wrap-box-top">
	<div><a href="/diary/list"><span class="glyphicon glyphicon-arrow-left"></span>&nbsp;이전 페이지</a></div>
	<div id="title-box">제목</div>
	<div></div>
</div>
<div id="wrap-box">
<section id="container">

	<aside>
		<c:import url ="../../layout/aside.jsp" ></c:import>
	</aside>
	<div id="container_box" class="text-center">
	
		<table>
		
 			<thead>
  				<tr>
   				<th>썸네일</th>
   				<th>번호</th>
   				<th>이름</th>
   				<th>카테고리</th>
   				<th>가격</th>
   				<th>수량</th>
   				<th>등록날짜</th>
  				</tr>
  				
 			</thead>
 			<tbody>	
  			<c:forEach items="${list}" var="list">
  			
  				<tr>
   				<td>
   					<c:if test="${not empty list }">
					<img src="<%=request.getContextPath() %>/upload/${list.imgStoredName }" 
			 			alt="그림을 불러오지못함" ><br>
					<a href="<%=request.getContextPath() %>/upload/${list.imgStoredName }"
			 			download="${list.imgOriginName }" >
					<%-- ${list.imgOriginName } --%>
					</a>
					</c:if>
   				</td>
   				<td>${list.gdsNum }</td>
   				<td>
   					<a href="/admin/goods/view?n=${list.gdsNum}">${list.gdsName}</a>
   				</td>
   				<td>${list.cateName}</td>
   				<td>
   					<fmt:formatNumber value="${list.gdsPrice}" pattern="###,###,###"/>
   				</td>
   				<td>${list.gdsStock}</td>
   				<td>
   					<fmt:formatDate value="${list.gdsDate}" pattern="yyyy-MM-dd" />
   				</td>
  				</tr>   
  			</c:forEach>
 			</tbody>
 			
		</table>
		
	</div>


</section>
</div>

<%-- <c:import url ="../../layout/footer.jsp" ></c:import> --%>