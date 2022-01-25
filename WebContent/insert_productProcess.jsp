<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="DBConn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	String productId=request.getParameter("productId");
	String productName=request.getParameter("productName");
	String unitprice=request.getParameter("unitprice");
	String description=request.getParameter("description");
	String category=request.getParameter("category");
	String manufacturer=request.getParameter("manufacturer");
	String unitsInstock=request.getParameter("unitsInstock");
	String condition=request.getParameter("condition");
	
	try{
		String sql="insert into product0125 values(?,?,?,?,?,?,?,?)";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, productId);
		pstmt.setString(2, productName);
		pstmt.setString(3, unitprice);
		pstmt.setString(4, description);
		pstmt.setString(5, category);
		pstmt.setString(6, manufacturer);
		pstmt.setString(7, unitsInstock);
		pstmt.setString(8, condition);
		pstmt.executeUpdate();
		System.out.println("데이터 등록 성공");
		%>
		<script>
			alert("데이터 등록을 성공하였습니다.");
			location.href="select_product.jsp";
		</script>
		<%
		
	}catch(SQLException e){
		System.out.println("데이터 등록 실패");
		e.printStackTrace();
	}
%>
		<script>
			alert("데이터 등록을 실패하였습니다.");
			history.back(-1);
		</script>
</body>
</html>