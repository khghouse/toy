<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <!-- Page Content -->
    <div class="container">

        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Toy Search
                    <small></small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="index.html">Home</a></li>
                    <li class="active">Search</li>
                </ol>
            </div>
        </div>
        <!-- /.row -->

        <!-- Content Row -->
        <div class="well">
    	    <div class="row">
  				<div class="col-md-4">
  					<select class="form-control" id="subject" name="searchConditionCate">
        				<option value="">분류 검색</option>
						<c:choose>
							<c:when test="${search.searchConditionCate == '000' }"><option value="000" selected="selected">자동차류</option></c:when>
							<c:otherwise><option value="000">자동차류</option></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${search.searchConditionCate == '100' }"><option value="100" selected="selected">역할놀이</option></c:when>
							<c:otherwise><option value="100">역할놀이</option></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${search.searchConditionCate == '200' }"><option value="200" selected="selected">조립류</option></c:when>
							<c:otherwise><option value="200">조립류</option></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${search.searchConditionCate == '300' }"><option value="300" selected="selected">신체놀이</option></c:when>
							<c:otherwise><option value="300">신체놀이</option></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${search.searchConditionCate == '400' }"><option value="400" selected="selected">퍼즐(종이)류</option></c:when>
							<c:otherwise><option value="400">퍼즐(종이)류</option></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when  test="${search.searchConditionCate == '500' }"><option value="500" selected="selected">블럭</option></c:when>
							<c:otherwise><option value="500">블럭</option></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${search.searchConditionCate == '600' }"><option value="600" selected="selected">음률</option></c:when>
							<c:otherwise><option value="600">음률</option></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${search.searchConditionCate == '700' }"><option value="700" selected="selected">비디오</option></c:when>
							<c:otherwise><option value="700">비디오</option></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${search.searchConditionCate == '800' }"><option value="800" selected="selected">기타</option></c:when>
							<c:otherwise><option value="800">기타</option></c:otherwise>
						</c:choose>
        			</select></div>
  				<div class="col-md-4">
  					<select class="form-control" id="age" name="searchConditionAge">
        				<option value="" selected="selected">연령 검색</option>
						<c:choose>
							<c:when test="${search.searchConditionAge == '0세~1세' }"><option value="0세~1세" selected="selected">0세~1세</option></c:when>
							<c:otherwise><option value="0세~1세">0세~1세</option></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${search.searchConditionAge == '1세~2세' }"><option value="1세~2세" selected="selected">1세~2세</option></c:when>
							<c:otherwise><option value="1세~2세">1세~2세</option></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${search.searchConditionAge == '2세~3세' }"><option value="2세~3세" selected="selected">2세~3세</option></c:when>
							<c:otherwise><option value="2세~3세">2세~3세</option></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${search.searchConditionAge == '3세~4세' }"><option value="3세~4세" selected="selected">3세~4세</option></c:when>
							<c:otherwise><option value="3세~4세">3세~4세</option></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${search.searchConditionAge == '4세~5세' }"><option value="4세~5세" selected="selected">4세~5세</option></c:when>
							<c:otherwise><option value="4세~5세">4세~5세</option></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${search.searchConditionAge == '5세이상' }"><option value="5세이상" selected="selected">5세이상</option></c:when>
							<c:otherwise><option value="5세이상">5세이상</option></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${search.searchConditionAge == '전체연령' }"><option value="전체연령" selected="selected">전체연령</option></c:when>
							<c:otherwise><option value="전체연령">전체연령</option></c:otherwise>
						</c:choose>
        			</select>
        		</div>
  				<div class="col-md-4">
					<input type="text" class="form-control" name="searchKeyword" id="keyword" placeholder="장난감 명" onkeydown="keywordSearch()">
					<!-- <button type="button" class="btn btn-primary" data="/app/show" id="btnSearch">검 색</button> -->
  				</div>

			</div>
		</div>

        <div class="row" id="imageContainer">
            <div id="map" class="col-md-12 img-portfolio">
                <center>
       	            <img class="img-responsive img-hover" src="../images/map.png" alt="" >
       	            
       	            <div id="b1"  onmouseover="this.title='강남구육아종합지원센터(개포점)'" style="position:absolute;top:75%;left:66.6%;width:3%;height:3%;cursor: pointer;"  onclick="clickMap('1');"><span></span></div>
       	            <div id="b2" onmouseover="this.title='강남구육아종합지원센터(논현점)'" style="position:absolute;top:62%;left:58.5%;width:3%;height:3%;cursor: pointer;" onclick="clickMap('2');"><span></span></div>
       	            <div id="b3" onmouseover="this.title='강남구육아종합지원센터(대치점)'" style="position:absolute;top:69%;left:65%;width:3%;height:3%;cursor: pointer;"onclick="clickMap('3');"><span></span></div>
       	            <div id="b4" onmouseover="this.title='강남구육아종합지원센터(도곡점)'" style="position:absolute;top:75%;left:59%;width:3%;height:3%;cursor: pointer;"onclick="clickMap(4);"><span></span></div>
       	            <div id="b5" onmouseover="this.title='동동레코텍(성내점)'" style="position:absolute;top:57.2%;left:77.6%;width:3%;height:3%;cursor: pointer;"onclick="clickMap(5);"><span></span></div>
       	            <div id="b6" onmouseover="this.title='동동레코텍(천호점)'" style="position:absolute;top:49.7%;left:82%;width:3%;height:3%;cursor: pointer;"onclick="clickMap(6);"><span></span></div>
       	            <div id="b7" onmouseover="this.title='강북구장난감도서관'" style="position:absolute;top:13.4%;left:57.7%;width:3%;height:3%;cursor: pointer;"onclick="clickMap(7);"><span></span></div>
       	            <div id="b8" onmouseover="this.title='강북구장난감나라'" style="position:absolute;top:8.5%;left:53%;width:3%;height:3%;cursor: pointer;"onclick="clickMap(8);"><span></span></div>
       	            <div id="b9" onmouseover="this.title='키득키득놀잇감터'" style="position:absolute;top:48.3%;left:11%;width:3%;height:3%;cursor: pointer;"onclick="clickMap(9);"><span></span></div>
       	            <!-- <div  onmouseover="this.title='관악구'" style="background-color:red;position:absolute;top:80%;left:65%;width:3%;height:3%;cursor: pointer;"onclick="alert('dd');"><span></span></div> -->

       	            
       	            <div id="b11" onmouseover="this.title='재미씨앗'" style="position:absolute;top:46%;left:66.5%;width:3%;height:3%;cursor: pointer;"onclick="clickMap(11);"><span></span></div>
       	            <div id="b12" onmouseover="this.title='구로꿈나무장난감나라(구로)'" style="position:absolute;top:74%;left:24.5%;width:3%;height:3%;cursor: pointer;"onclick="clickMap(12);"><span></span></div>
       	            <div id="b13" onmouseover="this.title='구로꿈나무장난감나라(개봉)'" style="position:absolute;top:70.5%;left:17.5%;width:3%;height:3%;cursor: pointer;"onclick="clickMap(13);"><span></span></div>
       	            <div id="b14" onmouseover="this.title='장난감나라(시흥)'" style="position:absolute;top:88.5%;left:26.5%;width:3%;height:3%;cursor: pointer;"onclick="clickMap(14);"><span></span></div>
       	            <div id="b15" onmouseover="this.title='장난감나라(독산)'" style="position:absolute;top:82.5%;left:27%;width:3%;height:3%;cursor: pointer;"onclick="clickMap(15);"><span></span></div>
       	            <div id="b16" onmouseover="this.title='노원정보장난감도서관'" style="position:absolute;top:-0.4%;left:64.8%;width:3%;height:3%;cursor: pointer;"onclick="clickMap(16);"><span></span></div>
       	            <div id="b17" onmouseover="this.title='도봉구육아종합지원센터'" style="position:absolute;top:-1%;left:57%;width:3%;height:3%;cursor: pointer;"onclick="clickMap(17);"><span></span></div>
       	            <div id="b18" onmouseover="this.title='보듬이나눔이영유아플라자'" style="position:absolute;top:11.5%;left:61.3%;width:3%;height:3%;cursor: pointer;"onclick="clickMap(18);"><span></span></div>
       	            <div id="b19" onmouseover="this.title='동대문구영유아플라자(답십리)'" style="position:absolute;top:38.5%;left:60.8%;width:3%;height:3%;cursor: pointer;"onclick="clickMap(19);"><span></span></div>
       	            <div id="b20" onmouseover="this.title='동대문구영유아플라자(제기)'" style="position:absolute;top:33.2%;left:58%;width:3%;height:3%;cursor: pointer;"onclick="clickMap(20);"><span></span></div>
       	            
       	            <div id="b21" onmouseover="this.title='동작구육아종합지원센터'" style="position:absolute;top:67.5%;left:32.8%;width:3%;height:3%;cursor: pointer;"onclick="clickMap(21);"><span></span></div>
       	            <div id="b22" onmouseover="this.title='로야장난감대여점'" style="position:absolute;top:67%;left:39%;width:3%;height:3%;cursor: pointer;"onclick="clickMap(22);"><span></span></div>
       	            <div id="b23" onmouseover="this.title='사당영유아돌보미센터'" style="position:absolute;top:79.8%;left:45.5%;width:3%;height:3%;cursor: pointer;"onclick="clickMap(23);"><span></span></div>
       	            <div id="b24" onmouseover="this.title='신대방영유아돌보미센터'" style="position:absolute;top:74.4%;left:29.5%;width:3%;height:3%;cursor: pointer;"onclick="clickMap(24);"><span></span></div>
       	            <div id="b25" onmouseover="this.title='도화장난감대여점'" style="position:absolute;top:52.5%;left:39.2%;width:3%;height:3%;cursor: pointer;"onclick="clickMap(25);"><span></span></div>
       	            <div id="b26" onmouseover="this.title='망원장난감대여점'" style="position:absolute;top:45.4%;left:28.8%;width:3%;height:3%;cursor: pointer;"onclick="clickMap(26);"><span></span></div>
       	            <div id="b27" onmouseover="this.title='서대문구육아종합지원센터'" style="position:absolute;top:33.5%;left:35.8%;width:3%;height:3%;cursor: pointer;"onclick="clickMap(27);"><span></span></div>
       	            <div id="b28" onmouseover="this.title='서초구육아종합지원센터'" style="position:absolute;top:76%;left:57%;width:3%;height:3%;cursor: pointer;"onclick="clickMap(28);"><span></span></div>
       	            <div id="b29" onmouseover="this.title='무지개장난감세상'" style="position:absolute;top:42.2%;left:58.5%;width:3%;height:3%;cursor: pointer;"onclick="clickMap(29);"><span></span></div>
       	            <div id="b30" onmouseover="this.title='장난감이좋아'" style="position:absolute;top:23.6%;left:58.7%;width:3%;height:3%;cursor: pointer;"onclick="clickMap(30);"><span></span></div>
       	            
       	            <div id="b31" onmouseover="this.title='sb장난감도서관'" style="position:absolute;top:30.8%;left:54%;width:3%;height:3%;cursor: pointer;"onclick="clickMap(31);"><span></span></div>
       	            <div id="b32" onmouseover="this.title='놀이감대여실'" style="position:absolute;top:68.3%;left:79%;width:3%;height:3%;cursor: pointer;"onclick="clickMap(32);"><span></span></div>
       	            <div id="b33" onmouseover="this.title='양천구육아종합지원센터'" style="position:absolute;top:62.5%;left:19.5%;width:3%;height:3%;cursor: pointer;"onclick="clickMap(33);"><span></span></div>
       	            <div id="b35" onmouseover="this.title='용산아이노리장난감나라'" style="position:absolute;top:54%;left:44.3%;width:3%;height:3%;cursor: pointer;"onclick="clickMap(35);"><span></span></div>
       	            <div id="b36" onmouseover="this.title='라온장난감나라'" style="position:absolute;top:18.5%;left:29%;width:3%;height:3%;cursor: pointer;"onclick="clickMap(36);"><span></span></div>
       	            <div id="b37" onmouseover="this.title='종로구육아종합지원센터'" style="position:absolute;top:36.7%;left:41%;width:3%;height:3%;cursor: pointer;"onclick="clickMap(37);"><span></span></div>
					<div id="b38" onmouseover="this.title='신당장난감도서관(키즈토이)'" style="position:absolute;top:43%;left:53.5%;width:3%;height:3%;cursor: pointer;"onclick="clickMap(38);"><span></span></div>
       	            <div id="b39" onmouseover="this.title='중림장난감도서관(키즈토이)'" style="position:absolute;top:44%;left:42.5%;width:3%;height:3%;cursor: pointer;"onclick="clickMap(39);"><span></span></div>
       	            <div id="b40" onmouseover="this.title='장난감대여센터(중랑) '" style="position:absolute;top:28.5%;left:66.8%;width:3%;height:3%;cursor: pointer;"onclick="clickMap(40);"><span></span></div>
       	            <div id="b41" onmouseover="this.title='장난감대여센터(명랑)'" style="position:absolute;top:34%;left:68%;width:3%;height:3%;cursor: pointer;"onclick="clickMap(41);"><span></span></div>
       	         
       	            
                </center>
            </div>
        </div>
        <!-- /.row -->
        
     	<div class="container">
		<div id="search_list"><div class="row"></div></div>
		<div id="search_page"></div>
		</div>

		<hr>
		
		<!-- Pagination -->
        <div class="row text-center">
            <div class="col-lg-12">
                <ul class="pagination">
                </ul>
            </div>
        </div>
        <!-- /.row -->
        
        <hr>
        
        <jsp:include page="../layout/footer.jsp"></jsp:include>
    </div>
    <!-- /.container -->
    
<script type="text/javascript">
/* $('(div />+)'

var $imageContainer = $("#imageContainer");
var $row = $("<div>aaaaaaaaaaaaaa안녕</div>");
$row.addClass('row');
$row.insertAfter($imageContainer);

var $col = $("<div>aa</div>");
$col.addClass('col-md-3 img-portfolio');
$row.append($col);

var $col1 = $("<div>aa</div>");
$col.addClass('col-md-3 img-portfolio');
$row.append($col1);
$row.append($col);
$row.append($col); */

	initEventListener();
	
</script>