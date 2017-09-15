
<html>
<head>
    <title>成绩管理系统</title>
    <link href="../../bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
</head>
<body>
<%--<script type="text/javascript" src="../../bootstrap/js/jquery-3.2.1.js"></script>--%>

<input type="button" id="kecheng" value="课程管理" >
<div id="xianshi"></div>
登入成功!
<br>
您好!${user.username}
<br>
<a href="<%=path%>/page/login.jsp">返回</a>
<br>
<table id="ketable" width="80%" border="1" align="center" style="display:none" >
    <tr>
        <td>ID</td>
        <td>用户名</td>
        <td>学号</td>
        <td>学科</td>
        <td>成绩</td>
        <td>操作</td>
    </tr>
    <c:forEach items="${credit}" var="item">
        <tr>
            <td>${item.id}</td>
            <td>${item.creditname}</td>
            <td>${item.xuehao}</td>
            <td>${item.xueke}</td>
            <td>${item.credit}</td>
            <td><a href="<%=path%>/user/beforeEdit.do?id=${item.id}" rel="external nofollow" >修改</a>
                <a href="${pageContext.request.contextPath }/user/delete.do?id=${item.id}" rel="external nofollow" >删除</a>
            </td>

        </tr>
    </c:forEach>
    <tr>
        <td colspan="6" align="center"><a href="<%=path%>/page/add.jsp" >增加信息</a></td>
    </tr>

</table>


<script>
    document.getElementById("kecheng").onclick=function () {
        document.getElementById("ketable").style.display='block';
//                alert("hello world");
    }


</script>
</body>
</html>