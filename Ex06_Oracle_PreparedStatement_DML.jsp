<%@page import="kr.or.bit.utils.SingletonHelper"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	//insert into dmlemp(empno,ename,deptno) values(?,?,?);

	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try{
		conn = SingletonHelper.getConnection("oracle");
		String sql ="update dmlemp set ename = ?, sal = ?, deptno = ?, job = ? where empno = ?";
		pstmt = conn.prepareStatement(sql); // 미리 쿼리문 컴파일
		//parameter 설정
		
		pstmt.setString(1, "하이");
		pstmt.setInt(2, 200000);
		pstmt.setInt(3, 20);
		pstmt.setString(4, "IT");
		pstmt.setInt(5,7499);
		
		int row = pstmt.executeUpdate();
		
		if(row > 0){
			out.print("<b>update row count: </b>" + row);
		}else{
			out.print("<b>update count: </b>" + row);
		}
	}catch(Exception e){
		
	}finally{
		SingletonHelper.close(pstmt);
	}
%>
</body>
</html>