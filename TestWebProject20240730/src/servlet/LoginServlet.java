package servlet;

import dto.UserDTO;
import dao.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String id = request.getParameter("id");
        String pw = request.getParameter("pw");

        UserDAO userDAO = new UserDAO();
        UserDTO user = userDAO.authenticate(id, pw);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            response.sendRedirect("main.jsp");
        } else {
            response.getWriter().println("<script>alert('아이디/비밀번호를 다시 확인하세요'); location.href='login.jsp';</script>");
        }
    }
}
