<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- <input type="submit" value="목록"/>
</form> -->
<a href="#" onclick="changeContent('/app/bbs/bbsList')">목록</a> --%>

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
    
	    <form class="form-horizontal" role="form" action="/app/bbs/bbsList" method="post">
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
	      <p class="form-control-static"><fmt:formatDate value="${bbs.regDate }" pattern="yyyy-MM-dd"/></p>
	    </div>
	    
	    <label class="col-lg-2 control-label">첨부파일</label>
	    <div class="col-lg-10">
	      <p class="form-control-static">[&nbsp;${bbs.attachment }&nbsp;]</p>
	    </div> 
	    
	    <label class="col-lg-2 control-label">내용</label>
	    <div class="col-lg-10">
	    	<textarea class="form-control" readonly="readonly" id="">${bbs.content }</textarea>
		</div>	
		</div>
			</form>
			<p align="right" id="bbs_reply">
			<button type="submit" class="btn btn-default btn-sm" >목록</button>
			</p>
			
  	</div>

