<%--
  Created by IntelliJ IDEA.
  User: 86132
  Date: 2021/7/28
  Time: 15:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>员工列表</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-3.5.1.min.js"></script>
    <link rel="stylesheet" href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.css">
    <script type="text/javascript" src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.js"></script>

</head>
<body>
<%--显示页面--%>
<div class="container">
    <%--    标题--%>
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <%--    按钮--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary" id="addRow">新增</button>
            <button class="btn btn-danger" id="delRow">删除</button>
        </div>
    </div>
    <%--    显示数据表格--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover">
                <tr>
                    <th>#</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
                <tbody id="emps_tbody">

                </tbody>
            </table>
        </div>
    </div>
    <%--    显示分页信息--%>
    <div class="row">
        <%--        分页文字信息--%>
        <div class="col-md-6" id="page_info_area">

        </div>
        <%--    分页条信息--%>
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination" id="page_nav_area">

                </ul>
            </nav>
        </div>
    </div>
<%--    新增用户model--%>
        <div class="modal fade" id="addUser" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="addUserLabel">用户新增</h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal">
                            <div class="form-group">
                                <label for="input_add_empName" class="col-sm-2 control-label">用户名</label>
                                <div class="col-sm-10">
                                    <input type="text" name="empName" class="form-control" id="input_add_empName" placeholder="empName">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="input_add_email" class="col-sm-2 control-label">email</label>
                                <div class="col-sm-10">
                                    <input type="email" name="email" class="form-control" id="input_add_email" placeholder="email">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">性别</label>
                                <div class="col-sm-10">
                                    <label class="radio-inline">
                                        <input type="radio" name="gende" id="input_add_men" value="M" checked> 男
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="gende" id="input_add_women" value="F"> 女
                                    </label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="dept_add_select" class="col-sm-2 control-label">部门名</label>
                                <div class="col-sm-4">
                                    <select name="dId" id="dept_add_select" class="form-control">
                                    </select>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
                    </div>
                </div>
            </div>
        </div>
<%--    编辑用户model--%>
        <div class="modal fade" id="updateUser" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="updateUserLabel">用户编辑</h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal">
                            <div class="form-group">
                                <label for="static_update_empName" class="col-sm-2 control-label">用户名</label>
                                <div class="col-sm-10">
                                    <p id="static_update_empName" class="form-control-static"></p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="input_update_email" class="col-sm-2 control-label">email</label>
                                <div class="col-sm-10">
                                    <input type="email" name="email" class="form-control" id="input_update_email" placeholder="email">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">性别</label>
                                <div class="col-sm-10">
                                    <label class="radio-inline">
                                        <input type="radio" name="gende" id="input_update_men" value="M" checked> 男
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="gende" id="input_update_women" value="F"> 女
                                    </label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="dept_update_select" class="col-sm-2 control-label">部门名</label>
                                <div class="col-sm-4">
                                    <select name="dId" id="dept_update_select" class="form-control">
                                    </select>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
                    </div>
                </div>
            </div>
        </div>
<%--    删除用户model--%>
        <div class="modal fade" id="delUser" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="delUserLabel">用户删除</h4>
                    </div>
                    <div class="modal-body">
                        ...
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default"  data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
            </div>
        </div>
</div>
<script>

    // 用于记录总记录数的常量
    var totalRecord;

    $(function () {
        // 默认去首页
        toPage(1)
    })

    // 分页跳转
    function toPage(pn) {
        $.ajax({
            url:"${APP_PATH}/emps"
            ,data:"pn="+pn
            ,type:"get"
            ,success:function (result) {
                // console.log(result);
                // 1.解析显示员工信息
                build_emps_table(result)
                // 2.解析并显示分页信息
                build_page_info(result)
                // 3.解析并显示分页条信息
                build_page_nav(result)
            }
        })
    }

    // table
    function build_emps_table(result) {
        // 清空table
        $('#emps_tbody').empty();
        var emps = result.data.pageInfo.list;
        $.each(emps,function (index,item) {
            var empIdTd = $("<td></td>").append(item.empId);
            var empNameTd = $("<td></td>").append(item.empName);
            var gendeTd = $("<td></td>").append(item.gende=="M"?"男":"女");
            var emailTd = $("<td></td>").append(item.email);
            var deptNameId = $("<td></td>").append(item.department.deptName);
            // 按钮
            var editBtn = $("<button></button>").addClass("btn btn-primary btn_sm edit_btn").append($("<span>编辑</span>").addClass("glyphicon glyphicon-pencil"))
            var delBtn = $("<button></button>").addClass("btn btn-danger btn_sm delete_btn").append($("<span>删除</span>").addClass("glyphicon glyphicon-trash"))
            // 为编辑和删除按钮添加自定义的属性代表员工id
            editBtn.attr("edit-id",item.empId)
            var btnTd = $("<td></ttd>").append(editBtn).append(" ").append(delBtn);
            $("<tr></tr>").append(empIdTd).append(empNameTd).append(gendeTd).append(emailTd).append(deptNameId).append(btnTd).appendTo('#emps_tbody');

        })
    }

    // 分页文字
    function build_page_info(result) {
        // 清空分页文字信息
        $('#page_info_area').empty();
        $("#page_info_area").append("当前"+ result.data.pageInfo.pageNum +"页,总"+ result.data.pageInfo.pages +"页,总"+ result.data.pageInfo.total +"条记录")
        totalRecord = result.data.pageInfo.total;
    }

    // 分页条信息
    function build_page_nav(result) {
        // 清空分页条信息
        $('#page_nav_area').empty();
        var firstPageLi = $("<li></li>").append($("<a>首页</a>").attr("herf","#"));
        firstPageLi.click(function () {
            toPage(1)
        })
        var prePageLi = $("<li></li>").append($("<a>&laquo;</a>").attr("herf","#"));
        if (result.data.pageInfo.hasPreviousPage == false){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        }
        prePageLi.click(function () {
            if (result.data.pageInfo.hasPreviousPage != false){
                toPage(result.data.pageInfo.pageNum-1)
            }
        })
        var nextPageLi = $("<li></li>").append($("<a>&raquo;</a>").attr("herf","#"));
        nextPageLi.click(function () {
            if (result.data.pageInfo.hasNextPage != false){
                toPage(result.data.pageInfo.pageNum+1)
            }
        })
        var lastPageLi = $("<li></li>").append($("<a>尾页</a>").attr("herf","#"));
        lastPageLi.click(function () {
                toPage(result.data.pageInfo.pages)
        })
        if (result.data.pageInfo.hasNextPage == false){
            lastPageLi.addClass("disabled");
            nextPageLi.addClass("disabled");
        }
        $('#page_nav_area').append(firstPageLi).append(prePageLi);

        $.each(result.data.pageInfo.navigatepageNums,function (index,item) {

            var numLi = $("<li></li>").append($("<a>"+ item +"</a>").attr("herf","#"));
            if (result.data.pageInfo.pageNum == item){
                numLi.addClass("active")
            }
            numLi.click(function () {
                toPage(item)
            })
            $('#page_nav_area').append(numLi);
        })
        $('#page_nav_area').append(nextPageLi).append(lastPageLi);
    }

    // 清空表单样式和内容的方法
    function reset_form(ele){
        $(ele)[0].reset();
        $(ele).find("*").removeClass("has-error has-success");
        $(ele).find(".help-block").text("")
    }

    // 新增用户model
    $('#addRow').click(function () {
        // 清除表单数据
        reset_form('#addUser form')
        getDepts("#dept_add_select");
        $('#addUser').modal()
    })

    // 新增用户model打开前先查询部门
    function getDepts(ele){
        // 清空下拉列表的值
        $(ele ).empty()
        $.ajax({
            url: "${APP_PATH}/depts"
            ,type: "GET"
            ,success:function (result) {
                $("#dept_add_select").empty();
                // console.log(result)
                // 显示部门信息到模态框下拉框中
                $.each(result.data.depts,function () {

                    var optionEle = $("<option></option>").append(this.deptName).attr("value",this.deptId);
                    optionEle.appendTo(ele)
                })
            }
        })
    }

    // 表单检验
    function validate_add_form(){

        let empName = $('#input_add_empName').val();
        let regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/
        if(!regName.test(empName)){
            // alert("用户名可以是2-5位中文也可以是6-16位字母和数字")
            show_validate_msg("#input_add_empName","error","用户名可以是2-5位中文也可以是6-16位字母和数字")
            return false;
        }else {
            show_validate_msg("#input_add_empName","success","")
        }
        let email = $('#input_add_email').val();
        let regemail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/
        if(!regemail.test(email)){
            // alert("email格式不正确")
            show_validate_msg("#input_add_email","error","email格式不正确")
            return false;
        }else {
            show_validate_msg("#input_add_email","success","")
        }
        return true;
    }

    // 检验方法
    function show_validate_msg(labelId,state,describe){
        $(labelId).parent().removeClass("has-success has-error").addClass("has-"+state)
        $(labelId).next("span").text(describe)
    }

    // 用户名重复检验
    $("#input_add_empName").change(function () {
        // 发送ajax请求校验用户名是否可用
        $.ajax({
            url:"${APP_PATH}/checkuser"
            ,data:"empName="+this.value
            ,type:"POST"
            ,success:function (result) {
                if (result.code == 100){
                    show_validate_msg("#input_add_empName","success","用户名可用")
                    $("#emp_save_btn").attr("ajax-va","success")
                }else {
                    show_validate_msg("#input_add_empName","error",result.data.va_msg)
                    $("#emp_save_btn").attr("ajax-va","error")
                }
            }
        })
    })

    // 模态框中的保存
    $("#emp_save_btn").click(function () {
        // 先对提交的数据进行校验
        if (!validate_add_form()){
            return false;
        }
        // 判断用户名是否成功
        if ($(this).attr("ajax-va") == "error"){
            return false;
        }
        // 模态框中填写的表单提交
        $.ajax({
            url:"${APP_PATH}/emp"
            ,type:"POST"
            ,data:$("#addUser form").serialize()
            ,success:function (result) {
                if (result.code == 100){
                    alert(result.msg)
                    // 1.关闭模态框
                    $("#addUser").modal('hide')
                    // 2.跳转到最后一页
                    toPage(totalRecord)
                }else {
                    // 显示失败信息
                    // console.log(result);
                    if (result.data.errorFields.email != undefined){
                        show_validate_msg("#input_add_email","error",result.data.errorFields.email)
                    }
                    if (result.data.errorFields.empName != undefined){
                        show_validate_msg("#input_add_empName","error",result.data.errorFields.empName)

                    }
                }

            }
        })
    })
    // 用户编辑
    $(document).on("click",".edit_btn",function () {
        // 清除表单数据
        reset_form('#updateUser form')
        // 查出部门信息，并显示部门信息
        getDepts("#updateUser select");
        // 查出员工信息,并显示员工信息
        getEmp($(this).attr("edit-id"));
        // 把员工id传入给模态框的更新按钮的ajax
        $("#emp_update_btn").attr("edit-id",$(this).attr("edit-id"))
        $('#updateUser').modal()
    })

    // 员工信息查询
    function getEmp(id){
        $.ajax({
            url:"${APP_PATH}/emp/"+id
            ,type:"GET"
            ,success:function (result) {
                // console.log(result)
                var empDate = result.data.emp;
                $("#static_update_empName").text(empDate.empName);
                $("#input_update_email").val(empDate.email);
                $("#updateUser input[name=gende]").val([empDate.gende]);
                $("#updateUser select").val([empDate.dId]);
            }
        })
    }

    // 点击更新，编辑员工信息
    $("#emp_update_btn").click(function () {
        // 验证邮箱
        let email = $('#input_update_email').val();
        let regemail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/
        if(!regemail.test(email)){
            // alert("email格式不正确")
            show_validate_msg("#input_add_email","error","email格式不正确")
            return false;
        }else {
            show_validate_msg("#input_add_email","success","")
        }
        // 发送ajax请求，保存编辑的信息
        $.ajax({
            url:"${APP_PATH}/emp/"+$(this).attr("edit-id")
            ,type:"POST"
            ,data:$("#updateUser form").serialize()+"&_method=put"
            ,success:function (result) {
                if (result.code == 100){
                    alert(result.msg)
                    // 1.关闭模态框
                    $("#updateUser").modal('hide')
                    // 2.跳转到最后一页
                    toPage(totalRecord)
                }else {
                    // 显示失败信息
                    // console.log(result);
                    alert(result.msg)
                }
            }
        })
    })

    $('#delRow').click(function () {
        $('#delUser').modal()
    })


</script>
</body>
</html>
