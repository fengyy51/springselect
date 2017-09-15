<%--
  Created by IntelliJ IDEA.
  User: alvin
  Date: 15/9/7
  Time: 下午10:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>
        用户登录
    </title>
    <link type="text/css" rel="stylesheet" href="../bootstrap/css/bootstrap.css">
    <style type="text/css" rel="stylesheet">
        body {
            padding-top: 40px;
            padding-bottom: 40px;
            background-color: #eee;
        }

        .form-signin {
            max-width: 330px;
            padding: 15px;
            margin: 0 auto;
        }
        .form-signin .form-signin-heading,
        .form-signin .checkbox {
            margin-bottom: 10px;
        }
        .form-signin .checkbox {
            font-weight: normal;
        }
        .form-signin .form-control {
            position: relative;
            height: auto;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            padding: 10px;
            font-size: 16px;
        }
        .form-signin .form-control:focus {
            z-index: 2;
        }
        .form-signin input[type="text"] {
            margin-bottom: -1px;
            border-bottom-right-radius: 0;
            border-bottom-left-radius: 0;
        }
        .form-signin input[type="password"] {
            margin-bottom: 10px;
            border-top-left-radius: 0;
            border-top-right-radius: 0;
        }

    </style>

</head>
<body>
<br>
<br>
<br>
<br>
<br>
<div class="container">

    <div class="form-signin">
        <h2 class="form-signin-heading">Please sign in</h2>
        <label for="inputUser" class="sr-only">用户名</label>
        <input type="text" id="inputUser" class="form-control" placeholder="username" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="inputPassword" class="form-control" placeholder="Password" required>
        <%--<div class="checkbox">--%>
            <%--<label>--%>
                <%--<input type="checkbox" value="remember-me"> Remember me--%>
            <%--</label>--%>
        <%--</div>--%>
        <button class="btn btn-lg btn-primary btn-block" type="submit" id="submit">登录</button>
    </div>

</div> <!-- /container -->
<script type="text/javascript" src="../js/jquery-3.2.1.js"></script>
<script type="text/javascript">
    window.onload=function(){
        var subBtn=document.getElementById("submit");
        subBtn.onclick=function(){
            var inputUser=document.getElementById("inputUser").value;
            var inputPassword=document.getElementById("inputPassword").value;
            $.ajax({
                url: "/user/login.do",
                type: "post",
                data:{
                    "username":inputUser,
                    "password":inputPassword
                },
                success:function(data){
                    var code=data.code;
                    if(code==200){
                        var result=data.data.result;
                        console.log(result);
                        if(result==true){
                            window.location.href="ftl/success.ftl?username=inputUser";
                        }else if(result==false){
                            window.location.href="page/fail.jsp";
                        }
                    }else if(code==500){
                        var msg=data.data.msg;
                        console.log(msg);
                    }
                },
                error:function(error){
                    console.log(error);
                }
            });
        };
    };

</script>
</body>
</html>