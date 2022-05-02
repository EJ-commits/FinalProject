<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<c:import url ="../../layout/header.jsp" ></c:import>

<style>
 ul { padding:0; margin:0; list-style:none;  }

 div#root { width:90%; margin:0 auto; }
 
 nav#nav { padding:10px; text-align:right; }
 nav#nav ul li { display:inline-block; margin-left:10px; }

 section#container { padding:20px 0; border-top:2px solid #eee; border-bottom:2px solid #eee; }
 section#container::after { content:""; display:block; clear:both; }
 aside { float:left; width:200px; }
 div#container_box { float:right; width:calc(100% - 200px - 20px); }
 
 aside ul li { text-align:center; margin-bottom:10px; }
 aside ul li a { display:block; width:100%; padding:10px 0;}
 aside ul li a:hover { background:#eee; }
 
 .inputArea { margin:10px 0; }
 select { width:100px; }
 label { display:inline-block; width:70px; padding:5px; }
 label[for='gdsDes'] { display:block; }
 input { width:150px; }
 textarea#gdsDes { width:400px; height:180px; }
 
 .oriImg { width: 200px; height: auto;}
 .thumbImg{}
 
</style>



<section id="container">

	<aside>
		<c:import url ="../../layout/aside.jsp" ></c:import>
	</aside>
	<div id="container_box">
		<h2>상품 상세보기</h2>

		<div class="inputArea"> 
 			<label>1차 분류</label>
 			<span class="category1"></span>        
 			<label>2차 분류</label>
 			<span class="category2">${goods.cateCode}</span>
		</div>

		<div class="inputArea">
 			<label for="gdsName">상품명</label>
 			<span>${goods.gdsName}</span>
		</div>

		<div class="inputArea">
 			<label for="gdsPrice">상품가격</label>
 			<span><fmt:formatNumber value="${goods.gdsPrice}" pattern="###,###,###"/></span>
		</div>

		<div class="inputArea">
 			<label for="gdsStock">상품수량</label>
 			<span>${goods.gdsStock}</span>
		</div>

		<div class="inputArea">
 			<label for="gdsDes">상품소개</label>
 			<span>${goods.gdsDes}</span>
		</div>
		
		<div class="inputArea">
 			<label for="gdsImg">이미지</label>
 			<p>원본 이미지</p>
 			
 			<!-- 첨부파일 -->
			<div>

		<!-- el은 첫번째 문자를 소문자로 해주면 에러가 나지않는다. ImgStoredName -> X, imgStoredName O -->
		<c:if test="${not empty goods }">
		<img src="<%=request.getContextPath() %>/upload/${goods.imgStoredName }" 
			 alt="그림을 불러오지못함" width="50%" height="50%" class="oriImg"><br>
		<a href="<%=request.getContextPath() %>/upload/${goods.imgStoredName }"
			 download="${goods.imgOriginName }" >
			${goods.imgOriginName }
		</a>
		</c:if>
		</div>
 
		</div>

		<div class="inputArea">
		 	<button type="button" id="list_Btn" class="btn btn-warning">목록</button>
		 	<button type="button" id="update_Btn" class="btn btn-warning">수정</button>
	 		<button type="button" id="delete_Btn" class="btn btn-danger">삭제</button>
	 
 		<script>
 		$(document).ready(function() {
 			//목록버튼
 			$("#list_Btn").click(function() {
 				$(location).attr("href", "<%=request.getContextPath() %>/admin/goods/list");
 			})
 			
 			//수정버튼
 			$("#update_Btn").click(function() {
 				$(location).attr("href", "<%=request.getContextPath() %>/admin/goods/update?n=${goods.gdsNum}");
 			})
 			
 			//삭제버튼
 			$("#delete_Btn").click(function() {
 				if( confirm("상품을 삭제하시겠습니까?") ) {
 					$(location).attr("href", "/admin/goods/delete?gdsNum=${goods.gdsNum}");
 				}
 			})
 			
 		});
 		</script>
		</div>
		
	</div>


</section>


<c:import url ="../../layout/footer.jsp" ></c:import>