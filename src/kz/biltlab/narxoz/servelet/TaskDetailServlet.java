package kz.biltlab.narxoz.servelet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kz.biltlab.narxoz.db.DBManager;
import kz.biltlab.narxoz.db.Tasks;

import java.io.IOException;

@WebServlet(value = "/details")
public class TaskDetailServlet extends HttpServlet  {

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      int id = Integer.parseInt(request.getParameter("task_id"));

      Tasks task = DBManager.getTask(id);

      request.setAttribute("task" , task);
      request.getRequestDispatcher("/details.jsp").forward(request,response);
  }

}
