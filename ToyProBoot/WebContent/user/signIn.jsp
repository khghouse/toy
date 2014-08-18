<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="loginForm" class="form-horizontal" role="form" method="POST" action="http://localhost:8080/user/signIn.jsp">
	  <div class="form-group">
	    <label for="inputId" class="col-lg-2 control-label">Id</label>
	    <div class="col-lg-10">
	      <input type="id" class="form-control" id="inputId" placeholder="Id">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="inputPassword" class="col-lg-2 control-label">Password</label>
	    <div class="col-lg-10">
	      <input type="password" class="form-control" id="inputPassword" placeholder="Password">
	    </div>
	  </div>
	<div class="form-group">
	    <div class="col-lg-offset-2 col-lg-10">
	      <div class="checkbox">
	        <label>
	          <input type="checkbox"> Remember me
	        </label>
	      </div>
	    </div>
	</div>
	<div class="form=group">
		<div class="col-lg-offset-2 col-lg-10">	
		    <div class="btn-group">
		      <button type="submit" class="btn btn-default" id="signin">Sign in</button>
		    </div>
		     <div class="btn-group">
		      <button type="reset" class="btn btn-default">Sign up</button>
		    </div>
	    </div>
    </div>
	</form>
	<script type="text/javascript">
		$('#inputId').focus();
		$('#signin').click(function(){
			var id = $('#inputId').val();
			var pw = $('#inputPassword').val();
			if(id == null || id.length <1){
				alert("Id를 입력하지 않으셨습니다.");
				$('#inputId').focus();
				return;
			}
			if(pw == null || pw.length <1){
				alert("Password를 입력하지 않으셨습니다.");
				$('#inputPassword').focus();
				return;
			}
		});
	</script>
</body>
</html>