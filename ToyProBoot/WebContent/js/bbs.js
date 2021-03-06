
function ajaxConnect() {
	$.ajax({
		type: "POST",
		url: "/app/bbs/bbsList",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		error:function(request,status,error){
	           alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        },
		success:function(msg){
			bbsList(msg);
		}
	});
}

function fncBbsCondition() {
	
	var url="/app/bbs/bbsList/";
	url=conditionPage(url)+"/1";
	
	$.ajax({
		type: "POST",
		url: url,
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		error:function(request,status,error){
	           alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        },
		success:function(msg){
			bbsList(msg);
		}
	});
	
}

function conditionPage(strPage){
	var bbsCondition=$("#bbsConditionId").val();
	var bbsKeyword=$("#bbsKeyword").val();
	
	if(bbsCondition!=null){
		strPage+="/"+bbsCondition;
	}
	
	if(bbsKeyword != ''){
		strPage+="/"+bbsKeyword;
	}else{
		strPage+="/"+"null";
	}
	return strPage;
}

//list data 뿌려주기
function bbsList(msg) {
	//json 객체를 자바스크립트 객체로 변환
	var listData = eval("("+msg+")");
	$(".table #bbsList").empty();
	resultPage = listData.resultPage;
	list='';
	list=listData.list;
	search = listData.search;
/*	alert(resultPage);
	alert(list);
	alert(search);*/
	
	if(list.length !=0){
		for(var i=0; i<list.length; i++){
			/*$("<td>").attr("width","10%").text(list[i].code);*/
			/*$("<td>").attr("width","40%").attr("align","left").text("&nbsp;&nbsp;").*/
			
			var appendContent='	<tr><td width="10%" align="center">'+list[i].code+'</td>'
								+'<td width="40%" align="left">&nbsp;&nbsp;';
			
			//관리자 없으면
			if(list[i].subjet !='관리자 또는 작성자에 의해서 삭제 되었습니다.'){
				appendContent+='<a href="#" id="subject" onclick="changeContent('+"'/app/bbs/getBBSContent/"+list[i].code+"')"+'">'+'';
			
				if(list[i].groupTab ==0){
					appendContent+=list[i].subject;
				}else if(list[i].groupTab !=0){
					for(var j=1; j<=list[i].groupTab; j++){
						appendContent+='&nbsp;&nbsp;';
					}
					appendContent+='<img src="../images/iconRe.gif" id="Re" />&nbsp;'+list[i].subject; 
				}
				
				appendContent+='</a></td>';
				
			}
			//관리자 있으면
			else if(list[i].subject=='관리자 또는 작성자에 의해서 삭제 되었습니다.'){
				appendContent+=list[i].subject;
			}
			
			//첨부파일 조건
			if(list[i].attachment ==null){
				appendContent+='<td width="10%" align="center"></td>';
			}else{
				appendContent+='<td width="10%" align="center">'+list[i].attachment+'</td>';
			}
			
			appendContent+='<td width="15%" align="center">'+list[i].userId.userId+'</td><td width="15%" align="center">'+list[i].regDate+'</td><td width="10%" align="center">'+list[i].count+'</td></tr>';
			
			
			$(".table #bbsList").append(appendContent);
			
		}
		//alert(appendContent);
		pageNavigation(resultPage);
	}
}

//pageNavigation
function pageNavigation(resultPage){
	var append;
	$(".pagination").empty();
	if(resultPage.currentPage <= resultPage.pageUnit){
		append="<li><a href=\"#\" onclick=\"event.preventDefault();\">&laquo;</a></li>";
		$(".pagination").append(append);
	}else{
		append="<li><a href=\"#\" onclick=\"event.preventDefault();listPage("+(resultPage.currentPage-1)+")\">&laquo;</a></li>";
		$(".pagination").append(append);
	}
	for(var i=resultPage.beginUnitPage; i<=resultPage.endUnitPage; i++){
		if(i==resultPage.currentPage){
			append="<li class=\"active\"><a href=\"#\" onclick=\"event.preventDefault();listPage("+i+");\">"+i+"</a></li>";
		}else{
			append="<li><a href=\"#\" onclick=\"event.preventDefault();listPage("+i+");\">"+i+"</a></li>";				
		}
		$(".pagination").append(append);
	}	
	if(resultPage.endUnitPage >= resultPage.maxPage){
		append="<li><a href=\"#\" onclick=\"event.preventDefault();\">&raquo;</a></li>";
		$(".pagination").append(append);
	}else{
		append="<li><a href=\"#\" onclick=\"event.preventDefault();listPage("+(resultPage.endUnitPage+1)+")\">&raquo;</a></li>";
		$(".pagination").append(append);
	}
	
}

function listPage(currentPage){
	var url="/app/bbs/bbsList";
	url= conditionPage(url)+"/"+currentPage;
	
    $.ajax({
        type: "POST",
        url:url ,
        error:function(request,status,error){
	           alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        },
        success: function(msg) {
        	bbsList(msg);
        }
    });
}

//insert 할때 들어가기(addBBSContentForm)
function formAddcontent() {
	var form = document.getElementById("bbsForm");
	var subject = document.getElementById("subjectId").value;
	/*var userId = document.getElementById("userId").value;*/
	var content = document.getElementById("contentId").value;
	var attachment = document.getElementById("bbs_attachment").value; 
	
	if(subject==''){
		alert("제목을 입력해주세요.");
		return false;
	}
	
	if(content==''){
		alert("내용을 입력해주세요.");
		return false
	}
	
	if(attachment == ''){
		attachment = "empty";
	}
	
	var url = "/app/bbs/addBBSContent/"+subject+"/"+content+"/"+attachment;
	
	$.ajax({
		type: "POST",
		url: url,
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		error:function(request,status,error){
	           alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        },
		success:function(msg){
			changeContent('../community/bbs.jsp');
		}
	});
}

//insert 할때 들어가기(addBBSReContentForm)
function formAddRecontent() {
	var form = document.getElementById("bbsForm");
	
	var code = document.getElementById("code").value; 
	var subject = document.getElementById("subjectId").value;
	/*var userId = document.getElementById("userId").value;*/
	var content = document.getElementById("contentId").value;
	var attachment = document.getElementById("bbs_attachment").value; 
	
	var root = document.getElementById("root").value; 
	var groupId = document.getElementById("groupId").value; 
	var groupStep = document.getElementById("groupStep").value; 
	var groupTab = document.getElementById("groupTab").value; 
	
	var jsonValue = '{"code" : "'+code+'","subject":"'+subject+'","content":"'+content+'","attachment":"'+attachment+'","root":"'+root+'","groupId":"'+groupId+'","groupStep":"'+groupStep+'","groupTab":"'+groupTab+'"}';
	
	if(subject==''){
		alert("제목을 입력해주세요.");
		return false;
	}
	if(content==''){
		alert("내용을 입력해주세요.");
		return false;
	}
	if(attachment == ''){
		attachment = "empty";
	}
	
	var url = "/app/bbs/addBBSReContent/"+jsonValue;
	
	$.ajax({
		type: "POST",
		url: url,
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		error:function(request,status,error){
	           alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        },
		success:function(msg){
			changeContent('../community/bbs.jsp');
		}
	});
}

//update 
function formUpdate() {
	var form = document.getElementById("bbsForm");
	
	var code = document.getElementById("code").value; 
	var subject = document.getElementById("subjectId").value;
	/*var userId = document.getElementById("userId").value;*/
	var content = document.getElementById("contentId").value;
	var attachment = document.getElementById("bbs_attachment").value; 
	
	if(attachment == ''){
		attachment = "empty";
	}
	
	//var jsonValue = '{"code" : "'+code+'","subject":"'+subject+'","userId":"'+userId+'","content":"'+content+'","attachment":"'+attachment+'"}';
	
	//var url = "/app/bbs/updateBBSContent/"+jsonValue;
	
	var url = "/app/bbs/updateBBSContent/"+code+"/"+subject+"/"+content+"/"+attachment;
	
	
	$.ajax({
		type: "POST",
		url: url,
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		error:function(request,status,error){
	           alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        },
		success:function(msg){
			changeContent('../community/bbs.jsp');
		}
	});
}

//reply insert 할때 들어가기(bbsContent)
function addReply() {
	var replyContent = document.getElementById("reply_textarea").value;
	
	if(replyContent ==''){
		alert("댓글을 입력해주세요.");
		return false;
	}
	var code = document.getElementById("codeId").value;
	/*var userId = document.getElementById("userId").value;*/
	/*var jsonValue = '{"code" : "'+code+'","replyContent":"'+replyContent+'"}';
	alert(jsonValue);*/
	
	var url = "/app/reply/addReply/"+code+"/"+replyContent;
	
	
	$.ajax({
		type: "POST",
		url: url,
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		error:function(request,status,error){
	           alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        },
		success:function(msg){
			changeContent('/app/bbs/getBBSContent/'+code+'');
		}
	});
}

//updateForm
function updateReplyForm(replyCode) {
	
	$("#reply_contentId"+replyCode).attr("readOnly", false);
	$("#reply_preUpdate").css("display","none");
	$("#reply_updateState").css("display","block");
}

//updateForm 취소
function updateCancel(replyCode) {
	
	$("#reply_contentId"+replyCode).attr("readOnly", true);
	$("#reply_preUpdate").css("display","block");
	$("#reply_updateState").css("display","none");
}

//update 
function updateReply(replyCode) {
	var replyContent = document.getElementById("reply_contentId"+replyCode).value;
	var url = "/app/reply/updateReply/"+replyCode+"/"+replyContent;
	
	
	$.ajax({
		type: "POST",
		url: url,
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		error:function(request,status,error){
	           alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        },
		success:function(msg){
			updateCancel(replyCode);
		}
	});
}

//delete
function deleteReply(replyCode) {
	var code = document.getElementById("codeId").value;
	var url = "/app/reply/deleteReply/"+replyCode;
	
	
	$.ajax({
		type: "POST",
		url: url,
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		error:function(request,status,error){
	           alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        },
		success:function(msg){
			changeContent('/app/bbs/getBBSContentReply/'+code+'');
		}
	});
}

function loginck() {
	var userId = document.getElementById("userId").value;
	
	/*if(userId == ''){*/
		alert("로그인페이지로 이동합니다.");
		
		var url = changeContent('../user/login.jsp');
		
		$.ajax({
			type: "POST",
			url: url,
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			error:function(request,status,error){
		           alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	        },
			success:function(msg){
				
			}
		});
	/*}*/
	
}
