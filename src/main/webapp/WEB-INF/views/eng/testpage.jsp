<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$("body").on("click", "[data-editable]", function(){
	var $el = $(this);
	var $input = $('<textarea rows=5 style="width:500px"/>').val( $el.text() );
	$el.replaceWith( $input );
	$input.focus();
	var field_name = $el.attr('data-name');
	var save = function(){
		var $td = $("<td data-editable />").text($input.val());
		$.ajax({
			type : "POST",
			url : "/tight",
			data :{"bid":299, "word":"Walter", "dialogue":"White", "practice":"breaking"},
			dataType: "json",
			success : function(msg){
				if (msg["status"] == 'success'){
					$input.replaceWith($td);
				} else {
					alert("Fail");
					$input.replaceWith($el);
				}
			},
			error : function(msg) {
				alert(msg);
			}
		});
	};
	$($input).blur(function(){
		$el.closest('tr').find('td.wordo').val();
		console.log($input.closest('tr').children('td.wordo').val());
		console.log($input.val());  // 값
		console.log(field_name);	// 필드명
		var check = confirm("내용을 변경하시겠습니까?");
		if (check == true){
			save();
		} else {
			var $td = $("<td data-editable />").text( $input.val() );
			$input.replaceWith($el);
		}
	})
});
</script>
<title>Insert title here</title>
</head>
<body>
<div class="option">
<button>df</button>
</div>
</body>
</html>