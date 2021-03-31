<%@page import="java.util.Scanner"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  
	지금 작업은 servlet 작업
-->
<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try{
		//2. 드라이버 로딩
		Class.forName("oracle.jdbc.OracleDriver");
		System.out.println("Oracle 가동");
		
		//3. 연결 객체 생성
		conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.0.218:1521:xe","bituser","1004");
		System.out.println("연결여부 : false: "+ conn.isClosed());
		
		//4. 연결 객체 생성
		stmt = conn.createStatement();
		
		//4.1 paramter 설정(옵션)
		String job ="";
		Scanner sc = new Scanner(System.in);
		System.out.println("직종 입력");
		job = sc.nextLine();
		
		//4.2 명령구문 생성
		String sql = "select empno, ename, job from emp where job='" + job +"'";
		
		//5. 명령실행
		//DQL(select) > stmt.execyteQuery(sql) > return ResultSet 타입의 객체 주소
		//D(insert, delet, update) > 결과 집합(x) > return 반영된 행의 개수 > stmt.executeUpdate();
		//delete from emp; 실행 return 14
				
		rs = stmt.executeQuery(sql);
		
		//명령 처리
		/*  
			DQL (select): 	1. return 결과가 없는 경우 (where empno = 1111)
							2. 결과가 1건일 경우 (PK, UK 컬럼을 조회: where empno = 7788)
							3. 결과가 다수일 경우(row: select empno, ename from emp where deptno = 20)
		
		*/
		/*
			1. 간단하고 단순한 방법
			1.1 결과 집합이 없는 경우 로직 처리가 안됨
			while(rs.next()){// 결과 row가 있나 없나 여부
				rs.getInt("empno") 출력
			}
		
			2. 결과가 있는 경우와 없는 경우 처리
				2.1 1건 경우만 처리가능
				if(rs.next()){
					//rs.getInt("empno")출력
				}else{
					//조회된 데이터가 없습니
				}
		
		*/
		//1, 2 번을 합하면
		//-single row
		//-multi row
		//- 결과가 없는 경우
		if(rs.next()){
			do{
				//컬럼의 순서 [1][2][3]
				System.out.println(rs.getInt("empno") + " , " + rs.getString("ename") + " , " + rs.getString("job"));
				
			}while(rs.next());
		}else{
			
			System.out.println("조회된 데이터가 없습니다");
		}
	}catch(Exception e){
		
		System.out.println(e.getMessage());
	}finally{
		//자원 해제
		
		try{
			stmt.close();
			rs.close();
			conn.close();
			
		}catch(Exception e){
			
		}
		
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>