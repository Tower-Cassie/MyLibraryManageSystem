<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.net.URLDecoder" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>图书管理系统</title>
<link href="css/main.css" type="text/css" rel="stylesheet" />
<link href="css/login.css" type="text/css" rel="stylesheet" />
</head>

<div class="container">
    <h1 class="animated bounceInLeft">信息提示</h1>
    <fieldset style="border:1px solid #B5B8C8;padding:10px;margin-bottom:10px;display:block;border-bottom-color:Red; border-left-color:Green; border-right-color:Blue; border-top-color:Purple; text-decoration:none;">
      <ul class="text-muted panel-body">
         	<%=URLDecoder.decode(request.getParameter("info"),"UTF-8") %>

        </ul>
   	</fieldset>
</div>
</html>