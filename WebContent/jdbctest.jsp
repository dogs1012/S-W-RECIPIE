<%@ page language="java" contentType="text/html; charset=UTF-8"
   import="java.sql.* " pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("UTF-8"); %>
  <%
     Connection conn = null;
     PreparedStatement pstmt = null;
     
     String jdbc_driver = "com.mysql.jdbc.Driver";
     String jdbc_url = "jdbc:mysql://localhost/jspdb";
    
     try{
    	 Class.forName(jdbc_driver);
    	 
    	 conn = DriverManager.getConnection(jdbc_url,"root","1234");
    	 
    	         String sql = "insert into jdbc_test values(?,?)";
    			 pstmt = conn.prepareStatement(sql);
    	         pstmt.setString(1,request.getParameter("username"));
    	         pstmt.setString(2,request.getParameter("email"));
    	         
    	         if(request.getParameter("username") != null){
    	        	 pstmt.executeUpdate();
    	         }
    	 
     }
     catch(Exception e){
    	 System.out.println(e);
     }
  %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>
<H2>이벤트 등록</H2>
<HR>

<form name = form1 method = post>
등록이름 : <input type = text name = username>
주소 : <input type = text name = email size = 20>
<input type = submit value = "등록">
</form>
<HR>
</center>
# 등록 목록 <p>
<%
  try{
	  String sql = "select username, email from jdbc_test";
	  
	  pstmt = conn.prepareStatement(sql);
	  
	  ResultSet rs = pstmt.executeQuery();
	  int i=1;
	  
	  while(rs.next()){
		  out.println(i+" : "+rs.getString(1)+"," +rs.getString("email")+ "<BR>");
		  i++;
	  }
	  rs.close();
	  pstmt.close();
	  conn.close();
          }
         catch(Exception e){
	System.out.println(e);
	
}
%>
</body>
</html>