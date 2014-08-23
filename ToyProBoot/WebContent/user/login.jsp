<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<!-- Page Content -->
	<div class="container">
	
		<!-- Page Heading/Breadcrumbs -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					Login <small></small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="index.html">Home</a></li>
					<li class="active">Login</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->
		
		<hr>
			<form id="loginForm" class="form-horizontal" role="form" method="POST" action="/app/user/login">
				
				<div class="form-group">
				<label for="userId" class="col-lg-4 control-label">아이디</label>
				<div class="col-lg-8">
					<input type="text" class="form-control" name="userId" id="userId"	placeholder="Id">
					<div id="checkId" style="text-align: right; float: left"></div>
				</div>
			</div>

			<div class="form-group">
				<label for="userPw" class="col-lg-4 control-label">비밀번호</label>
				<div class="col-lg-8">
					<input type="password" class="form-control" name="userPw" id="userPw" placeholder="Password">
					<div id="checkPw" style="float: left; text-align: left"></div>
				</div>
			</div>
	
			<div class="form-group">
				<div class="col-lg-offset-6">
	
					<div class="btn-group">
						<button type="button" class="btn btn-primary btn-sm" id="btn_login" onClick="changeContent('/index/index.jsp');" >로그인</button>
					</div>
					
					<div class="btn-group">
						<button type="reset" class="btn btn-default btn-sm"onClick="changeContent('../user/join.jsp');">회원가입</button>
					</div>
					
				</div>	
			</div>
	
			</form>
			<!-- loginForm -->
		
		<hr>
		
		<jsp:include page="../layout/footer.jsp"></jsp:include>
		
	</div>
	<!-- /.container -->

<script type="text/javascript">
		loginEventListener();
</script>

