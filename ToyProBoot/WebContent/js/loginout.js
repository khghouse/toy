function loginoutEventListener(){
	
	$('#btn_login').click(function(){
		var userId = $('#userId').val();
		var userPw = $('#userPw').val();
		
		if(userId == null || userId.length <1){
			alert("Id를 입력바랍니다.");
			$('#userId').focus();
			return;
		}
		
		if(userPw == null || userPw.length <1){
			alert("Password를 입력바랍니다.");
			$('#userPw').focus();
			return;
		}
		
		$.ajax({
			type: "POST",
			url: "/app/user/login",
			data:"userId="+userId+"&userPw="+userPw,
			dataType:"json",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			error:function(request,status,error){
		           //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				alert("아이디와 비밀번호를 확인해주세요.");
				changeContent("../user/login.jsp");
	        },
	        success:function(msg){
	        	$('#aLogin').css("display","none");
	        	$('#myPage').css("display","block");
	        	var userId
	        	$.each(msg,function(key){
	        		var user = msg[key];
	        		userId = user.userId;
	        	});
	        	$('#aUserId').text(userId+"님");
	        	$('#aUserId').append("<b class='caret'></b>");
	        	changeContent("../index/mainContent.jsp");
	        	
	        }
		});//ajax
	});//$('#btn_login').click()
	
	///////////////////////////////////////////////////////////////////////////////////////////////// logout	
	$('#aLogout').click(function(){
		$('#myPage').css("display","none");
		$('#aLogin').css("display","block");
		$.ajax({
			url:"/app/user/logout",
			type:"POST",
			dataType:"json",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			error:function(){			
			},
			success:function(){ 
				$('#myPage').css("display","none");
				$('#aLogin').css("display","block");
			}
		});//ajax
	});//$('#aLogout').click()
	
}//loginoutEventListener()

//showUser
//유저 session
/*function showUser(msg){
	alert("showUser탔어요login.js안");	
	var json=eval("("+msg+")");
	alert(json.userName+"userName");

}*/

