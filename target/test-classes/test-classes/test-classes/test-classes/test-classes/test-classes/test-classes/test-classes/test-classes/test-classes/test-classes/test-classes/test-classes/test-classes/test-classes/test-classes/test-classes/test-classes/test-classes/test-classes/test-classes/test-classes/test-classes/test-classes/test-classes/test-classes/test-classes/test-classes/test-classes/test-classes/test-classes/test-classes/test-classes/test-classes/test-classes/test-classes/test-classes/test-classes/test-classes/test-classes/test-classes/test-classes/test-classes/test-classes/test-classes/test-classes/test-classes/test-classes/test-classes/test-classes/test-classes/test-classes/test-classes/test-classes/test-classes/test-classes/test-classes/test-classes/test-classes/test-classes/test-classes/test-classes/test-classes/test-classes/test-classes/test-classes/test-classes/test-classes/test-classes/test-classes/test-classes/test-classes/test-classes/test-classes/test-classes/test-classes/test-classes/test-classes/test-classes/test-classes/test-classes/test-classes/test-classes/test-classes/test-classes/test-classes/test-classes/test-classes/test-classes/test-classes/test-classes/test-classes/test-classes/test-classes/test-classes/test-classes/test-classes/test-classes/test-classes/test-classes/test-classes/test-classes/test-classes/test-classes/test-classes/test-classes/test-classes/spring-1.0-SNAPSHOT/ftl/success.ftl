
<html>
<head>
    <meta charset="UTF-8">
    <title>成绩管理系统</title>
    <link href="../../bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
</head>
<body>
<script type="text/javascript" src="../../js/jquery-3.2.1.js"></script>
<label  id="kecheng">课程管理</label>
<div id="xianshi"></div>
    登入成功!
<br>
    您好!<div id="username"></div>
<a href="/page/login.jsp">返回</a>
<br>
<div id="chaxun" border="1" width="80%"  align="center"  style="display:none" >
    <div class="form-inline"  >
        <div class="form-group">
            <label for="InputName">姓名</label>
            <input type="text" class="form-control" id="InputName" >
        </div>
        <div class="form-group">
            <label for="InputXuehao">学号</label>
            <input type="text" class="form-control" id="InputXuehao" >
        </div>
        <div class="form-group">
            <label for="InputKecheng">课程</label>
            <input type="text" class="form-control" id="InputKecheng" >
        </div>
        <button  class="btn btn-default" >查询</button>
    </div>
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

</div>




<script>
    window.onload=function(){
        var username=document.getElementById("username");
        var val=queryString("username");
        console.log(val);
        if(val!=null){
            username.innerHTML=val;
        }
        document.getElementById("kecheng").onclick=function () {
            document.getElementById("chaxun").style.display='block';
//                alert("hello world");
        }
        document.querySelector("#chaxun button").onclick=function () {
            document.getElementById("ketable").style.display='block';
//                alert("hello world");
        }
        function queryString(key){
            var re={};
            var val=window.location.search.split("?");
            var vals=val[1].length!=0?val[1].split("&"):[];
            for(var i=0;i<vals.length;i++) {
                var item = vals[i].split("=");
                console.log(item[0]);
                console.log(encodeURIComponent(item[1]));
                if(item[0]==key){
                    return item[1];
                }
            }
            return null;
        }


    };



</script>
</body>
</html>