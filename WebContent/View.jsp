<%@ page language="java" contentType="text/html; charset=utf-8"
    import="java.sql.*" pageEncoding="utf-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
<%
   Connection conn = null;

   String jdbc_driver = "com.mysql.jdbc.Driver";
   String jdbc_url = "jdbc:mysql://localhost/jspdb";
   int idx = Integer.parseInt(request.getParameter("idx"));
   try{
	   Class.forName(jdbc_driver);
	   conn = DriverManager.getConnection(jdbc_url,"root","1234");
	   Statement stmt = conn.createStatement();
	   String sql = "select pageno,pagename,i_day,i_person,memo,image from lastoutboard where pageno= " +idx;
       ResultSet rs = stmt.executeQuery(sql);
       if(rs.next()){
    	   String pageno = rs.getString(1);
    	   String pagename = rs.getString(2);
    	   String i_day = rs.getString(3);
    	   String i_person = rs.getString(4);    
    	   String memo = rs.getString(5);
    	   String image = rs.getString(6);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>보기</title>
</head>
 <body>
<table>
  <tr>
   <td>
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
     <tr>
      <td width="5"></td>
      <td>내 용</td>
      <td width="5"></td>
     </tr>
    </table>
   <table width="413">
     <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">글번호</td>
      <td width="319"><%=idx%></td>
      <td width="0">&nbsp;</td>
     </tr>
	 <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">작성일</td>
      <td width="319"><%=i_day%></td>
      <td width="0">&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">작성자</td>
      <td width="319"><%=i_person%></td>
      <td width="0">&nbsp;</td>
     </tr>
      <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">제목</td>
      <td width="319"><%=pagename%></td>
      <td width="0">&nbsp;</td>
     </tr>
      <tr>
      <td>&nbsp;</td>
      <td align="center">내용</td>
      <td><textarea name="memo" cols="30" rows="9"><%=memo%></textarea></td>
      <td>&nbsp;</td>
     </tr>
     <tr>
     <td>&nbsp;</td>
     <td align="center">이미지 </td>
     <td><%=image%></td>
     <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>          
<% 
 	stmt.executeUpdate(sql);
 	rs.close();
 	stmt.close();
 	conn.close();
	 	} 
	}catch(SQLException e) {
}

%>
     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
     <tr height="1" bgcolor="#82B5DF"><td colspan="4" width="407"></td></tr>
     <tr align="center">
      <td width="0">&nbsp;</td>
      <td colspan="2" width="399"><input type=button value="글쓰기" OnClick="window.location='Write.jsp'">
	<input type=button value="목록" OnClick="window.location='outboardtest.jsp'">
	<input type=button value="수정" OnClick="window.location='modify.jsp?idx=<%=idx%>'">
	<input type=button value="삭제" OnClick="window.location='delete.jsp?idx=<%=idx%>'">
      <td width="0">&nbsp;</td>
     </tr>
    </table>
   </td>
  </tr>
 </table>
</body>

 </html>