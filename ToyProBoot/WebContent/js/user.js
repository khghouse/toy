	
function joinEventListener(){
	
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
				url:"/app/user/checkUser/"+userId,
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
	
	///////////////////////////////////////////////////////////////////////////// not null validation 
	var userId;
	var tel;
	var email;
	var addr;
	
	$('#tel').keyup(function(){
		tel = $('#tel').val();
		if(tel == ''||tel==null)
			$('#tel').attr("placeholder","전화번호가 비었습니다. 필수입력입니다.");
	});
		
	$('#email').keyup(function(){
		email = $('#email').val();
		if(email == ''||email==null)
			$('#email').attr("placeholder","이메일이 비었습니다. 필수입력입니다.");
	});

	$('#addr').keyup(function(){
		addr = $('#addr').val();
		if(addr == ''||addr==null)
			$('#addr').attr("placeholder","주소가 비었습니다.");
	});
	
	///////////////////////////////////////////////////////////////////////////// Click join
	$('#btn_join').click(function(){
		if(	userId==''||userId==null||userPw1==''||userPw1==null||userPw2==''||userPw2==null||userName==''||userName==null||
				tel==''||tel==null||email==''||email==null){
				alert("id, password, name, tel, email 필수입력칸을 입력 후 다시 눌러주세요. ");
		}else{
			var str = $('#joinForm').serialize();
			
			$.ajax({
				url:"/app/user/join",
				type:"POST",
				data:str,
				dataType:"json",
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				beforeSend:function(){
					
				},
				error:function(request,status,error){
					alert("입력하신 값을 확인해주세요.");
		        },
				success:function(){
					alert("회원가입이 완료되었습니다.");
					$('#loading').fadeIn(500).delay(1).fadeOut();
					changeContent('../index/mainContent.jsp');
				}
			});//ajax
		}//not null validation		
	});//btn_join click
}//joinEventListener();

function updateEventListener(){
	///////////////////////////////////////////////////////////////////////////// not null validation 
	$('#userPw1').keyup(function(){
		
		userPw1 = $('#userPw1').val();
		if(userPw1==""){
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
	

	$('#tel').keyup(function(){
		tel = $('#tel').val();
		if(tel == ''||tel==null)
			$('#tel').attr("placeholder","전화번호가 비었습니다. 필수입력입니다.");
	});
		
	$('#email').keyup(function(){
		email = $('#email').val();
		if(email == ''||email==null)
			$('#email').attr("placeholder","이메일이 비었습니다. 필수입력입니다.");
	});

	$('#addr').keyup(function(){
		addr = $('#addr').val();
		if(addr == ''||addr==null)
			$('#addr').attr("placeholder","주소가 비었습니다.");
	});
	
	
	///////////////////////////////////////////////////////////////////////////// Click Update
	$('#btn_update').click(function(){
		if(	userPw1==''||userPw1==null||userPw2==''||userPw2==null||
				tel==''||tel==null||email==''||email==null){
				alert("password, tel, email 필수입력칸을 입력 후 다시 눌러주세요 ");
		}else{
			var data = $('#updateForm').serialize();
			
			$.ajax({
				url:"/app/user/update",
				type:"POST",
				data:data,
				dataType:"json",
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				beforeSend:function(){
					$('#loading').fadeIn(500).delay(1).fadeOut();
				},
				error:function(request,status,error){
					alert("필수입력을 모두 입력 후 다시 수정버튼을 눌러주세요.");
		        },
				success:function(){
					alert("update 완료되었습니다.");
					changeContent("../user/updateUser.jsp");
				}
			});//ajax
		}//not null validation
	});//btn_update click
}//updateEventListener();


function deleteEventListener(){
	///////////////////////////////////////////////////////////////////////////// Click Update
	
	$('#btn_delete').click(function(){
		var userId = $('#userId').val();
		$.ajax({
			url:"/app/user/delete/"+userId,
			type:"POST",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			error:function(){
				console.log("delete 실패");
			},
			success:function(){
				$('#myPage').css("display","none");
				$('#aLogin').css("display","block");
				changeContent("../index/mainContent.jsp");
			}
		});//ajax
	});//$('#btn_delete').click()
}//deleteEventListener();
