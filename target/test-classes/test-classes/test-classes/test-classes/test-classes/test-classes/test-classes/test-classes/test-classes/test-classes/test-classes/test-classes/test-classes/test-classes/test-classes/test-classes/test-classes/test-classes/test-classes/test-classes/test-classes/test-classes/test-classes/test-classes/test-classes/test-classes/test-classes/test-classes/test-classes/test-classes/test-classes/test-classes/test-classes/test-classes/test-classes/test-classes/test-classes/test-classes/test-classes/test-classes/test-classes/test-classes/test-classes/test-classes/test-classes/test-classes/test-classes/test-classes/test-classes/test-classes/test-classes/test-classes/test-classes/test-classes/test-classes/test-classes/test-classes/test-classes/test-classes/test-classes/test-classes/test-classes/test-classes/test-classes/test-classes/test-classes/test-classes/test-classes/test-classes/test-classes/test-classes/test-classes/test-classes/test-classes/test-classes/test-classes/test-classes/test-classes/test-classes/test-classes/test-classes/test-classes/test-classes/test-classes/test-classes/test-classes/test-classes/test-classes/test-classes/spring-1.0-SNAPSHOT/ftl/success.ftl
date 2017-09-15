
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
    登入成功! 您好!<span id="username"></span>
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
            <label for="InputXueke">学科</label>
            <input type="text" class="form-control" id="InputXueke" >
        </div>
        <button  class="btn btn-default" id="chaxunBtn">查询</button>
    </div>
    <table id="ketable" class="table table-hover table-bordered"  border="1" align="center" style="display:none;width: 80%" >
        <tr>
            <td>ID</td>
            <td>用户名</td>
            <td>学号</td>
            <td>学科</td>
            <td>成绩</td>
            <td>操作</td>
        </tr>
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
        }
        document.querySelector("#chaxunBtn").onclick=function () {
            var nameVal=document.querySelector("#InputName").value;
            var xuehaoVal=document.querySelector("#InputXuehao").value;
            var xuekeVal=document.querySelector("#InputXueke").value;
            console.log(nameVal+xuehaoVal+xuekeVal);
            if(nameVal==""&&xuehaoVal==""&&xuekeVal==""){
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
                                    var rowCount=table.childElementCount;
                                    table.insertRow(rowCount-1);
                                    table.rows[rowCount-1].insertCell(0);
                                    table.rows[rowCount-1].cells[0].appendChild(document.createTextNode(item[i].id));
                                    table.rows[rowCount-1].insertCell(1);
                                    table.rows[rowCount-1].cells[1].appendChild(document.createTextNode(item[i].creditname));
                                    table.rows[rowCount-1].insertCell(2);
                                    table.rows[rowCount-1].cells[2].appendChild(document.createTextNode(item[i].xuehao));
                                    table.rows[rowCount-1].insertCell(3);
                                    table.rows[rowCount-1].cells[3].appendChild(document.createTextNode(item[i].xueke));
                                    table.rows[rowCount-1].insertCell(4);
                                    table.rows[rowCount-1].cells[4].appendChild(document.createTextNode(item[i].credit));
                                    table.rows[rowCount-1].insertCell(5);
                                    var a=document.createElement("a");
                                    a.href="/user/beforeEdit.do?id="+item[i].id;
                                    a.rel="external nofollow";
                                    a.innerHTML="修改";
                                    table.rows[rowCount-1].cells[5].appendChild(a);
                                    var b=document.createElement("a");
                                    b.href="/user/delete.do?id="+item[i].id;
                                    b.rel="external nofollow";
                                    b.innerHTML="删除";
                                    table.rows[rowCount-1].cells[5].appendChild(b);

                                }
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

            }

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