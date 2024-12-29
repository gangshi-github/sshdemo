<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>错误页面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <div class="alert alert-danger mt-5">
            <h4>系统错误</h4>
            <p>${errorMessage}</p>
            <p><a href="javascript:history.back()" class="btn btn-primary">返回上一页</a></p>
        </div>
    </div>
</body>
</html> 