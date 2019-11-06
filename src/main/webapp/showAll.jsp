<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <!--引入BootStrap的css样式-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css">
    <!--BootStrap与JQGRID整合后的css样式-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/boot-jqgrid/css/trirand/ui.jqgrid-bootstrap.css">
    <!--引入jquery的js文件-->
    <script src="${pageContext.request.contextPath}/bootstrap/js/jquery-3.3.1.min.js"></script>
    <!--引入BootStrap的js文件-->
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>

    <!--jqgrid与bootstrap整合的国际化的js文件-->
    <script src="${pageContext.request.contextPath}/boot-jqgrid/js/trirand/i18n/grid.locale-cn.js"></script>
    <!--jqgrid与bootstrap整合的js文件-->
    <script src="${pageContext.request.contextPath}/boot-jqgrid/js/trirand/jquery.jqGrid.min.js"></script>
    <script>
        $(function () {
            $("#table").jqGrid({
                styleUI:"Bootstrap",
                url:"${pageContext.request.contextPath}/user/showAll",
                datatype:"json",
                autowidth:true,
                caption:"用户列表",
                pager:"#pager",
                rowNum:"3",
                rowList:["3","6","9","12"],
                viewrecords:true,
                editurl:"${pageContext.request.contextPath}/user/edit",
                colNames:["用户id","用户名","密码","电话","邮箱","用户来源","ip地址","状态","操作"],
                colModel:[
                    {name:"id"},
                    {name:"username",editable:true},
                    {name:"password",editable:true},
                    {name:"phone",editable:true},
                    {name:"email",editable:true},
                    {name:"source",editable:true},
                    {name:"ip",editable:true},
                    {name:"state"},
                    {name:"sdsdsdsdsds",formatter:function(cellvalue, options, rowObject){
                            return "<a onclick=\"update('"+rowObject.id+"')\" class='btn btn-danger'>修改</a>&nbsp;<a onclick=\"del('"+rowObject.id+"')\" class='btn btn-success'>删除</a>"
                        }}
                ]
            }).jqGrid("navGrid","#pager",{edit:true});

            $("#add").click(function () {
                $("#table").jqGrid('editGridRow','new',{
                    height:300,
                    reloadAfterSubmit:true

                });
            });
            $("#update").click(function () {
                var gr = $("#table").jqGrid('getGridParam', 'selrow');
                if (gr != null)
                //调用修改的方法
                    $("#table").jqGrid('editGridRow', gr, {
                        height : 300,
                        reloadAfterSubmit : true
                    });
                else
                    alert("请选中一行");
            });
            $("#del").click(function() {
            //改行的ID
                var gr = $("#table").jqGrid('getGridParam', 'selrow');
                if (gr != null)
                    $("#table").jqGrid('delGridRow', gr, {
                        reloadAfterSubmit : true
                    });
                else
                    alert("请选中一行");
            });
        })
        function update(a) {
            //调用修改的方法
            $("#table").jqGrid('editGridRow', a, {
                height : 300,
                reloadAfterSubmit : true})

        };
        function del(a) {
            $("#table").jqGrid('delGridRow', a, {
                reloadAfterSubmit : true
            });
        };
    </script>
</head>
<body>
<table id="table"></table>
<div id="pager"></div>
<button id="add" class="btn btn-danger">添加</button>
<button id="update" class="btn btn-info">修改</button>
<button id="del" class="btn btn-info">删除</button>
</body>
</html>
