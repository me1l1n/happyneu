<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="page page-dashboard clearfix" ng-controller="DashboardCtrl">
    <div>
        <table class="layui-hide" id="test9" lay-filter="test"></table>
    </div>
    <script type="text/html" id="barDemo">
        {{# if(d.status =='待接单' || d.status == '确认收货'){ }}
        <a class="layui-btn layui-btn-xs" lay-event="del">删除</a>
        {{# } }}
    </script>
    <script>
        layui.use(["jquery", "layer", "table", "layedit", "form", "laydate", "upload", "carousel"], function () {
            var $ = layui.jquery,
                layer = layui.layer,
                util = layui.util,
                upload = layui.upload,
                carousel = layui.carousel,
                layedit = layui.layedit,
                form = layui.form,
                table = layui.table;
            a()
            //页面一打开就执行弹层
            layer.ready(function(){
                if(location.href.indexOf("#reloaded")==-1){
                    location.href=location.href+"#reloaded";
                    location.reload();
                }
            });
            function a() {
                var data = getAjax("/order/getList")
                table.render({
                    elem: '#test9'
                    , data: data
                    , title: '用户数据表'
                    , cols: [[
                        {type: 'numbers', title: '序号'}
                        , {field: 'ms', title: '需求'}
                        , {field: 'type', title: '分类'}
                        , {field: 'money', title: '价格'}
                        , {field: 'status', title: '状态'}
                        , {field: 'date', title: '发布日期'}
                        , {field: 'date', title: '操作', width: 200, toolbar: '#barDemo'}

                    ]]
                    , page: true
                });
            }
            table.on('tool(test)', function (obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
                var data = obj.data //获得当前行数据
                    , layEvent = obj.event; //获得 lay-event 对应的值
                if (layEvent === "del") {
                    getAjax1(JSON.stringify(data), "/order/del")
                    layer.msg("删除成功")
                    a()
                }
            });
        })
    </script>
</div>