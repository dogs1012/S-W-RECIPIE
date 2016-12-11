<%@ page language="java" contentType="text/html; charset=utf-8"
    import="java.sql.*" pageEncoding="utf-8"%>
    <%@page import="java.util.Date, java.text.SimpleDateFormat" %>
 <% request.setCharacterEncoding("UTF-8"); %>
 <%  Date nowDate=new Date();//현재날짜와 시간을 얻어옴
     SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
     String formatDate=dateFormat.format(nowDate);
 %> <%
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
			if(request.getParameter("pageno") !=null)
			{
				pstmt.executeUpdate();
			}   
	}catch(SQLException e) {
		out.println(e);
		} 
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
</head>
<body>
<form method=post action="outboardtest.jsp">
<table>
  <tr>
   <td>
    <table width="100%" cellpadding="0" cellspacing="0" border="0">    
     <tr>
      <td width="5"></td>
      <td>글쓰기</td>
      <td width="5"></td>
     </tr>
    </table>
   <table>
   <tr>
      <td>&nbsp;</td>
      <td align="center">번호</td>
      <td><input name="pageno" size="50" maxlength="100"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr>
      <td>&nbsp;</td>
      <td align="center">제목</td>
      <td><input name="pagename" size="50" maxlength="100"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td align="center">작성일</td>
      <td><input name="i_day" size="50" maxlength="50" value=<%=formatDate %>></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr>
      <td>&nbsp;</td>
      <td align="center">작성자</td>
      <td><textarea name="i_person" cols="50" rows="2"></textarea></td>
      <td>&nbsp;</td>
     </tr>
       <tr>
      <td>&nbsp;</td>
      <td align="center">내용</td>
      <td><textarea name="memo" cols="50" rows="19"></textarea></td>
      <td>&nbsp;</td>
     </tr>
     <tr>
     <td>&nbsp;</td>
     <td align="center">이미지 </td>
     <td><input type='file' name='image'></td>
     <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
     <tr align="center">
      <td>&nbsp;</td>
      <td colspan="2"><input type=submit value="등록">
       <input type=button value="취소" OnClick="javascript:history.back(-1)">
      <td>&nbsp;</td>
     </tr>
    </table>
   </td>
  </tr>
 </table>
 </form>
</body>
</html>