<%@ page language="java" contentType="text/html; charset=utf-8"
    import="java.sql.*" pageEncoding="utf-8"%>
 <%
     request.setCharacterEncoding("utf-8");
 
     String jdbc_driver = "com.mysql.jdbc.Driver";
     String jdbc_url = "jdbc:mysql://localhost/jspdb";
     int idx = Integer.parseInt(request.getParameter("idx"));
     int pageno = Integer.parseInt(request.getParameter("pageno"));
	 String pagename = request.getParameter("pagename");
	 String i_person = request.getParameter("i_person");
     
     try{  	 
    	 Connection conn = DriverManager.getConnection(jdbc_url,"root","1234");
    	 Statement stmt = conn.createStatement(); 
    	 String sql = "UPDATE lastoutboard SET pageno='"+ pageno+"' , pagename='"+ pagename +"' , i_person='"+i_person+"' WHERE pageno=" + idx;	
    	 stmt.executeUpdate(sql);
    	 %>
    	 <script language=javascript>
    	   location.href="outboardtest.jsp";
    	 </script>
    	 <% 
    	 stmt.close();
    	 conn.close();
     }catch(SQLException e) {
    		out.println(e.toString());
     } 
  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
</head>
<body>
</body>
</html>