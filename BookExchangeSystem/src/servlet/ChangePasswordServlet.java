package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Created by Steven 臧 on 22/04/2017.
 */
@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        process(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        process(request, response);
    }

    protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if(changePassword(request,response)) {
            HttpSession session=request.getSession();
            session.removeAttribute("email");
            session.invalidate();
            PrintWriter out = response.getWriter();
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Password changed!');");
            out.println("location='login.jsp';");
            out.println("</script>");
        }
    }

    protected boolean changePassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "jdbc:mysql://127.0.0.1:3306/maxi";
        boolean result = false;
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url,"root","steven04060406");
            Statement st = conn.createStatement();
            String password = request.getParameter("password");
            String sql = "update userprofile set password = '"+password.hashCode()+"' where email = '"+email+"'";
            int row = st.executeUpdate(sql);
            if(row==1){
                result = true;
            }

        }catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

}
