package servlet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Created by Steven 臧 on 20/03/2017.
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        process (request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        process (request,response);
    }

    protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=utf-8");

        //取出客戶端輸入之資料
        String userTitle =request.getParameter("userTitle");
        String forename =request.getParameter("forename");
        String surname =request.getParameter("surname");
        String phonenumber =request.getParameter("phonenumber");
        String email =request.getParameter("email");
        String password = request.getParameter("password");


        //封裝資料為 Java Bean
        //校訂屬性型態

        UserProfile profile = new UserProfile();
        profile.setUserTitle(userTitle);
        profile.setForename(forename);
        profile.setSurname(surname);
        profile.setPhonenumber(phonenumber);
        profile.setEmail(email);
        profile.setPassword(password);

        System.out.println("");

        //將資料寫入資料庫 獨立出來成為一個方法
        boolean result = writeToDB(profile);
        //具結果顯示成功或失敗
        if(result) {
            RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/completeRegistration.jsp");
            dispatcher.forward(request, response);
        }
        else{
            RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/registration.jsp");
            dispatcher.forward(request,response);
        }

    }

    public boolean writeToDB (UserProfile profile) {
        boolean result=false;
        String url = "jdbc:mysql://127.0.0.1:3306/maxi";
        try {
            //取得資料庫連結
//            Properties prop = new Properties();
//            prop.put("charSet", "big5");

            Class.forName("com.mysql.jdbc.Driver");
//            Connection conn = DriverManager.getConnection(url, prop);
            Connection conn = DriverManager.getConnection(url,"root","steven04060406");

            //建立SQL字串
            String sql = "insert into userprofile (userTitle,forename,surname,phonenumber,email,password) value ("
                    +"'"+profile.getUserTitle()+"',"
                    +"'"+profile.getForename()+"',"
                    +"'"+profile.getSurname()+"',"
                    +"'"+profile.getPhonenumber()+"',"
                    +"'"+profile.getEmail()+"',"
                    +"'"+profile.getPassword().hashCode()+"')"
                    ;

            //執行SQL
            Statement st = conn.createStatement();

            //得到結果
            int row = st.executeUpdate(sql);
            //執行相關處理
            if(row>0){
                System.out.println("Insert Successful!");
                result = true;
            }

            //關閉connection
            conn.close();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return  result;
    }
}
