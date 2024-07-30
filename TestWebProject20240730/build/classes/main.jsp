<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.UserDTO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>메인페이지</title>
    <style>
        .course-container {
            display: flex;
            justify-content: space-around;
        }
        .course {
            text-align: center;
            margin: 10px;
        }
        .course img {
            width: 200px;
            height: 150px;
            cursor: pointer;
        }
        .course h2 {
            font-size: 18px;
            margin: 10px 0;
        }
        .course p {
            margin: 5px 0;
        }
        .logout {
            float: right;
        }
        .ad-container {
            margin-top: 20px;
            float: right;
        }
        .ad-container img {
            width: 100%;
            max-width: 200px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>메인페이지</h1>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
            $(document).ready(function() {
                $('.logout-button').click(function() {
                    $.post('logout', function(response) {
                        alert('로그아웃 되었습니다.');
                        window.location.href = 'login.jsp';
                    });
                });

                $('.course-card').click(function() {
                    var course = $(this).data('course');
                    $.post('purchase', { course: course }, function(response) {
                        alert(response.message);
                        if (response.success) {
                            $('#user-points').text(response.points + '점');
                        }
                    }, 'json');
                });

                $('.ad-container img').click(function() {
                    $.post('advertise', function(response) {
                        alert(response.message);
                        $('#user-points').text(response.points + '점');
                    }, 'json');
                });
            });
        </script>
        <div class="logout">
            <% 
                UserDTO user = (UserDTO) session.getAttribute("user");
                if (user != null) { 
            %>
                <%= user.getUsername() %>님 안녕하세요. 
                <button class="logout-button">로그아웃</button>
            <% } else { %>
                <p>로그인 정보가 없습니다.</p>
            <% } %>
        </div>
        <div>
            포인트 : <span id="points">
                <% if (user != null) { %>
                    <%= user.getPoints() %>
                <% } else { %>
                    0
                <% } %>
            </span>점
        </div>
    </div>
    <p>구입할 컨텐츠를 선택하세요.</p>
    <div class="course-container">
        <div class="course" onclick="purchaseCourse('intro', 100000)">
            <img src="Intro_350_408.png" alt="Intro to Programming">
            <p>100,000포인트</p>
        </div>
        <div class="course" onclick="purchaseCourse('java', 500000)">
            <img src="Java_350_408.png" alt="Java Programming">
            <p>500,000포인트</p>
        </div>
        <div class="course" onclick="purchaseCourse('cpp', 300000)">
            <img src="Cpp_350_408.png" alt="C++">
            <p>300,000포인트</p>
        </div>
    </div>
    <div class="ad-container">
        <div>&lt;광고&gt;</div>
        <img src="korea_it.png" alt="광고">
    </div>
</body>
</html>
