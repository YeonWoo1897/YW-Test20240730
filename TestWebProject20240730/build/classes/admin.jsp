<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="dto.MemberDTO"%>
<%
    List<MemberDTO> userList = (List<MemberDTO>) request.getAttribute("userList");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원관리</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 10px;
            text-align: center;
        }
        .logout {
            float: right;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>회원관리</h1>
        <div class="logout">
            <button onclick="location.href='login.jsp'">로그아웃</button>
        </div>
    </div>
    <table>
        <tr>
            <th>ID</th>
            <th>PW</th>
            <th>Name</th>
            <th>Point</th>
            <th>수정</th>
            <th>삭제</th>
        </tr>
        <%
            if (userList != null) {
                for (MemberDTO u : userList) {
        %>
        <tr>
            <td><%= u.getId() %></td>
            <td><%= u.getPw() %></td>
            <td><%= u.getName() %></td>
            <td><%= u.getPoint() %></td>
            <td><button onclick="location.href='editMember.jsp?id=<%= u.getId() %>'">수정</button></td>
            <td><button onclick="deleteMember('<%= u.getId() %>')">삭제</button></td>
        </tr>
        <%
                }
            }
        %>
    </table>
    <h2>스케줄러관리</h2>
    <button onclick="startScheduler()">스케줄러 실행 시작</button>
    <button onclick="stopScheduler()">스케줄러 실행 종료</button>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        function deleteMember(id) {
            $.post('admin', { action: 'delete', id: id }, function(response) {
                alert('삭제되었습니다.');
                location.reload();
            });
        }

        function startScheduler() {
            $.post('startScheduler', function(response) {
                alert('스케줄러가 시작되었습니다.');
            });
        }

        function stopScheduler() {
            $.post('stopScheduler', function(response) {
                alert('스케줄러가 종료되었습니다.');
            });
        }
    </script>
</body>
</html>
