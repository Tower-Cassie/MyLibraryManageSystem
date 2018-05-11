<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>图书管理系统</title>
<link href="css/main.css" type="text/css" rel="stylesheet" />
</head>

<body>
	<div id = "header">
    	<div id = "header_left"><img src="images/xh.png" width="108" height="90" float = "left"/></div>
		<!--<div id = "header_right" style="font-family:华文行楷">图书管理系统</div>-->
        <div id = "header_right">
        	<div id ="header_right_top"></div>
            <div id ="header_right_botton" style="font-family:华文行楷">图书管理系统</div>
        </div>
        <div id="header_botton">
        	<div class = "menu"  style="font-family:华文楷体"> <a href="usermain.jsp">系统首页</a></div>
            <div class = "menu"  style="font-family:华文楷体"> <a href="findBook.jsp">借阅查询</a></div>
             <div class = "menu"  style="font-family:华文楷体"> <a href="returnBook.jsp">图书归还</a></div>
            <div class = "menu"  style="font-family:华文楷体"> <a href="usercenter.jsp">用户中心</a></div>
            <div class = "menu" style="font-family:华文楷体"> <a href="login.jsp">退出系统</a></div>
        </div>
    </div>
    
    
        <table style="margin-top:50px" align="center" width="1520" height = "300" border="0">
          <tr>
              <td width="220" rowspan="2">&nbsp;</td>
                <td width="335" class="list"><img src="images/arrow4.gif"  align="left"width="10" height="11" />读者推荐</td>
                <td width="24" rowspan="5">&nbsp;</td>
                <td colspan="2" class="list"><img src="images/arrow4.gif"  align="left"width="10" height="11" />学校介绍</td>
                <td width="22" rowspan="2">&nbsp;</td>
                <td width="355" rowspan="2"><img src="images/pictrue1.jpg" align="middle" width="223" height="286" /></td>
          </tr>
          <tr>
                <td height="227" class="biankuang">
                	<marquee direction="up" scrolldelay="150" onmouseout="this.start()" onmouseover="this.stop()">
                        <ul>
                           <li> <p class="shuji"><img src="images/star.gif" width="32" height="32" />《平凡的世界》</p></li>
                            <li><p class="shuji"><img src="images/star.gif" width="32" height="32" />《三国演义》</p></li>
                            <li><p class="shuji"><img src="images/star.gif" width="32" height="32" />《编程之美》</p></li>
                            <li><p class="shuji"><img src="images/star.gif" width="32" height="32" />《红楼梦》</p></li>
                            <li><p class="shuji"><img src="images/star.gif" width="32" height="32" />《围城》</p></li>
                            <li><p class="shuji"><img src="images/star.gif" width="32" height="32" />《活着》</p></li>
                        <ul>
            		</marquee>
                  </td>
                <td width="239" class="biankuang"><img src="images/library.jpg" width="470" height="250" /></td>
                <td width="287" class="biankuang">
                	<marquee direction="up" scrolldelay="150" onmouseout="this.start()" onmouseover="this.stop()">
                        <p class="font">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 桂林电子科技大学座落在世界著名的风景游览城市和中国历史文化名城——广西壮族自治区桂林市，是工业和信息化部与广西壮族自治区共建高校国家"中西部高校基础建设工程”入选高校、广西壮族自治区重点建设高校。</p>
                    </marquee>
           		 </td>
          </tr>

    </table>
    
    
   
    <div id="foot">
	  <p>&nbsp;</p>
    	<p align="center"  style="font-family:华文楷体"><strong>Copyright 2013-2020 版权所有   个人网页网站</strong></p>
		<p align="center"  style="font-family:华文楷体"><strong>建议使用IE5.0及以上版本   分辨率在1024*678及以上版权</strong></p>
    </div>
</body>
</html>