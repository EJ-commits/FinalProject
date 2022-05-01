<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<c:import url ="../../layout/header.jsp" ></c:import>

<style>
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
 
 .inputArea { margin:10px 0; }
 select { width:100px; }
 label { display:inline-block; width:70px; padding:5px; }
 label[for='gdsDes'] { display:block; }
 input { width:150px; }
 textarea#gdsDes { width:400px; height:180px; }
 
</style>



<section id="container">

	<aside>
		<c:import url ="../../layout/aside.jsp" ></c:import>
	</aside>
	<div id="container_box">
		<h2>상품 등록</h2>
		
		<form role="form" method="post" autocomplete="off">
 
 			<div class="inputArea"> 
 				<label>1차 분류</label>
 				<select class="category1">
  					<option value="">전체</option>
 				</select>

 				<label>2차 분류</label>
 				<select class="category2" name="cateCode">
  					<option value="">전체</option>
 				</select>
			</div>

			<div class="inputArea">
 				<label for="gdsName">상품명</label>
 				<input type="text" id="gdsName" name="gdsName" />
			</div>

			<div class="inputArea">
 				<label for="gdsPrice">상품가격</label>
 				<input type="text" id="gdsPrice" name="gdsPrice" />
			</div>

			<div class="inputArea">
 				<label for="gdsStock">상품수량</label>
 				<input type="text" id="gdsStock" name="gdsStock" />
			</div>

			<div class="inputArea">
 				<label for="gdsDes">상품소개</label>
 				<textarea rows="5" cols="50" id="gdsDes" name="gdsDes"></textarea>
			</div>

			<div class="inputArea">
 				<button type="submit" id="register_Btn" class="btn btn-primary">등록</button>
			</div>
 
		</form>
		
	</div>


</section>


<script>

//	컨트롤러에서 데이터 받기
var jsonData = JSON.parse('${category}');
console.log(jsonData);

var cate1Arr = new Array();
var cate1Obj = new Object();

//	1차 분류 셀렉트 박스에 삽입할 데이터 준비

//	jsondata에서 level값이 1인 경우에만 cate1Obj에 추가하고, 추가한 데이터를 cate1Arr에 추가한다 
//이렇게 추가한 값을 cate1Select에 추가한다
for(var i = 0; i < jsonData.length; i++) {
	
	if(jsonData[i].level == "1") {
		cate1Obj = new Object(); //초기화
		cate1Obj.cateCode = jsonData[i].cateCode;
		cate1Obj.cateName = jsonData[i].cateName;
		cate1Arr.push(cate1Obj);
		/* console.log(cate1Obj);
		console.log(cate1Arr); */
	}
}

//	1차 분류 셀렉트 박스에 데이터 삽입
var cate1Select = $("select.category1")
for(var i = 0; i < cate1Arr.length; i++) {
	cate1Select.append("<option value='" + cate1Arr[i].cateCode + "'>"
						+ cate1Arr[i].cateName + "</option>");
}


// 1차 카테고리 선택 시 -> 2차 카테고리 세팅
$(document).on("change", "select.category1", function(){

	var cate2Arr = new Array();
	var cate2Obj = new Object();
	 
	// 2차 분류 셀렉트 박스에 삽입할 데이터 준비
	for(var i = 0; i < jsonData.length; i++) {
	  
		if(jsonData[i].level == "2") {
	   		cate2Obj = new Object();  //초기화
	   		cate2Obj.cateCode = jsonData[i].cateCode;
	   		cate2Obj.cateName = jsonData[i].cateName;
	   		cate2Obj.cateCodeRef = jsonData[i].cateCodeRef;
	   
	   		cate2Arr.push(cate2Obj);
	 	}
	}
	 
	var cate2Select = $("select.category2");

	//기존에 있던 데이터 삭제
	cate2Select.children().remove();
	 
	$("option:selected", this).each(function () {
		
		var selectVal = $(this).val();
		cate2Select.append("<option value='" + selectVal + "'>전체</option>");
		
		//1차 분류값인 selectVal과 cate2Arr[i].cateCodeRef를 비교하여 동일할 경우에만 2차카테고리가 보임
		for(var i=0; i<cate2Arr.length; i++) {
			if(selectVal == cate2Arr[i].cateCodeRef) {
				cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
									+ cate2Arr[i].cateName + "</option>");
			}
		}
		
	})
	 
});


</script> 
<c:import url ="../../layout/footer.jsp" ></c:import>