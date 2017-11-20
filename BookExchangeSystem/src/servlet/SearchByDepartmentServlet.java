package servlet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by Steven 臧 on 24/03/2017.
 */
@WebServlet("/SearchByDepartmentServlet")
public class SearchByDepartmentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        process(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        process(request, response);
    }

    protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String search = req.getParameter("searchByDepartment");
        HttpSession session=req.getSession();
        session.setAttribute("searchByDepartment",search);
        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/searchByDepartment.jsp");
        dispatcher.forward(req, resp);
    }
}
