<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function check(){
		if(document.form.id.value==""){
			alert("상품코드를 입력하세요.");
			document.form.id.focus();
		}else if(document.form.name.value==""){
			alert("주문자 이름을 입력하세요.");
			document.form.name.focus();
		}else if(document.form.addr.value==""){
			alert("배달주소를 입력하세요.");
			document.form.addr.focus();
		}else{
			form.action="insert_orderProcess.jsp";
		}
	}
	
	function changesubmit(){
		document.form.submit();
	}
</script>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
<%@ include file="DBConn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String id=request.getParameter("id");
	String name=request.getParameter("name");
	String orderdate=request.getParameter("orderdate");
	String addr=request.getParameter("addr");
	String tel=request.getParameter("tel");
	String pay=request.getParameter("pay");
	String cardno=request.getParameter("cardno");
	String prodcount=request.getParameter("prodcount");
	
	int pcount=0;
	int price=0;
	int total=0;
	
	if(cardno==null){
		cardno="";
	}
	if(id==null){
		id="";
		name="";
		orderdate="";
		tel="";
		addr="";
		pay="1";
		cardno="";
		prodcount="0";
		pcount=0;
	}else{
		pcount=Integer.parseInt(prodcount);
	
	try{
		String sql="select productId,unitprice from product0125 where productId=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();
		if(rs.next()){
			id=rs.getString(1);
			price=rs.getInt(2);
			total=pcount*price;
		}else if(id!=""){
			%>
			<script>
				alert("등록되지 않은 코드입니다.");
			</script>
			<%
		}
	}catch(SQLException e){
		System.out.println("product테이블 읽기 실패");
		e.printStackTrace();
	}	
	}
%>
<form name="form" method="post" action="insert_order.jsp">
<h2>주문정보 등록</h2>
<table border=1 id="tab3">
	<tr>
		<th>상품 코드</th>
		<td><input type="text" name="id" value="<%=id %>" onchange="changesubmit();"></td>
		<th>주문자 이름</th>
		<td><input type="text" name="name" value="<%=name %>"></td>
	</tr>
	<tr>
		<th>주문 날짜</th>
		<td><input type="text" name="orderdate" value="<%=orderdate %>"></td>
		<th>전화번호</th>
		<td><input type="text" name="tel" value="<%=tel %>"></td>
	</tr>
	<tr>
		<th>배달주소</th>
		<td  colspan=3><input type="text" name="addr" value="<%=addr %>"></td>
	</tr>
	<tr>
		<th>결제방법</th>
		<td><input type="radio" name="pay" value="1" onchange="changesubmit();"
			<%if(pay.equals("1")){%>checked<%}%>>현금
			<input type="radio" name="pay" value="2" onchange="changesubmit();"
			<%if(pay.equals("2")){%>checked<%}%>>카드
		</td>
		<th>카드번호</th>
		<td><input type="text" name="cardno" value="<%=cardno %>" <%if(pay.equals("1")){%>disabled<%}%>></td>
	</tr>
	<tr>
		<th>주문상품수</th>
		<td><input type="text" name="prodcount" value="<%=prodcount %>" onchange="changesubmit();"></td>
		<th>주문금액</th>
		<td><input type="text" name="total" value="<%=total %>"></td>
	</tr>
	<tr>
		<td colspan=4 align=center>
			<input type="button" value="목록" onclick="location.href='select_order.jsp'" id="btn1">
			<input type="submit" value="저장" onclick="check()" id="btn1">
		</td>
	</tr>
</table>
</form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>