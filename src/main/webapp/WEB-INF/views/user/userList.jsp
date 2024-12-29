<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<table class="table">
    <thead>
    <tr>
        <th>ID</th>
        <th>Username</th>
        <th>Real Name</th>
        <th>Email</th>
        <th>telephone</th>
        <th>Status</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody id="userList">
    <!-- 用户数据将通过 AJAX 填充 -->
    </tbody>
</table>
<button class="btn btn-primary" onclick="add()">添加用户</button>
<button class="btn btn-success" onclick="saveUsers()">保存用户数据</button>
<script>
    $(function () {
        loadData(1); // 加载第一页数据
    });

    function loadData(page) {
        $.ajax({
            url: '${pageContext.request.contextPath}/user/page.action',
            data: {
                page: page,
                size: 20
            },
            success: function (response) {
                if (response.code === 200) {
                    renderTable(response.data);
                } else {
                    alert(response.message);
                }
            }
        });
    }

    function renderTable(list) {
        var html = '';
        for (var i = 0; i < list.length; i++) {
            var user = list[i];
            html += '<tr>';
            html += '<td>' + user.id + '</td>';
            html += '<td>' + user.username + '</td>';
            html += '<td>' + (user.realname || '') + '</td>';
            html += '<td>' + (user.email || '') + '</td>';
            html += '<td>' + (user.telephone || '') + '</td>';
            html += '<td>' + (user.status === true ? '正常' : '禁用') + '</td>';
            html += '<td>';
            html += '<button class="btn btn-sm btn-info" onclick="edit(\'' + user.id + '\')">编辑</button> ';
            html += '<button class="btn btn-sm btn-danger" onclick="del(\'' + user.id + '\')">删除</button>';
            html += '</td>';
            html += '</tr>';
        }
        $('#userList').html(html);
    }

    function add() {
        self.location.href = '${pageContext.request.contextPath}/user/userEdit.action';
    }

    function edit(id) {
        self.location.href = '${pageContext.request.contextPath}/user/userEdit.action?id=' + id;
    }

    function del(id) {
        if (confirm('确定要删除吗？')) {
            $.ajax({
                url: '${pageContext.request.contextPath}/user/delete.action',
                data: {id: id},
                success: function (res) {
                    if (res.code === 200) {
                        loadData(1);
                    } else {
                        alert(res.message);
                    }
                }
            });
        }
    }

    function saveUsers() {
        // 获取用户数据
        var users = [];
        $('#userList tr').each(function() {
            var user = {
                id: $(this).find('td').eq(0).text(), // ID
                username: $(this).find('td').eq(1).text(), // Username
                realname: $(this).find('td').eq(2).text(), // Real Name
                email: $(this).find('td').eq(3).text(), // Email
                telephone: $(this).find('td').eq(4).text(), // telephone
                status: $(this).find('td').eq(5).text() === '正常' // Status
            };
            users.push(user);
        });

        // 发送 AJAX 请求保存用户数据
        $.ajax({
            url: '${pageContext.request.contextPath}/user/saveOrUpdate.action',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(users), // 将用户数据转换为 JSON 字符串
            success: function(res) {
                if (res.code === 200) {
                    alert('用户数据保存成功！');
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