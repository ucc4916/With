<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
    <head>
    
    <style>
.main{
     background-color: yellow;
     border: 1px solid red;
}
 
.main_common{
    display: inline-block;
    float: left;
    width: 100px;
    height: 100px;
    border: 1px solid blue;
}
</style>
										<!-- 정진이형 키 : 1c6bbbf0-74bd-4727-936f-0acdeb2a47cb -->
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>With</title>
        <script type="text/javascript" src="resources/js/jquery-3.1.1.min.js"></script>
        <script src="https://api2.sktelecom.com/tmap/js?version=1&format=javascript&appKey=9678b2f0-469e-4b2b-94bc-988d16431c07"></script>
        <script type="text/javascript">
			function initTmap(){
				var map, marker;	
				// 1. 지도 띄우기
				// map 생성
				// Tmap.map을 이용하여, 지도가 들어갈 div, 넓이, 높이를 설정합니다.
				map = new Tmap.Map({
					div : 'map_div',// map을 표시해줄 div
					width : "100%",// map의 width 설정
					height : "400px",// map의 height 설정
				});
				map.setCenter(new Tmap.LonLat("126.986072", "37.570028").transform("EPSG:4326", "EPSG:3857"), 15);//설정한 좌표를 "EPSG:3857"로 좌표변환한 좌표값으로 즁심점을 설정합니다.
				var markerLayer = new Tmap.Layer.Markers("marker");
				map.addLayer(markerLayer);

				// 2. API 사용요청
				var lon, lat;
				map.events.register("click", map, onClickMap); //map 클릭 이벤트 등록 	
				// map을 클릭했을 때 발생하는 이벤트 함수입니다.
				function onClickMap(evt){
					markerLayer.removeMarker(marker); // 기존 마커 삭제
					var px = new Tmap.Pixel(evt.xy.x, evt.xy.y); //이벤트가 발생했을때 클릭한 지점의 x,y 픽셀값을 가져옵니다.
					var lonlat = map.getLonLatFromViewPortPx(evt.xy);//클릭지점의 픽셀값을 좌표로 변환해줍니다.
					lonlat = lonlat.transform(new Tmap.Projection("EPSG:3857"),new Tmap.Projection("EPSG:4326"));//좌표를 "EPSG:4326"로 좌표변환한 좌표값으로 설정합니다.
					console.log(lonlat.toString()); //콘솔창에서 클릭지점의 좌표를 확인할 수 있습니다.
					
					lon=lonlat.lon; // 경도를 클릭좌표의 경도로 설정합니다.
					lat=lonlat.lat; // 위도를 클릭좌표의 위도로 설정합니다.
					reverseGeo(lon, lat);
					
					var size = new Tmap.Size(24, 38);//아이콘 크기 설정
					var offset = new Tmap.Pixel(-(size.w / 2), -size.h);//아이콘 중심정 설정
					var icon = new Tmap.IconHtml("<img src='http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_p.png' />", size, offset);//마커 아이콘 설정
					marker = new Tmap.Marker(new Tmap.LonLat(lon, lat).transform("EPSG:4326", "EPSG:3857"), icon);//설정한 좌표를 "EPSG:3857"로 좌표변환 한 좌표값으로 설정합니다.
					markerLayer.addMarker(marker);//마커 레이어에 마커 추가
				}

				function reverseGeo(lon, lat){
					$.ajax({
						method:"GET",
						url:"https://api2.sktelecom.com/tmap/geo/reversegeocoding?version=1&format=json&callback=result", // ReverseGeocoding api 요청 url입니다.
						async:false,
						data:{
							"coordType" : "WGS84GEO", //지구 위의 위치를 나타내는 좌표 타입
							"addressType" : "A10",  // 주소 타입 입니다.
							"lon" : lon,
							"lat" : lat,
							"appKey" : "9678b2f0-469e-4b2b-94bc-988d16431c07", //실행을 위한 키 입니다. 발급받으신 AppKey를 입력하세요.
						},
						//데이터 로드가 성공적으로 완료되었을 때 발생하는 함수입니다.
						success:function(response){
							prtcl = response;
							
							// 3. json에서 주소 파싱
							var arrResult = prtcl.addressInfo;
							
							//법정동 마지막 문자 
							var lastLegal = arrResult.legalDong.charAt(arrResult.legalDong.length-1);
							
							// 새주소
							newRoadAddr = arrResult.city_do + ' ' + arrResult.gu_gun + ' '; 
							
							if(arrResult.eup_myun == '' && (lastLegal=="읍"||lastLegal=="면")){//읍면
								newRoadAddr +=  arrResult.legalDong;	
							}else{
								newRoadAddr +=  arrResult.eup_myun;
							}
							newRoadAddr += ' ' +arrResult.roadName + ' ' + arrResult.buildingIndex;
							
							// 새주소 법정동& 건물명 체크
							if(arrResult.legalDong != '' && (lastLegal!="읍"&&lastLegal!="면")){//법정동과 읍면이 같은 경우
								
								if(arrResult.buildingName != ''){//빌딩명 존재하는 경우
									newRoadAddr +=  (' (' + arrResult.legalDong + ', ' +arrResult.buildingName +') ');
								}else{
									newRoadAddr += (' (' + arrResult.legalDong + ')');
								}
							}else if(arrResult.buildingName != ''){//빌딩명만 존재하는 경우
								newRoadAddr +=  (' (' + arrResult.buildingName +') ');
							}
							
							// 구주소
							jibunAddr = arrResult.city_do + ' ' + arrResult.gu_gun + ' ' + arrResult.legalDong + ' '+ arrResult.ri + ' ' + arrResult.bunji;
							//구주소 빌딩명 존재
							if(arrResult.buildingName != ''){//빌딩명만 존재하는 경우
								jibunAddr +=  (' '+arrResult.buildingName);
							}
							
							result="새주소 : "+newRoadAddr+"</br>";
							result+="지번주소 : "+jibunAddr+"</br>";
							result="경도 : "+lon+"</br>";
							result+="위도 : "+lat;
							
							var resultDiv = document.getElementById("result");//결과를 출력할 태그를 찾습니다.
							resultDiv.innerHTML = result;//결과를 html에 출력합니다.
							
							
						},
						//요청 실패시 콘솔창에서 에러 내용을 확인할 수 있습니다.
						error:function(request,status,error){
							console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}
					});
					
				}
			}
			</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body onload="initTmap()">
        <div style="float:left;" id="map_div" >
        </div>
        <div id=result></div>

</body>
</html>