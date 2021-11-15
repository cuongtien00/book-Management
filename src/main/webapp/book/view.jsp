<%--
  Created by IntelliJ IDEA.
  User: Phong Vu
  Date: 11/13/2021
  Time: 9:56 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Book Information</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <style>

        a{
            text-decoration: none;
            color: black;
        }
        div{
            margin-left: 500px;
            width: 500px;
        }
        .title{
            width: 75px;
        }
        body {

            background-image: url("https://cdn11.bigcommerce.com/s-ka7ofex/images/stencil/2000x1000/uploaded_images/how-rfid-is-making-libraries-smarter.jpg?t=1580145106");
        }

    </style>
</head>
<body>
<div>
    <h2><a href="/books">Book Management</a></h2>
    <fieldset>
        <legend>Book Information</legend>
        <table class="table table-warning table-striped table-hover">
            <tr>
                <td class="title">Name</td>
                <td><input type="text" value="${book.name}" disabled></td>
            </tr>
            <tr>
                <td class="title">Description</td>
                <td><input type="text" value="${book.description}" disabled></td>
            </tr>
            <tr>
                <td class="title">Category</td>
                <td><input type="text" value="${book.getCategory().name}" disabled></td>
            </tr>
            <tr>
                <td class="title">Edit</td>
                <td><a href="/books?action=edit&id=${book.id}"><input type="submit" class="btn btn-outline-secondary" value="Edit"></a></td>
            </tr>
            <tr>
                <td class="title">Delete</td>
                <td><a href="/books?action=delete&id=${book.id}"><input type="submit" class="btn btn-outline-secondary" value="Delete"></a></td>
            </tr>
        </table>
    </fieldset>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</body>
</html>