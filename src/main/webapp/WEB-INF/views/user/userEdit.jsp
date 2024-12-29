<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit User</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script>
        $(document).ready(function() {
            // 获取用户 ID（假设通过 URL 参数传递）
            const id = getUrlParameter('id');
            loadUserData(id);
        });

        function getUrlParameter(name) {
            // 获取 URL 参数
            const results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
            return results ? decodeURIComponent(results[1]) : null;
        }

        function loadUserData(id) {
            debugger;
            $.ajax({
                url: '${pageContext.request.contextPath}/user/getOne.action', // 后端接口
                data: { id: id },
                dataType: 'json',
                success: function(response) {
                    debugger;
                    if (response.code === 200) {
                        // 填充表单数据
                        $('#username').val(response.data.username);
                        $('#email').val(response.data.email);
                        $('#realname').val(response.data.realname);
                        $('#telephone').val(response.data.telephone);
                        $('#status').prop('checked', response.data.status);
                        // 其他字段...
                    } else {
                        alert(response.message);
                    }
                },
                error: function(xhr, status, error) {
                    console.error('Error loading user data:', status, error);
                    alert('Error loading user data.');
                }
            });
        }

        function saveUser() {
            var users =[];
            // 构建用户对象
            var user = {
                id: $('#id').val(),
                username: $('#username').val(),
                email: $('#email').val(),
                realname: $('#realname').val(),
                telephone: $('#telephone').val(),
                status: $('#status').is(':checked') // 获取复选框状态
            };
            users.push(user);

            // 发送 AJAX 请求保存用户数据
            $.ajax({
                url: '${pageContext.request.contextPath}/user/saveOrUpdate.action',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(users), // 将用户数据转换为 JSON 字符串
                success: function(res) {
                    if (res.code === 200) {
                        alert('用户数据保存成功！');
                        window.location.href = '${pageContext.request.contextPath}/user/userList.action';
                        location.reload();
                    } else {
                        alert(res.message);
                    }
                },
                error: function(xhr, status, error) {
                    console.error('Error saving user data:', status, error);
                    alert('保存用户数据时出错。');
                }
            });
        }
    </script>
</head>
<body>
<div class="container">
    <h2 class="mt-4">Edit User</h2>
    <form id="editUserForm" onsubmit="event.preventDefault(); saveUser();"> <!-- 阻止默认提交 -->
        <input type="hidden" id="id" value="${param.id}"/> <!-- 用户 ID -->
        <div class="form-group">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" class="form-control" required/>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" class="form-control" required/>
        </div>
        <div class="form-group">
            <label for="realname">Real Name:</label>
            <input type="text" id="realname" name="realname" class="form-control"/>
        </div>
        <div class="form-group">
            <label for="telephone">telephone:</label>
            <input type="text" id="telephone" name="telephone" class="form-control"/>
        </div>
        <div class="form-group">
            <label for="status">Status:</label>
            <input type="checkbox" id="status" name="status"/> <!-- 状态复选框 -->
        </div>
        <button type="submit" class="btn btn-primary">Update User</button>
        <button type="button" class="btn btn-secondary" onclick="window.location.href='${pageContext.request.contextPath}/user/userList.action'">返回用户列表</button> <!-- 返回按钮 -->
    </form>
</div>
</body>
</html>