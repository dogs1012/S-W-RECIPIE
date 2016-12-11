<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<head> <style>
  #div_root{
  margin:atuo;
  width:800px;
}
	#div_top{
	width:100%;
	height:50px;
	text-align:center;
	}
  #div_pic{
  width:120px;
  height:150px;
  float:left;
  background-color:#81977
  text-align:reft;
  }

  #div_menu{
  width:35%;
  height:100px;
  float:left;
  text-align:reft;
  }

	#div_login{
	width:20%;
	height:300px;
	float:left;
	text-align:reft;
	}
  #div_con{
  width:30%;
  height:100px;
  float:left;
  text-align:center;
  }

  #div_bottom{
  width:100%;
  height:100px;
  clear:both;
  text-align:right;
  }
  </style> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
<div id="div_root"></div>
<div id="div_top"></div>
<form method = "post" action = "Mainpage.jsp"><div id="div_con"><input type = "submit" value = "백과사전"/></div></form>
<form method = "post" action = "tema.jsp" ><div id="div_menu"><center><input type = "submit" value = "테마요리"/></center></div></form>
<form method = "post" action = "category.jsp" ><div id="div_menu"><input type = "submit" value = "카테고리별요리"/></div></form>


<div id="div_con">아이디 : <input type="text" name = "id"><br>
비밀번호<input type="password" name = "password"><br>
<form name = "form1" method = "post" action = "Mainpage_login.jsp"><input type="submit" name = "username" value="로그인"></form>
<form name = "form2" method = "post" action = "sign.jsp"><input type="submit" name = "userpassword" value="회원가입"></form><br>
<form method = "post" action = "mymenu.jsp"><input type="submit" value ="mymenu"/> </form>
</div> 
<div id="div_menu">검색 : <input type = "text"><input type = "button" value = "확인"><br>
<input type = "checkbox" name = "time">time<br>
<input type = "checkbox" name = "hard">난이도
</div>-
<div></div>
<div id ="div_bottom"><center><form name = "form3" method = "post" action = "outboardtest.jsp"><input type = "submit" value="게시판"></form></center>
</div>
</body>
</html>