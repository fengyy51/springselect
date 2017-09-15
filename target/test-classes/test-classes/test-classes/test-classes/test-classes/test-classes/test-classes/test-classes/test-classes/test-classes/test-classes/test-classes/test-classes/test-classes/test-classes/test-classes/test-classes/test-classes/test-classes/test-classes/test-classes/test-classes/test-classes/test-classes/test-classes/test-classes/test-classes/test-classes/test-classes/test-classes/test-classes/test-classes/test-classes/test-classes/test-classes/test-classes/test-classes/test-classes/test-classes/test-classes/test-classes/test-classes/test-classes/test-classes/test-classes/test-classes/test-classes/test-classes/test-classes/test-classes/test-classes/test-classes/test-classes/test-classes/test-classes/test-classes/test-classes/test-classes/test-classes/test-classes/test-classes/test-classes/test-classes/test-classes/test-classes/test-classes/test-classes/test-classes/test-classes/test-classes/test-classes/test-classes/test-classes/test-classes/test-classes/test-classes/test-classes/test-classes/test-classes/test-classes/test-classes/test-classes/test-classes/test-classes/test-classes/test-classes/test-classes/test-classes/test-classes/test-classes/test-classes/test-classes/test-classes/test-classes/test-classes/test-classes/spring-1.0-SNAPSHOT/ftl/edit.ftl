<%--
  Created by IntelliJ IDEA.
  User: yy
  Date: 2017/9/8
  Time: 17:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改用户信息</title>
    <meta charset="UTF-8">
</head>
<body>
<br>
您好!${editcredit.creditname}
您好!${editcredit.xuehao}
<br>
<form action="/user/edit.do" method="post" name="form2">
  <table width="80%" border="1" align="center">
    <tr>
      <td colspan="2">修改信息</td>
    </tr>
    <tr id="id">
      <td>您的id为：</td>
      <td><input type="text" value="${editcredit.id}" name="id" readonly="readonly"></td>
    </tr>
    <tr id="">
      <td>您的姓名为：</td>
      <td><input type="text" value="${editcredit.creditname}" name="creditname" readonly="readonly"></td>
    </tr>
    <tr>
      <td>您的学号为：</td>
      <td><input type="text" value="${editcredit.xuehao}" name="xuehao" readonly="readonly" ></td>
    </tr>
    <tr><td>您所选学科为：</td>
      <td><input type="text" value="${editcredit.xueke}" name="xueke" readonly="readonly"></td>
    </tr>
    <tr><td>您要修改的分数为：</td>
      <td><input type="text" value="${editcredit.credit}"  name="credit"  ></td>
    </tr>
   <tr>
     <td colspan="2" align="center"><input id="submit" type="submit" value="确定修改"></td>
   </tr>
  </table>
  </form>

</body>
</html>
