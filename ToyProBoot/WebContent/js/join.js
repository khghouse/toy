function joinEventListener(){
	
	var userId;
	var userPw1;
	var userPw2;
	
	
	$('#userId').keyup(function(){
		
		userId = $('#userId').val();
		
		if(userId==""){
			$('#checkId').html("");
		}else if(userId.length<6){
			
			$('#checkId').css("color","red");
			$('#checkId').html("아이디는 6글자 이상 작성하시기 바랍니다.");
		}else if(userId.length>12){
			
			$('#checkId').css("color","red");
			$('#checkId').html("아이디는 12글자 내로 작성하시기 바랍니다.");
		}else{
			
			$('#checkId').css("color","blue");
			
			$.ajax({
				url:"/app/user/getUser/"+userId,
				type:"POST",
				dataType:"json",
				error:function(msg){
					
				},
				success:function(msg){
					if(msg){
						$('#checkId').html(userId+"은(는) 사용가능합니다.");
					}else{
						$('#checkId').html(userId+"은(는) 사용중인 아이디 입니다.");
					}
					
				}
				
			});//ajax id validation
			
		}//validation length		
		
		
	});//userId
	
	
	///////////////////////////////////////////////////////////////////////////////////////////////// PW
	$('#userPw1').keyup(function(){
		
		userPw1 = $('#userPw1').val();
		if(userId.length<6||userId.length>12){
			alert("아이디를 확인해주세요.");
			$('#userId').focus();
		}else if(userPw1==""){
			$('#checkPw1').html("");
		}else if(userPw1.length<8){
			$('#checkPw1').css("color","red");
			$('#checkPw1').html("비밀번호는 8글자 이상 작성하시기 바랍니다.");
			$('#checkPw2').html("");
		}else if(userPw1.length>15){
			$('#checkPw1').css("color","red");
			$('#checkPw1').html("비밀번호는 15글자 내로 작성하시기 바랍니다.");
			$('#checkPw2').html("");
		}else if(userPw1.length>=8&&userPw1.length<=15){
			$('#checkPw1').css("color","blue");
			$('#checkPw1').html("사용가능한 비밀번호 입니다.");
			$('#checkPw2').html("");
		}
		
		$('#userPw2').keyup(function(){
			userPw2 = $('#userPw2').val();
			$('#checkPw2').show();
			if(userPw1.length>15||userPw1.length<8){
				$('#checkPw2').css("color","red");
				$('#checkPw2').html("초기 비밀번호를 8 ~ 15글자 내로 작성 후 재입력바랍니다.");
				$('#userPw1').focus();
			}else if(userPw2==""){
				$('#checkPw2').html("");
			}else if(userPw1 != userPw2){
				$('#checkPw2').css("color","red");
				$('#checkPw2').html("비밀번호가 일치하지 않습니다.");
			}else{
				$('#checkPw2').css("color","blue");
				$('#checkPw2').html("비밀번호가 일치합니다.");
			}
			
		});//userPw2 keyup
		
	});//userPw1 keyup
	
	
	$('#btn_join').click(function(){
		
		var str = $('#joinForm').serialize();
		
		$.ajax({
			url:"/app/user/join",
			type:"POST",
			data:str,
			dataType:"json",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			beforeSend:function(){
				$('#loading').fadeIn(500).delay(1).fadeOut();
			},
			error:function(request,status,error){
				alert("회원가입 실패");
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	        },
			success:function(){
				alert("회원가입이 완료되었습니다.");
				//changeContent("/index/index.jsp");
			}
		});//ajax
			
	});//btn_join click
		
}//joinEventListener();