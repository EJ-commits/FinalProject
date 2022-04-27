<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	.map_wrap, .map_wrap *, #gardenReview * {margin:0;padding:0;
 	font-family:'Malgun Gothic',dotum,'돋움',sans-serif; 
	font-size:13px;}
/*  	.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}  */
	.map_wrap {position:relative;width:100%;height:500px;}
	#menu_wrap 
	{position:absolute;top:0;left:0;bottom:0;
	width:300px;
	height:inherit;
	padding:5px;overflow-y:auto;
	background:rgba(255, 255, 255, 0.8);
	z-index: 1;font-size:12px;
/* 	margin:10px 0 30px 10px; */
/* 	border-radius: 10px; */
	}
	.bg_white {background:#fff;}
	#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
	#menu_wrap .option{text-align: center;}
	#menu_wrap .option p {margin:10px 0;}  
	#menu_wrap .option button {margin-left:5px;}
	#placesList li {list-style: none;}
	#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
	#placesList .item span {display: block;margin-top:4px;}
	#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
	#placesList .item .info{padding:10px 0 10px 55px;}
	#placesList .info .gray {color:#8a8a8a;}
	#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
	#placesList .info .tel {color:#009900;}
	#placesList .item .markerbg {float:left;position:absolute;width:36px; height:45px;margin:10px 0 0 10px;background:url(/resources/img/map_number_icon.png) no-repeat;}
	#placesList .item .marker_1 {background-position: 0 0px;}
	#placesList .item .marker_2 {background-position: 0 -39px;}
	#placesList .item .marker_3 {background-position: 0 -78px}
	#placesList .item .marker_4 {background-position: 0 -118px;}
	#placesList .item .marker_5 {background-position: 0 -156px;}
	#placesList .item .marker_6 {background-position: 0 -195px;}
	#placesList .item .marker_7 {background-position: 0 -234px;}
	#placesList .item .marker_8 {background-position: 0 -273px;}
	#placesList .item .marker_9 {background-position: 0 -312px;}
	#placesList .item .marker_10 {background-position: 0 -352px;}
	#placesList .item .marker_11 {background-position: 0 -390px;}
	#placesList .item .marker_12 {background-position: 0 -429px;}
	#placesList .item .marker_13 {background-position: 0 -469px;}
	#placesList .item .marker_14 {background-position: 0 -507px;}
	#placesList .item .marker_15 {background-position: 0 -547px;}
	#pagination {margin:10px auto;text-align: center;}
	#pagination a {display:inline-block;margin-right:10px;}
	#pagination .on {font-weight: bold; cursor: default;color:#777;}
	
	#category {position:absolute;bottom:10px;right:10px;border-radius: 5px; border:1px solid #909090;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);background: #fff;overflow: hidden;z-index: 2;}
	#category li {float:left;list-style: none;width:50px;px;border-right:1px solid #acacac;padding:6px 0;text-align: center; cursor: pointer;}
	#category li.on {background: #ffe6e6; } 
	#category li:hover {
	background: #ffe6e6;
/*  	border-left:1px solid #acacac;  */
/*  	margin-left: -1px;  */
	}
	#category li:last-child{margin-right:0;border-right:0;}
	#category li span {display: block;margin:0 auto 3px;width:27px;height: 28px;}
/* 	#category li .category_bg {background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png) no-repeat;} */
	#category li .visit {background:url('/resources/img/map_sightseeing_icon.png') no-repeat;background-size: 27px;}
	#category li .culture {background:url('/resources/img/map_culture_icon.png') no-repeat;background-size: 27px;}
	#category li .cafe {background:url('/resources/img/map_coffee_icon.png') no-repeat;background-size: 27px;}
/*  	#category li.on .category_bg {background-position-x:-46px;}   */
	.placeinfo_wrap {position:absolute;bottom:28px;left:-150px;width:300px;}
	.placeinfo {position:relative;width:100%;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;padding-bottom: 10px;background: #fff;}
	.placeinfo:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
	.placeinfo_wrap .after {content:'';position:relative;margin-left:-12px;left:50%;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
	.placeinfo a, .placeinfo a:hover, .placeinfo a:active{color:#fff;text-decoration: none;}
	.placeinfo a, .placeinfo span {display: block;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
	.placeinfo span {margin:5px 5px 0 5px;cursor: default;font-size:13px;}
	.placeinfo .title {font-weight: bold; font-size:14px;border-radius: 6px 6px 0 0;margin: -1px -1px 0 -1px;padding:10px; color: #fff;background: #d95050;background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
	.placeinfo .tel {color:#0f7833;}
	.placeinfo .jibun {color:#999;font-size:11px;margin-top:0;}
	
	
</style>
<!-- 헤더 -->
<c:import url="/WEB-INF/views/layout/header.jsp"></c:import>

<!-- 본문 -->
<!-- 지도 -->
<div class="garden_wrap" style="height:1000px;"><!-- garden 전체 div -->

<div class="map_wrap" style="width:70%;height:600px;margin:20px auto;">

    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;">
    	<div id="iconShortcut" style="position:absolute;right:10px;bottom:100px;z-index:20;width:48px;margin-bottom: 10px;">
		<p style="width:48px;text-align:center;font-weight: bold;cursor:pointer;" onclick="iconkeywordsearch1('공원');"><img alt="공원" src="/resources/img/map_park_icon.png">공원</p>
		<p style="width:48px;text-align:center;font-weight: bold;cursor:pointer;" onclick="iconkeywordsearch2('수목원');"><img alt="수목원" src="/resources/img/map_garden_icon.png">수목원</p>
		</div>
    </div>

    <div id="menu_wrap" class="bg_white">
        <div class="option clearfix">
            <div>
                <form onsubmit="searchPlaces(); return false;">
<!--                     키워드 :  -->
<!-- value="수목원" -->
                    <input type="text" id="keyword"  size="15"  class="form-control pull-left" style="width:200px;height:30px;" placeholder="키워드 검색" autocomplete="off"> 
                    <button type="submit" class="btn btn-default pull-left" style="width:60px;height:30px;">검색</button> 
                </form>
            </div>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
    
    
    <ul id="category">
        <li id="CE7" data-order="0"> 
            <span class="category_bg cafe"></span>
            카페
        </li>  
        <li id="CT1" data-order="1"> 
            <span class="category_bg culture"></span>
            문화
        </li>       
        
         <li id="AT4" data-order="2"> 
            <span class="category_bg visit"></span>
            관광
        </li>  
         
        
          
    </ul>
</div><!-- map wrap -->

<!-- 리뷰 -->
<div id="gardenReview" class="form-horizontal" style="width:800px;margin:0 auto;">
	<p id="gName" style="font-size:16px;font-weight:bold;margin-bottom: 10px;">리뷰를 보고싶은 수목원 또는 공원을 클릭해주세요</p>
 <c:if test="${not empty id }"> 
<!-- id가 있을 때 리뷰를 작성할 수 있게 할 예정 -->
	<form name="f">
	<div class="col-sm-10">
	<input type="hidden" name="gardenName" id="gardenName">
	<input type="text" placeholder="리뷰를 작성해주세요." class="form-control" name="grContent" id="grContent" style="height:60px;padding-left:5px;">
	</div>
	<button class="btn btn-info" type="button" id="reviewWrite" style="height:60px;width:120px;font-size: 16px;">등록</button>
	</form>
 </c:if> 
	<div id="allReview"></div>
</div>
<%-- <c:import url="/WEB-INF/views/garden/gardenReview.jsp"></c:import> --%>

</div><!-- garden 전체 div -->


<!-- 푸터 -->
<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>

<!-- 카카오지도 시작 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1f447360a4d3b43321309eb9e4c01460&libraries=services"></script>
<script>
// 마커를 담을 배열입니다
var markers = [];



var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };  


// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

//지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
var zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);


// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

// 키워드로 장소를 검색합니다
searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
//       	  alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {
    	
        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);
    
    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });
		
            
            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';
	
    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>'
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }


    
      itemStr += '  <span class="tel">' + places.phone  + '</span>' 
      			+ '   <a class="title" href="' + places.place_url + '" target="_blank" title="' + places.place_name + '">상세보기 </a>'
      			+ '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = '/resources/img/map_number_icon.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 39),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 600), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*39)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(16, 0) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

var iwContent; 
var iwPosition;

//인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({
position : iwPosition, 
content : iwContent 
});


// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
//     var content = '<div style="padding:5px;z-index:1;" class="style1">' + title + '</div>';
    iwContent = '<div style="padding:5px;width:185px;height:30px;" class="clearfix">' + title + '</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
//     iwContent = '<div style="padding:5px;width:185px;height:60px;" class="clearfix">' + title + '<button type="button" class="close delInfo pull-right" aria-label="Close" onclick="infowindow.close();"><span aria-hidden="true" style="font-size:25px;">&times;</span></button> <br><a href="https://map.kakao.com/link/map/'+ title +',33.450701,126.570667" style="color:blue;display:inline-block;margin-top:7px;" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/' + title +',33.450701,126.570667" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    
       
    iwPosition = new kakao.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다
    infowindow.setContent(iwContent);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}


// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
var placeOverlay = new kakao.maps.CustomOverlay({zIndex:1}), 
    contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
    kmarkers = [], // 마커를 담을 배열입니다
    currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다
 
//지도를 생성합니다    
// var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
ps = new kakao.maps.services.Places(map); 

// 지도에 idle 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'idle', ksearchPlaces);

// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
contentNode.className = 'placeinfo_wrap';

// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다 
addEventHandle(contentNode, 'mousedown', kakao.maps.event.preventMap);
addEventHandle(contentNode, 'touchstart', kakao.maps.event.preventMap);

// 커스텀 오버레이 컨텐츠를 설정합니다
placeOverlay.setContent(contentNode);  

// 각 카테고리에 클릭 이벤트를 등록합니다
addCategoryClickEvent();

// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
function addEventHandle(target, type, callback) {
    if (target.addEventListener) {
        target.addEventListener(type, callback);
    } else {
        target.attachEvent('on' + type, callback);
    }
}

// 카테고리 검색을 요청하는 함수입니다
function ksearchPlaces() {
    if (!currCategory) {
        return;
    }
    
    // 커스텀 오버레이를 숨깁니다 
    placeOverlay.setMap(null);

    // 지도에 표시되고 있는 마커를 제거합니다
    kremoveMarker();
    
    ps.categorySearch(currCategory, kplacesSearchCB, {useMapBounds:true}); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function kplacesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
        kdisplayPlaces(data);
    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
        // 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요

    } else if (status === kakao.maps.services.Status.ERROR) {
        // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
        
    }
}

// 지도에 마커를 표출하는 함수입니다
function kdisplayPlaces(places) {

    // 몇번째 카테고리가 선택되어 있는지 얻어옵니다
    // 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
    var order = document.getElementById(currCategory).getAttribute('data-order');

    

    for ( var i=0; i<places.length; i++ ) {

            // 마커를 생성하고 지도에 표시합니다
            var kmarker = kaddMarker(new kakao.maps.LatLng(places[i].y, places[i].x), order);

            // 마커와 검색결과 항목을 클릭 했을 때
            // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
            (function(kmarker, place) {
                kakao.maps.event.addListener(kmarker, 'click', function() {
                    displayPlaceInfo(place);
                });
            })(kmarker, places[i]);
    }
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function kaddMarker(position, order) {
    var imageSrc = '/resources/img/map_icon.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(27, 28),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(27, 84), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (order*28)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(11, 28) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
        	kmarker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    kmarker.setMap(map); // 지도 위에 마커를 표출합니다
    kmarkers.push(kmarker);  // 배열에 생성된 마커를 추가합니다

    return kmarker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function kremoveMarker() {
    for ( var i = 0; i < kmarkers.length; i++ ) {
    	kmarkers[i].setMap(null);
    }   
    kmarkers = [];
}

//커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
function closeOverlay() {
	placeOverlay.setMap(null);     
}

// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
function displayPlaceInfo (place) {
    var content = '<div class="placeinfo">' +
                    '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';   

    if (place.road_address_name) {
        content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
                    '  <span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
    }  else {
        content += '    <span title="' + place.address_name + '">' + place.address_name + '</span>';
    }                
   
    content += '    <span class="tel clearfix">' + place.phone + '<strong onclick="closeOverlay()" class="pull-right" style="color:#888;cursor:pointer;font-size:11px;margin-right:2px;">닫기</strong>'+'</span>' 
                +'</div>' + 
                '<div class="after"></div>';
    contentNode.innerHTML = content;
    placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
    placeOverlay.setMap(map);  
}

var callList;

//자바스크립트로 공원이름 html에 추가하기
function addVar(place){
	var garden = document.getElementById("gardenName");
	var gname = document.getElementById("gName");
	gname.innerText = place.place_name+" 리뷰";
	garden.innerText = place.place_name;
	callList(place.place_name);
}

$(document).ready(function(){
	callList = function(gardenName){
		$.ajax({
			type:"get"
			,url:"/garden/list"
			,data:{"gardenName":gardenName}
			,dataType:"html"
			,success:function(){
				console.log("성공");
			}
			,error:function(){
				console.log("실패");
				alert("리뷰 불러오기를 실패했습니다. 다시 시도해주세요");
			}
		})
	}
})//document.ready

// 각 카테고리에 클릭 이벤트를 등록합니다
function addCategoryClickEvent() {
    var category = document.getElementById('category'),
        children = category.children;

    for (var i=0; i<children.length; i++) {
        children[i].onclick = onClickCategory;
    }
}

// 카테고리를 클릭했을 때 호출되는 함수입니다
function onClickCategory() {
    var id = this.id,
        className = this.className;

    placeOverlay.setMap(null);

    if (className === 'on') {
        currCategory = '';
        changeCategoryClass();
        kremoveMarker();
    } else {
        currCategory = id;
        changeCategoryClass(this);
        ksearchPlaces();
    }
}

// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
function changeCategoryClass(el) {
    var category = document.getElementById('category'),
        children = category.children,
        i;

    for ( i=0; i<children.length; i++ ) {
        children[i].className = '';
    }

    if (el) {
        el.className = 'on';
    } 
} 



var iconcheck1=false;
var iconcheck2=false;
function iconkeywordsearch1(iconkey) {
	removeMarker();

	if(iconcheck1){
		iconcheck1=false;
		removeMarker();
		return;
	}
	
	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places(); 

	// 키워드로 장소를 검색합니다
	ps.keywordSearch(iconkey, placesSearchCB); 

	// 키워드 검색 완료 시 호출되는 콜백함수 입니다
	function placesSearchCB (data, status, pagination) {
	    if (status === kakao.maps.services.Status.OK) {
			

	        // 정상적으로 검색이 완료됐으면
	        // 검색 목록과 마커를 표출합니다
	        idisplayPlaces(data);    

	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	        map.setBounds(bounds);
	    } 
	}
	
	iconcheck1=true;
	iconcheck2=false;
}

function iconkeywordsearch2(iconkey) {
	removeMarker();
	if(iconcheck2){
		iconcheck2=false;
		removeMarker();
		return;
	}

	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places(); 

	// 키워드로 장소를 검색합니다
	ps.keywordSearch(iconkey, placesSearchCB); 

	// 키워드 검색 완료 시 호출되는 콜백함수 입니다
	function placesSearchCB (data, status, pagination) {
	    if (status === kakao.maps.services.Status.OK) {
			

	        // 정상적으로 검색이 완료됐으면
	        // 검색 목록과 마커를 표출합니다
	        idisplayPlaces(data);     

	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	        map.setBounds(bounds);
	    } 
	}
	
	iconcheck2=true;
	iconcheck1=false;
}
	
	// 검색 결과 목록과 마커를 표출하는 함수입니다
	function idisplayPlaces(places) {

// 	    var listEl = document.getElementById('placesList'), 
	    menuEl = document.getElementById('menu_wrap'),
	    fragment = document.createDocumentFragment(), 
	    bounds = new kakao.maps.LatLngBounds(), 
	    listStr = '';
	    
	    // 검색 결과 목록에 추가된 항목들을 제거합니다
// 	    removeAllChildNods(listEl);

	    // 지도에 표시되고 있는 마커를 제거합니다
	    removeMarker();
	    
	    for ( var i=0; i<places.length; i++ ) {
	    	var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = iaddMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

       		 // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        	// LatLngBounds 객체에 좌표를 추가합니다
      		  bounds.extend(placePosition);

            // 마커를 생성하고 지도에 표시합니다
//             var marker = iaddMarker(new kakao.maps.LatLng(places[i].y, places[i].x), order);

            // 마커와 검색결과 항목을 클릭 했을 때
            // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
            (function(marker, place) {
                kakao.maps.event.addListener(marker, 'click', function() {
                    idisplayPlaceInfo(place);
                });
                itemEl.onmouseover =  function () {
	                idisplayInfowindow(marker, places[i]);
	            };

	            itemEl.onmouseout =  function () {
	                infowindow.close();
	            };
	        })(marker, places[i]);

	        fragment.appendChild(itemEl);
            
    }
	
	 // 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
	    function idisplayPlaceInfo (place) {
	        var content = '<div class="placeinfo">' +
	                        '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';   

	        if (place.road_address_name) {
	            content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
	                        '  <span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
	        }  else {
	            content += '    <span title="' + place.address_name + '">' + place.address_name + '</span>';
	        }                
	       
	        content += '    <span class="tel clearfix">' + place.phone + '<strong onclick="closeOverlay()" class="pull-right" style="color:#888;cursor:pointer;font-size:11px;margin-right:2px;">닫기</strong>'+'</span>' 
	                    +'</div>' + 
	                    '<div class="after"></div>';
	                    
	        addVar(place);
	        contentNode.innerHTML = content;
	        placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
	        placeOverlay.setMap(map);  
	    }

	    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
// 	    listEl.appendChild(fragment);
// 	    menuEl.scrollTop = 0;

	    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	    map.setBounds(bounds);
	}
	
	function idisplayInfowindow(marker, place) {
//	     var content = '<div style="padding:5px;z-index:1;" class="style1">' + title + '</div>';
	    iwContent = '<div style="padding:5px;width:180px;height:30px;" class="clearfix">'  + place.place_name +  '</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
//	     iwContent = '<div style="padding:5px;width:185px;height:60px;" class="clearfix">' + title + '<button type="button" class="close delInfo pull-right" aria-label="Close" onclick="infowindow.close();"><span aria-hidden="true" style="font-size:25px;">&times;</span></button> <br><a href="https://map.kakao.com/link/map/'+ title +',33.450701,126.570667" style="color:blue;display:inline-block;margin-top:7px;" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/' + title +',33.450701,126.570667" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	    
	       
	    iwPosition = new kakao.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다
	    infowindow.setContent(iwContent);
	    infowindow.open(map, marker);
	}

	// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	function iaddMarker(position, idx, title) {
	    var imageSrc = '/resources/img/map_key_icon.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
	        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
	        imgOptions =  {
	            offset: new kakao.maps.Point(18, 30) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	        },
	        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
	            marker = new kakao.maps.Marker({
	            position: position, // 마커의 위치
	            image: markerImage 
	        });

//     kmarker.setMap(map); // 지도 위에 마커를 표출합니다
//     kmarkers.push(kmarker);  // 배열에 생성된 마커를 추가합니다

	    marker.setMap(map); // 지도 위에 마커를 표출합니다
	    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

	    return marker;
	}


//  카카오지도 끝 
</script>


