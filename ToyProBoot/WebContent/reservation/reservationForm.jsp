<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	
    <!-- Page Content -->
    <div class="container">

        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Reservation
                    <small></small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="index.html">Home</a></li>
                    <li class="active">Reservation</li>
                </ol>
            </div>
        </div>
        <!-- /.row -->
        
		<form class="form-horizontal" role="form" id="reservationForm">
		<input type="hidden" id="toyCode"  value="${param.toyCode }"/>
		<input type="hidden" id="rentalDate" name="rentalDate"/>
		<input type="hidden" id="rentalCode" />
		  <div class="form-group">
		    <label for="inputEmail1" class="col-lg-2 control-label">ID</label>
		    <div class="col-lg-8">
		      <input type="text" class="form-control" id="userId" value="${user.userId }" readOnly>
		    </div>
		    <div class="col-lg-2"></div>
		  </div>
		  
		  <div class="form-group">
		    <label for="inputPassword1" class="col-lg-2 control-label">회원명</label>
		    <div class="col-lg-8">
		      <input type="text" class="form-control" id="userName" value="${user.userName }" readOnly>
		    </div>
		    <div class="col-lg-2"></div>
		  </div>
		  
		  <div class="form-group">
		    <label for="inputPassword1" class="col-lg-2 control-label">장난감명</label>
		    <div class="col-lg-8">
		      <input type="text" class="form-control" name="toyName" id="toy_Name" readOnly>
		    </div>
		    <div class="col-lg-2"></div>
		  </div>
		  
		  <div class="form-group">
		    <label for="inputPassword1" class="col-lg-2 control-label">이용연령</label>
		    <div class="col-lg-8">
		      <input type="text" class="form-control" id="useAge" name="useAge" readOnly>
		    </div>
		    <div class="col-lg-2"></div>
		  </div>
		  
		  <div class="form-group">
		    <label for="inputPassword1" class="col-lg-2 control-label">제조회사</label>
		    <div class="col-lg-8">
		      <input type="text" class="form-control" id="business" name="business" readOnly>
		    </div>
		    <div class="col-lg-2"></div>
		  </div>
		  
		  <div class="form-group">
		    <label for="inputPassword1" class="col-lg-2 control-label">제조국</label>
		    <div class="col-lg-8">
		      <input type="text" class="form-control" id="region" name="region" readOnly>
		    </div>
		    <div class="col-lg-2"></div>
		  </div>
		  
		  
		  <div class="form-group">
		    <label for="inputPassword1" class="col-lg-2 control-label">대여 예정일</label>
			    <div class="col-lg-2"><input type="text" class="form-control" id="year" readOnly></div>
			    <div class="col-lg-2"><input type="text" class="form-control" id="month" readOnly></div>
			    <div class="col-lg-2">

						<select class="form-control" id="day">

			  			</select>

			  	</div>
			    <!-- <div class="col-lg-offset-2"><button type="button" class="btn btn-default">예약하기</button></div> -->
			    <div class="col-lg-2"></div>
		  </div>
			
		  <div class="form-group">
		    <label for="inputPassword1" class="col-lg-2 control-label">반납 예정일</label>
		    <div class="col-lg-8">
		      <input type="text" class="form-control" id="returnDate" name="returnDate" readOnly>
		    </div>
		    <div class="col-lg-2"></div>
		  </div>
		  
		  <div class="form-group">
		    <div class="col-lg-offset-2 col-lg-10">
		      <button type="button" class="btn btn-default" onclick="addReservation()">예 약</button>
		    </div>
		  </div>
		</form>

		<hr>
		
        <jsp:include page="../layout/footer.jsp"></jsp:include>
        
    </div>
    </form>
<script type="text/javascript">

	var year;
	var month;
	var day;
	var lastDay = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
	
	var rentalCode;
	/* var url = "/app/getToy/"+toyCode; */
	var url = "/app/getToy/"+$('#toyCode').val();
	/* alert(url); */
	$.ajax({
		type : "POST",
		url : url,
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		
		success : function(msg) {
			/* alert(msg); */
			showToyData(msg);
		}
	});

	function showToyData(msg)
	{
/* 		alert(msg.toyName); -- 이거 안됨 */
		var toy = eval("("+msg+")");
		
		/* $('#userId').val('Hong');
		$('#userName').val('홍길동'); */
		$('#toy_Name').val(toy.toyName);
		$('#useAge').val(toy.useAge);
		$('#business').val(toy.business);
		$('#region').val(toy.region);
		rentalCode = toy.rentalCode.rentalCode;
		/* $('#rentalCode').val(rentalCode); */
		
		var date = new Date();
		
		year = date.getFullYear();
		month = date.getMonth()+1;
		day = date.getDate();
		
		$('#year').val(year);
		$('#month').val(month);
		
		setRentalDate(year, month, day);
		setReturnDate(year, month, day);
		/* var sdf = new SimpleDateFormat("yyyy-MM-dd");
		 */
	/* 	$('#year').val(year);
		$('#month').val(month); */
		
		/* getReturnDate(date); */
		/* alert(year + "년 " + month + "월 " + day + "일");
		
		setDate(year, month, day, 3); */
		
		/* for(var i = 0 ; i <= 3 ; i++)
		{
			$('#date').append($('<option>').attr("value", day+i).text(day+i));

		} */
		/* getDate(date.getDate()); */
		
		/* alert(date);
		alert(date.getFullYear());
		alert(date.getMonth() + 1);
		alert(date.getDate()+1);
		
		getDate(); */
		
	}
	
	$('#day').change(function()
	{
		/* alert($('#day option:selected').val()); */
		/* alert(day); */
		
		/* setRentalDate(year, month, $('#day option:selected').val()); */
		setReturnDate(year, month, $('#day option:selected').val());
		/* setReturnDate(year, 12, 30); */
		/* setReturnDate(year, month, day); */
		/* setDate(year, month, day, 14); */
		/* alert( $("#guSelect option:selected").val() ); */
	});
	
	function setRentalDate(year, month, day)
	{
		for ( var i = 0; i <= 3; i++)
		{
			if (day > lastDay[month - 1])
			{
				day = 1;
			}

			$('#day').append($('<option>').attr("value", day).text(day));
			day++;
		}
		
		/* $('#rentalDate').val(year + "-" + month + "-" + day);
		alert(year + "-" + month + "-" + day); */
	}

	function setReturnDate(year, month, day)
	{

		for ( var i = 0; i < 14; i++)
		{
			// day가 각 달의 마지막 날보다 크다면
			/* alert("day : " + day);
			alert("i : " + i); */
			/* alert(lastDay[month-1]); */
			if (day >= lastDay[month - 1]) {
				//alert("if문 탔나?");
				day = 1;
				month++;
				continue;
			}
			if (month > 12) {
				month = 1;
				year++;
				continue;
			}
			day++;
		}
		$('#returnDate').val(year + "-" + month + "-" + day);
	}
	
/* 	function setRentalDate(year, month, day)
	{
		alert(year);
		alert(month);
		alert(day);
	} */

	function setDate(ear, locMonth1, day1, term) {
		var lastDay = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];

		alert(year1 + " " + month1 + " " + day1 + " " + term);
		/* 		var year = date.getFullYear();
		 var month = 12;
		 var day = 27; */
		/* 	alert(year);
			alert(month);
			alert(day); */

		if (term == 3) {
			for ( var i = 0; i <= 2; i++) {
				alert(i);
				if (day > lastDay[month - 1]) {
					day = 1;
				}

				$('#day').append($('<option>').attr("value", day).text(day));
				day++;
			}
		}
		alert("aa");
		alert(lastDay[month - 1]);
		for ( var i = 0; i < 14; i++) {
			// day가 각 달의 마지막 날보다 크다면
			alert("day : " + day);
			alert("i : " + i);
			/* alert(lastDay[month-1]); */
			if (day >= lastDay[month - 1]) {
				alert("if문 탔나?");
				day = 1;
				month++;
				continue;
			}
			if (month > 12) {
				month = 1;
				year++;
				continue;
			}
			day++;
		}
		$('#returnDate').val(year + "-" + month + "-" + day);
		alert("for문 후" + year + "년 " + month + "월 " + day + "일");

		/* if(term == 14)
		{
			
		} */

		/* var i = 0;
		
		do
		{
			$('#day').append($('<option>').attr("value", day+i).text(day+i));
			i++;
			alert("중간점검 "+day+"   "+i);
			if((day+i) >= lastDay[date.month-1])
			{
				day = 1;
				alert("if문 안 "+day);
				continue;
			}
			
			alert(day+i);
		}
		while(i <= term); */

		/* alert(date.getMonth()+1);
		alert(lastDay[date.getMonth()]); */
		//for(var i = 0 ; i < term ; i++)
		//{
		//day++;
		// day가 각 달의 마지막 날보다 크다면
		/* alert(i+1+"번 반복");
		alert(day);
		alert(lastDay[date.getMonth()]); */
		/* if(day > lastDay[date.getMonth()])
		{
			//alert("if문 탔나?");
			day = 1;
			month++;
			continue;
		}
		if(month > 12)
		{
			month = 1;
			year++;
			continue;
		} */
		/* day++; */
		//}
		/* alert("for문 후"+ year + "년 " + month + "월 " + day + "일"); */
	}

	function addReservation() {
		/* alert("예약 펑션");
		alert(rentalCode); */
		
		$('#rentalDate').val($('#year').val() + "-" + $('#month').val() + "-" + $('#day').val());
		/* alert($('#year').val() + "-" + $('#month').val() + "-" + $('#day').val()); */
		
		var url = "/app/reservation/addReservation/"+rentalCode+"/"+$('#toyCode').val();
		/* alert(url); */
		var data = $('#reservationForm').serialize();
		//랜탈코드, 토이코드, 
		$.ajax({
			type : "POST",
			url : url,
			data : data,
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(msg) {
				changeContent('../user/rentalState.jsp');

				/* showToyData(msg); */
			}
		});
	}
</script>
<%-- 	/* var url = "/app/getToy/"+toyCode;
	alert(url);
	$.ajax(
	        {
	        	type : "POST",
	        	url : url,
	        	contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		        success: function(msg)
		        {
		        	alert(msg);
		        	showToyData(msg);
		        }
	        });
	
	function showToyData(msg);
	{
		alert(msg.toyName);
	} */
	
	/* initReservationForm('${param.toyCode }'); */ --%>
	
