<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
    <title>With</title>
    <meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <link href="resources/boot/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="resources/boot/css/font-awesome.min.css" media="screen" title="no title" charset="utf-8">
    <link rel="stylesheet" href="resources/boot/css/style.css" media="screen" title="no title" charset="utf-8">
    <style>
#map_div{
	float:right;

}
.w3-container{

	float:center;


}

body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", Arial, Helvetica, sans-serif}
.mySlides {display:none}
.main_common{
    display: inline-block;
    float: left;
    width: 300px;
    height: 120px;
    
    margin: auto;
    
}
.map_main{
	float : left;
	width : 29%;
	height : 100%;
	border: 1px solid black;
	margin : auto;
}

</style>
										<!-- 정진이형 키 : 1c6bbbf0-74bd-4727-936f-0acdeb2a47cb -->
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>simpleMap</title>
        <script type="text/javascript" src="resources/js/jquery-3.1.1.min.js"></script>
        <script src="https://api2.sktelecom.com/tmap/js?version=1&format=javascript&appKey=9678b2f0-469e-4b2b-94bc-988d16431c07"></script>
        <script type="text/javascript">
        //도로명 주소 변환
        function goPopup(){
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	var pop = window.open("resources/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}
        
        function goPopup2(){
        	// 주소검색을 수행할 팝업 페이지를 호출합니다.
        	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
        	var pop = window.open("resources/jusoPopup2.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
        	
        	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
            //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
        }

function jusoCallBack(roadAddrPart1){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		
		
		document.form.roadAddrPart1.value = roadAddrPart1;
}
function jusoCallBack2(roadAddrPart1){
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
	
	
	document.form.roadAddrPart2.value = roadAddrPart1;
}
        
        //여기까지
        
        // map.clearOverlays();
        var map;
        var start;
        var end;
        var tDistance;
        var tTime;
        var taxiFare;
        var PreDistance;
        var PreTime;
        var PreMoney;
       
        function CreateRoom(){
        							//start이 값만 바꾸면됨
        	start = document.getElementById("roadAddrPart1").value;
        	end =  document.getElementById("roadAddrPart2").value;
        	
        	location.href="CreateRoom?rStart="+start+"&rEnd="+end+"&preDistance="+PreDistance+"&preTime="+PreTime+"&preMoney="+PreMoney;
        }
        
        function StartMap(){
        	map = new Tmap.Map({
				div:'map_div',
				width : "70%",
				height : "60%",
			});
        	
        	
        	/* '<html><body><h1>이거뜨냐?</h1></body></html>'
        	'<body><h1>이거뜨냐?</h1></body>'
        	'<form action="CreateRoom" method="post">'+
    		+'<input type="hidden" name="PreDistance" value='+tDistance+'>'+
    		console.log(start)
    		+'<input type="hidden" name="PreTime" value='+tTime+'>'+
    		+'<input type="hidden" name="PreMoney" value='+taxiFare+'>'+
    		+'<body>'+'<input type="submit" value="방 만들어보리기">'+
    		+'</body>'+'</form>'
    		console.log("안녕><") */
        }
        
    	function initTmap(){
    		
			map.setCenter(new Tmap.LonLat("126.986072", "37.570028").transform("EPSG:4326", "EPSG:3857"), 15);
			
			//여기부터 출발지
			var start = document.getElementById("roadAddrPart1").value;
			//console.log(start);/* var promise =  */
		 	$.ajax({
				method:"GET",
				url:"https://api2.sktelecom.com/tmap/geo/fullAddrGeo?version=1&format=xml&callback=result", //FullTextGeocoding api 요청 url입니다.
				async:false,
				data:{
					"coordType" : "WGS84GEO",//지구 위의 위치를 나타내는 좌표 타입입니다.
					"fullAddr" : start, //주소 정보 입니다, 도로명 주소 표준 표기 방법을 지원합니다.  
					"page" : "1",//페이지 번호 입니다.
					"count" : "20",//페이지당 출력 갯수 입니다.
					"appKey" : "9678b2f0-469e-4b2b-94bc-988d16431c07",//실행을 위한 키 입니다. 발급받으신 AppKey를 입력하세요.
				},
				//데이터 로드가 성공적으로 완료되었을 때 발생하는 함수입니다.
				success:function(response){
					prtcl = response;
					
					// 3. 마커 찍기
					var prtclString = new XMLSerializer().serializeToString(prtcl);//xml to String	
					xmlDoc = $.parseXML( prtclString ),
					$xml = $( xmlDoc ),
					$intRate = $xml.find("coordinate");

					//검색 결과 정보가 없을 때 처리
					if($intRate.length==0){
						//예외처리를 위한 파싱 데이터
						$intError = $xml.find("error");
								
						// 주소가 올바르지 않을 경우 예외처리
						if($intError.context.all[0].nodeName == "error"){
							$("#result").text("요청 데이터가 올바르지 않습니다.");
						}
					}	
						  		    
					var lon1, lat1;
					if($intRate[0].getElementsByTagName("lon").length>0){//구주소
						lon1 = $intRate[0].getElementsByTagName("lon")[0].childNodes[0].nodeValue;
					   	lat1 = $intRate[0].getElementsByTagName("lat")[0].childNodes[0].nodeValue;
					}else{//신주소
						lon1 = $intRate[0].getElementsByTagName("newLon")[0].childNodes[0].nodeValue;
						lat1 = $intRate[0].getElementsByTagName("newLat")[0].childNodes[0].nodeValue;
					}
					//console.log("ajax안"+lon1);
					//console.log("ajax안"+lat1);
					
					result1 = lon1;
					result2 = lat1;
					
					
				}});
		 			//	console.log("result1밖"+result1);
		 			//	console.log("result2밖"+result2);
		 			//여기까지 출발지 
			
			//여기부터 도착지
			var end = document.getElementById("roadAddrPart2").value;
			$.ajax({
				method:"GET",
				url:"https://api2.sktelecom.com/tmap/geo/fullAddrGeo?version=1&format=xml&callback=result", //FullTextGeocoding api 요청 url입니다.
				async:false,
				data:{
					"coordType" : "WGS84GEO",//지구 위의 위치를 나타내는 좌표 타입입니다.
					"fullAddr" : end, //주소 정보 입니다, 도로명 주소 표준 표기 방법을 지원합니다.  
					"page" : "1",//페이지 번호 입니다.
					"count" : "20",//페이지당 출력 갯수 입니다.
					"appKey" : "9678b2f0-469e-4b2b-94bc-988d16431c07",//실행을 위한 키 입니다. 발급받으신 AppKey를 입력하세요.
				},
				//데이터 로드가 성공적으로 완료되었을 때 발생하는 함수입니다.
				success:function(response){
					prtcl = response;
					
					// 3. 마커 찍기
					var prtclString = new XMLSerializer().serializeToString(prtcl);//xml to String	
					xmlDoc = $.parseXML( prtclString ),
					$xml = $( xmlDoc ),
					$intRate = $xml.find("coordinate");

					//검색 결과 정보가 없을 때 처리
					if($intRate.length==0){
						//예외처리를 위한 파싱 데이터
						$intError = $xml.find("error");
								
						// 주소가 올바르지 않을 경우 예외처리
						if($intError.context.all[0].nodeName == "error"){
							$("#result").text("요청 데이터가 올바르지 않습니다.");
						}
					}	
						  		    
					var lon2, lat2;
					if($intRate[0].getElementsByTagName("lon").length>0){//구주소
						lon2 = $intRate[0].getElementsByTagName("lon")[0].childNodes[0].nodeValue;
					   	lat2 = $intRate[0].getElementsByTagName("lat")[0].childNodes[0].nodeValue;
					}else{//신주소
						lon2 = $intRate[0].getElementsByTagName("newLon")[0].childNodes[0].nodeValue;
						lat2 = $intRate[0].getElementsByTagName("newLat")[0].childNodes[0].nodeValue;
					}
					result3 = lon2;
					result4 = lat2;
					
				}});
					//여기까지 도착지
			//lat 위도
			
			var routeLayer = new Tmap.Layer.Vector("route");//벡터 레이어 생성
			var markerLayer = new Tmap.Layer.Markers("start");// 마커 레이어 생성
			map.addLayer(routeLayer);//map에 벡터 레이어 추가
			map.addLayer(markerLayer);//map에 마커 레이어 추가

			// 시작
				//	console.log("출발지도착지 안"+result1)
				//	console.log("출발지도착지 안"+result2)
			//var input1 = document.getElementById("start1").value;
			//var input2 = document.getElementById("start2").value;
			var size = new Tmap.Size(24, 38);//아이콘 크기 설정
			var offset = new Tmap.Pixel(-(size.w / 2), -size.h); //아이콘 중심점
			var icon = new Tmap.IconHtml('<img src=http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_s.png />', size, offset);//마커 아이콘 설정
			var marker_s = new Tmap.Marker(new Tmap.LonLat(result1, result2).transform("EPSG:4326", "EPSG:3857"), icon);//설정한 좌표를 "EPSG:3857"로 좌표변환한 좌표값으로 설정합니다.
			markerLayer.addMarker(marker_s);//마커 레이어에 마커 추가   변수 변수

			// 도착
			//var input3 = document.getElementById("end1").value;
			//var input4 = document.getElementById("end2").value;
			var icon = new Tmap.IconHtml('<img src=http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_e.png />', size, offset);//마커 아이콘 설정
			var marker_e = new Tmap.Marker(new Tmap.LonLat(result3, result4).transform("EPSG:4326", "EPSG:3857"), icon);//설정한 좌표를 "EPSG:3857"로 좌표변환한 좌표값으로 설정합니다.
			markerLayer.addMarker(marker_e);//마커 레이어에 마커 추가 변수

			var headers = {}; 
			headers["appkey"]="9678b2f0-469e-4b2b-94bc-988d16431c07";//실행을 위한 키 입니다. 발급받으신 AppKey를 입력하세요.
			$.ajax({
				method:"POST",
				headers : headers,
				url:"https://api2.sktelecom.com/tmap/routes?version=1&format=xml",//자동차 경로안내 api 요청 url입니다.
				async:false,
				data:{
					//출발지 위경도 좌표입니다.
					startX : result1,
					startY : result2,
					//목적지 위경도 좌표입니다.
					endX : result3,
					endY : result4,
					//출발지, 경유지, 목적지 좌표계 유형을 지정합니다.
					reqCoordType : "WGS84GEO",
					resCoordType : "EPSG3857",
					//각도입니다.
					angle : "172",
					//경로 탐색 옵션 입니다.
					searchOption : 0
				},
				//데이터 로드가 성공적으로 완료되었을 때 발생하는 함수입니다.
				success:function(response){
					prtcl = response;
					
					// 결과 출력
					var innerHtml ="";
					var prtclString = new XMLSerializer().serializeToString(prtcl);//xml to String	
				    xmlDoc = $.parseXML( prtclString ),
				    $xml = $( xmlDoc ),
			    	$intRate = $xml.find("Document");
			    	
					//var
			    	tDistance = "총 거리 : "+($intRate[0].getElementsByTagName("tmap:totalDistance")[0].childNodes[0].nodeValue/1000).toFixed(1)+"km";
			    	tTime = "총 시간 : "+($intRate[0].getElementsByTagName("tmap:totalTime")[0].childNodes[0].nodeValue/60).toFixed(0)+"분";	
			    	tFare = "총 요금 : "+$intRate[0].getElementsByTagName("tmap:totalFare")[0].childNodes[0].nodeValue+"원";	
			    	taxiFare = "예상 택시 요금 : "+$intRate[0].getElementsByTagName("tmap:taxiFare")[0].childNodes[0].nodeValue+"원";
			    	PreDistance = ($intRate[0].getElementsByTagName("tmap:totalDistance")[0].childNodes[0].nodeValue/1000).toFixed(1)+"km";
			        PreTime = ($intRate[0].getElementsByTagName("tmap:totalTime")[0].childNodes[0].nodeValue/60).toFixed(0)+"분";
			        PreMoney = $intRate[0].getElementsByTagName("tmap:taxiFare")[0].childNodes[0].nodeValue+"원";
					//console.log(tDistance);
			    	$("#result").text(tDistance+tTime+tFare+taxiFare);
					$("#tDistance").text(tDistance);
					$("#tTime").text(tTime);
					$("#tFare").text(tFare);
					$("#taxiFare").text(taxiFare);
					prtcl=new Tmap.Format.KML({extractStyles:true, extractAttributes:true}).read(prtcl);//데이터(prtcl)를 읽고, 벡터 도형(feature) 목록을 리턴합니다.
					
					routeLayer.removeAllFeatures();//레이어의 모든 도형을 지웁니다.
					
					//표준 데이터 포맷인 KML을 Read/Write 하는 클래스 입니다.
					//벡터 도형(Feature)이 추가되기 직전에 이벤트가 발생합니다.
					routeLayer.events.register("beforefeatureadded", routeLayer, onBeforeFeatureAdded);
					        function onBeforeFeatureAdded(e) {
						        	var style = {};
						        	switch (e.feature.attributes.styleUrl) {
						        	case "#pointStyle":
							        	style.externalGraphic = "http://topopen.tmap.co.kr/imgs/point.png"; //렌더링 포인트에 사용될 외부 이미지 파일의 url입니다.
							        	style.graphicHeight = 16; //외부 이미지 파일의 크기 설정을 위한 픽셀 높이입니다.
							        	style.graphicOpacity = 1; //외부 이미지 파일의 투명도 (0-1)입니다.
							        	style.graphicWidth = 16; //외부 이미지 파일의 크기 설정을 위한 픽셀 폭입니다.
						        	break;
						        	default:
							        	style.strokeColor = "#ff0000";//stroke에 적용될 16진수 color
							        	style.strokeOpacity = "1";//stroke의 투명도(0~1)
							        	style.strokeWidth = "5";//stroke의 넓이(pixel 단위)
						        	};
					        	e.feature.style = style;
					        }
					
					routeLayer.addFeatures(prtcl); //레이어에 도형을 등록합니다.
					
					map.zoomToExtent(routeLayer.getDataExtent());//map의 zoom을 routeLayer의 영역에 맞게 변경합니다.	
				},
				//요청 실패시 콘솔창에서 에러 내용을 확인할 수 있습니다.
				error:function(request,status,error){
					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});

			/* '<form action="CreateRoom" method="post">'+
    		+'<input type="hidden" name="PreDistance" value='+tDistance+'>'+
    		+'<input type="hidden" name="PreTime" value='+tTime+'>'+
    		+'<input type="hidden" name="PreMoney" value='+taxiFare+'>'+
    		+'<body>'+'<input type="submit" value="방 만들어보리기">'+
    		+'</body>'+'</form>'
    		console.log("안녕><") */
		} 
    	

    	</script>
		
    </head >
   

<body class="w3-content w3-border-left w3-border-right"  onload="StartMap()">

<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="home"><img src="resources/KakaoTalk_20180918_160253898.png" width="80px" height="30px"></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
      <%
	String id = (String)session.getAttribute("id");
%>
       <% if(id != null){ %>
<li><a href="Logout">로그아웃</a></li>
<% }else {%>
<li><a href="Login">로그인</a></li>
<li><a href="UserJoin">사용자 회원가입</a></li>
<li><a href="DriverJoin">기사 회원가입</a></li>
 <%} %> 
 <c:if test="${LoginMember.passuser == 2}">

<li><a href="DriverMyPage">마이페이지 기사용</a></li>
</c:if>
<c:if test="${LoginMember.passuser == 1}">
<li><a href="UserMyPage">마이페이지 유저용</a></li>
</c:if>
       
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">MORE
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="RoomList">방목록보기</a></li>
            <li><a href="RoomList2">예약가능한 방목록보기</a></li>
            
          </ul>
        </li>
       
      </ul>
    </div>
  </div>
</nav>


<br>
<br>
<br>
<br>

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-light-grey w3-collapse w3-top" style="z-index:3;width:260px" id="mySidebar">
  <div class="w3-container w3-display-container w3-padding-16">
    <i onclick="w3_close()" class="fa fa-remove w3-hide-large w3-button w3-transparent w3-display-topright"></i>
    
<br>
<br>
<br>
<br>
    <h2>경로 검색 </h2>
   
    <hr>
    <form name="form" id="form" method="post">
      <p><label><i class="fa fa-calendar-check-o"></i> 출발지</label></p>
      <input class="w3-input w3-border" type="text"   name="Start" id="roadAddrPart1" disabled="disabled" value="${RoomMap.rStart }">
      <br>          
      <p><label><i class="fa fa-calendar-o"></i> 도착지</label></p>
      <input class="w3-input w3-border" type="text"  name="end" id="roadAddrPart2" disabled="disabled" value="${RoomMap.rEnd }">         
      <br>
      </form> 
      <p><button class="w3-button w3-block w3-green w3-left-align" onclick="initTmap()" ><i class="fa fa-search w3-margin-right"></i> 경로검색 </button></p> <br>
       <p><button class="w3-button w3-block w3-green w3-left-align" onclick="location.href='RoomInfo?roomId=${RoomMap.roomId}&opGender=${RoomMap.opGender}'" ><i class="fa fa-search w3-margin-right"></i> 돌아가기 </button></p> <br>
        
       
    
    
<p>    <button class="btn btn-info" onclick="location.href='RoomList'" ><i class="fa fa-search w3-margin-center"></i> 실시간 방목록보기 </button> </p><br>
<p>    <button class="btn btn-info" onclick="location.href='RoomList2'" ><i class="fa fa-search w3-margin-center"></i> 예약 방목록보기 </button> </p>
   
  </div>
</nav>


<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main w3-white" style="margin-left:260px"></div>

  <!-- Push down content on small screens -->
  <div class="w3-hide-large" style="margin-top:80px"></div>

  <div class="w3-container" id="apartment">
    <div class="w3-display-container mySlides">
    <img src="/w3images/livingroom.jpg" style="width:100%;margin-bottom:-6px">
      <div class="w3-display-bottomleft w3-container w3-black">
       
      </div>
    </div>
    </div>
 
<div class="main_0 main_common" id="map_div"></div>
 <!--  <div class="w3-container">
  
    <h4><strong>The space</strong></h4>
    <div class="w3-row w3-large">
      <div class="w3-col s6">
        <p><i class="fa fa-fw fa-male"></i> Max people: 4</p>
        <p><i class="fa fa-fw fa-bath"></i> Bathrooms: 2</p>
  
      </div> -->
      <div class="w3-col s6">
        <div class="main_1 main_common" id="tDistance"></div>
      <div class="main_2 main_common" id="tTime"></div>
      <div class="main_3 main_common" id="taxiFare">  </div>
     
     
      </div>
    </div>
 
 </div>
<script>
// Script to open and close sidebar when on tablets and phones
function w3_open() {
    document.getElementById("mySidebar").style.display = "block";
    document.getElementById("myOverlay").style.display = "block";
}
 
function w3_close() {
    document.getElementById("mySidebar").style.display = "none";
    document.getElementById("myOverlay").style.display = "none";
}

</script>

</body>

</html>

