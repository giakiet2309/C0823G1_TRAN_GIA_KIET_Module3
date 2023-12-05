<%--
  Created by IntelliJ IDEA.
  User: Gia Kiet
  Date: 11/1/2023
  Time: 1:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/book-servlet?action=edit" method="post">
    <table>
        <tr>
            <td>ID</td>
            <td><input type="text" name="id" value="${book.getId()}" readonly></td>
        <tr>
            <td>Title:</td>
            <td><input type="text" name="title" value="${book.getTitle()}"></td>
        </tr>
        <tr>
            <td>Size Page:</td>
            <td><input type="number" name="pageSize" value="${book.getPageSize()}"></td>
        </tr>
        <tr>
            <td>Author:</td>
            <td><input type="text" name="author" value="${book.getAuthor()}"></td>
        </tr>
        <tr>
            <td>Category:</td>
            <td><input type="text" name="category" value="${book.getCategory()}"></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="Edit product"></td>
        </tr>
        </tr>
    </table>

</form>
</body>
</html>