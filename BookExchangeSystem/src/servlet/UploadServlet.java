package servlet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

/**
 * Created by Steven 臧 on 23/03/2017.
 */
@WebServlet("/UploadServlet")
public class UploadServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request,response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request,response);
	}

	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		resp.setContentType("text/html; charset=utf-8");

		String bookname = req.getParameter("bookname");
		String author = req.getParameter("author");
		String isbn = req.getParameter("isbn");
		String description = req.getParameter("description");
		String department = req.getParameter("department");
		String locationID = req.getParameter("locationID");
		String sellorlend = req.getParameter("sellorlend");
		String condition = req.getParameter("condition");
		String price = req.getParameter("price");

		Book book = new Book();

		book.setBookname(bookname);
		book.setAuthor(author);
		book.setIsbn(isbn);
		book.setDescription(description);
		book.setDepartment(department);
		book.setLocationID(Integer.parseInt(locationID));
		book.setSellorlend(sellorlend);
		book.setCondition(condition);
		book.setPrice(price);

		String email = (String) req.getSession().getAttribute("email");
		book.setEmail(email);

		boolean result = writeToDB(book);
		//具結果顯示成功或失敗
		if(result) {
			PrintWriter out = resp.getWriter();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Upload book success!');");
			out.println("location='home.jsp';");
			out.println("</script>");
		}
		else{
			RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/uploadBook.jsp");
			dispatcher.forward(req,resp);
		}
		System.out.println(req.getSession().getAttribute("email"));

	}

	public boolean writeToDB(Book book){
		boolean result=false;
		String url = "jdbc:mysql://127.0.0.1:3306/maxi";
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(url,"root","steven04060406");

			String sqlGetEmail = "select userID from userprofile where email = '"+book.getEmail()+"'";
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(sqlGetEmail);
			int userID=0;
			while(rs.next()){
				userID=Integer.parseInt(rs.getString("userID"));
			}

			String sql = "insert into booklist (bookname,author,isbn,description,userID,department,locationID,sellorlend,bookcondition,price) value ("
					+"'"+book.getBookname()+"',"
					+"'"+book.getAuthor()+"',"
					+"'"+book.getIsbn()+"',"
					+"'"+book.getDescription()+"',"
					+""+userID+","
					+"'"+book.getDepartment()+"',"
					+""+book.getLocationID()+","
					+"'"+book.getSellorlend()+"',"
					+"'"+book.getCondition()+"',"
					+"'"+book.getPrice()+"')";
			int row=st.executeUpdate(sql);
			if(row>0){
				System.out.println("Insert Success!");
				result=true;
			}


			conn.close();

		}catch (ClassNotFoundException e){
			e.printStackTrace();
		}    catch (SQLException e){
			e.printStackTrace();
		}
		return result;
	}
}
