<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="page page-dashboard clearfix" ng-controller="DashboardCtrl">
    <div>
        <table class="layui-hide" id="test9" lay-filter="test"></table>
    </div>
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
                var data = getAjax("/opinion/getList")
                table.render({
                    elem: '#test9'
                    , data: data
                    , title: '用户数据表'
                    , cols: [[
                        {type: 'numbers', title: '序号'}
                        , {field: 'content', title: '反馈内容'}
                        , {field: 'contact', title: '联系方式'}
                        , {field: 'date', title: '更新日期'}

                    ]]
                    , page: true
                });
            }
        })
    </script>
</div>