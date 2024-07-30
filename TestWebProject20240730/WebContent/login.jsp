<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
	.login-container {
            width: 300px;
        }
        .login-container h1 {
            margin-bottom: 20px;
        }
        .login-container label {
            display: inline-block;
            width: 55px;
            margin-bottom: 10px;
        }
        .login-container input[type="text"],
        .login-container input[type="password"] {
            width: calc(100% - 65px);
            padding: 5px;
            margin-bottom: 10px;
            display: inline-block;
            box-sizing: border-box;
        }
        .login-container input[type="submit"],
        .login-container input[type="button"] {
            width: 100%;
            cursor: pointer;
            margin-top: 10px;
        }
	
</style>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<div class="login-container">
        <h1>로그인</h1>
        <form action="login" method="post">
            <label for="id">ID :</label>
            <input type="text" id="id" name="id" required>
            <label for="pw">PW :</label>
            <input type="password" id="pw" name="pw" required>
            <input type="submit" value="로그인">
            <input type="button" value="회원가입" onclick="location.href='signup.jsp'">
        </form>
    </div>
</body>
</html>