<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:import url ="../layout/header.jsp" ></c:import>



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
 
</style>

<div id="wrap-box-top">
	<div><a href="/diary/list"><span class="glyphicon glyphicon-arrow-left"></span>&nbsp;이전 페이지</a></div>
	<div id="title-box">제목</div>
	<div></div>
</div>
<div id="wrap-box">
<section id="container">

	<aside>
 		<ul>
  		<c:import url ="../layout/aside.jsp" ></c:import>
 		</ul>
	</aside>
	
	<div id="container_box">
		본문영역
	</div>

</section>
</div>

<c:import url ="../layout/footer.jsp" ></c:import>
