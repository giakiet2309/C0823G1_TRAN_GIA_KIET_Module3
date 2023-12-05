<%--
  Created by IntelliJ IDEA.
  User: Gia Kiet
  Date: 11/1/2023
  Time: 1:52 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
<table class="table">
    <thead class="thead-dark">
    <tr>
        <th scope="col">ID</th>
        <th scope="col">Name</th>
        <th scope="col">Price</th>
        <th scope="col">Description</th>
        <th scope="col">Manufacture</th>
        <th scope="col">Edit</th>
        <th scope="col">Delete</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${book}" var="title">
    <tr>
        <th scope="row">${title.id}</th>
        <th>${title.title}</th>
        <th>${title.pageSize}</th>
        <th>${title.author}</th>
        <th>${title.category}</th>
        <th><a href="/book-servlet?action=edit&id=${title.getId()}">
            <button>Edit</button>
        </a></th>
        <td><a href="/book-servlet?action=delete&id=${title.getId()}">
            <button>Delete</button>
        </a></td>
    </tr>
    </c:forEach>
    </tbody>
</table>
<button type="button"><a href="/book-servlet">Back</a></button>
</body>
</html>