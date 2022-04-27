<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<c:import url ="../../layout/header.jsp" ></c:import>

<style>
#container_box table td { width:100px; }

 body { font-family:'맑은 고딕', verdana; padding:0; margin:0; }
 ul { padding:0; margin:0; list-style:none;  }

 div#root { width:90%; margin:0 auto; }
 
 header#header { font-size:60px; padding:20px 0; }
 header#header h1 a { color:#000; font-weight:bold; }
 
 nav#nav { padding:10px; text-align:right; }
 nav#nav ul li { display:inline-block; margin-left:10px; }

 section#container { padding:20px 0; border-top:2px solid #eee; border-bottom:2px solid #eee; }
 section#container::after { content:""; display:block; clear:both; }
 aside { float:left; width:200px; }
 div#container_box { float:right; width:calc(100% - 200px - 20px); }
 
 aside ul li { text-align:center; margin-bottom:10px; }
 aside ul li a { display:block; width:100%; padding:10px 0;}
 aside ul li a:hover { background:#eee; }
 
 footer#footer { background:#f9f9f9; padding:20px; }
 footer#footer ul li { display:inline-block; margin-right:10px; }

</style>



<section id="container">

	<aside>
		<c:import url ="../../layout/aside.jsp" ></c:import>
	</aside>
	<div id="container_box" class="text-center">
	
		<table>
		
 			<thead>
  				<tr>
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
   				<td>${list.gdsNum}</td>
   				<td>
   					<a href="/admin/goods/view?n=${list.gdsNum}">${list.gdsName}</a>
   				</td>
   				<td>
   					<fmt:formatNumber value="${list.cateCode}" pattern="###,###,###"/>
   				</td>
   				<td>${list.gdsPrice}</td>
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


<c:import url ="../../layout/footer.jsp" ></c:import>