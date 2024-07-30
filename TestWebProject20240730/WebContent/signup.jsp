<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<style>
        .signup-container {
            width: 300px;
        }

        .signup-container h1 {
            margin-bottom: 20px;
        }

        .signup-container label {
            display: inline-block;
            width: 55px;
            margin-bottom: 10px;
        }

        .signup-container input[type="text"],
        .signup-container input[type="password"] {
            width: calc(100% - 65px);
            padding: 5px;
            margin-bottom: 10px;
            display: inline-block;
            box-sizing: border-box;
        }

        .signup-container input[type="submit"] {
            width: 100%;
            cursor: pointer;
            margin-top: 10px;
        }
    </style>
	<meta charset="UTF-8">
	<title>회원가입</title>
</head>
	<body>
		<div class="signup-container">
	    <h1>회원가입</h1>
	    <form action="signup" method="post">
	        <label for="id">ID :</label>
	        <input type="text" id="id" name="id" required>

	        <label for="pw">PW :</label>
	        <input type="password" id="pw" name="pw" required>
	
	        <label for="name">Name :</label>
	        <input type="text" id="name" name="name" required>
	
	        <input type="submit" value="작성완료">
	    </form>
	</div>
</body>
</html>