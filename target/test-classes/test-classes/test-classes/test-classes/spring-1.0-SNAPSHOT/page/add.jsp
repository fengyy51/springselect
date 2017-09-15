<%--
  Created by IntelliJ IDEA.
  User: yy
  Date: 2017/9/8
  Time: 19:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" import="java.util.*" language="java" %>
<html>
<head>
    <title>增加用户信息</title>
</head>
<body>
<form action="/user/add.do" method="post" name="form3">

  <table width="80%" border="1" align="center" class="table table-hover table-bordered">
    <tr>
      <td colspan="2">添加信息</td>
    </tr>
      <tr><td>您的id为：</td><td><input type="text" name="id" ></td></tr>
      <tr><td>您的姓名为：</td><td><input type="text" name="creditname" ></td></tr>
      <tr><td>您的学号为：</td><td><input type="text" name="xuehao" ></td></tr>
      <tr><td>您所选学科为：</td><td><input type="text" name="xueke" ></td></tr>
      <tr><td>您的分数为：</td><td><input type="text" name="credit"></td></tr>
    <td colspan="2" align="center"><input id="submit" type="submit" value="确定添加"></td>
    </table>
</form>
</body>
</html>
