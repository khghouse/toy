<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <div class="container">
    
     <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">RentalState
                    <small></small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="index.html">Home</a></li>
                    <li class="active">MyPage</li>
                </ol>
            </div>
        </div>
        <!-- /.row -->
        
        <table class="table">
		
			<tr>
				<th width="10%">예약번호</th>
				<th width="15%">아이디 </th>
				<th width="35%">장난감명</th>
				<th width="20%" >대출 예정일</th>
				<th width="20%" >반납 예정일</th>
			</tr>
			<tbody id="reservationList"> </tbody>

		</table>
        
        <!-- Pagination -->
        <div class="row text-center">
            <div class="col-lg-12">
                <ul class="pagination">
                </ul>
            </div>
        </div>
        
        <hr>
        
        <jsp:include page="../layout/footer.jsp"></jsp:include>
    </div>
    
<script type="text/javascript">
/* $(document).ready(function(){
	
}) */
var url = "/app/reservation/getReservationList/1";
/* alert(url); */
$.ajax({
	type : "POST",
	url : url,
	contentType : "application/x-www-form-urlencoded; charset=UTF-8",
	
	success : function(msg) {
		/* alert(msg); */
		showReservationList(msg);
	}
});

function showReservationList(msg)
{
	var listData = eval("("+msg+")");
	
	$(".table #reservationList").empty();
	
	resultPage = listData.resultPage;
	list = listData.list;
	
	/* alert("토이 네임 : "+list[0].toyCode.toyName); */
	 // search = listData.search;
	
	if(list.length !=0){
		for(var i=0; i<list.length; i++){
			
			var appendContent = '<tr><td width="10%" align="center">'+list[i].reservationCode+'</td>'
						+'<td width="15%" align="center">'+list[i].userId.userId+'</td>'
						+'<td width="35%" align="left">';
			/*$("<td>").attr("width","10%").text(list[i].code);*/
			/*$("<td>").attr("width","40%").attr("align","left").text("&nbsp;&nbsp;").*/
			
			
			
			appendContent += '<a href="#" id="toy_name" onclick="changeContent('+"'/app/reservation/getReservationContent/"+list[i].reservationCode+"')"+'">'
							+list[i].toyCode.toyName+'</a></td>';
							
			appendContent += '<td width="20%" align="center">'+list[i].rentalDate+'</td>'+'<td width="20%" align="center">'+list[i].returnDate+'</td>'

			$(".table #reservationList").append(appendContent);
			
		}
		//alert(appendContent);
		reservationPageNavi(resultPage);
	}
}

function reservationPageNavi(resultPage){
	var append;
	$(".pagination").empty();
	if(resultPage.currentPage <= resultPage.pageUnit){
		append="<li><a href=\"#\" onclick=\"event.preventDefault();\">&laquo;</a></li>";
		$(".pagination").append(append);
	}else{
		append="<li><a href=\"#\" onclick=\"event.preventDefault();changePage("+(resultPage.currentPage-1)+")\">&laquo;</a></li>";
		$(".pagination").append(append);
	}
	for(var i=resultPage.beginUnitPage; i<=resultPage.endUnitPage; i++){
		if(i==resultPage.currentPage){
			append="<li class=\"active\"><a href=\"#\" onclick=\"event.preventDefault();changePage("+i+");\">"+i+"</a></li>";
		}else{
			append="<li><a href=\"#\" onclick=\"event.preventDefault();changePage("+i+");\">"+i+"</a></li>";				
		}
		$(".pagination").append(append);
	}	
	if(resultPage.endUnitPage >= resultPage.maxPage){
		append="<li><a href=\"#\" onclick=\"event.preventDefault();\">&raquo;</a></li>";
		$(".pagination").append(append);
	}else{
		append="<li><a href=\"#\" onclick=\"event.preventDefault();changePage("+(resultPage.endUnitPage+1)+")\">&raquo;</a></li>";
		$(".pagination").append(append);
	}
	
}

function changePage(currentPage)
{	
	var url = "/app/reservation/getReservationList/"+currentPage;
	
	$.ajax({
		type : "POST",
		url : url,
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		
		success : function(msg) {
			/* alert(msg); */
			showReservationList(msg);
		}
	});
}
</script>