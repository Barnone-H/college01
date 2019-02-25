<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title>
	学生信息管理平台
</title>
	<link href="../Style/StudentStyle.css" rel="stylesheet" type="text/css" />
	<link href="../Script/jBox/Skins/Blue/jbox.css" rel="stylesheet" type="text/css" />
	<link href="../Style/ks.css" rel="stylesheet" type="text/css" />
	<link href="../css/mine.css" type="text/css" rel="stylesheet">
    <script src="../Script/jBox/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="../Script/jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="../Script/jBox/i18n/jquery.jBox-zh-CN.js" type="text/javascript"></script>
    <script src="../Script/Common.js" type="text/javascript"></script>
    <script src="../Script/Data.js" type="text/javascript"></script>
    <script src="../Script/jquery-1.8.0.min.js" type="text/javascript"></script>
    <script src="../Script/jquery.validate.js" type="text/javascript"></script>


    
    <%--<script type="text/javascript">
         var ok1,ok2,ok3=false;
         $(function(){
             $("[name=yuanpass]").blur(function(){
                 var upass=$(this).val();
                 $.ajax({
                     url:"/user/checkpass",
                     data:"upass="+upass,
                     type:"post",
                     dataType:"text",
                     success:function(rs){
                         if(rs=='密码正确'){
                             ok1=true;
                         }else{
                             ok1=false;
                         }
                         $("[name=yuanpass]").next().html("<font color='red'>"+rs+"</font>");
                     }
                 });
             });

             $("[name=userPs]").blur(function(){
                 var newpass = $(this).val();
                 //定义正则
                 var reg = /^\w{6,}$/;
                 if(reg.test(newpass)) {
                     $(this).next().html("新密码正确");
                     ok2=true;
                 }else{
                     $(this).next().html("新密码必须六位以上");
                     ok2=false;
                 }
             });

             //重复密码
             $("[name=newpass2]").blur(function(){
                 var pass2 = $(this).val();
                 var pass1 = $("[name=userPs]").val();
                 //定义正则
                 var reg = /^\w{6,}$/;
                 if(reg.test(pass2)) {
                     if(pass2==pass1){
                         $(this).next().html("新密码正确");
                         ok3=true;
                     }else{
                         $(this).next().html("两次密码不一致");
                     }

                 }else{
                     $(this).next().html("新密码必须六位以上");
                     ok3=false;
                 }
             });

             $("#button2").click(function() {
                 if(ok1 && ok2 && ok3){
                     document.forms[0].submit();
                 }else{
                     alert("填写信息有误");
                 }
             });

         })
    </script>--%>



    <script type="text/javascript">
        $(function(){
            $("form").validate({
                rules:{
                    yuanpass:{required:true,
                    remote:"/user/checkpass"
                    },
                    userPs:{required:true,minlength:6},
                    newpass2:{required:true,equalTo:"#userPs"},
                },

                message:{
                    yuanpass:{
                        required:"请输入原密码",
                        remote:"与原密码不一致",
                    },
                    userPs:{
                        required:"请输入新密码",
                        minlength:"新密码至少要6位"
                    },
                    newpass2:{
                        required:"再次输入新密码",
                        equalTo:"两次密码要一致"
                    },
                },
            });
        })
    </script>



</head>
<body>

		<div class="div_head">
            <span>
                <span style="float:left">当前位置是：个人中心-》密码修改</span>
                <span style="float:right;margin-right: 8px;font-weight: bold"></span>
            </span>
        </div>
</div>
<div class="cztable">
    <form action="/user/updatepassword" method="post" >
    <table width="100%" cellpadding="0" cellspacing="0">
        <input type="hidden" name="userId" value="${u1.userId}"  />
        <tr>
            <td align="right" width="80">原密码：</td>
            <td><input type="password" name="yuanpass" /><span></span></td>
        </tr>
        <tr>
            <td align="right" width="90">新密码：</td>
            <td><input type="password" name="userPs" id="userPs"/><span></span></td>
        </tr>
        <tr>
            <td align="right" width="90">密码确认：</td>
            <td><input type="password" name="newpass2"  /><span></span></td>
        </tr>
       
        <tr align="center">
            <td colspan="5" height="40">
                <div align="center">
                    
                    <input type="button" id="button2" value="确认" />
                </div>
            </td>
        </tr>
    </table>
    </form>
</div>

            </div>
        </div>
    </div>
</body>
</html>
