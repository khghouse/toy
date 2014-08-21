<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="container">
    
     <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">BBS
                    <small></small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="index.html">Home</a></li>
                    <li class="active">Community</li>
                </ol>
            </div>
        </div>
        <!-- /.row -->
        
	<form class="form-horizontal" role="form" id="bbsForm" action="" method="post">
	<!-- <form class="form-horizontal" role="form"> -->
	
	  <div class="form-group">
	    <label for="inputEmail1" class="col-lg-2 control-label">제목</label>
	    <div class="col-lg-10">
	      <input type="text" name="subject" class="form-control" id="subjectId" placeholder="제목"/>
	    </div>
	  </div>
	  
	  <div class="form-group">
	    <label for="inputEmail1" class="col-lg-2 control-label">작성자</label>
	    <div class="col-lg-10">
	      <input type="text"  name="writer" class="form-control" id="writerId" placeholder="작성자"/>
	    </div>
	  </div>
	  
	  <div class="form-group">
	   <label for="inputPassword1" class="col-lg-2 control-label">내용</label>
	    <div class="col-lg-10">
	  	<textarea class="form-control" rows="3" name="content" id="contentId"></textarea>
	  	</div>
	  </div>
	  
	  <div class="form-group">
	    <label for="inputEmail1" class="col-lg-2 control-label">첨부파일</label>
	    <div class="col-lg-10">
	      <input type="file"  name="writer" id="bbs_attachment" placeholder="첨부파일"/>
	    </div>
	  </div>
	  
	  
	    <input type="hidden" id="root" value="${bbs.code }"/>
		<input type="hidden" id="groupId" value="${bbs.groupId }"/>
		<input type="hidden" id="groupStep" value="${bbs.groupStep }"/>
		<input type="hidden" id="groupTab" value="${bbs.groupTab }"/>
		<input type="hidden" id="code" value="${bbs.code }"/>
	  
	  <p align="center">
	   <%-- <button  type="button" class="btn btn-primary btn-sm" onclick="changeContent('/app/bbs/addBBSReContent/${bbs.code }')">등록</button> --%>
	   <a href="#"  class="btn btn-primary btn-sm" onclick="formAddRecontent();">등록</a>
	   <a href="#"  class="btn btn-default btn-sm" onclick="changeContent('../community/bbs.jsp')">취소</a>
	  </p>
	</form>
</div>
