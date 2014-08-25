function initGallery() {
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

}

function showImg(msg) {
	var json = JSON.parse(msg);
	list = json.list;
	var imgSrc;
	if (list.length != 0) {

		for ( var i = 0; i < list.length; i++) {
			imgSrc = "../images/images/" + list[i];
			var appendContent = '<li class="col-lg-2 col-md-2 col-sm-3 col-xs-4">'
					+ '<img class="img-responsive" src="'
					+ imgSrc
					+ '" onclick="detail(this)"></li>';
			$("#imgList").append(appendContent);

		}
	}
}

function detail(obj) {

	var src = $(obj).attr('src');
	var img = '<img src="' + src + '" class="img-responsive"/>';
	//start of new code new code
	var index = $(obj).parent('li').index();
	var html = '';
	html += img;
	html += '<div style="height:25px;clear:both;display:block;">';
	html += '<a class="controls next" href="' + (index + 2)
			+ '">next &raquo;</a>';
	html += '<a class="controls previous" href="' + (index)
			+ '">&laquo; prev</a>';
	html += '</div>';

	$('#myModal').modal();
	$('#myModal').on('shown.bs.modal', function() {
		$('#myModal .modal-body').html(html);
		//new code
		$('a.controls').trigger('click');
	})
	$('#myModal').on('hidden.bs.modal', function() {
		$('#myModal .modal-body').html('');
	});

}

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