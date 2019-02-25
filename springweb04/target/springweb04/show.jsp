<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2018/10/27
  Time: 19:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:forEach items="${ulist}" var="u">
    ${u.username}=====${u.password}<br />
</c:forEach>
</body>
</html>
