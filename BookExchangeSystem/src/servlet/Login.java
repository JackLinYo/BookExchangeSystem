package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
    Connection connect = null;
    String url = "jdbc:mysql://localhost:3306/maxi";
    String dbdriver = "com.mysql.jdbc.Driver";
    String dbuserName = "root";
    String dbpassword = "steven04060406";


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //取出客戶端資料
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        PrintWriter out = response.getWriter();

        if (isValid(email, password)) {
            HttpSession session = request.getSession();
            session.setAttribute("email", email);
            response.sendRedirect("home.jsp");
        } else {
            if (isWrongPassword(email, password)) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Wrong Password! Please check!');");
                out.println("location='login.jsp';");
                out.println("</script>");
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Account not exist! Please register!')");
                out.println("location='login.jsp'");
                out.println("</script>");
            }
        }
    }

    public boolean isValid(String email, String password) {
        boolean result = false;
        try {
            //1. get connection to the database
            Class.forName(dbdriver);
            connect = DriverManager.getConnection(url, dbuserName, dbpassword);
            //2.establish sql string
            String sql = "select * from userprofile where email='" + email + "' and password ='" + password.hashCode() + "'";
            //3.execute sql statement
            Statement st = connect.createStatement();
            //4.result
            ResultSet rs = st.executeQuery(sql);
            //5.execute process
            if (rs.next()) {
                result = true;
            }
            //6.close it!
            connect.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return result;
    }

    public boolean isWrongPassword(String email, String password) {

        boolean result = false;

        try {
            //1. get connection to the database
            Class.forName(dbdriver);
            connect = DriverManager.getConnection(url, dbuserName, dbpassword);
            //2.establish sql string
            String sql = "select * from userprofile where email='" + email + "'";
            //3.execute sql statement
            Statement st = connect.createStatement();
            //4.result
            ResultSet rs = st.executeQuery(sql);
            //5.execute process
            if (rs.next()) {
//				int DBpassword = Integer.parseInt(rs.getString("password"));
//				(DBpassword==password.hashCode()) &&
                if (rs.getString("email").equals(email)) {
                    result = true;
                } else {
                    result = false;
                }
            }
            //6.close it!
            connect.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return result;
    }

}
