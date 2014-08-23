function loginEventListener(){
	
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
			cache:false,
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			error:function(request,status,error){
		           alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	        },
	        success:function(msg){
	        	alert("로긴성공함");
	        	$('#aLogin').text("MyPage");
	        }
		});//ajax
	});//$('#btn_login').click()

}//loginEventListener()

//유저 session
function showUser(msg){
	alert("showUser탔어요login.js안");	
	var json=eval("("+msg+")");
	alert("1");
	alert(json.userName+"userName");
	
	user = json.user;
	alert("user 찍어보기");
	alert(user);
	alert("user찍음");
	alert(json+"json찍어보기 showUser안 login.js입니다.");
}

