<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
  ul { padding:0; margin:0; list-style:none;  } 

  div#root { width:90%; margin:0 auto; } 
 
/*   header#header { font-size:60px; padding:20px 0; }  */
/*   header#header h1 a { color:#000; font-weight:bold; }  */
 
/*   nav#nav { padding:10px; text-align:right; }  */
/*   nav#nav ul li { display:inline-block; margin-left:10px; }  */

 #container { padding:20px 0; border-top:2px solid #eee; }  
 #container::after { content:""; display:block; clear:both; } 
  aside { float:left; width:200px; } 
  div#container_box { float:right; width:calc(100% - 200px - 20px); } 
 
  aside{margin-top:30px;}
  aside ul li { text-align:center; margin-bottom:10px; width:100%;height:50px;border:1px solid #333;padding-top:9px;font-size:20px; } 
  aside ul li a { display:block; width:100%; padding:10px 0;} 
  aside ul li:hover { background:#eee; }
 
	footer#footer { background:#f9f9f9; padding:20px; } 
	footer#footer ul li { display:inline-block; margin-right:10px; } 
</style>

<c:import url ="../layout/headerm.jsp" ></c:import>


<div id="wrap-box">
<section id="container">

	<aside>
 		<ul>
  		<c:import url ="../layout/aside.jsp" ></c:import>
 		</ul>
	</aside>
	
	<div id="container_box">
		<p>오늘도 살아남읍시다</p>
		<iframe width="560" height="315" src="https://www.youtube.com/embed/TjqegE9ngaU" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	</div>
</section>
	

</div>


<c:import url ="../layout/footerm.jsp" ></c:import>
