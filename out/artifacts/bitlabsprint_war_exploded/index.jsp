<%@ page import="java.util.ArrayList" %>
<%@ page import="kz.biltlab.narxoz.db.Tasks" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ru">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Демо Bootstrap</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>
<%@include file="navbar.jsp" %>
<div class="container mt-5">
    <button type="button" class="btn btn-sm btn-dark mt-3" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
        New Task
    </button>
    <div class="row mt-5">
        <div class="col-12  ">
            <table class="table table-striped table-hover">
                <thead class="table-header">
                <tr>
                    <th>ID</th>
                    <th>NAME</th>
                    <th>DESCRIPTION</th>
                    <th>DEADLINE</th>
                    <th>DETAILS</th>
                </tr>
                </thead>

                <tbody>
                <% ArrayList<Tasks> tasks = (ArrayList<Tasks>) request.getAttribute("tasks"); %>
                <% if (tasks != null) {
                    for (Tasks task : tasks) {
                %>
                <tr>
                    <td>
                        <%=task.getId()  %>
                    </td>
                    <td>
                        <%=task.getName()  %>
                    </td>
                    <td>
                        <%=task.getDescription()  %>
                    </td>
                    <td>
                        <%=task.getDeadlineDate()  %>
                    </td>
                    <td>
                        <a href="/details?task_id=<%=task.getId() %>" class="btn btn-primary"> About </a>
                    </td>
                </tr>
                <% }
                }%>
                </tbody>

            </table>

        </div>
    </div>
</div>


<!-- Модальное окно -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="staticBackdropLabel">Add New Task</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Закрыть"></button>
            </div>
           <%@include file="addform.jsp"%>
        </div>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
</body>
</html>