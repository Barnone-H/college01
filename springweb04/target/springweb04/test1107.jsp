<%@ page import="com.bean.UserTb" %><%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2018/11/7
  Time: 15:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="my" uri="http://java.sun.com/jsp/mytag/my"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>test1107</h1>
    <%
        UserTb user = new UserTb();
        user.setUserName("张三");
        pageContext.setAttribute("u1",user);
    %>
    <my:abc test="${1>2}"  yonghu="${u1}">aaaa</my:abc>
</body>
</html>
