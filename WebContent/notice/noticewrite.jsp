<%@page import="com.notice.db.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.hidden {
	display: none;
}

.shown {
	display:;
}
</style>
<meta charset="UTF-8">
<meta name="description" content="Yoga Studio Template">
<meta name="keywords" content="Yoga, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Violet | Template</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css"
	integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js"
	integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"
	integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"
	integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn"
	crossorigin="anonymous"></script>
<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="./css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="./css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="./css/nice-select.css" type="text/css">
<link rel="stylesheet" href="./css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="./css/magnific-popup.css" type="text/css">
<link rel="stylesheet" href="./css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="./css/style.css" type="text/css">

<style type="text/css">
</style>

</head>

<body>

	<!-- header 시작 -->
	<jsp:include page="../header/header.jsp" />
	<!-- header 끝 -->
	<%	

String userId = (String)session.getAttribute("userId");
// 전달정보 저장 - 액션태그 (자바빈)- num,pass
NoticeDAO noti = new NoticeDAO();
int check1 = noti.deleteCheckNotice(userId);

System.out.println("userId = "+userId);

 if(check1 == 1){
 	
  }else{
	  %>
	<script type="text/javascript">
	alert("글쓰기 권한이 없습니다");
	history.back();
</script>
	<%
	}

%>


	<br>
	<div style="margin-left: 30%">
		<h1 class="display-4">공지사항 쓰기</h1>
		<div style="margin-right: 30%">
			<fieldset>
				<form action="noticewritepro.nos" method="post"
					enctype="multipart/form-data">
					<div class="input-group">
						<div class="input-group-prepend">
							<span class="input-group-text">제목</span>
						</div>
						<input type="text" name="title">
					</div>
					<br>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<label class="input-group-text" for="inputGroupSelect01">중요도</label>
						</div>
						<select class="custom-select" id="inputGroupSelect01" name="imp2">

							<option value="1" selected>공지사항</option>
							<option value="0">이벤트</option>

						</select>
					</div>





					<div class="input-group">
						<div class="input-group-prepend">
							<span class="input-group-text">내용</span>
						</div>
						<textarea class="form-control" aria-label="With textarea"
							rows="10" cols="30" name="content"></textarea>
					</div>

					<div class="input-group">
						<div class="custom-file">
							<input type="file" class="custom-file-input" name="filename"
								aria-describedby="inputGroupFileAddon04"> <label
								class="custom-file-label" for="inputGroupFile04">첨부파일</label>
						</div>
						<div class="input-group-append">
							<button class="btn btn-outline-secondary" type="button"
								id="inputGroupFileAddon04">취소하기</button>
						</div>
					</div>

					<div class="input-group">
						<div class="custom-file">
							<input type="file" class="custom-file-input" name="imgname"
								aria-describedby="inputGroupFileAddon04"><label
								class="custom-file-label" for="inputGroupFile04">이미지
								추가하기</label>
						</div>
						<div class="input-group-append">
							<button class="btn btn-outline-secondary" type="button"
								id="inputGroupFileAddon04">취소하기</button>
						</div>
					</div>


					<hr>
					<input type="submit" class="btn btn-primary" value="글쓰기">


				</form>
			</fieldset>
		</div>
	</div>
	<br>
	<!-- footer 시작 -->
	<jsp:include page="../footer/footer.jsp" />
	<!-- footer 끝 -->
</body>

<!-- Js Plugins -->
<script type="text/javascript">

    $('.custom-file input').change(function (e) {
        var files = [];
        for (var i = 0; i < $(this)[0].files.length; i++) {
            files.push($(this)[0].files[i].name);
        }
        $(this).next('.custom-file-label').html(files.join(', '));
    });

</script>
<script>window.jQuery || document.write('<script src="/docs/4.6/assets/js/vendor/jquery.slim.min.js"><\/script>')</script>
<script
	src="https://cdn.jsdelivr.net/npm/docsearch.js@2/dist/cdn/docsearch.min.js"></script>

<script src="./js/jquery-3.3.1.min.js"></script>
<script src="./js/bs-custom-file-input.js"></script>
<script src="./js/bootstrap.min.js"></script>
<script src="./js/jquery.magnific-popup.min.js"></script>
<script src="./js/jquery.slicknav.js"></script>
<script src="./js/owl.carousel.min.js"></script>
<script src="./js/jquery.nice-select.min.js"></script>
<script src="./js/mixitup.min.js"></script>
<script src="./js/main.js"></script>

<script type="text/javascript">
	
	function pop() {
		if(document.getElementById("imp2").checked==true){
			document.getElementById("imp2").checked=false;
		}else{
			document.getElementById("imp2").checked=true;
		}
	}

</script>

</html>