<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>成绩管理系统</title>
    <link href="../bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="../css/b.page.bootstrap3.css" rel="stylesheet" type="text/css">
    <style>
        tr{
            text-align: center;
        }
    </style>
</head>
<body>
<script type="text/javascript" src="../js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="../js/b.page.js"></script>
<%--<label  id="kecheng">课程管理</label>--%>
<div id="xianshi" style="float: right">登入成功! 您好!<br><a href="/page/login.jsp">返回</a></div>
<span id="username"></span>

<br>
<div id="chaxun" border="1" width="80%"  align="center">
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
            <label for="InputXueke">学科</label>
            <input type="text" class="form-control" id="InputXueke" >
        </div>
        <button  class="btn btn-default" id="chaxunBtn">查询</button>
    </div>
</div>
<script>
    window.onload=function(){
//        var username=document.getElementById("username");
//        var val=queryString("username");
//        console.log(val);
//        if(val!=null){
//            username.innerHTML=val;
//        }
//        document.getElementById("kecheng").onclick=function () {
//            document.getElementById("chaxun").style.display='block';
//        }
        document.querySelector("#chaxunBtn").onclick=function () {
            var nameVal=document.querySelector("#InputName").value;
            var xuehaoVal=document.querySelector("#InputXuehao").value;
            var xuekeVal=document.querySelector("#InputXueke").value;
            console.log(nameVal+xuehaoVal+xuekeVal);

                var table=document.createElement("table");
                table.id="ketable";
                table.className="table table-hover table-bordered";
                table.align="center";
                table.style.width="80%";
                table.insertRow(0);
                table.rows[0].insertCell(0);
                table.rows[0].cells[0].appendChild(document.createTextNode("ID"));
                table.rows[0].insertCell(1);
                table.rows[0].cells[1].appendChild(document.createTextNode("用户名"));
                table.rows[0].insertCell(2);
                table.rows[0].cells[2].appendChild(document.createTextNode("学号"));
                table.rows[0].insertCell(3);
                table.rows[0].cells[3].appendChild(document.createTextNode("学科"));
                table.rows[0].insertCell(4);
                table.rows[0].cells[4].appendChild(document.createTextNode("成绩"));
                table.rows[0].insertCell(5);
                table.rows[0].cells[5].appendChild(document.createTextNode("操作"));
            if(!document.body.contains(document.getElementById("ketable"))){
                document.body.appendChild(table);
            }else{
                document.body.replaceChild(table,document.getElementById("ketable"));
            }

                if(nameVal==""&&xuehaoVal==""&&xuekeVal==""&&table.childElementCount==1){
                    $.ajax({
                        url: "/user/queryAll.do",
                        type: "post",
                        success:function(data){
                            var code=data.code;
                            if(code==200){
                                var result=data.data.result;
                                if(result==true){
                                    var item=data.data.item;
                                    console.log(item);
                                    for(var i=0;i<item.length;i++){
                                        var table=document.getElementById("ketable");
                                        table.insertRow(i+1);
                                        table.rows[i+1].insertCell(0);
                                        table.rows[i+1].cells[0].appendChild(document.createTextNode(item[i].id));
                                        table.rows[i+1].insertCell(1);
                                        table.rows[i+1].cells[1].appendChild(document.createTextNode(item[i].creditname));
                                        table.rows[i+1].insertCell(2);
                                        table.rows[i+1].cells[2].appendChild(document.createTextNode(item[i].xuehao));
                                        table.rows[i+1].insertCell(3);
                                        table.rows[i+1].cells[3].appendChild(document.createTextNode(item[i].xueke));
                                        table.rows[i+1].insertCell(4);
                                        table.rows[i+1].cells[4].appendChild(document.createTextNode(item[i].credit));
                                        table.rows[i+1].insertCell(5);
                                        var a=document.createElement("a");
                                        a.href="/user/beforeEdit.do?id="+item[i].id;
                                        a.rel="external nofollow";
                                        a.innerHTML="修改";
                                        table.rows[i+1].cells[5].appendChild(a);
                                        var b=document.createElement("a");
                                        b.href="/user/delete.do?id="+item[i].id;
                                        b.rel="external nofollow";
                                        b.innerHTML="删除";
                                        table.rows[i+1].cells[5].appendChild(b);
                                    }
                                    var table=document.getElementById("ketable");
                                    table.insertRow(item.length+1);
                                    table.rows[item.length+1].insertCell(0);
                                    table.rows[item.length+1].cells[0].colSpan="6";
                                    var a=document.createElement("a");
                                    a.href="./add.jsp";
                                    a.rel="external nofollow";
                                    a.innerHTML="增加";
                                    table.rows[item.length+1].cells[0].appendChild(a);
                                    document.getElementsByTagName("nav")[0].style.display="block";
                                }else if(result==false){
                                    alert("未查询到数据");
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
                }else{
                    var queryUser={};
                    queryUser.nameVal=nameVal;
                    queryUser.xuehaoVal=parseInt(xuehaoVal);
                    queryUser.xuekeVal=xuekeVal;
                    console.log(queryUser);
                    $.ajax({
                        url: "/user/queryUser.do",
                        type: "post",
                        data:{"queryUser":queryUser},
                        success:function(data){
                            var code=data.code;
                            if(code==200){
                                var result=data.data.result;
                                if(result==true){
                                    var item=data.data.item;
                                    console.log(item);
                                    for(var i=0;i<item.length;i++){
                                        var table=document.getElementById("ketable");
                                        table.insertRow(i+1);
                                        table.rows[i+1].insertCell(0);
                                        table.rows[i+1].cells[0].appendChild(document.createTextNode(item[i].id));
                                        table.rows[i+1].insertCell(1);
                                        table.rows[i+1].cells[1].appendChild(document.createTextNode(item[i].creditname));
                                        table.rows[i+1].insertCell(2);
                                        table.rows[i+1].cells[2].appendChild(document.createTextNode(item[i].xuehao));
                                        table.rows[i+1].insertCell(3);
                                        table.rows[i+1].cells[3].appendChild(document.createTextNode(item[i].xueke));
                                        table.rows[i+1].insertCell(4);
                                        table.rows[i+1].cells[4].appendChild(document.createTextNode(item[i].credit));
                                        table.rows[i+1].insertCell(5);
                                        var a=document.createElement("a");
                                        a.href="/user/beforeEdit.do?id="+item[i].id;
                                        a.rel="external nofollow";
                                        a.innerHTML="修改";
                                        table.rows[i+1].cells[5].appendChild(a);
                                        var b=document.createElement("a");
                                        b.href="/user/delete.do?id="+item[i].id;
                                        b.rel="external nofollow";
                                        b.innerHTML="删除";
                                        table.rows[i+1].cells[5].appendChild(b);
                                    }
                                    var table=document.getElementById("ketable");
                                    table.insertRow(item.length+1);
                                    table.rows[item.length+1].insertCell(0);
                                    table.rows[item.length+1].cells[0].colSpan="6";
                                    var a=document.createElement("a");
                                    a.href="./add.jsp";
                                    a.rel="external nofollow";
                                    a.innerHTML="增加";
                                    table.rows[item.length+1].cells[0].appendChild(a);
//                                    document.getElementsByTagName("nav")[0].style.display="block";
                                }else if(result==false){
                                    alert("未查询到数据");
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
                }

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