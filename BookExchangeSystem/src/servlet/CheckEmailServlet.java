package servlet;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

/**
 * Created by Steven 臧 on 21/04/2017.
 */
@WebServlet("/CheckEmailServlet")
public class CheckEmailServlet extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        process(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        process(request, response);
    }

    protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(!checkEmail(request,response)){
            PrintWriter out = response.getWriter();
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Account not exist!');");
            out.println("location='forgottenpassword.jsp';");
            out.println("</script>");
        }
        else{
            HttpSession session = request.getSession();
            String email = request.getParameter("email");
            session.setAttribute("email",email);
            response.sendRedirect("changePassword.jsp");
        }

    }

    protected boolean checkEmail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String url = "jdbc:mysql://127.0.0.1:3306/maxi";
        boolean result = false;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url,"root","steven04060406");
            String email = request.getParameter("email");

            String sql = "select *  from userprofile where email = '"+email+"'";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if(rs.next()){
                result=true;
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
}
