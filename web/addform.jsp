<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form action="/addTask" method="post">
    <div class="modal-body">

        <div class="container">
            <div class="row">
                <div class="col-8 mx-auto">
                    <div class="mt-3">
                        <label> Name</label>
                        <input type="text" name="task_name" class="form-control" placeholder="name">
                    </div>
                    <div class="mt-3">
                        <label> Description</label>
                        <textarea name="task_description" class="form-control"
                        ></textarea>
                    </div>
                    <div class="mt-3">
                        <label> Deadline</label>
                        <input type="date" name="task_date" class="form-control" placeholder="date">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal-footer">
        <button type="submit" class="btn btn-success">Add</button>
    </div>
</form>