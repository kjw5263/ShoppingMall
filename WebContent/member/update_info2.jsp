<%@page import="com.member.db.MemberDTO"%>
<%@page import="com.member.db.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <meta charset="UTF-8">
    <meta name="description" content="Yoga Studio Template">
    <meta name="keywords" content="Yoga, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,500,600,700,800,900&display=swap"
        rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="./css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="./css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="./css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="./css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="./css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="./css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="./css/style.css" type="text/css">


</head>
<script type="text/javascript">
function func1() {
	var con = document.getElementById("i1");
	con.style.display = (con.style.display != 'none') ? "none" : "block";
	var con = document.getElementById("i2");
	con.style.display = (con.style.display != 'none') ? "none" : "block";
}

function func2() {
	var con = document.getElementById("i3");
	con.style.display = (con.style.display != 'none') ? "none" : "block";
	var con = document.getElementById("i4");
	con.style.display = (con.style.display != 'none') ? "none" : "block";
}

function func3() {
	var con = document.getElementById("i5");
	con.style.display = (con.style.display != 'none') ? "none" : "block";
	var con = document.getElementById("i6");
	con.style.display = (con.style.display != 'none') ? "none" : "block";
}



</script>
<body>
	<!-- header 시작 -->
 		<jsp:include page="../header/header.jsp" />
	<!-- header 끝 -->
	
	
	
	<!-- container 시작 -->	
	
	
	 <!-- Page Add Section Begin -->
    <section class="page-add">
            <div class="row">      
                <div class="col-lg-3"></div>
                  
                <div class="col-lg-9">
                    <div class="page-breadcrumb">
                        <h2>MY PAGE<span>.</span></h2><h3>회원 수정</h3>
                    </div>
                   
                </div>
                  
                
            </div>
    </section>
    <!-- Page Add Section End -->
	
	
	<div class="container-fluid">	
	
	<% 
	String userId = (String)session.getAttribute("userId");
	MemberDTO mdto  = (MemberDTO)request.getAttribute("mdto");
		
	%>
	
	<div class="row">
		<div class="col-3"></div>
		<div class="col-6">	
			<div class="row">
				<div class="col-3">
					
					<h4><a href="">장바구니</a></h4>
					<h4><a href="">주문조회</a></h4>
					<h4><a href="">찜목록</a></h4>
					<hr>
					<h4><a href="">내 쿠폰</a></h4>
					<h4><a href="">포인트</a></h4>
					<hr>
					<h5><a href="">내 화장품 사용기한 확인하기</a></h5>
					<hr>
					<h4><a href="./MemberUpdateInfo.me">회원 정보 수정</a></h4>
					<h4><a href="./MemberDelete.me">탈퇴하기</a></h4>
				
				</div>
				<div class="col-9">
					
			<h3>기본 회원 정보</h3><br>
					
				<!-- 회원정보 -->
					<table class="table table-hover" "width="820px;" height="350px;" style="text-align: center;">
						<tr>
							<th>아이디</th>
							<td><%=mdto.getUserId() %></td>
							<td></td>
						</tr>
						<tr>
							<th>이름</th>
							<td><%=mdto.getUserName() %></td>
							<td></td>
						</tr>
					  <!--전화변호 변경 구역  -->
					  <tr>
				      <th scope="row">전화번호</th>
				      <td>
				      
					     <form action="MemberUpdateInfopro2.me" method="post" onsubmit="return phcheck()">
					     	<input type="hidden" name="id" value="<%=mdto.getUserId()%>">
					     	<input type="hidden" name="number" value="1">
					      		<div id="i2" style="display: none;">
						      		<div><input type="text" name="userTel" id="userTel" value="<%=mdto.getUserTel()%>"></div><br>
						      		
							   		<input type="submit" class="btn btn-outline-primary btn-sm" value="확인">
							      	<input type="button" class="btn btn-outline-primary btn-sm" value="취소" onclick="func1();">	
							      		
							     </div>
						      	
						      	<div id="i1"><%=mdto.getUserTel() %></div>
					      </form>
				      </td>
				      <td><button type="button" class="btn btn-outline-info" onclick="func1();">변경하기</button></td>
				    </tr>
				    <!--전번 구역 끝 이메일 구역 시작  -->
					  <tr>
				      <th scope="row">이메일</th>
				      <td>
					     <form action="MemberUpdateInfopro2.me" method="post" onsubmit="return phcheck()">
					     	<input type="hidden" name="id" value="<%=mdto.getUserEmail() %>">
					     	<input type="hidden" name="number" value="2">
					      		<div id="i4" style="display: none;">
						      		<div><input type="text" name="userEmail" id="userEmail"></div><br>
						      		
							   		<input type="submit" class="btn btn-outline-primary btn-sm" value="확인">
							      	<input type="button" class="btn btn-outline-primary btn-sm" value="취소" onclick="func2();">	
							      		
							     </div>
						      	
						      	<div id="i3"><%=mdto.getUserEmail() %></div>
					      </form>
				      </td>
				      <td><button type="button" class="btn btn-outline-info" onclick="func2();">변경하기</button></td>
				    </tr>
				    <!--  -->
				    <tr>
				      <th scope="row">비밀번호</th>
				      
				      <td>
					      <form action="MemberUpdateInfopro2.me" method="post" onsubmit="return pwcheck()">
					     	<input type="hidden" name="id" value="<%=mdto.getUserId()%>">
					     	<input type="hidden" name="number" value="3">
					      	<div id="i6" style="display: none;">
					      		<table class="table table-borderless">
					      			<tr>
					      				<th>현재비밀번호</th>
					      				<th><input type="password" name="userPass" id="userPass" class="form-control"></th>
					      			</tr>
					      			<tr>
					      				<th>새 비밀번호</th>
					      				<th><input type="password" name="newpw1" id="newpw1" class="form-control"></th>
					      			</tr>
					      			<tr>
					      				<th>새 비밀번호 확인</th>
					      				<th><input type="password" name="newpw2" id="newpw2" class="form-control"></th>
					      			</tr>
									<tr>
					      				<td colspan="2">
					      				<input type="submit" class="btn btn-outline-info" value="변경하기">
					      				<input type="button" class="btn btn-outline-info" value="취소" onclick="func3();">
					      				</td>
									</tr>					      		
					      		</table>
					      		</div>
    							<%
    								String pw="";
    								for(int i= 0 ; i<mdto.getUserPass().length();i++)
    								{
    									pw+="*";
    								}
    							%>
					      	<div id="i5"><%=pw %></div>
					      </form>
				      </td>
				      
				      <td>
				      <button type="button" class="btn btn-outline-info" onclick="func3();">변경하기</button>
				      </td>
				      
				    </tr>
				  
				    
				</table>
	
				<br><br><br>
				<h3>비밀번호 변경</h3><br>				
				<table class="table" width="840px;" height="100px;" style="text-align: center; font-size: 20px;">
					<tr>
				      <th scope="row">비밀번호</th>
				      
				      <td>
					      <form action="MemberUpdateInfopro2.me" method="post" onsubmit="return pwcheck()">
					     	<input type="hidden" name="id" value="<%=mdto.getUserId()%>">
					     	<input type="hidden" name="number" value="1">
					      	<div id="i2" style="display: none;">
					      		<table class="table table-borderless">
					      			<tr>
					      				<th>현재비밀번호</th>
					      				<th><input type="password" name="userPass" id="userPass" class="form-control"></th>
					      			</tr>
					      			<tr>
					      				<th>새 비밀번호</th>
					      				<th><input type="password" name="newpw1" id="newpw1" class="form-control"></th>
					      			</tr>
					      			<tr>
					      				<th>새 비밀번호 확인</th>
					      				<th><input type="password" name="newpw2" id="newpw2" class="form-control"></th>
					      			</tr>
									<tr>
					      				<td colspan="2">
					      				<input type="submit" class="btn btn-outline-info" value="변경하기">
					      				<input type="button" class="btn btn-outline-info" value="취소" onclick="func1();">
					      				</td>
									</tr>					      		
					      		</table>
					      		</div>
    							<%
    								String pw1="";
    								for(int i= 0 ; i<mdto.getUserPass().length();i++)
    								{
    									pw1+="*";
    								}
    							%>
					      	<div id="i1"><%=pw1 %></div>
					      </form>
				      </td>
				      
				      <td>
				      <button type="button" class="primary-btn look-btn" style="background-color: #B0BCC2;" onclick="func1();">변경하기</button>
				      </td>
				      
				    </tr>
				    
				</table>
				
					
					<br><br>
						<fieldset style="border: 3px solid #EAEAEA; padding: 10px;" >
						<h3>부가정보</h3><br>
						<form>
						<h4>나의 피부</h4><br>
						<%if(mdto.getUserSkinType().equals("건성")){%>
						<input type="radio" name="skinType" value="건성" checked> 건성
						<input type="radio" name="skinType" value="중성"> 중성
						<input type="radio" name="skinType" value="지성"> 지성
						<input type="radio" name="skinType" value="복합성"> 복합성
						<%}else if(mdto.getUserSkinType().equals("중성")){%>
						<input type="radio" name="skinType" value="건성"> 건성
						<input type="radio" name="skinType" value="중성" checked> 중성
						<input type="radio" name="skinType" value="지성"> 지성
						<input type="radio" name="skinType" value="복합성"> 복합성
						<%}else if(mdto.getUserSkinType().equals("지성")){%>
						<input type="radio" name="skinType" value="건성"> 건성
						<input type="radio" name="skinType" value="중성"> 중성
						<input type="radio" name="skinType" value="지성" checked> 지성
						<input type="radio" name="skinType" value="복합성"> 복합성
						<%}else if(mdto.getUserSkinType().equals("복합성")){%>
						<input type="radio" name="skinType" value="건성"> 건성
						<input type="radio" name="skinType" value="중성"> 중성
						<input type="radio" name="skinType" value="지성"> 지성
						<input type="radio" name="skinType" value="복합성" checked> 복합성
						<%} %>
						<br><br>	
						<h4>피부 고민</h4><br>	
						<%if(mdto.getUserTrouble().equals("여드름")){%>
						<input type="radio" name="skinTrouble" value="여드름" checked> 여드름
						<input type="radio" name="skinTrouble" value="아토피"> 아토피
						<input type="radio" name="skinTrouble" value="민감성"> 민감성
						<input type="radio" name="skinTrouble" value="해당없음"> 해당없음
						
						<%}else if(mdto.getUserTrouble().equals("아토피")){%>
						<input type="radio" name="skinTrouble" value="여드름"> 여드름
						<input type="radio" name="skinTrouble" value="아토피" checked> 아토피
						<input type="radio" name="skinTrouble" value="민감성"> 민감성
						<input type="radio" name="skinTrouble" value="해당없음"> 해당없음
						<%}else if(mdto.getUserTrouble().equals("민감성")){%>
						<input type="radio" name="skinTrouble" value="여드름"> 여드름
						<input type="radio" name="skinTrouble" value="아토피"> 아토피
						<input type="radio" name="skinTrouble" value="민감성" checked> 민감성
						<input type="radio" name="skinTrouble" value="해당없음"> 해당없음
						<%}else if(mdto.getUserTrouble().equals("해당없음")){%>
						<input type="radio" name="skinTrouble" value="여드름"> 여드름
						<input type="radio" name="skinTrouble" value="아토피"> 아토피
						<input type="radio" name="skinTrouble" value="민감성"> 민감성
						<input type="radio" name="skinTrouble" value="해당없음"  checked> 해당없음
						<%} %>
						</form><br>
						<div style="text-align: center;">
						<button type="submit" class="primary-btn look-btn" style="background-color: #B0BCC2;">저장</button>
						</div>									
						</fieldset>
						
						<br><br><br>
					
					<br><br><br><br><br>
				</div>
			</div>
		</div>
		<div class="col-3"></div>
	</div>
	
	
	
	</div>
	<!-- container 끝 -->	
	
	
	<!-- footer 시작 -->
   		<jsp:include page="../footer/footer.jsp" />
    <!-- footer 시작 -->
	
	

	
</body>
</html>