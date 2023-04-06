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
    <%
        Tasks task = (Tasks) request.getAttribute("task");
        if (task != null) {


    %>
    <div class="row">
        <div class="col-6 mx-auto">
            <div class="mt-3">
                <label>Name</label>
                <input type="text" class="form-control" readonly value="<%=task.getName()%>">
            </div>
            <div class="mt-3">
                <label>Description</label>
                <textarea class="form-control" readonly ><%=task.getDescription()%></textarea>
            </div>
            <div class="mt-3">
                <label>DeadLine Date</label>
                <input type="date" class="form-control" readonly value="<%=task.getDeadlineDate()%>">
            </div>
            <div class="mt-3">
                <button type="button" class="btn btn-sm btn-success mt-3" data-bs-toggle="modal"
                        data-bs-target="#staticBackdrop">
                    EDIT
                </button>
                <button type="button" class="btn btn-danger btn-sm mt-3 ms-2" data-bs-toggle="modal" data-bs-target="#delete">
                    Delete
                </button>
            </div>
        </div>
    </div>




    <div class="modal fade" id="delete" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="/deleteTask" method="post">
                    <input type="hidden" name="id" value="<%=task.getId()%>">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5">Confirm Delete</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <h5 class="text-center">Are you sure?</h5>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">NO</button>
                        <button class="btn btn-danger">YES</button>
                    </div>
                </form>
            </div>
        </div>
    </div>




    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
         aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="staticBackdropLabel">Edit</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Закрыть"></button>
                </div>
                <form action="/saveTask" method="post">
                    <div class="modal-body">
                        <div class="container">
                            <div class="row">
                                <div>
                                    <input type="hidden" name="task_id" value="<%=task.getId()%>">
                                    <label>Name</label>
                                    <input type="text" class="form-control" name="task_name"
                                           value="<%=task.getName()%>">
                                </div>
                                <div>
                                    <label>Description</label>
                                    <textarea class="form-control"
                                              name="task_description"><%=task.getDescription()%></textarea>
                                </div>
                                <div>
                                    <label>DeadLine Date</label>
                                    <input type="date" class="form-control" name="task_date"  value="<%=task.getDeadlineDate()%>">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">Save</button>
                    </div>
                </form>
            </div>
        </div>
    </div>


    <%
    } else {
    %>
    <h1>
        Nothing here
    </h1>
    <% }
    %>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
</body>
</html>