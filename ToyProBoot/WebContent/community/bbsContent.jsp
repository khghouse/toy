<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
        
	    <form class="form-horizontal" role="form">
	  <div class="form-group">
	  
	    <label class="col-lg-2 control-label">제목</label>
	    <div class="col-lg-10">
	      <p class="form-control-static">${bbs.subject }</p>
	    </div>
	    
	    <label class="col-lg-2 control-label">작성자</label>
	    <div class="col-lg-10">
	      <p class="form-control-static">${bbs.writer }</p>
	    </div>
	    
	    <label class="col-lg-2 control-label">작성일</label>
	    <div class="col-lg-10">
	      <p class="form-control-static">${bbs.regDate }</p>
	    </div>
	    
	    <label class="col-lg-2 control-label">첨부파일</label>
	    <div class="col-lg-10">
	      <p class="form-control-static">[&nbsp;${bbs.attachment }&nbsp;]</p>
	    </div> 
	    
	    <label class="col-lg-2 control-label">내용</label>
	    <div class="col-lg-10">
	    	<textarea class="form-control" readonly="readonly" >${bbs.content }</textarea>
		</div>	
		
		
		<label class="col-lg-2 control-label"></label>
	    <div class="col-lg-10">
	      <p class="form-control-static"></p>
	    </div>
	     
		</div>
		<input type="hidden" name="code"value="${bbs.code }"/>
		<input type="hidden" name="depth" value="${bbs.depth }"/>
		</form>
		
		
		<!-- 댓글공간 -->
		<form class="form-horizontal" role="form" id="replyFormId" name="replyForm">
			<div class="form-group">
			 <hr id="reply_hr">
	    <!-- 공백 -->
		    <label class="col-lg-2 control-label"></label>
		    <div class="col-lg-10">
		      <p class="form-control-static"></p>
		    </div>
		    
		    <!-- 댓글쓰기 -->
			<label class="col-lg-2" id="reply_lable">댓글</label>
		    <div class="col-lg-10" id="bbsReply">
		    	<textarea id="reply_textarea" rows="3"></textarea>
		    	<button type="button" class="btn btn-default btn-sm" id="reply_btn" onclick="addReply();">댓글등록</button>
			</div>	
			<!-- 공백 -->
			<label class="col-lg-2 control-label"></label>
		    <div class="col-lg-10">
		      <p class="form-control-static"></p>
		    </div>
		    
		    <!-- 댓글 -->
			<c:forEach var="reply" items="${reply }">
			<div class="col-lg-10" id="bbsReply">
				<div class="form-group has-warning" >
				<input type="hidden" name="replyCode" id="replyCodeId${reply.replyCode }" value="${reply.replyCode }"/>
	  			<label class="control-label" for="inputWarning">${reply.replyWriter }</label>
	 			 <input type="text" class="form-control" name="reply_content" id="reply_contentId${reply.replyCode }" value="${reply.replyContent }" readOnly>
				</div>
   			 	<p align="right" id="reply_preUpdate">
	      		<button type="button" class="btn btn-default btn-sm" id="reply_btn"  onclick="updateReplyForm(${reply.replyCode });">수정</button>
	      		
	      		<button type="button" class="btn btn-default btn-sm" id="reply_btn" onclick="deleteReply(${reply.replyCode })">삭제</button>
	      		</p>
	      		
	      		<p align="right" id="reply_updateState">
	      		<button type="button" class="btn btn-default btn-sm" id="reply_btn"  onclick="updateReply(${reply.replyCode});">댓글수정</button>
	      		
	      		<button type="button" class="btn btn-default btn-sm" id="reply_btn" onclick="updateCancel(${reply.replyCode})">취소</button>
	      		</p>
			</div>
   			 </c:forEach>
   			 </div>
   			 <hr id="reply_hr">
   			 <input type="hidden" name="code" id="codeId" value="${bbs.code }"/>
		</form>
		
		
			
			<!--  button -->
			<p align="right" id="bbs_reply">
			<c:if test="${bbs.root == 0 }">
				<button type="button" class="btn btn-default btn-sm" onclick="changeContent('/app/bbs/addBBSReContentForm/${bbs.code }')">답글</button>
			</c:if>
			<button type="button" class="btn btn-default btn-sm" onclick="changeContent('/app/bbs/updateBBSContentForm/${bbs.code}')">수정</button>
			<button type="button" class="btn btn-default btn-sm" onclick="changeContent('../community/bbs.jsp')">목록</button>
			<button type="button" class="btn btn-default btn-sm" onclick="changeContent('/app/bbs/deleteBBSContent/${bbs.code}/${bbs.depth }')">삭제</button>
			</p>
			
  	</div>
    
    
    
  
