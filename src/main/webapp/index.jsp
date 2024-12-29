<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Management System</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"> <!-- 引入 Font Awesome -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        .nav-link {
            background-color: white; /* 默认背景为白色 */
            color: lightgray; /* 未选中时字体颜色为浅灰色 */
            position: relative; /* 为了对号样式定位 */
        }
        .nav-link:hover {
            background-color: #f8f9fa; /* 鼠标悬停时的灰色高亮 */
        }
        .nav-link.active {
            color: black; /* 选中时字体颜色为黑色 */
        }
        .nav-link::after {
            content: '✔'; /* 添加对号样式 */
            position: absolute;
            right: 10px; /* 右侧位置 */
            opacity: 0; /* 默认隐藏 */
            transition: opacity 0.3s; /* 添加过渡效果 */
        }
        .nav-link:hover::after {
            opacity: 1; /* 鼠标悬停时显示对号 */
        }
        .header {
            background-color: #f8f9fa; /* 灰色横框 */
            padding: 10px; /* 内边距 */
            text-align: center; /* 居中对齐 */
        }
        .dashboard-title {
            display: flex;
            align-items: last baseline;
            justify-content: left;
            margin-bottom: 20px; /* 与菜单的间距 */
            margin-top: 20px;
        }
        .dashboard-title i {
            margin-right: 8px; /* 图标与文字之间的间距 */
        }
    </style>
    <script>
        function loadContent(url) {
            $('#mainContent').load(url);
            // 更新菜单项的选中状态
            $('.nav-link').removeClass('active'); // 移除所有菜单项的选中状态
            $('a[href="' + url + '"]').addClass('active'); // 添加选中状态
        }

        $(function() {
            // 默认加载用户列表
            // loadContent('${pageContext.request.contextPath}/user/userList.action');
        });
    </script>
</head>
<body>
<div class="container-fluid">
    <div class="header">
        <h4 class="dashboard-title"><i class="fab fa-github"></i> Dashboard</h4> <!-- 添加 GitHub 图标 -->
    </div>
    <div class="row">
        <nav class="col-md-2 d-none d-md-block bg-light sidebar">
            <div class="sidebar-sticky">
                <h4></h4>
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link collapsed" data-toggle="collapse" href="#userMenu" role="button" aria-expanded="false" aria-controls="userMenu">
                            User Management
                        </a>
                        <div class="collapse" id="userMenu">
                            <ul class="nav flex-column ml-3">
                                <li class="nav-item">
                                    <a class="nav-link" href="#" onclick="loadContent('${pageContext.request.contextPath}/user/userList.action')">User List</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#" onclick="loadContent('${pageContext.request.contextPath}/user/userEdit.action')">Edit User</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#" onclick="loadContent('${pageContext.request.contextPath}/user/create.action')">Create User</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" onclick="loadContent('${pageContext.request.contextPath}/role/roleList.action')">Role Management</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" onclick="loadContent('${pageContext.request.contextPath}/settings.action')">Settings</a>
                    </li>
                </ul>
            </div>
        </nav>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
            <div id="mainContent">
                <h2>Welcome to Admin Management System</h2>
                <p class="lead">Manage your application efficiently with our admin system.</p>
            </div>
        </main>
    </div>
</div>
</body>
</html>