<%@ page language="java" contentType="text/html; charset=utf-8"
    import="java.sql.*" pageEncoding="utf-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
<%
   Connection conn = null;
   PreparedStatement pstmt = null;

    String jdbc_driver = "com.mysql.jdbc.Driver";
    String jdbc_url = "jdbc:mysql://localhost/jspdb";
    try{
   	 Class.forName(jdbc_driver);
   	 
   	 conn = DriverManager.getConnection(jdbc_url,"root","1234");
   	 
   	         String sql = "insert into lastoutboard values(?,?,?,?,?,?)";
   			 pstmt = conn.prepareStatement(sql);
   	         pstmt.setString(1,request.getParameter("pageno"));
   	         pstmt.setString(2,request.getParameter("pagename"));
   	         pstmt.setString(3,request.getParameter("i_day"));
   	         pstmt.setString(4,request.getParameter("i_person"));
   	         pstmt.setString(5,request.getParameter("memo"));
   	         pstmt.setString(6,request.getParameter("image"));
   	         
   	         if(request.getParameter("pageno") != null){
   	        	 pstmt.executeUpdate();
   	         }
    }
    catch(Exception e){
   	 System.out.println(e);
    }
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
</head>
<body>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr height="5"><td width="5"></td></tr>
 <tr>
   <td width="5"></td>
   <td width="273">번호</td>
   <td width="279">제목</td>
   <td width="273">작성일</td>
   <td width="264">작성자</td>
  </tr>
    <%
  try{
	  String sql = "select pageno, pagename, i_day, i_person, memo, image from lastoutboard";
	  
	  pstmt = conn.prepareStatement(sql);
	  
	  ResultSet rs = pstmt.executeQuery();
	  
	  while(rs.next()){
		 int idx = rs.getInt(1);
		 String name = rs.getString(2);
		 String time = rs.getString(3);
		 String person = rs.getString(4);
	
%>
  <tr height="25" align="center">
  <td>&nbsp;</td>
	<td><%=idx %></td>
	<td align="left"><a href="View.jsp?idx=<%=idx%>"><%=name %></a></td>
	<td align="center"><%=time %></td>
	<td align="center"><%=person %></td>
	<td>&nbsp;</td>
</tr>
  <tr height="1" bgcolor="#D2D2D2"><td colspan="6"></td></tr>
   <%
	  }
	  rs.close();
	  pstmt.close();
	  conn.close();
          }
         catch(Exception e){
	System.out.println(e.toString());
	
}
   %>
 <tr height="1" bgcolor="#82B5DF"><td colspan="6" width="752"></td></tr>
 </table>
 
<table width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr><td colspan="4" height="5"></td></tr>
  <tr align="center">
   <td><input type=button value="글쓰기" Onclick="window.location='Write.jsp'"></td>
  </tr>
  </table>
</body>
</html>