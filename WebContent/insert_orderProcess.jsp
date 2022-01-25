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
	String id=request.getParameter("id");
	String name=request.getParameter("name");
	String orderdate=request.getParameter("orderdate");
	String addr=request.getParameter("addr");
	String tel=request.getParameter("tel");
	String pay=request.getParameter("pay");
	String cardno=request.getParameter("cardno");
	String prodcount=request.getParameter("prodcount");
	String total=request.getParameter("total");
	
	try{
		String sql="insert into order0125 values(?,?,?,?,?,?,?,?,?)";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, name);
		pstmt.setString(3, orderdate);
		pstmt.setString(4, addr);
		pstmt.setString(5, tel);
		pstmt.setString(6, pay);
		pstmt.setString(7, cardno);
		pstmt.setString(8, prodcount);
		pstmt.setString(9, total);
		pstmt.executeUpdate();
		System.out.println("데이터 등록 성공");
		%>
		<script>
			alert("데이터 등록을 성공하였습니다.");
			location.href="select_order.jsp";
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