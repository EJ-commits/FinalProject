<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:import url ="../layout/header2.jsp" ></c:import>



<style>

 a { color:#05f; text-decoration:none; }
 a:hover { text-decoration:underline; }
 
 h1, h2, h3, h4, h5, h6 { margin:0; padding:0; }
 ul, lo, li { margin:0; padding:0; list-style:none; }

 /* ---------- */
 
 div#root { width:900px; margin:0 auto; }
 header#header { }
 nav#nav { }
 section#container { }
  section#content { float:right; width:700px; }
  aside#aside { float:left; width:180px; }
  section#container::after { content:""; display:block; clear:both; } 

 
 /* ---------- */
 

 
 nav#nav div#nav_box { font-size:14px; padding:10px; text-align:right; }
 nav#nav div#nav_box li { display:inline-block; margin:0 10px; }
 nav#nav div#nav_box li a { color:#333; }
 
 section#container { }
 
 aside#aside h3 { font-size:22px; margin-bottom:20px; text-align:center; }
 aside#aside li { font-size:16px; text-align:center; }
 aside#aside li a { color:#000; display:block; padding:10px 0; }
 aside#aside li a:hover { text-decoration:none; background:#eee; }
 
 aside#aside li { position:relative; }
aside#aside li:hover { background:#eee; }   
aside#aside li > ul.low { display:none; position:absolute; top:0; left:180px;  }
aside#aside li:hover > ul.low { display:block; }
aside#aside li:hover > ul.low li a { background:#eee; border:1px solid #eee; }
aside#aside li:hover > ul.low li a:hover { background:#fff;}
aside#aside li > ul.low li { width:180px; }
 

 
</style>

<style>
/*  section#content ul li { display:inline-block; margin:10px; }
 section#content div.thumb img { width:200px; height:200px; }
 section#content div.goodsName { padding:10px 0; text-align:center; }
 section#content div.goodsName a { color:#000; } */
 
 section#content ul li { margin:10px 0; }
 section#content ul li img { width:200px; height:200px; }
 section#content ul li::after { content:""; display:block; clear:both; }
 section#content div.thumb { float:left; width:100px; }
 section#content div.gdsInfo { float:right; width:calc(100% - 270px); }
 section#content div.gdsInfo { font-size:20px; line-height:2; }
 section#content div.gdsInfo span { display:inline-block; width:100px; font-weight:bold; margin-right:10px; }
 section#content div.gdsInfo .delete { text-align:right; }
 section#content div.gdsInfo .delete button { font-size:15px;
            padding:5px 10px; border:1px solid #eee; background:#eee;}
            
.allCheck { float:left; width:200px; }
.allCheck input { width:16px; height:16px; }
.allCheck label { margin-left:10px; }
.delBtn { float:right; width:300px; text-align:right; }
.delBtn button { font-size:18px; padding:5px 10px; border:1px solid #eee; background:#eee;}

.checkBox { float:left; width:30px; }
.checkBox input { width:16px; height:16px; }
.total {font-size: 30px;}
.gdsAllPrice{font-size: 32px; color: #86B404;}
.numBox { font-size:22px; width:50px; padding:5px; margin:0; border:1px solid #eee; }
.plus { font-size:26px; border:none; background:none; }
.minus { font-size:26px; border:none; background:none; }

</style>

<div id="wrap-box-top">
	<div><a href="/shop/home"><span class="glyphicon glyphicon-arrow-left"></span>&nbsp;상품 홈</a></div>
	<div id="title-box">장바구니</div>
	<div></div>
</div>
<div id="wrap-box">


<section id="container">
	<div id="container_box">
	<aside id="aside">
 		<ul>
  		<c:import url ="../layout/asideGoodsUser.jsp" ></c:import>
 		</ul>
	</aside>
	
		<section id="content">
			
			<ul>
			<li>
				<div class="allCheck">
   				<input type="checkbox" name="allCheck" id="allCheck" /><label for="allCheck">모두 선택</label> 
  				</div>
  				
  				<script>
					$("#allCheck").click(function(){
					 var chk = $("#allCheck").prop("checked");
					 if(chk) {
					  $(".chBox").prop("checked", true);
					 } else {
					  $(".chBox").prop("checked", false);
					 }
					});
				</script>
  
  				<div class="delBtn">
   					<button type="button" class="selectDelete_btn">선택 삭제</button>				 
  				</div>
    			<script>
					 $(".selectDelete_btn").click(function(){
					  //confirm을 이용해 삭제 여부를 확인
					  var confirm_val = confirm("정말 삭제하시겠습니까?");
					  
					  //개별 선택된 체크박스들을 배열 변수 checkArr에 저장한 뒤 컨트롤러로 전송
					  if(confirm_val) {
					   	var checkArr = new Array();
					   
					   	//each() : 선택한 요소가 여러 개일 때 각각에 대하여 반복하여 함수를 실행
					   	$("input[class='chBox']:checked").each(function(){
					   		
					   		//data-[사용자 문자] : 커스텀 속성 -> cartNum을 가져오기 위함 
					    	checkArr.push($(this).attr("data-cartNum"));
					   	});
					    
					   	$.ajax({
					    	url : "/shop/deleteCart",
					    	type : "post",
					    	data : { chbox : checkArr },
					    	success : function(result){
					    		if(result == 1) {
					    			//성공 시 새로고침
					    			alert("삭제하였습니다!");
					     			location.href = "/shop/cartList";
					    		} else {
					    			alert("요청 처리 중, 문제가 발생하여 장바구니 삭제에 실패하였습니다.");
					    		}
					    	}
					   	});
					   } 
					 });
				</script>
			</li>
			
			<c:set var ="total" value="0" />
			
 			<c:forEach items="${cartList}" var="cartList">
 			<li>
 			
 			<div class="checkBox">
   				<input type="checkbox" name="chBox" class="chBox" data-cartNum="${cartList.cartNum}" />
  			</div>
  			
  			
  			<script>
  				//모두 선택 체크박스를 누르면 기존의 개별 체크박스 체크 해제
				 $(".chBox").click(function(){
				  $("#allCheck").prop("checked", false);
				 });
			</script>
  			
  			<div class="thumb">
   				<img src="<%=request.getContextPath() %>/upload/${cartList.imgStoredName }" 
			 alt="그림을 불러오지못함" width="50%" height="50%"><br>
  			</div> 
  			<div class="gdsInfo">
    			<p>
    				
     				 <span>상품명 : </span>${cartList.gdsName}<br />
				     <span>개당 가격 : </span><fmt:formatNumber pattern="###,###,###" value="${cartList.gdsPrice}" />원<br />
				     <span>구입 수량 : </span>
				     		
 							<input type="hidden" value="${cartList.gdsStock}"/>
 							<input type="number" name="numBox_${cartList.cartNum}" class="numBox_${cartList.cartNum}" min="1" max="${cartList.gdsStock}" value="${cartList.cartStock}"/>
 							
 							
 							<button type="button" class="update_${cartList.cartNum}_btn" data-cartNum="${cartList.cartNum}" data-cartStock="${cartList.cartStock}" >변경</button>
 						
 							 
			    			<script>
								 $(".update_${cartList.cartNum}_btn").click(function(){
									 
									 console.log("click()");
									 
								  	//confirm을 이용해 변경 여부를 확인
								  	var confirm_val = confirm("변경하시겠습니까?");
								  	 if(confirm_val) {
								  		
								  		/* var cartNum = new Array(); 
								  		var cartStock = new Array();
								  		cartNum.push($(this).attr("data-cartNum"));
								  		cartStock.push($(this).attr("data-cartStock")); */
								  	
								  		
								  		 
								  		var cartStock = $(".numBox_${cartList.cartNum}").val();
								  		var cartNum; 
								  		console.log(cartStock);
								  		/* cartNum.push($(this).attr("data-cartNum")); */  
								  		var cartNum = $(this).attr("data-cartNum"); 
								  		console.log(cartNum);
								  		
									   	
								  		
								  		
								  		 var data = {
								  				cartStock : cartStock,
								  				/* chbox : checkArr */
								  				 cartNum : cartNum 
											     }; 
											     
							
		
								  		
				    						$.ajax({
				    				 			url : "/shop/updateCart",
				    				 			type : "post",
				    				 			data : data,
				    				 			success : function(result){
				    				  				if(result == 1) {
				    				  					alert("변경하였습니다!");
				    				   					location.href = "/shop/cartList";
				    				  				} else {
				    				   					alert("요청 처리 중, 문제가 발생하여 수량 변경에 실패하였습니다.");
				    				  				}
				    				 			}
				    						});
								  		} 
								  	   
								 });
			    			</script>  
		 				<br>
		 
						
				     
				     <span>총 가격 : </span><fmt:formatNumber pattern="###,###,###" value="${cartList.gdsPrice * cartList.cartStock}" />원
				     <c:set var="total" value="${total + cartList.gdsPrice * cartList.cartStock }" />
    			</p>
    			
    			<div class="delete">
    				<button type="button" class="delete_${cartList.cartNum }_btn" data-cartNum="${cartList.cartNum}">삭제</button>
    			</div>
    			<script>
					 $(".delete_${cartList.cartNum }_btn").click(function(){
					  	//confirm을 이용해 삭제 여부를 확인
					  	var confirm_val = confirm("정말 삭제하시겠습니까?");
					  	if(confirm_val) {
					  		
					  		//선택목록 하나만 지우는 데에도 배열을 사용하는 이유 -> 컨트롤러 메소드 활용
					  		var checkArr = new Array();
					  		
					  		checkArr.push($(this).attr("data-cartNum"));
					  		
    						$.ajax({
    				 			url : "/shop/deleteCart",
    				 			type : "post",
    				 			data : { chbox : checkArr },
    				 			success : function(result){
    				  				if(result == 1) {
    				  					alert("삭제하였습니다!");
    				   					location.href = "/shop/cartList";
    				  				} else {
    				   					alert("요청 처리 중, 문제가 발생하여 장바구니 삭제에 실패하였습니다.");
    				  				}
    				 			}
    						});
					  	}
					 });
    			</script>
    			
    			    
   			</div>
 			</li>
 			</c:forEach>
 			<li>
 				<br>
   				<div class="total">
   					상품가격 <fmt:formatNumber pattern="###,###,###" value="${total}" />원 + 배송비 0원 = <div class="gdsAllPrice">총 가격 <fmt:formatNumber pattern="###,###,###" value="${total}" />원<br /></div>
   				</div>
   			</li>
			</ul>
		
		</section>
	
	
	</div>

</section>
</div>

<c:import url ="../layout/footer.jsp" ></c:import>
