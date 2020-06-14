<%@ page import="com.company.servlet.entity.User" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>


<html>
<head>
    <title>ЯВА ЦЕ ГОВНО</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</head>
<body>
<%
    HttpServletResponse resp = (HttpServletResponse) response;
    String login = (String)session.getAttribute("login");
    if (login == null) {
        resp.sendRedirect("login.jsp");
    }
%>
    <h1 align="center">Hello Govno</h1><br>
<form class="form-inline">
    <button type="button" class="btn btn-outline-success create">Добавить</button>
    <input type="searchfield" class="form-control" id="InputSearch" placeholder="Search..." onkeyup="tableSearch()">
</form>
<Table class="table" id="info-table">
    <tr>
        <th>ФИО</th>
        <th>Адрес</th>
        <th>Телефон</th>
        <th>Почта</th>
        <th>Коментарий</th>
    </tr>
    <c:forEach var="user" items="${requestScope.users}">
        <tr id="tr_${user.id}">
            <td data-name="FIO"><c:out value="${user.FIO}"/></td>
            <td data-name="address"><c:out value="${user.address}"/></td>
            <td data-name="phone"><c:out value="${user.phone}"/></td>
            <td data-name="email"><c:out value="${user.email}"/></td>
            <td data-name="comments"><c:out value="${user.comments}"/></td>
            <td width="50"><button type="button" class="btn btn-outline-warning action" value="${user.id}" action="update">Изменить</button></td>
            <td width="50"><a href="?rm=${user.id}" class="btn btn-outline-danger">Удалить</a></td>
        </tr>
    </c:forEach>
</Table>


<div class="modal fade" id="createPhone" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Добавить</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form method="post">
                <input type="hidden" name="id" id="inputId" value="0">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="inputFIO">ФИО</label>
                        <input type="text" class="form-control" id="inputFIO" name="FIO">
                    </div>
                    <div class="form-group">
                        <label for="inputAddress">Адрес</label>
                        <input type="text" class="form-control" id="inputAddress" name="Address">
                    </div>
                    <div class="form-group">
                        <label for="inputPhone">Телефон</label>
                        <input type="text" class="form-control" id="inputPhone" name="Phone">
                    </div>
                    <div class="form-group">
                        <label for="inputEmail">Почта</label>
                        <input type="text" class="form-control" id="inputEmail" name="Email">
                    </div>
                    <div class="form-group">
                        <label for="inputComment">Коментарий</label>
                        <input type="text" class="form-control" id="inputComment" name="Comment">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Отменить</button>
                    <button type="submit" class="btn btn-primary">Сохранить</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
