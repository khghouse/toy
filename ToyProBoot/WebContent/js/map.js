
// 마크, 동선을 그리고 난 후 해당 위치를 array에 저장합니다.
var MarkersArray = [];
var Coordinates= [];
var travelPathArray = [];
var map;
var marker;
//var seoulmarker = new google.LatLng(37.5172399872365, 127.0371735)

function initialize() {
	        if (navigator.geolocation)
	        {
	            /*$("#latlng").html("");
	            $("#errormsg").html("");*/
	            navigator.geolocation.getCurrentPosition (function (pos)
	            {
	                lat = pos.coords.latitude;
	                lng = pos.coords.longitude;
	 
	                var mapOptions = {
	                    zoom: 16,
	                    mapTypeId: google.maps.MapTypeId.ROADMAP,
	                    center: new google.maps.LatLng(lat,lng)
	                };
	                map = new google.maps.Map(document.getElementById('map_canvas'),mapOptions);
	                /*var myIcon = new google.maps.MarkerImage("http://google-maps-icons.googlecode.com/files/restaurant.png", null, null, null, new google.maps.Size(17,17));*/
	                var marker = new google.maps.Marker({
	                    position: new google.maps.LatLng(lat,lng),
	                    map: map,
	                    draggable: false,
	                    /*icon: myIcon*/
	                });
	                
	                var myLatlng = new google.maps.LatLng(lat, lng);
	                attachMessage(marker, myLatlng); 
	                
	                markers.push(marker);
	            },function(error)
	            {
	                switch(error.code)
	                {
	                    case 1:
	                        $("#errormsg").html("User denied the request for Geolocation.");
	                        break;
	                    case 2:
	                        $("#errormsg").html("Location information is unavailable.");
	                        break;
	                    case 3:
	                        $("#errormsg").html("The request to get user location timed out.");
	                        break;
	                    case 0:
	                        $("#errormsg").html("An unknown error occurred.");
	                        break;
	                }
	            });
	        }
	        else
	        {
	            $("#errormsg").html("Geolocation is not supported by this browser.");
	        }
	        
	        function attachMessage(marker, latlng) {
			geocoder = new google.maps.Geocoder();
			 geocoder.geocode({'latLng': latlng}, function(results, status) {
			     if (status == google.maps.GeocoderStatus.OK) {
			if (results[0]) {
			var address_nm = results[0].formatted_address;
			$("#startLocation").val(address_nm);
			/*alert(address_nm);*/
			/*var infowindow = new google.maps.InfoWindow(
			     { content: address_nm,
			size: new google.maps.Size(50,50)
			     });
			 google.maps.event.addListener(marker, 'click', function() {
			   infowindow.open(map,marker);
			 });*/
			}
			     } else {
			alert('주소 가져오기 오류!'); 
			     }
			});
			}
	    
}


