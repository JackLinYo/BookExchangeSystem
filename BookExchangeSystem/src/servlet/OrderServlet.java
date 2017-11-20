package servlet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

/**
 * Created by Steven 臧 on 28/03/2017.
 */
@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        process(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        process(request,response);
    }

    protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String value[] = req.getParameter("order").split("\\s");
        PrintWriter out = resp.getWriter();

        int booklistID =Integer.parseInt(value[0]);
        int booklistOwnerID=Integer.parseInt(value[1]);

        String requestUserEmail=(String) req.getSession().getAttribute("email");

        String url = "jdbc:mysql://127.0.0.1:3306/maxi";
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url,"root","steven04060406");

            String sqlRequestUserID = "select userID from userprofile where email = '"+requestUserEmail+"'";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sqlRequestUserID);
            int requestUserID=0;
            while(rs.next()){
                requestUserID=Integer.parseInt(rs.getString("userID"));
            }


            //handle order own book
            if(booklistOwnerID==requestUserID){
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Error : Order your own book!');");
                out.println("location='searchByDepartment.jsp';");
                out.println("</script>");
            }

            else {

                //Handle Order Same Book Many Times
                String sqlOrderExist = "select booklistID from orderlist where requestUserID = '"+requestUserID+"'";
                rs=st.executeQuery(sqlOrderExist);
                boolean sameorder=false;
                while(rs.next()){
                    int booklistIDInDatabase=Integer.parseInt(rs.getString("booklistID"));
                    if(booklistIDInDatabase==booklistID){
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Error : Order same book!');");
                        out.println("location='searchByDepartment.jsp';");
                        out.println("</script>");
                        sameorder=true;
                        break;
                    }
                    else;
                }

                if(!sameorder) {
                    //Do Insert An Order
                    PreparedStatement ps = conn.prepareStatement("INSERT INTO orderlist (booklistID,requestUserID) VALUES (?,?)");
                    ps.setInt(1, booklistID);
                    ps.setInt(2, requestUserID);
                    int row = ps.executeUpdate();
                    if (row > 0) {
                        System.out.println("Order has send!");
                    }
                }
            }
            conn.close();

        }catch (ClassNotFoundException e){
            e.printStackTrace();
        }    catch (SQLException e){
            e.printStackTrace();
        }

        out.println("<script type=\"text/javascript\">");
        out.println("alert('Order success!');");
        out.println("location='home.jsp';");
        out.println("</script>");
    }
}
