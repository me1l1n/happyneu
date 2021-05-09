<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="page page-dashboard clearfix" ng-controller="DashboardCtrl">
    <div>
        <div><button class="layui-btn" id="add">新增</button></div>
        <table class="layui-hide" id="test9" lay-filter="test"></table>
    </div>
    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-xs" lay-event="upl">修改</a>
        <a class="layui-btn layui-btn-xs" lay-event="del">删除</a>
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
                var data = getAjax("/leave/getList")
                table.render({
                    elem: '#test9'
                    , data: data
                    , title: '用户数据表'
                    , cols: [[
                        {type: 'numbers', title: '序号'}
                        , {field: 'comment', title: '公告内容'}
                        , {field: 'date', title: '更新日期'}
                        , {field: 'date', title: '操作', width: 200, toolbar: '#barDemo'}

                    ]]
                    , page: true
                });
            }
            table.on('tool(test)', function (obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
                var data = obj.data //获得当前行数据
                    , layEvent = obj.event; //获得 lay-event 对应的值
                if (layEvent === "upl") {
                    layer.open({
                        type: 1,
                        title: "修改",
                        shade: [0.8, '#393D49'],
                        area: ['500px', '300px'],
                        btn: ["OK", "cancel"],
                        content: '                <form action="" style="margin: 10px 10px"  class="layui-form">' +
                            '                    <div class="layui-form-item">' +
                            '                        <label class="layui-form-label">公告内容</label>' +
                            '                        <div class="layui-input-block">' +
                            '    <textarea name="comment" class="layui-textarea" lay-verify="required">'+data.comment+'</textarea>' +
                            '                        </div>' +
                            '                    </div>' +
                            '                </form>' //这里content是一个普通的String
                        , btn1: function () {

                        }, success: function (layero, index) {
                            layero.addClass("layui-form");
                            layero.find(".layui-layer-btn0").attr("lay-filter", "formVerify").attr("lay-submit", "")
                            form.render()
                        }

                    });
                    form.render()
                    form.on("submit(formVerify)", function (da) {
                        da.field["id"]=data.id
                        getAjax1(JSON.stringify(da.field), "/leave/save")
                        layer.msg("修改成功")
                        layer.closeAll()
                        a()
                        return false;
                    })
                } else if (layEvent === "del") {
                    getAjax1(JSON.stringify(data), "/leave/del")
                    layer.msg("删除成功")
                    a()
                }
            });


            $("#add").on("click", function () {
                layer.open({
                    type: 1,
                    title: "新增",
                    shade: [0.8, '#393D49'],
                    area: ['500px', '300px'],
                    btn: ["OK", "cancel"],
                    content: '                <form action="" style="margin: 10px 10px"  class="layui-form">' +
                        '                    <div class="layui-form-item">' +
                        '                        <label class="layui-form-label">公告内容</label>' +
                        '                        <div class="layui-input-block">' +
                        '    <textarea name="comment" class="layui-textarea" lay-verify="required"></textarea>' +
                        '                        </div>' +
                        '                    </div>' +
                        '                </form>' //这里content是一个普通的String
                    , btn1: function () {

                    }, success: function (layero, index) {
                        layero.addClass("layui-form");
                        layero.find(".layui-layer-btn0").attr("lay-filter", "formVerify").attr("lay-submit", "")
                        form.render()
                    }

                });
                form.render()
                form.on("submit(formVerify)", function (data) {
                    getAjax1(JSON.stringify(data.field), "/leave/save")
                    layer.msg("保存成功")
                    layer.closeAll()
                    a()
                    return false;
                })
            })
        })
    </script>
</div>