<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap 101 Template</title>
    <% pageContext.setAttribute("APP_PATH",request.getContextPath()); %>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
    <!-- 员工修改的模态框-->
    <div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">员工修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="empName_update_static"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="email" class="form-control" name="email" id="emp_update_email" placeholder="email">
                            <span  class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="emp_update_M" value="M" checked> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="emm_update_F" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <select class="form-control" id="emp_update_select" name="dId">

                            </select>
                        </div>
                    </div>


                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
                <button type="button" class="btn btn-primary" id="emp_update_save">更新</button>
            </div>
        </div>
    </div>
</div>

    <!-- 员工新增的模态框-->
    <div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">员工新增</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">empName</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="empName" id="emp_add_empName" placeholder="empName">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">email</label>
                            <div class="col-sm-10">
                                <input type="email" class="form-control" name="email" id="emp_add_email" placeholder="email">
                                <span  class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">gender</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="emp_add_M" value="M" checked> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="emm_add_F" value="F"> 女
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">deptName</label>
                            <div class="col-sm-4">
                                <select class="form-control" id="emp_add_select" name="dId">

                                </select>
                            </div>
                        </div>


                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
                    <button type="button" class="btn btn-primary" id="emp_add_save">保存</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 搭配显示页面-->
    <div class="container">
        <!-- 标题 -->
        <div class="row">
            <div class="col-md-12">
                <h1>SSM_CRUD</h1>
            </div>
        </div>
        <!-- 按钮-->
        <div class="row">
            <div class="col-md-4 col-md-offset-8">
                <BUTTON class="btn btn-primary"
                        data-target="#empAddModal"
                        id="emp_add_modal_btn">
                    新增
                </BUTTON>
                <BUTTON class="btn btn-danger" id="deleteBatch">批量删除</BUTTON>
            </div>
        </div>
        <!-- 表格数据-->
        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover" id="table_emps">
                    <THEAD>
                        <tr>
                            <th><input type="checkbox" id="checkAll"></th>
                            <th>#</th>
                            <th>empName</th>
                            <th>gender</th>
                            <th>email</th>
                            <th>deptName</th>
                            <th>操作</th>
                        </tr>
                    </THEAD>
                    <tbody id="tbody"></tbody>

                </table>
            </div>
        </div>
        <!--分页信息-->
        <div class="row">
            <div class="row">
                <!--分页文字信息  -->
                <div class="col-md-6" id="page_info_area"></div>
                <!-- 分页条信息 -->
                <div class="col-md-6" id="page_nav_area">
                </div>
            </div>
        </div>
    </div>

    <!-- 显示表格数据和分页信息 -->
    <script type="text/javascript">
        var totalRecord,currentPage;
        //1、页面加载完成以后，直接去发送ajax请求,要到分页数据
        $(function(){
            //去首页
            to_page(1);
        });

        function to_page(page){
            $.ajax({
                url:"${APP_PATH}/emps",
                data:"page="+page,
                type:"GET",
                success:function(result){
                    //console.log(result);
                    //1、解析并显示员工数据
                    build_emps_table(result);
                    //2、解析并显示分页信息
                    build_page_info(result);
                    //3、解析显示分页条数据
                    build_page_nav(result);
                }
            });
        }

        //构建表格数据
        function build_emps_table(result) {
            //清空table表格
            $("#checkAll").prop("checked",false);
            $("#tbody").html("");
            var emps = result.extend.pageInfo.list;
            $.each(emps, function (index, item) {
                var checkTd = $("<td><input type='checkbox' class='checkEmp' /> </td>")
                var empIdTd = $("<td></td>").append(item.empId);
                var empNameTd = $("<td></td>").append(item.empName);
                var genderTd = $("<td></td>").append(item.gender == 'M' ? '男': '女');
                var emailTd = $("<td></td>").append(item.email);
                var deptNameTd = $("<td></td>").append(item.department.deptName);
                var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                    .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
                //为编辑按钮添加属性存放员工id
                editBtn.attr("edit_id",item.empId);
                var deleteBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                    .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
                //为删除按钮添加属性存放员工id
                deleteBtn.attr("delete_id",item.empId);
                var Btn = $("<td></td>").append(editBtn).append(" ").append(deleteBtn);
                $("<tr></tr>")
                    .append(checkTd)
                    .append(empIdTd)
                    .append(empNameTd)
                    .append(genderTd)
                    .append(emailTd)
                    .append(deptNameTd)
                    .append(Btn)
                    .appendTo("#table_emps tbody");
            });
        }

        //解析显示分页信息
        function build_page_info(result){
            $("#page_info_area").empty();
            $("#page_info_area").append("当前"+result.extend.pageInfo.pageNum+"页,总"+
                result.extend.pageInfo.pages+"页,总"+
                result.extend.pageInfo.total+"条记录");
            totalRecord = result.extend.pageInfo.total;
            currentPage = result.extend.pageInfo.pageNum;
        }

        //解析显示分页条，点击分页要能去下一页....
        function build_page_nav(result){
            //page_nav_area
            $("#page_nav_area").empty();
            var ul = $("<ul></ul>").addClass("pagination");

            //构建元素
            var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
            var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
            if(result.extend.pageInfo.hasPreviousPage == false){
                firstPageLi.addClass("disabled");
                prePageLi.addClass("disabled");
            }else{
                //为元素添加点击翻页的事件
                firstPageLi.click(function(){
                    to_page(1);
                });
                prePageLi.click(function(){
                    to_page(result.extend.pageInfo.pageNum -1);
                });
            }
            var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
            var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
            if(result.extend.pageInfo.hasNextPage == false){
                nextPageLi.addClass("disabled");
                lastPageLi.addClass("disabled");
            }else{
                nextPageLi.click(function(){
                    to_page(result.extend.pageInfo.pageNum +1);
                });
                lastPageLi.click(function(){
                    to_page(result.extend.pageInfo.pages);
                });
            }


            //添加首页和前一页 的提示
            ul.append(firstPageLi).append(prePageLi);
            //1,2，3遍历给ul中添加页码提示
            $.each(result.extend.pageInfo.navigatepageNums,function(index,item){

                var numLi = $("<li></li>").append($("<a></a>").append(item));
                if(result.extend.pageInfo.pageNum == item){
                    numLi.addClass("active");
                }
                numLi.click(function(){
                    to_page(item);
                });
                ul.append(numLi);
            });
            //添加下一页和末页 的提示
            ul.append(nextPageLi).append(lastPageLi);

            //把ul加入到nav
            var navEle = $("<nav></nav>").append(ul);
            navEle.appendTo("#page_nav_area");
        }

    </script>

    <!-- 员工新增-->
    <script type="text/javascript">
        //重置表单数据和样式
        function reset_form(ele) {
            $(ele)[0].reset();
            //清空表单样式
            $(ele).find("*").removeClass("has-error has-success");
            $(ele).find(".help-block").text("");
        }
        //点击新增按钮
        $("#emp_add_modal_btn").click(function() {
            //清空表单数据
            reset_form("#empAddModal form");
            //发出ajax请求查询部门信息显示在下拉列表中
            getDepts("#emp_add_select");
            //弹出模态框
            $("#empAddModal").modal({
                backdrop:"static"
            });
        });
        //查出所有部门信息并显示在下拉列表中
        function getDepts(ele){
            //清空数据
            $(ele).empty();
            //发送ajax请求获取部门信息
            $.ajax({
                url:"${APP_PATH}/depts",
                type:"GET",
                success:function(result) {
                    //显示部门信息到下拉列表中
                    $.each(result.extend.depts,function(){
                        var optionEle = $("<option></option>").append(this.deptName).attr("value",this.deptId);
                        optionEle.appendTo(ele);
                    });
                }
            });
        }

        //校验添加员工信息数据
        function validate_add(){
            //1、拿到要校验的数据，使用正则表达式
            var empName = $("#emp_add_empName").val();
            var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
            if(!regName.test(empName)){
                //alert("用户名可以是2-5位中文或者6-16位英文和数字的组合");
                show_validate_msg("#emp_add_empName", "error", "用户名必须是2-5位中文或者6-16位英文和数字的组合(前端校验)");
                return false;
            }else{
                show_validate_msg("#emp_add_empName", "success", "");
            };

            //2、校验邮箱信息
            var email = $("#emp_add_email").val();
            var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
            if(!regEmail.test(email)){
                //alert("邮箱格式不正确");
                //应该清空这个元素之前的样式
                show_validate_msg("#emp_add_email", "error", "邮箱格式不正确(前端校验）");
                /* $("#email_add_input").parent().addClass("has-error");
                $("#email_add_input").next("span").text("邮箱格式不正确"); */
                return false;
            }else{
                show_validate_msg("#emp_add_email", "success", "");
            }
            return true;
        }

        //显示校验结果的提示信息
        function show_validate_msg(ele,status,msg){
            //清除当前元素的校验状态
            $(ele).parent().removeClass("has-success has-error");
            $(ele).next("span").text("");
            if("success"==status){
                $(ele).parent().addClass("has-success");
                $(ele).next("span").text(msg);
            }else if("error" == status){
                $(ele).parent().addClass("has-error");
                $(ele).next("span").text(msg);
            }
        }

        //校验用户名是否存在
        $("#emp_add_empName").change(function () {
            //发送ajax请求校验
            $.ajax({
                url:"${APP_PATH}/checkuser",
                data:"empName="+this.value,
                type:"POST",
                success:function (result) {
                    if(result.code==100) {
                        show_validate_msg("#emp_add_empName","success","用户名可用!");
                        $("#emp_add_save").attr("state","success");
                    }else {
                        show_validate_msg("#emp_add_empName","error",result.extend.va_msg+"(后端校验)");
                        $("#emp_add_save").attr("state","error");
                    }
                }
            })
        });

        //点击保存按钮
        $("#emp_add_save").click(function () {
            //提交请求之前进行格式校验
            if(!validate_add()){
                return false;
            }
            //提交之前进行用户名可用校验
            if($(this).attr("state")!="success"){
                return false;
            }
            //发送ajax请求插入员工信息
            $.ajax({
                url:"${APP_PATH}/emp",
                type:"POST",
                //将表单的数据转换为字符串
                data:$("#empAddModal form").serialize(),
                success:function (result) {
                    if(result.code==100) {//后端验证成功
                        //关闭模态框
                        $("#empAddModal").modal('hide');
                        //跳转最后一页，pageHelper可以把大于总页数的页码自动变成总页数
                        to_page(totalRecord);
                    }else {//后端验证失败
                        if(undefined != result.extend.errorFields.empName) {
                            show_validate_msg("#emp_add_empName","error",result.extend.errorFields.empName);
                        }
                        if(undefined != result.extend.errorFields.email) {
                            show_validate_msg("#emp_add_email","error",result.extend.errorFields.email);
                        }

                    }

                }
            })
        });



    </script>

    <!--员工修改-->
    <script type="text/javascript">
        //jQuery新版本中没有live方法，用on代替
        $(document).on("click",".edit_btn",function () {

            //查出部门信息显示在下拉列表中
            getDepts("#emp_update_select");
            //查出员工信息并显示出来
            getEmp($(this).attr("edit_id"));
            //将id传递给更新按钮
            $("#emp_update_save").attr("edit_id",$(this).attr("edit_id"));
            $("#empUpdateModal").modal({
                backdrop:"static"
            });
        });

        //查询员工信息并显示到修改模态框中
        function getEmp(id){
            $.ajax({
                url:"${APP_PATH}/emp/"+id,
                type:"GET",
                success:function (result) {
                    var empData = result.extend.emp;
                    $("#empName_update_static").text(empData.empName);
                    $("#emp_update_email").val(empData.email);
                    $("#empUpdateModal input[name=gender]").val([empData.gender]);
                    $("#empUpdateModal select").val([empData.dId]);
                }
            });
        }
        
        //点击更新按钮
        $("#emp_update_save").click(function () {
            //验证邮箱是否合法
            var email = $("#emp_update_email").val();
            var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
            if(!regEmail.test(email)){
                show_validate_msg("#emp_update_email", "error", "邮箱格式不正确");
                return false;
            }else{
                show_validate_msg("#emp_update_email", "success", "");
            }
            //发送ajax请求
            $.ajax({
                url:"${APP_PATH}/emp/"+$(this).attr("edit_id"),
                type:"PUT",
                data:$("#empUpdateModal form").serialize(),
                success:function(result) {
                    //关闭模态框
                    $("#empUpdateModal").modal("hide");
                    //跳到当前页
                    to_page(currentPage);
            }
            });
        })
    </script>

    <!--员工删除-->
    <script type="text/javascript">
        $(document).on("click",".delete_btn",function () {
            //获取empName数据
            var empName = $(this).parents("tr").find("td:eq(2)").text();
            //获取员工id
            var empId = $(this).attr("delete_id");
            //弹出确认删除对话框
            if(confirm("确认删除【"+empName+"】吗？")) {
                $.ajax({
                    url:"${APP_PATH}/emp/"+empId,
                    type:"DELETE",
                    success:function () {
                        to_page(currentPage);
                    }
                });
            }
        });
    </script>

    <!--批量删除-->
    <script type="text/javascript">
        //一键全选/取消
        $(document).on("click","#checkAll",function () {
            //操作dom原生属性用prop方法
            $(".checkEmp").prop("checked", $(this).prop("checked"));
        });

        //当复选框全被选中时全选按钮自动选中
        $(document).on("click",".checkEmp",function () {
            var flag = $(".checkEmp:checked").length==$(".checkEmp").length;
            $("#checkAll").prop("checked",flag);
        });

        //删除
        $("#deleteBatch").click(function () {
            var empNames = "";
            var empIds = "";
            if($(".checkEmp:checked").length == 0) {
                alert("请先勾选选择要删除的信息！");
                return;
            }
            $.each($(".checkEmp:checked"),function () {
                empNames += $(this).parents("tr").find("td:eq(2)").text() +",";
                empIds += $(this).parents("tr").find("td:eq(1)").text() + ",";
            });
            empNames = empNames.substring(0,empNames.length-1);
            empIds = empIds.substring(0,empIds.length-1);
            if(confirm("确认删除【"+empNames+"】吗？")){
                $.ajax({
                    url:"${APP_PATH}/emp/" + empIds,
                    type:"DELETE",
                    success:function () {
                        to_page(currentPage);
                    }
                });
            }
        })
    </script>
</body>
</html>
