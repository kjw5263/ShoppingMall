<%@page import="com.goods.db.listDAO"%>
<%@page import="com.goods.db.GoodsDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.var.list.varlist"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

  <h1>WebContent/goods/goods_list.jsp</h1>
  
  

  <%
    // request.setAttribute("goodsList", gdao.getGoodsList());
  	listDAO gdao = new listDAO();
  	
    List goodsList = gdao.getGoodsList("all");//(List) request.getAttribute("goodsList");
    String goHead = "./GoodsList.cos";
    varlist var = new varlist();
    String http[][] = var.getHttp();
	String cat[][] = var.getCat();	
    
    
  %>
  <table  border="1">
  <tr>
    <%for(int i = 0; i<http.length;i++){ %>
	  <td>
       	<a href=<%=goHead%> + <%=http[i][0] %>> <%=http[i][1] %> </a>
      </td>
      <%} %>
    </tr>
  
  </table>
  <br>
  <br>
  <table border="1">
  <table  border="1">
  <tr>
    <%for(int i = 0; i<cat.length;i++){ %>
	  <td>
       	<a href=<%=goHead%> + <%=cat[i][0] %>> <%=cat[i][1] %> </a>
      </td>
      <%} %>
    </tr>
  
  </table>
  <br>
  <br>
  <table border="1">
    
    
    <%
      // 전체 상품 개수
      System.out.println(goodsList);
      int size = goodsList.size();
      // 열의 개수
      int col =http.length;
      // 행의 개수 
      int row = (size/col)+((size%col>0)? 1:0);
      // 상품 출력개수 
      int num = 0;
      
      // 행
      for(int a=0;a<row;a++){
    	  %>
    	   <tr>
    	  <%
    	  // 열
    	  for(int b=0;b<col;b++){
    		  //System.out.print(" 상품1 ");
    		  GoodsDTO dto = (GoodsDTO) goodsList.get(num);
    		  %>
    		     <td>
    		         <img src="./upload/<%=dto.getCosImage().split(",")[0]%>"
	             	 width="120" height="120"
	          		 ><br>
	          		 
	         	  	<a href="./GoodsDetail.cos?num=<%=dto.getCosNum()%>"><%=dto.getCosName() %></a><br>
	           		<%=dto.getCosPrice() %>원  <br>
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
  
  
  
  

</body>
</html>