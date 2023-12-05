<%--
  Created by IntelliJ IDEA.
  User: Gia Kiet
  Date: 12/4/2023
  Time: 2:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
</head>
<body>
<button type="button"><a href="/book-servlet?action=add">Add new Product</a></button>
<br>

<form action="/book-servlet">
    <table class="table table-striped">
        <tr>
            <td><input hidden="hidden" type="text" name="action" value="searchName"></td>

            <td><input type="text" name="title">
                <button class="btn btn-primary">Search By Name</button>
            </td>
        </tr>
    </table>
</form>
<br>
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
        <th scope="col">Info</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${bookList}" var="book">
    <tr>
        <th scope="row">${book.id}</th>
        <th>${book.title}</th>
        <th>${book.pageSize}</th>
        <th>${book.author}</th>
        <th>${book.category}</th>
        <th><a href="/book-servlet?action=edit&id=${book.getId()}">
            <button>Edit</button>
        </a></th>
        <td><a href="/book-servlet?action=delete&id=${book.getId()}" onclick="showMessage (${book.id})">
            <button>Delete</button>
        </a></td>
        <td><a href="/book-servlet?action=Info&id=${book.getId()}">
            <button>Info</button>
        </a></td>
    </tr>
    </tbody>
    </c:forEach>
</table>
</body>
<script>
    function showMessage(id) {
        let option = confirm('Are you sure to delete ?');
        if (option === true) {
            window.location.href = '/book?action=delete&id=' + id;
        }
    }
</script>
</html>
