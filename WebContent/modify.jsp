<%@ page language="java" contentType="text/html; charset=utf-8"
    import="java.sql.*" pageEncoding="utf-8"%>
 <%
    request.setCharacterEncoding("utf-8");
     
     Connection conn = null;
 
     String jdbc_driver = "com.mysql.jdbc.Driver";
     String jdbc_url = "jdbc:mysql://localhost/jspdb";
     
     int idx = Integer.parseInt(request.getParameter("idx"));
     int pageno=0;
     String name = "";
     String time = "";
     String person ="";
     String memo = "";
     String image = "";
     
     try{
    	 conn = DriverManager.getConnection(jdbc_url,"root","1234");
    	 Statement stmt = conn.createStatement();
    	 
    	 String sql = "select pageno, pagename, i_day, i_person,memo,image from lastoutboard where pageno=" + idx;
    	 ResultSet rs = stmt.executeQuery(sql);
    	 
    	 if(rs.next()){
    		 pageno = rs.getInt(1);
    		 name = rs.getString(2);
    		 time = rs.getString(3);
    		 person = rs.getString(4);
    		 memo = rs.getString(5);
    		 image = rs.getString(6);
    	 }
    	 rs.close();
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
<form method=post action="modifyok.jsp?idx=<%=idx%>">
<table>
  <tr>
   <td>
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
     <tr>
      <td width="5"></td>
      <td align="center">수정</td>
      <td width="5"></td>
     </tr>
    </table>
   <table>
     <tr>
      <td>&nbsp;</td>
      <td align="center">번호</td>
      <td><input name="pageno" size="50" maxlength="100" value="<%=pageno%>"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td align="center">제목</td>
      <td><input name="pagename" size="50" maxlength="50"value="<%=name%>"></td>
      <td>&nbsp;</td>
     </tr>
      <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td align="center">작성일</td>
      <td><%=time%><input type=hidden name="i_day" size="50" maxlength="50" value="<%=time%>"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td align="center">작성자</td>
      <td><input name="i_person" size="50" maxlength="2" value="<%=person%>"></td>
      <td>&nbsp;</td>
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
     <td><input type='file' name='image'></td>
     <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
     <tr align="center">
      <td>&nbsp;</td>
      <td colspan="2"><input type=submit value="수정">
       <input type=button value="취소" OnClick="javascript:history.back(-1)">
      <td>&nbsp;</td>
     </tr>
    </table>
 </table>
 </form>
</body> 
</html>