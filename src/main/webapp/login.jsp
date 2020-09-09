<%--
  Created by IntelliJ IDEA.
  User: yzw
  Date: 2020/4/11
  Time: 17:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en" class="page-fill">
<head>
    <meta charset="UTF-8">
    <title>实验室设备管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="keywords" content="ok-admin v2.0,ok-admin网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
    <meta name="description" content="ok-admin v2.0，顾名思义，很赞的后台模版，它是一款基于Layui框架的轻量级扁平化且完全免费开源的网站后台管理系统模板，适合中小型CMS后台系统。">

    <%@include file="static/common/common.jsp"%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/oksub.css"/>
    <style type="text/css">

    </style>
</head>
<body class="page-fill">
<div class="page-fill" id="login">
    <form class="layui-form" onsubmit="return false" action="##" method="post">
        <div class="login_face">
            <img src="${pageContext.request.contextPath}/static/images/logo1.jpg">

        </div>
        <h2 style="text-align: center;margin-bottom: 10px">实验室设备管理系统</h2>
        <div class="layui-form-item input-item">
            <label for="username">用户名</label>
            <input type="text" lay-verify="required" name="username" placeholder="请输入账号" autocomplete="off" id="username" value=" "
                   class="layui-input">
        </div>
        <div class="layui-form-item input-item">
            <label for="password">密码</label>
            <input type="password" lay-verify="required|password" name="password" value=" " placeholder="请输入密码" autocomplete="off"
                   id="password" class="layui-input">
        </div>
        <%--<div class="layui-form-item input-item captcha-box">
            <label for="captcha">验证码</label>
            <input type="text" lay-verify="required|captcha" name="captcha" placeholder="请输入验证码" autocomplete="off"
                   id="captcha" maxlength="4" class="layui-input">
            <div class="img">
                <img src="${pageContext.request.contextPath}/checkCode" onclick="this.src=this.src+'?d='+Math.random();"
                     title="点击刷新">
            </div>
        </div>--%>
        <div class="layui-form-item">
            <button class="layui-btn layui-block" lay-filter="login" id="loginBtn"  >登录</button>
            <div style="height: 5px"></div>
            <a href="register.jsp" class="layui-btn layui-block" style="background-color: #0e90d2;float: right">注册</a>
        </div>
    </form>
</div>
<!--js逻辑-->
<script src="${pageContext.request.contextPath}/static/lib/layui/layui.js"></script>
<script>

    $(function () {
        $("#loginBtn").click(function () {
            //发送请求做登录验证
            /*Ajax发送请求，是没有办法跳转服务器当中的请求
                * 只能通过浏览器当中来跳转
                * */
            /*发送请求 做登录认证*/
            /*表单序列化*/
            $.post("/login",$("form").serialize(),function(data){
                console.log(data);
                /*把data json格式的字符串 转成数据*/
                /*data=$.parseJSON(data);*/
                if(data.success){
                    //跳转到首页
                    window.location.href="index.jsp";

                }else{
                    alert(data.msg);
                }
            })
        })
    });

    layui.use(["form", "okGVerify", "okUtils", "okLayer"], function () {
        var form = layui.form;
        var $ = layui.jquery;
        var okGVerify = layui.okGVerify;
        var okUtils = layui.okUtils;
        var okLayer = layui.okLayer;


        /**
         * 数据校验
         */
        form.verify({
            password: [/^[\S]{6,12}$/, "密码必须6到12位，且不能出现空格"],

        });

        /**
         * 表单提交
         */
        form.on("submit(login)", function (data) {
            console.log(data)
            okUtils.ajax("/login", "post", data.field, true).done(function (response) {
                okLayer.greenTickMsg(response.content, function () {
                    window.location = "/index.jsp"
                })
            });
            return false;
        });

        /**
         * 表单input组件单击时
         */
        $("#login .input-item .layui-input").click(function (e) {
            e.stopPropagation();
            $(this).addClass("layui-input-focus").find(".layui-input").focus();
        });

        /**
         * 表单input组件获取焦点时
         */
        $("#login .layui-form-item .layui-input").focus(function () {
            $(this).parent().addClass("layui-input-focus");
        });

        /**
         * 表单input组件失去焦点时
         */
        $("#login .layui-form-item .layui-input").blur(function () {
            $(this).parent().removeClass("layui-input-focus");
            if ($(this).val() != "") {
                $(this).parent().addClass("layui-input-active");
            } else {
                $(this).parent().removeClass("layui-input-active");
            }
        })
    });


</script>
</body>
</html>
