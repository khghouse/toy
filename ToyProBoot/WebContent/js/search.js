	
	var toyName;
	var toyImg;
	var toyrentalState;
	var toyBusiness;
	var toyUseAge;
	var toyRegion;
	var toyMadeDate;
	var toyImgSRC;
	var list;
	
	function initEventListener()
	{	
		$('select').change(function()
		{
			/*alert($('#subject option:selected').val());*/
			
			var url="/app/showCount";
			url=loadPage(url);
		    $.ajax({
		        type: "POST",
		        url: url,
		        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		        success: function(msg) {
		        	showCount(msg);
		        	
		        
		            
		        }
		    });
		    url="/app/showList";
		    url=loadPage(url);
		    url=url+"/null/null";
		    alert('222');
		    $.ajax({
		        type: "POST",
		        url:url ,
		        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		        success: function(msg) {
		        	alert('list');
		        	showList(msg);
		        }
		    });
		});
	}
	
	
	function loadPage(strPage)
	{
		var age=$("#age").val();
		var subject=$("#subject").val();
		var keyword=$("#keyword").val();
		if(age!=''){
			strPage+="/"+age;
		}else{
			strPage+="/"+"null";
		}
		if(subject!=''){
			strPage+="/"+subject;
		}else{
			strPage+="/"+"null";
		}
		if(keyword!=''){
			strPage+="/"+keyword;
		}else{
			strPage+="/"+"null";
		}
		return strPage;
	}
	
	
	function showList(msg){
		var json=JSON.parse(msg);
    	page=json.page;
    	list='';
    	list=json.list;
    	search=json.search;
    	alert("리스트사이즈:"+list.length);
    	$("#search_list .row").empty();
    	$("#search_page .row").empty();

    	if(list.length!=0)
    	{
    		
    		for(var i=0;i<list.length;i++){
    			toyImg = list[i].toyImg;
    			toyImgSRC="../images/toy/"+list[i].toyImg;
    			childImg='../images/child_00'+Math.floor((Math.random()*9+1))+'.png';
    			toyName=list[i].toyName;
    			
    			if(toyName.length>10){
    				toyName=toyName.substr(0,8);
    				toyName=toyName+" ...";
    			} 
    			toyrentalState=((list[i].rentalState=="대출가능      ")?"대출가능":"대출중");
    			
    			toyBusiness = list[i].business;
    			toyUseAge = list[i].useAge;
    			toyRegion = list[i].region;
    			toyMadeDate = list[i].madeDate;
    			var appendContent='<div class="col-md-3 img-portfolio superbox-list" onclick="showPopUp(this,'+i+')" ><div id="list"><img class="superbox-img" style="width:100%;height:30%;" src="'+toyImgSRC+"\"onerror=\"this.src='../images/noImg.gif'\" />" +
    			'<div id="info"><img style="float:left;width:25%;height:6%;"  src="'+childImg+'"/><span id=\"toyName">'+toyName+'</span><br><span id="rentalState">'+toyrentalState+'</span></div></div></div>';
    			$("#search_list .row").append(appendContent);
    		}
    		
    		pageNavigator(page,search.shopCode);
    		
    	}
	}
	
	function clickMap(shopCode){
	    url="/app/showList";
	    url=loadPage(url);
	    url=url+"/null/"+shopCode;
	    $.ajax({
	        type: "POST",
	        url:url ,
	        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	        success: function(msg) {
	        	showList(msg);
	        }
	    });
	}
	


	function showCount(countArr){
		var arr=[];
		var k=0;
		var c=1;
		arr[0]='';
		while(true){
			
			if(countArr[c] == "]"){
				break;
			}
			if(countArr[c] == ","){
				k++;
				arr[k]='';
				c++;
				continue;
			}
			arr[k]+=countArr[c];
			c++;
		}
		for(var i=1;i<=arr.length;i++){
			$("#b"+i).text(arr[i-1]);
			if(arr[i-1]==0){
				$("#b"+i).css("color","brown");
			}else if(arr[i-1]<10){
				$("#b"+i).css("color","blue");
			}else if(arr[i-1]<100){
				$("#b"+i).css("color","green");
			}else{
				$("#b"+i).css("color","red");
			}
			$("#b"+i).css("display","inline");
		}
	}
	
	function pageNavigator(page,shopCode){
		var append;
		$(".pagination").empty();
		if(page.currentPage <= page.pageUnit){
			append="<li><a href=\"#\" onclick=\"event.preventDefault();\">&laquo;</a></li>";
			$(".pagination").append(append);
		}else{
			append="<li><a href=\"#\" onclick=\"event.preventDefault();fncToyList("+(page.currentPage-1)+","+shopCode+")\">&laquo;</a></li>";
			$(".pagination").append(append);
		}
		for(var i=page.beginUnitPage;i<=page.endUnitPage;i++){
			if(i==page.currentPage){
				append="<li class=\"active\"><a href=\"#\" onclick=\"event.preventDefault();fncToyList("+i+","+shopCode+");\">"+i+"</a></li>";
			}else{
				append="<li><a href=\"#\" onclick=\"event.preventDefault();fncToyList("+i+","+shopCode+");\">"+i+"</a></li>";				
			}
			$(".pagination").append(append);
		}	
		if(page.endUnitPage >= page.maxPage){
			append="<li><a href=\"#\" onclick=\"event.preventDefault();\">&raquo;</a></li>";
			$(".pagination").append(append);
		}else{
			append="<li><a href=\"#\" onclick=\"event.preventDefault();fncToyList("+(page.endUnitPage+1)+","+shopCode+")\">&raquo;</a></li>";
			$(".pagination").append(append);
		}
		
		
	}
	
	
	function fncToyList(currentPage,shopCode){
			url="/app/showList";
		    url=loadPage(url);
		    url=url+"/"+currentPage+"/"+shopCode;
		    $.ajax({
		        type: "POST",
		        url:url ,
		        success: function(msg) {
		        	showList(msg);
		        }
		    });
		
	}
	
	function showPopUp(obj,i){
		var obj = $(obj);									//.superbox-list
		var imgsrc= obj.children().children().attr('src');	//superbox-img src
		
		var superbox      = $('<div class="superbox-show"></div>');
		var outline = $('<div class="outline"></div>');
		var superboximg   = $('<img src="" class="superbox-current-img">');
		var superboxclose = $('<div class="superbox-close" onClick="closePopUp(this)"></div>');
		var popupname = $('<div class="popupname">abcdabcd</div>');
		var popuprentalstate=$('<div class="popuprentalstate">abcdabcd</div>');
		var popupuseage=$('<div class="popupuseage">abcdabcd</div>');
		var popupbusiness=$('<div class="popupbusiness">abcdabcd</div>');
		var popupregion=$('<div class="popupregion">abcdabcd</div>');
		var popupmadedate=$('<div class="popupmadedate">abcdabcd</div>');
		var popupimage = $('<div class="popupimage"></div>');
		superbox.append(superboximg).append(outline).append(popupname).append(popuprentalstate)
		.append(popupuseage).append(popupbusiness).append(popupregion).append(popupmadedate);
		superbox.append(popupimage);
		superbox.append(superboxclose);
		superboximg.attr('src',imgsrc);
		
		if(toyName!=null){
			popupname.text("장난감 이름 : "+list[i].toyName);
			popupuseage.text("이용연령: "+list[i].useAge);
			popupbusiness.text("제조회사 : "+list[i].business);
			popupregion.text("제조국 : "+list[i].region);
			popupmadedate.text("제조일 : "+list[i].madeDate);
			
			if(list[i].rentalState="제적"){
				popuprentalstate.text("상태 : 대출중");
			}else{
				popuprentalstate.text("상태 : "+list[i].rentalState);
			}
		}
		
		obj.append(superbox); //obj superbox-list
		
		if(obj.next().hasClass('superbox-show')){			//superbox-list 다음
			superbox.toggle();
		}else{
			superbox.insertAfter(superbox).css('display','block');
		}
		
	}
	
	function closePopUp(obj){
		//alert(obj+" close obj");//superbox-close obj

		$('.superbox-current-img').animate({opacity:0},200,function(){
			$('.superbox-show').slideUp();
		});
	}
	