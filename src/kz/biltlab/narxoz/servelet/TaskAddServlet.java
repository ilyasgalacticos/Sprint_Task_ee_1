package kz.biltlab.narxoz.servelet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kz.biltlab.narxoz.db.DBManager;
import kz.biltlab.narxoz.db.Tasks;

import java.io.IOException;

@WebServlet(value = "/addTask") // If your link contains 2 words, then you should write like 'add-task'
public class TaskAddServlet extends HttpServlet {

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    response.setContentType("text/html");
    String name = request.getParameter("task_name");
    String description = request.getParameter("task_description");
    String date = request.getParameter("task_date");

    Tasks tasks = new Tasks();
    tasks.setName(name);
    tasks.setDescription(description);
    tasks.setDeadlineDate(date);

    DBManager.addTasks(tasks);

    response.sendRedirect("/");

  }

}
