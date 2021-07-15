<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="map" style="width: 95%; height: 90%; margin: auto; position: relative; z-index: 0;"></div>
<script type="text/javascript"src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8562e9b0d0ed2cdc824566d1eae42485"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="../resources/util/util.js" type="text/javascript"></script>
<script>
	var lat = "${latitude}";
	var lon = "${hardness}";
	
	if (lat == ""){
		lat = 37.49846454396237;
	} 
	
	if (lon == ""){
		lon = 126.86528924290542;
	}

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new kakao.maps.LatLng(37.49846454396237, 126.86528924290542), // 지도의 중심좌표
		level : 5
	// 지도의 확대 레벨 
	};

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	var locPosition = new kakao.maps.LatLng(lat, lon)
	displayMarker(locPosition);

	function displayMarker(locPosition, message) {

		var iwContent = message, // 인포윈도우에 표시할 내용
		iwRemoveable = true;

		// 지도 중심좌표를 접속위치로 변경합니다
		map.setCenter(locPosition);
	}

	var positions = new Array();
	
	<c:forEach items="${parkingList}" var="pk">
		var pkmk = {
			prk_plc_cd : '${pk.prk_plc_cd}'
			,prkplceno : '${pk.prkplceno}'
			,latlng : new daum.maps.LatLng('${pk.latitude}','${pk.hardness}')
			,content : 
			'<div class="wrap">' + 
		    '    <div class="info">' + 
		    '        <div class="title">' + 
		    '            ${pk.prkplcenm}' +
		    '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
		    '        </div>' + 
		    '        <div class="body">' + 
		    '            <div class="img">' +
		    '                <img src="../resources/img/placeImages/${pk.parkimg}" width="100" height="90">' +
		    '           </div>' + 
		    '            <div class="desc">' + 
		    '                <div class="ellipsis">${pk.rdnmadr}</div>' + 
		    '                <div class="jibun ellipsis">하루요금 : ${pk.daycmmtkt}</div>' + 
		    '                <div><a href="javascript:openPopup(${pk.prkplceno});">상세보기</a></div>' + 
		    '            </div>' + 
		    '        </div>' + 
		    '    </div>' +    
		    '</div>'			
			
		}
		positions.push(pkmk);
	</c:forEach>
	
	var marker;

	for (var i = 0; i < positions.length; i++) {

		var imageSrc;

		if (positions[i].prk_plc_cd === "001") {
			imageSrc = "../resources/img/marker/mk2.png";
		} else if (positions[i].prk_plc_cd === "002") {
			imageSrc = "../resources/img/marker/mk1.png";
		} else {
			imageSrc = "../resources/img/marker/mk3.png";
		}

		var imageSize = new daum.maps.Size(40, 45);
		var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize);
		var marker = new daum.maps.Marker({
			map : map, // 마커를 표시할 지도
			position : positions[i].latlng, // 마커를 표시할 위치
			image : markerImage, // 마커 이미지 
			prkplceno : positions[i].prkplceno,
		});

		var pkno = positions[i].prkplceno;
		var content = positions[i].content;
		var position = positions[i].latlng;

		daum.maps.event.addListener(marker, 'click', openOverlay(pkno, content, position));

	}

	function openOverlay(pkno, content, position) {
		return function() {
			overlay.setPosition(position);
			overlay.setContent(content);
			overlay.setMap(map);
		}
	}

	var overlay = new kakao.maps.CustomOverlay({
		content : content,
		map : map,
		position : position
	});

	function closeOverlay() {
		overlay.setMap(null);
	}

	function openPopup(prkplceno) {
		
		var session = '${sessionScope.loginId}';
		if(!sessionCheck(session)) return;
		
		window.open(
					"../parking/parkingDtl?pkno=" + prkplceno,
					"new",
					"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=1000, height=900, left=0, top=0");

	}
</script>