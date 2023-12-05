<%--
  Created by IntelliJ IDEA.
  User: Gia Kiet
  Date: 12/4/2023
  Time: 3:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/book-servlet?action=add" method="post">
    <table>
        <tr>
            <td>ID</td>
            <td><input type="text" name="id"></td>
        </tr>
        <tr>
            <td>Title</td>
            <td><input type="text" name="title"></td>
        </tr>
        <tr>
            <td>Size Page</td>
            <td><input type="text" name="pageSize"></td>
        </tr>
        <tr>
            <td>Author</td>
            <td><input type="text" name="author"></td>
        </tr>
        <tr>
            <td>Category</td>
            <td><input type="text" name="category"></td>
        </tr>
        <tr>
            <td><button type="submit">Add</button></td>
            <td></td>
        </tr>
    </table>
</form>
</body>
</html>
