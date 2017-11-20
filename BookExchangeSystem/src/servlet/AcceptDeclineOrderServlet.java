package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Created by Steven 臧 on 05/04/2017.
 */
@WebServlet("/AcceptDeclineOrderServlet")
public class AcceptDeclineOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        process(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        process(request,response);
    }

    protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String processType= req.getParameter("acceptordecline");
        if(processType.equals("accept")){
            accept(req,resp);
        }
        else {
            System.out.println("Decline");
        }
    }

    protected void accept(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int applicantID = Integer.parseInt(req.getParameter("myID"));
        int ownerID= Integer.parseInt(req.getParameter("ownerID"));
        int orderID= Integer.parseInt(req.getParameter("orderID"));
        int booklistID= Integer.parseInt(req.getParameter("booklistID"));
        System.out.println(applicantID+" "+ownerID+" "+orderID+" "+booklistID);
        String url = "jdbc:mysql://127.0.0.1:3306/maxi";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url,"root","steven04060406");

            String sql ="update booklist set available=0, applicantID = "+ applicantID + " where booklistID = "+booklistID;
            String deleteOtherOrders;
            Statement st = conn.createStatement();
            int row = st.executeUpdate(sql);
            if(row>0){
                System.out.println("Update Successful!");
            }

            conn.close();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
