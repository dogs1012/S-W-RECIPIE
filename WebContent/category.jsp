<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><style>
  #div_root{
  margin:atuo;
  width:800px;
}
	#div_top{
	width:100%;
	height:110px;
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
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div id="div_root"></div>
<div id="div_top"></div>
<form method = "post" action = "Mainpage.jsp"><div id="div_con"><input type = "submit" value = "�������"/></div></form>
<form method = "post" action = "category.jsp" ><div id="div_menu"><input type = "submit" value = "ī�װ����丮"/></div></form>
<div id="div_menu"></div>


<div id="div_con">���̵� : <input type="text" name = "id"><br>
��й�ȣ<input type="password" name = "password"><br>
<form name = "form1" method = "post" action = "Mainpage_login.jsp"><input type="submit" name = "username" value="�α���"></form>
<form name = "form2" method = "post" action = "sign.jsp"><input type="submit" name = "userpassword" value="ȸ������"></form><br>
<form method = "post" action = "mymenu.jsp"><input type="submit" value ="mymenu"/> </form>
</div> 
<div id="div_menu">�˻�<input type = "text"><br>
<input type = "checkbox" name = "time">time<br>
<input type = "checkbox" name = "hard">���̵�
</div>
<div id ="div_bottom"><center><form name = "form3" method = "post" action = "outboardtest.jsp"><input type = "submit" value="�Խ���"></form></center>
</body>
</html>