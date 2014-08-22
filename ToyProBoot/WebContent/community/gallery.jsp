<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Bootstrap Image Gallery</title>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<script src="../js/jquery-1.11.0.js"></script>
<script src="../js/bootstrap.min.js"></script>

</head>
<style>
ul {
	padding: 0 0 0 0;
	margin: 10%;
}

ul li {
	list-style: none;
	margin-bottom: 25px;
	margin-right: 20px;
}

ul li img {
	cursor: pointer;
}

.modal-body {
	padding: 5px !important;
}

.modal-content {
	border-radius: 0;
}

.modal-dialog img {
	text-align: center;
	margin: 0 auto;
}

.controls {
	width: 50px;
	display: block;
	font-size: 11px;
	padding-top: 8px;
	font-weight: bold;
}

.next {
	float: right;
	text-align: right;
}
/*override modal for demo only*/
.modal-dialog {
	max-width: 500px;
	padding-top: 90px;
}

@media screen and (min-width: 768px) {
	.modal-dialog {
		width: 500px;
		padding-top: 90px;
	}
}

@media screen and (max-width:1500px) {
	#ads {
		display: none;
	}
}
</style>

<body>
	<script type="text/javascript">
		//<![CDATA[try{(function(a){var b="http://",c="demo.fearlessflyer.com",d="/cdn-cgi/cl/",e="img.gif",f=new a;f.src=[b,c,d,e].join("")})(Image)}catch(e){}//]]>
	</script>
	<div id="ads"
		style="padding: 25px; border-left: 1px solid #ccc; border-bottom: 1px solid #ccc; width: 200px; height: 200px; margin: 0 0 0 0; position: absolute; background: #fff; right: 0; top: 0; -webkit-box-sizing: content-box !important; box-sizing: content-box !important;">
		<script async
			src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
		<ins class="adsbygoogle"
			style="display: inline-block; width: 200px; height: 200px"
			data-ad-client="ca-pub-6163174599932698" data-ad-slot="6189522971"></ins>
		<script>
			(adsbygoogle = window.adsbygoogle || []).push({});
		</script>
	</div>
	<div class="container">
	<!-- 	<div class="row"
			style="text-align: center; border-bottom: 1px dashed #ccc; padding: 0 0 20px 0; margin-bottom: 40px;">
			<h3 style="font-family: arial; font-weight: bold; font-size: 30px;">
				<a style="text-decoration: none; color: #666;" href="">Bootstrap
					<span style="color: red;">Image Gallery</span>
				</a>
			</h3>
			<p>
				íìí©ëë¤. ì´ê³³ì <strong><a style="color: red"
					href="index.jsp#">Image Gallery</a></strong> ìëë¤.
			</p>
		</div>

		<div>
			<form action="../upload" method="post" enctype="multipart/form-data">
				<input type="file" name="imageFile"><br> <input
					type="submit" value="ì ì¡">
			</form>
		</div> -->
		<center>
			<ul id="imgList" class="row">

			</ul>
		</center>
	</div>
	<!-- /container -->


	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body"></div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

</body>

<script>
	$.ajax({
		type : "POST",
		url : "/app/showImg",
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		error : function(request, status, error) {
			alert("code:" + request.status + "\n" + "message:"
					+ request.responseText + "\n" + "error:" + error);
		},
		success : function(msg) {

			showImg(msg);

		}
	});
	function showImg(msg) {
		var json = JSON.parse(msg);
		list = json.list;
		var imgSrc;
		if (list.length != 0) {

			for ( var i = 0; i < list.length; i++) {
				imgSrc = "../images/images/" + list[i];
				var appendContent = '<li class="col-lg-2 col-md-2 col-sm-3 col-xs-4">'
						+ '<img class="img-responsive" src="'+imgSrc+'"></li>';
				$("#imgList").append(appendContent);

			}
		}
	}
	$(document)
			.ready(
					
					
					
					function() {
						$('#imgList li img')
								.on(
										'click',
										function() {
											var src = $(this).attr('src');
											var img = '<img src="' + src + '" class="img-responsive"/>';

											//start of new code new code
											var index = $(this).parent('li')
													.index();

											var html = '';
											html += img;
											html += '<div style="height:25px;clear:both;display:block;">';
											html += '<a class="controls next" href="'
													+ (index + 2)
													+ '">next &raquo;</a>';
											html += '<a class="controls previous" href="'
													+ (index)
													+ '">&laquo; prev</a>';
											html += '</div>';

											$('#myModal').modal();
											$('#myModal')
													.on(
															'shown.bs.modal',
															function() {
																$(
																		'#myModal .modal-body')
																		.html(
																				html);
																//new code
																$('a.controls')
																		.trigger(
																				'click');
															})
											$('#myModal')
													.on(
															'hidden.bs.modal',
															function() {
																$(
																		'#myModal .modal-body')
																		.html(
																				'');
															});

										});

					})

	//new code

	$(document).on('click', 'a.controls', function() {
		var index = $(this).attr('href');
		var src = $('ul.row li:nth-child(' + index + ') img').attr('src');

		$('.modal-body img').attr('src', src);

		var newPrevIndex = parseInt(index) - 1;
		var newNextIndex = parseInt(newPrevIndex) + 2;

		if ($(this).hasClass('previous')) {
			$(this).attr('href', newPrevIndex);
			$('a.next').attr('href', newNextIndex);
		} else {
			$(this).attr('href', newNextIndex);
			$('a.previous').attr('href', newPrevIndex);
		}

		var total = $('ul.row li').length + 1;
		//hide next button
		if (total === newNextIndex) {
			$('a.next').hide();
		} else {
			$('a.next').show()
		}
		//hide previous button
		if (newPrevIndex === 0) {
			$('a.previous').hide();
		} else {
			$('a.previous').show()
		}

		return false;
	});
</script>
</html>
