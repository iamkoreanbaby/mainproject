<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "DB.DBConnect" %> <%-- 지시문형식을 통해 DB연결 자바파일 불러오기 --%>
<%@ page import = "java.sql.*" %>

<%
	request.setCharacterEncoding("UTF-8");

	String sql = "insert into member_tbl_02 values(?,?,?,?,?,?,?)";

	Connection conn = DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	//---> 화면으로부터 사용자가 입력한 회원정보 데이터 7개를 쿼리문 각 자리에 셋팅 //
	
	pstmt.setInt(1,Integer.parseInt(request.getParameter("custno")));
	
	pstmt.setString(2,request.getParameter("custname"));
	pstmt.setString(3,request.getParameter("phone"));
	pstmt.setString(4,request.getParameter("address"));
	pstmt.setString(5,request.getParameter("joindate"));
	pstmt.setString(6,request.getParameter("grade"));
	pstmt.setString(7,request.getParameter("city"));
	
	pstmt.executeUpdate();  //쿼리문을 실행하고, 건별로 오라클 테이블에 누적
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:forward page="mainpage.jsp"></jsp:forward>
<!-- 데이터입력 수행 완료 후 회원목록을 조회할 수 있는 페이지로 이동 -->

</body>
</html>