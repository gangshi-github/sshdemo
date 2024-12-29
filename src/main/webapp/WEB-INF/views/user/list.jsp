<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>用户列表</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h2>用户列表</h2>
        <div class="row">
            <div class="col-md-12">
                <button class="btn btn-primary" onclick="add()">新增用户</button>
            </div>
        </div>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>用户名</th>
                    <th>真实姓名</th>
                    <th>邮箱</th>
                    <th>手机号</th>
                    <th>状态</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody id="userList">
            </tbody>
        </table>
        <div id="pagination"></div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script>
        $(function() {
            loadData(1);
        });

        function loadData(pageNum) {
            $.ajax({
                url: '${pageContext.request.contextPath}/user/listData.action',
                data: {
                    pageNum: pageNum,
                    pageSize: 10
                },
                success: function(res) {
                    if (res.code === 200) {
                        debugger;
                        renderTable(res.data.list);
                    } else {
                        alert(res.message);
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
                html += '<td>' + (user.realName || '') + '</td>';
                html += '<td>' + (user.email || '') + '</td>';
                html += '<td>' + (user.mobile || '') + '</td>';
                html += '<td>' + (user.status === true ? '正常' : '禁用') + '</td>';
                html += '<td>';
                html += '<button class="btn btn-sm btn-info" onclick="edit(' + user.id + ')">编辑</button> ';
                html += '<button class="btn btn-sm btn-danger" onclick="del(' + user.id + ')">删除</button>';
                html += '</td>';
                html += '</tr>';
            }
            $('#userList').html(html);
        }

        function add() {
            window.location.href = '${pageContext.request.contextPath}/user/edit.action';
        }

        function edit(id) {
            window.location.href = '${pageContext.request.contextPath}/user/edit.action?id=' + id;
        }

        function del(id) {
            if (confirm('确定要删除吗？')) {
                $.ajax({
                    url: '${pageContext.request.contextPath}/user/delete.action',
                    data: {id: id},
                    success: function(res) {
                        if (res.code === 200) {
                            loadData(1);
                        } else {
                            alert(res.message);
                        }
                    }
                });
            }
        }
    </script>
</body>
</html> 