<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.goods.db.listDAO"%>
<%@page import="com.goods.db.GoodsDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.var.list.varlist"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Yoga Studio Template">
    <meta name="keywords" content="Yoga, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Violet | Template</title>

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
<style type="text/css">
button{
  background:#1AAB8A;
  color:#fff;
  border:none;
  position:relative;
  height:34px;
  font-size:1em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
button:hover{
  background:#fff;
  color:#1AAB8A;
}
button:before,button:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #1AAB8A;
  transition:400ms ease all;
}
button:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
button:hover:before,button:hover:after{
  width:100%;
  transition:800ms ease all;
}




	#one{
	  border-right:	1px solid #444444;
	}
	#one:last-child {
	border-right: 0;
	}
table {
	margin-top : 10px;
	margin-bottom : 10px;
	margin-left : 50px;
    border-collapse: collapse;
}
table td {
    border:  0px solid black;
}
table tr {
    border-top: 0;
}
table tr {
    border-bottom: 0;
}
table tr td {
    border-left: 10;
}
table tr td {
    
}


</style>

</head>

<body>

	
  <!-- header 시작 -->
 		<jsp:include page="../header/header.jsp" />
	<!-- header 끝 -->
  
  

  <%
   
  	listDAO gdao = new listDAO();
  	
    List goodsList = (List)request.getAttribute("goodsList");
    JSONObject json = new JSONObject();

    String goHead = "./GoodsList.cos";
    varlist var = new varlist();
    String http[][] = var.getHttp();
	String cat[][] = var.getCat();	
    String skin[][] = var.getSkin(); // 스킨타입
    
  %>
  <table  >
  <tr>
    <%for(int i = 0; i<http.length;i++){ %>
	  <td  id = "one">
       	<a href="<%=goHead%><%=http[i][0] %>"> &nbsp;&nbsp;<%=http[i][1] %> &nbsp;&nbsp; </a>
      </td>
      <%} %>
    </tr>
  
  </table>
  <br>
   <table  >
  <tr>
    <%for(int i = 0; i<skin.length;i++){ %>
	  <td  id = "one">
       	<a href="<%=goHead%><%=skin[i][0] %>"> &nbsp;&nbsp; <%=skin[i][1] %> &nbsp;&nbsp; </a>
      </td>
      <%} %>
    </tr>
  
  </table>
  <br>
  
  <table  >
  <tr>
    <%for(int i = 0; i<cat.length;i++){ 
    if(i == 8){
    	%></tr><tr><td></td></tr>
    	<tr><td></td></tr>
    	<tr><td>.</td></tr><tr><% 
    }
    %>
	  <td id = "one">
       	<a href="<%=goHead%><%=cat[i][0] %>">  &nbsp;&nbsp; <%=cat[i][1] %> &nbsp;&nbsp; </a>
      </td>
      <%} %>
    </tr>
  
  </table>

  
  <br>
  <table >
    
    
    <%
      // 전체 상품 개수
      
      int size = goodsList.size();
      // 열의 개수
      int col =http.length;
      // 행의 개수 
      int row = (size/col)+((size%col>0)? 1:0);
      // 상품 출력넘버 
      int num = 0;
      
      // 행
      for(int a=0;a<row;a++){
    	  %>
    	   <tr >
    	  <%
    	  // 열
    	  for(int b=0;b<col;b++){
    		  //System.out.print(" 상품1 ");
    		  GoodsDTO dto = (GoodsDTO) goodsList.get(num);
    		  %>
    		     <td>
    		         <img src="<%=dto.getCosImage()%>"
	             	 width="120" height="120"
	          		 ><br>
	          		 
	         	  	<a href="./GoodsDetail.cos?cosNum=<%=dto.getCosNum()%>"><%=dto.getCosName() %></a><br>
	           		<%=dto.getCosPrice() %>원  <br>
	           		<button onclick="location.href='http://localhost:8088/
	           		ShoppingMall/Goods_basketpro.cos?cosAmount=1&cosNum=<%=dto.getCosNum()%> '">장바구니 담기</button>	

    		     </td>
    		  <%   		  
    		  num++;
    		  if(size <= num) break;
    	  }  
    	  //System.out.println();
    	  %>
    	   </tr>
    	  <%
      }
    
    
    %>
    
    
    
    <%-- <tr>
      <% for(int i=0;i<goodsList.size();i++){
    	  GoodsDTO dto = (GoodsDTO) goodsList.get(i);
    	  %>
       <td>
	           <img src="./upload/<%=dto.getImage().split(",")[0]%>"
	              width="120" height="120"
	           ><br>
	           <%=dto.getName() %><br>
	           <%=dto.getPrice() %>원  <br>
       </td>
      <%} %>   
    
    </tr> --%>
  
  </table>
  
    <!-- footer 시작 -->
   		<jsp:include page="../footer/footer.jsp" />
    <!-- footer 끝 -->
    
  
  

</body>
<script type="text/javascript">
	function update_form(b_no) {
		$.ajax({
			url : "./update_form.jsp",
			type : "POST",
			cache : false,
			dataType : "json",
			data : "b_no=" + b_no,
			success : function(data) {
				$('#b_no').val(data.b_no);
				$('#b_type').val(data.b_type);
				$('#b_title').val(data.b_title);
				$('#b_content').val(data.b_content);
				$('#b_file').val(data.b_file);
				$('#b_user').val(data.b_user);
				$('#btn_proc').html('저장');
				$('#btn_proc').off('click');
				$('#btn_proc').on('click', update_proc);
			},
			error : function(request, status, error) {
				var msg = "ERROR : " + request.status + "<br>"
				msg += +"내용 : " + request.responseText + "<br>" + error;
				console.log(msg);
			}
		});
	}
</script>