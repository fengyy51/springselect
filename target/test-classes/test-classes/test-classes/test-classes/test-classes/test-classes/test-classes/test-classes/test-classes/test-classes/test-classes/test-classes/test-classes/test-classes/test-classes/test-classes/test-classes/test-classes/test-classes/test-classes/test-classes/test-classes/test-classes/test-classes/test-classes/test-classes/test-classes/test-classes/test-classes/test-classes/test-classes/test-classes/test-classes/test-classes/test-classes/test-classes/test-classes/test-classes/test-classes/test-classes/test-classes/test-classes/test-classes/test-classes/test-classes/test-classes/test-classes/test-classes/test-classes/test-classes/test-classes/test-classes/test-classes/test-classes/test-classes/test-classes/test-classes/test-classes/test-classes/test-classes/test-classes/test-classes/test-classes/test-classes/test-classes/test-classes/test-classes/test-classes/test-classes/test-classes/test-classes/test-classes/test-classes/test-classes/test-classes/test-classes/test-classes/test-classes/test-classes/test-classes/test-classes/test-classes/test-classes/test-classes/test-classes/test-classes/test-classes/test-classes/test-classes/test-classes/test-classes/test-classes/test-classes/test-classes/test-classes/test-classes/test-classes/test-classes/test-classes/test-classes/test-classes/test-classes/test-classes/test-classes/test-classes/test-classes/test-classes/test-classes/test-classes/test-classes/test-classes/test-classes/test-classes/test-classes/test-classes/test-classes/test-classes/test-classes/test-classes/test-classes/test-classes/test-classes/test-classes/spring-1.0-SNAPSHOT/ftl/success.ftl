
<html>
<head>
    <meta charset="UTF-8">
    <title>成绩管理系统</title>
    <link href="../../bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
</head>
<body>
<script type="text/javascript" src="../../js/jquery-3.2.1.js"></script>

<input type="button" id="kecheng" value="课程管理" >
<div id="xianshi"></div>
登入成功!
<br>
您好!<div id="username"></div>
<br>
<a href="/page/login.jsp">返回</a>
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
        <td colspan="6" align="center"><a href="page/add.jsp" >增加信息</a></td>
    </tr>

</table>


<script>
    window.onload=function(){
        var username=document.getElementById("username");
        var val=queryString();

        function queryString(){
            var re={};
            var val=window.location.search;
            var vals=val.length!=0?val.split("&"):[];
            for(var i=0;i<vals.length;i++) {
                var item = vals[i].split("=");
                var key = encodeURIComponent(item[0]);
                var value = encodeURIComponent(item[1]);
                re.key = value;
            }
            return re;
        }
        var val=window.location.search;

    }
    document.getElementById("kecheng").onclick=function () {
        document.getElementById("ketable").style.display='block';
//                alert("hello world");
    }


</script>
</body>
</html>