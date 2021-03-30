<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  
JDBC

1. Java 를 통해서 Oracle 연결 하고 CRUD 작업
2. 어떤한 DB 소프트웨어 사용 결정 (Oracle , mysql , ms-sql) 
2.1 제품에 맞는 드라이버필요 (각 벤더 사이트에서 다운로드 받아서 사용)
2.2 오라클 (로컬 PC 오라클 DB 서버 설치) >> ojdbc6.jar (드라이버 파일)
C:\oraclexe\app\oracle\product\11.2.0\server\jdbc\lib
드라이버 : ojdbc6.jar

만약 mysql >> https://www.mysql.com/products/connector/
​

3. Cmd 기반의 Java Project 에서는 드라이버 사용하기 위해서 참조 
3.1 java Build Path (jar 추가) 하는 작업
3.2 드라이버 사용준비 완료 >> 드라이버 사용할 수 있도록 메모리 (new ..)
3.3 class.forName("class 이름") >> new 동일한 효과 

(WEB)
 1. Webproject >> WebCotent >> WEB-INF >> lib >> jar >> 붙여넣기 >> 준비
 2. 드라이버 로딩 : class.forName("드라이버 클래스명") : 자동화 ...
 3. DB 연결(연결문자열 :  서버 IP , PORT , 계정, 비번) 
​

4.JAVA ( JDBC API)
4.1 import java.sql.*; 제공하는 자원 (대부분의 자원은 : interface , class)
4.2 개발자는 interface 를 통해서 작업 ( 궁긍증 : why interface 일까? hint)java 뿐만 아니라 다양한 언어 사용 )

​

5. DB연결 -> 명령 -> 실행 -> 처리 -> 자원해제
5.1 명령 (CRUD) : select , insert , update , delete
5.2 처리 : select 화면 출력할꺼야 아니야 난 확인만 ...........
5.3 자원해제 (성능)

​

*연결 문자열 (ConnectionString) 설정
채팅 (client -> server 연결하기 위해서)
네트워크 DB (서버 IP , PORT , SID(전역 데이터베이스 이름) , 접속계정 , 접속 비번)
-->    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = null;

	conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.0.218:1521:xe","bituser","1004");
	//접속 성공 new 연결객체 >> 객체의 주소를 리턴 
	out.print(conn.isClosed()); //연결 여부 확인 : false
%>
</body>
</html>