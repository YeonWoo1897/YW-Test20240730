<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.MemberDAO" %>
<%@ page import="dto.MemberDTO" %>

<%
    String id = request.getParameter("id");
    MemberDAO memberDAO = new MemberDAO();
    MemberDTO member = memberDAO.getMemberById(id);
    
    if (member == null) {
        response.sendRedirect("admin.jsp"); 
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 정보 수정</title>
    <style>
        .edit-container {
            width: 300px;
            margin: auto;
        }
        .edit-container label {
            display: block;
            margin-bottom: 10px;
        }
        .edit-container input[type="text"],
        .edit-container input[type="password"] {
            width: 100%;
            padding: 5px;
            margin-bottom: 10px;
        }
        .edit-container input[type="submit"] {
            width: 100%;
            padding: 5px;
        }
    </style>
</head>
<body>
    <div class="edit-container">
        <h1>회원 정보 수정</h1>
        <form action="updateMember" method="post">
            <input type="hidden" name="id" value="<%= member.getId() %>">
            <label for="pw">비밀번호:</label>
            <input type="password" id="pw" name="pw" value="<%= member.getPw() %>" required>
            <label for="name">이름:</label>
            <input type="text" id="name" name="name" value="<%= member.getName() %>" required>
            <label for="point">포인트:</label>
            <input type="text" id="point" name="point" value="<%= member.getPoint() %>" required>
            <input type="submit" value="제출">
        </form>
    </div>
</body>
</html>
