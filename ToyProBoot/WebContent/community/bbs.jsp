<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="../css/toy.css" rel="stylesheet">

<!-- <script type="text/javascript">
ajaxConnect();
</script> -->

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
        
		<table class="table">
				
			<div class="row">
			 <div class="col-lg-8">
			    <div class="input-group">
			      <div class="input-group-btn">
			        <button type="button" class="btn btn-primary btn-sm" id="bbs_writer" onclick="changeContent('../community/addBBSContentForm.jsp')">글쓰기</button>
			      </div><!-- /btn-group -->
			    </div><!-- /input-group -->
			  </div>
			  <div class="col-lg-4">
			    <div class="input-group">
			      <div class="input-group-btn">
			        <!-- <button type="button" id = "testId" class="btn btn-default dropdown-toggle" data-toggle="dropdown">&nbsp;&nbsp;검  색 ▼&nbsp;&nbsp;<span class="caret"></span></button>
			        <ul class="dropdown-menu" >
			          <li><a href="#" onclick="test();">제목</a></li>
			          <li><a href="#">작성자</a></li>
			          <li><a href="#">글내용</a></li>
			        </ul> -->
			        <select name="bbsCondition" class="btn btn-default" id="bbsConditionId">
			        	<option value="0">제목</option>
			        	<option value="1">작성자</option>
			        	<option value="2">글내용</option>
			        </select>
			      </div><!-- /btn-group -->
			      <input type="text" class="form-control" name="searchKeyword" id="bbsKeyword" onkeyup="fncBbsCondition();">
			    </div><!-- /input-group -->
			  </div><!-- /.col-lg-6 -->
			</div><!-- /.row -->
			<p/>
			
			<tr>
				<th width="10%">번호</th>
				<th width="40%">제목</th>
				<th width="10%">첨부</th>
				<th width="15%">작성자</th>
				<th width="15%">등록일</th>
				<th width="10%">조회수</th>
			</tr>

		</table>
		
		<!-- Pagination -->
        <div class="row text-center">
            <div class="col-lg-12">
                <ul class="pagination">
                </ul>
            </div>
        </div>
        
        <hr>
        
        <jsp:include page="../layout/footer.jsp"></jsp:include>
	</div>
	
<script type="text/javascript">
/* $(document).ready(function(){
	
}) */
ajaxConnect();
</script>
