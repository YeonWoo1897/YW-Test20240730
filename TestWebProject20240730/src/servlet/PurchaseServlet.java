package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONObject;

@WebServlet("/purchase")
public class PurchaseServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("userId");
        String course = request.getParameter("course");

        int courseCost = 0;
        switch (course) {
            case "intro":
                courseCost = 100000;
                break;
            case "java":
                courseCost = 500000;
                break;
            case "cpp":
                courseCost = 300000;
                break;
        }

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        JSONObject json = new JSONObject();

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "user0112", "user1234");

            String sql = "SELECT point FROM member WHERE id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                int points = rs.getInt("point");
                if (points >= courseCost) {
                    points -= courseCost;

                    sql = "UPDATE member SET point = ? WHERE id = ?";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setInt(1, points);
                    pstmt.setString(2, userId);
                    pstmt.executeUpdate();

                    json.put("message", "컨텐츠(" + course + ")를 구입하였습니다.");
                    json.put("success", true);
                    json.put("points", points);
                } else {
                    json.put("message", "포인트가 부족합니다. 광고를 클릭하세요.");
                    json.put("success", false);
                }
            }

            response.setContentType("application/json");
            PrintWriter out = response.getWriter();
            out.print(json);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
