<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#" onclick="changeContent('../index/mainContent.jsp')">Toy Library</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                	<!-- <li>
                		<a href="#" onclick="changeContent('../about/test.html')">About</a>
                	</li> -->
                    <li>
                        <a href="#" onclick="changeContent('../contact/contact.jsp')">Contact</a>
                    </li>
                    <li>
                        <a href="#" onclick="changeContent('../search/toySearch.jsp')">Search</a>
                    </li>
                    <!-- <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Search <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="#" onclick="changeContent('../search/toySearch.jsp')">Toy Search</a>
                            </li>
                            <li>
                                <a href="#" onclick="changeContent('../search/newToyList.jsp')">New Toy</a>
                            </li>
                            <li>
                                <a href="#" onclick="changeContent('../search/bestToyList.jsp')">Best Toy</a>
                            </li>
                        </ul>
                    </li> -->
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Community <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="#" onclick="changeContent('../community/bbs.jsp')">BBS</a>
                            </li>
                            <li>
                                <a href="#" onclick="changeContent('../community/gallery.jsp')">Gallery</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#" id="aLogin" onclick="changeContent('../user/login.jsp')">Login</a>
                    </li>
                    <li id="myPage" style="display:none;" class="dropdown">
                        <a id="aUserId" href="#" class="dropdown-toggle" data-toggle="dropdown">Login<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="#" onclick="changeContent('../user/updateUser.jsp')">MyPage</a>
                            </li>
                            <li>
                                <a href="#" onclick="changeContent('../user/rentalState.jsp')">RentalState</a>
                            </li>
                            <li>
                                <a id="aLogout" href="#" onclick="changeContent('../index/mainContent.jsp')">Logout</a>
                            </li>
                        </ul>
                    </li>
                </ul>
<!--                 <form class="navbar-form navbar-right">
		            <div class="form-group">
		              <input type="text" placeholder="Email" class="form-control">
		            </div>
		            <div class="form-group">
		              <input type="password" placeholder="Password" class="form-control">
		            </div>
		            <button type="submit" class="btn btn-success">Sign in</button>
		       </form> -->
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
    
<script type="text/javascript">
	/* (function(){
		alert("already");
		
	})(); */
</script>