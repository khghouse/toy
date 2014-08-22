<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Page Content -->
<div class="container">

	<!-- Page Heading/Breadcrumbs -->
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">
				Join <small></small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="index.html">Home</a></li>
				<li class="active">Join</li>
			</ol>
		</div>
	</div>
	<!-- /.row -->
	
		<hr>
	
		<form id="joinForm" class="form-horizontal" role="form" name="joinForm">
			
			<div class="form-group">
				<label for="userId" class="col-lg-4 control-label">아이디</label>
				<div class="col-lg-8">
					<input type="text" class="form-control" name="userId" id="userId"	placeholder="Id">
					<div id="checkId" style="text-align: right; float: left"></div>
				</div>
			</div>

			<div class="form-group">
				<label for="userPw1" class="col-lg-4 control-label">비밀번호</label>
				<div class="col-lg-8">
					<input type="password" class="form-control" id="userPw1" placeholder="Password">
					<div id="checkPw1" style="float: left; text-align: left"></div>
				</div>
			</div>

			<div class="form-group">
				<label for="userPw2" class="col-lg-4 control-label">비밀번호 재확인</label>
				<div class="col-lg-8">
					<input type="password" class="form-control" name="userPw" id="userPw2" placeholder="Password">
					<div id="checkPw2" style="float: left; text-align: left"></div>
				</div>
			</div>
			
			<div class="form-group">
				<label for="userName" class="col-lg-4 control-label">이름</label>
				<div class="col-lg-8">
					<input type="text" class="form-control" name="userName" id="userName" placeholder="Name">
				</div>
			</div>
			
			<div class="form-group">
				<label for="tel" class="col-lg-4 control-label">전화번호</label>
				<div class="col-lg-8">
					<input type="text" class="form-control" name="tel" id="tel" placeholder="Tel">
				</div>
			</div>
			
			<div class="form-group">
				<label for="email" class="col-lg-4 control-label">이메일</label>
				<div class="col-lg-8">
					<input type="text" class="form-control" name="email" id="email" placeholder="Email">
				</div>
			</div>
			
			<div class="form-group">
				<label for="emailReceive" class="col-lg-4 control-label">이메일 수신여부</label>
					<div class="col-lg-8">
						<span class="input-group-addon" style="background:#ffffff"><input type="radio"  name="emailReceive" value="0" checked="checked">수신 동의</span>
						<span class="input-group-addon" style="background:#ffffff"><input type="radio" name="emailReceive" value="1" >수신 비동의</span>
					</div>
			</div>
			
			<div class="form-group">
				<label for="addr" class="col-lg-4 control-label">주소</label>
				<div class="col-lg-8">
					<input type="text" class="form-control" name="addr" id="addr" placeholder="Address">
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-lg-offset-6">
	
					<div class="btn-group">
						<button id="btn_join" type="button" class="btn btn-primary btn-sm">가입하기</button>
					</div>
					
					<div class="btn-group">
						<button type="button" class="btn btn-default btn-sm"onClick="resetData();">취소</button>
					</div>
					
				</div>	
			</div>
			
		</form>
		<!-- joinForm -->
		<div id="loading" style="position:absolute;top:30%;left:40%; display:none;"><img alt="" src="../images/loading.gif"></div>
		
		<hr>
		
	<jsp:include page="../layout/footer.jsp"></jsp:include>

</div>
<!-- /.container -->

<script type="text/javascript">
		joinEventListener();
		
		function resetData(){
			document.joinForm.reset();
		}
</script>