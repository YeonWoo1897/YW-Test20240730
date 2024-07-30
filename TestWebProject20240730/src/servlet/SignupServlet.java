package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Signup")
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        request.setCharacterEncoding("UTF-8");
	        response.setContentType("text/html;charset=UTF-8");
	        
	        String id = request.getParameter("id");
	        String pw = request.getParameter("pw");
	        String name = request.getParameter("name");
	        
	        Connection conn = null;
	        PreparedStatement pstmt = null;
	        
	        try {
	            Class.forName("oracle.jdbc.driver.OracleDriver");
	            conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "user0112", "user1234");

	            String sql = "INSERT INTO member (id, pw, name, point) VALUES (?, ?, ?, 1000)";
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, id);
	            pstmt.setString(2, pw);
	            pstmt.setString(3, name);
	            
	            int result = pstmt.executeUpdate();
	            
	            PrintWriter out = response.getWriter();
	            if (result > 0) {
	                out.println("<script>alert('가입되었습니다. 로그인 해주세요.'); location.href='login.jsp';</script>");
	            } else {
	                out.println("<script>alert('회원가입 실패. 다시 시도해주세요.'); history.back();</script>");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            try {
	                if (pstmt != null) pstmt.close();
	                if (conn != null) conn.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	    }

}
