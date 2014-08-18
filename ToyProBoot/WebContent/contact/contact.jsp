<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <div class="container">
  
        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Contact
                    <small></small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="index.html">Home</a></li>
                    <li class="active">Contact</li>
                </ol>
            </div>
        </div>
        <!-- /.row -->
        
  	<div class="row">
  		<div class="col-md-8">
	  		<div id="map_canvas">
	
	  		</div>
		</div>
		<div class="col-md-4">
				<form class="form-horizontal" role="form">
					<div class="form-group">
						<select class="form-control" id="guSelect" name="guCode">
			  				<option value="">구 검색</option>
			  				<option value="1">강남구</option>
			  				<option value="2">강동구</option>
			  				<option value="3">강북구</option>
			  				<option value="4">강서구</option>
			  				<option value="5">관악구</option>
			  				<option value="6">광진구</option>
			  				<option value="7">구로구</option>
			  				<option value="8">금천구</option>
			  				<option value="9">노원구</option>
			  				<option value="10">도봉구</option>
			  				<option value="11">동대문구</option>
			  				<option value="12">동작구</option>
			  				<option value="13">마포구</option>
			  				<option value="14">서대문구</option>
			  				<option value="15">서초구</option>
			  				<option value="16">성동구</option>
			  				<option value="17">성북구</option>
			  				<option value="18">송파구</option>
			  				<option value="19">양천구</option>
			  				<option value="20">영등포구</option>
			  				<option value="21">용산구</option>
			  				<option value="22">은평구</option>
			  				<option value="23">종로구</option>
			  				<option value="24">중구</option>
			  				<option value="25">중랑구</option>
			  			</select>
					</div>
					<div class="form-group">
						<select class="form-control" id="rentalName" name="searchConditionCate">
			  				<option value="">지점 검색</option>
			  			</select>
					</div>
				  <div class="form-group">
				    <label for="inputEmail1" class="col-lg-2 control-label"> Start &nbsp;&nbsp;</label>
				    <div class="col-lg-10">
				      <input type="text" class="form-control" id="startLocation" placeholder="현재 위치">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="inputPassword1" class="col-lg-2 control-label"> End &nbsp;&nbsp;</label>
				    <div class="col-lg-10">
				      <input type="text" class="form-control" id="endLocation" placeholder="목적지 위치">
				    </div>
				  </div>
				  <div class="form-group">
				    <div class="col-lg-offset-2 col-lg-10">
				      <button type="button" class="btn btn-default" id="search">길 찾기</button>
				    </div>
  				</div>
			</form>
		</div>
  	</div>
  	<!-- <div class="row">
  		<div class="col-md-6">
  			<select class="form-control" id="guSelect" name="guCode">
  				<option value="">구 검색</option>
  				<option value="1">강남구</option>
  				<option value="2">강동구</option>
  				<option value="3">강북구</option>
  				<option value="4">강서구</option>
  				<option value="5">관악구</option>
  				<option value="6">광진구</option>
  				<option value="7">구로구</option>
  				<option value="8">금천구</option>
  				<option value="9">노원구</option>
  				<option value="10">도봉구</option>
  				<option value="11">동대문구</option>
  				<option value="12">동작구</option>
  				<option value="13">마포구</option>
  				<option value="14">서대문구</option>
  				<option value="15">서초구</option>
  				<option value="16">성동구</option>
  				<option value="17">성북구</option>
  				<option value="18">송파구</option>
  				<option value="19">양천구</option>
  				<option value="20">영등포구</option>
  				<option value="21">용산구</option>
  				<option value="22">은평구</option>
  				<option value="23">종로구</option>
  				<option value="24">중구</option>
  				<option value="25">중랑구</option>
  			</select>
  		</div>
  		<div class="col-md-6">
  			<select class="form-control" id="rentalName" name="searchConditionCate">
  				<option value="">지점 검색</option>
  			</select>
  		</div>
  	</div> -->
  	
  	<hr>
        
        <jsp:include page="../layout/footer.jsp"></jsp:include>
  </div>

<script type="text/javascript">

	initialize();
	
	var directionsDisplay;
    var directionsService = new google.maps.DirectionsService();
    var map;
    
	$(document).ready(function()
	{
		var MarkersArray = [];
		var Coordinates= [];
		var travelPathArray = [];
		var marker;
		
		
	    $('#guSelect').change(function()
	    {
	        /* alert( $("#guSelect option:selected").val() ); */
	        var guCode = $("#guSelect option:selected").val();
	    	/* alert(guCode); */
	        
	        var url = "/app/contact/getRentalShopData/"+guCode;
	        /* alert(url); */
	        
	        $.ajax(
	        {
	        	type : "POST",
	        	url : url,
	        	contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		        success: function(msg)
		        {
		        	/* alert(msg); */
		        	createSelectOption(msg);
		        }
	        });
	    });
	    
	    function createSelectOption(msg)
	    {
	    	/* alert("createSelectOption안에서의 "+msg); */
	    	var optionValue = eval("("+msg+")");
	    	/* alert("파싱한 데이터 : "+optionValue[0].rentalName); */

	    	/* alert(optionValue.length); // 리스트의 크기 */
	    	
	    	$("#rentalName").empty();
	    	$("#rentalName").append($("<option>").attr("value", "").text("지점 검색"));
	    	
	    	for(var i = 0 ; i < optionValue.length ; i++)
	    	{
	    		/* $<"option">.attr("value", optionValue[i].rentalCode).text(optionValue[i].rentalName); */
	    		$("#rentalName").append($("<option>").attr("value", optionValue[i].rentalCode).text(optionValue[i].rentalName));
	    	}
	    }
	    
	    $('#rentalName').change(function()
	    {
	    	var rentalCode = $("#rentalName option:selected").val();
	    	/* alert(rentalCode); */
	    	var url = "/app/contact/getLocation/"+rentalCode;
	    	
	    	$.ajax(
	    	{
	    		type : "POST",
	    		url : url,
	    		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	    		success: function(msg)
	    		{
	    			/* alert(msg); */
	    			/* createSelectOption(msg); */
	    			showMap(msg);
	    		}
	    	});
	    });
	    
	    function showMap(msg)
	    {
	    	directionsDisplay = new google.maps.DirectionsRenderer();
	    	var locationInfo = eval("("+msg+")");
	    	
	    	$('#map_canvas').empty();
	    	
	    	/* alert(locationInfo[0].latitude);
	    	alert(locationInfo[0].longitude); */
	    	
	    	var myLatlng = new google.maps.LatLng(locationInfo[0].latitude, locationInfo[0].longitude);
	    	
	    	var myOptions = {
	    			  zoom: 17,
	    			  center: myLatlng,
	    			  mapTypeId: google.maps.MapTypeId.ROADMAP
	    			}
	    			map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
	    			
	    			marker = new google.maps.Marker({
	    			        position: myLatlng,
	    			        map: map,
	    			        title: 'Click to zoom'
	    			    });

	    			/* google.maps.event.addListener(map, 'click', function(event) { 
	    			  var marker = new google.maps.Marker({ 
	    			  position: myLatlng, 
	    			  map: map,
	    			  title: '위치마커'
	    			});
	    			  */
	    			attachMessage(marker, myLatlng); 
	    			  /*
	    			//선을 그리기 위해 좌표를 넣는다.
	    			Coordinates.push( event.latLng ); 
	    			//마커 담기
	    			MarkersArray.push(marker);
	    			        //array에 담은 위도,경도 데이타를 가지고 동선 그리기
	    			flightPath();
	    			}); */
	    			directionsDisplay.setMap(map);
	    }


	    			//해당 위치에 주소를 가져오고, 마크를 클릭시 infowindow에 주소를 표시한다.
	    			function attachMessage(marker, latlng) {
	    				/* alert(latlng); */
	    			geocoder = new google.maps.Geocoder();
	    			 geocoder.geocode({'latLng': latlng}, function(results, status) {
	    			     if (status == google.maps.GeocoderStatus.OK) {
	    			if (results[0]) {
	    			var address_nm = results[0].formatted_address;
	    			/* alert(address_nm); */
	    			$("#endLocation").val(address_nm);
	    			/* var infowindow = new google.maps.InfoWindow(
	    			     { content: address_nm,
	    			size: new google.maps.Size(50,50)
	    			     });
	    			 google.maps.event.addListener(marker, 'click', function() {
	    			   infowindow.open(map,marker);
	    			 }); */
	    			}
	    			     } else {
	    			alert('주소 가져오기 오류!'); 
	    			     }
	    			});
	    			}
					/*
	    			//동선그리기
	    			function flightPath(){
	    			for (i in travelPathArray){
	    			travelPathArray[i].setMap(null);
	    			}
	    			var flightPath = new google.maps.Polyline({
	    			path: Coordinates,
	    			strokeColor: "#FF0000",
	    			strokeOpacity: 0.3,
	    			strokeWeight: 2
	    			});
	    			flightPath.setMap(map);
	    			travelPathArray.push(flightPath);
	    			} */
	    			
	    			$('#search').click(function()
	    			{
	    			      var start = document.getElementById('startLocation').value;
	    			      var end = document.getElementById('endLocation').value;
	    			      var mode = "TRANSIT";
	    			      // DRIVING, WALKING, BICYCLING, TRANSIT 4가지 방법 지원하지만
	    			      // 국내 Driving, Walking은 잘 안된다.
	    			 		/* alert(start);
	    			 		alert(end);
	    			 		alert(mode); */
	    			      
	    			      var request = {
	    			          origin:start,
	    			          destination:end,
	    			          travelMode: eval("google.maps.DirectionsTravelMode."+mode)
	    			      };
	    			      directionsService.route(request, function(response, status) {
	    			        /* alert(status);  // 확인용 Alert..미사용시 삭제 */
	    			        if (status == google.maps.DirectionsStatus.OK) {
	    			            directionsDisplay.setDirections(response);
	    			        }
	    			      });
	    		});
	    
	});
</script>

