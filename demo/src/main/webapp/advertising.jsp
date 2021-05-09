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
                var data = getAjax("/advertising/getList")
                console.log(data)
                table.render({
                    elem: '#test9'
                    , data: data
                    , id: 'test1'
                    , title: '用户数据表'
                    , cols: [[
                        {type: 'numbers', title: '序号'}
                        , {field: 'ms', title: '标题'}
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
                        area: ['500px', '500px'],
                        btn: ["OK", "cancel"],
                        content: '                <form action="" style="margin: 10px 10px"  class="layui-form">' +
                            '                    <div class="layui-form-item">' +
                            '                        <label class="layui-form-label">标题</label>' +
                            '                        <div class="layui-input-block">' +
                            '                            <input type="text" name="ms" value="'+data.ms+'" required lay-verify="required" maxlength="20" placeholder="请输入..." autocomplete="off" class="layui-input">' +
                            '                        </div>' +
                            '                    </div>' +
                            // '                    <div class="layui-form-item">' +
                            // '                        <label class="layui-form-label">广告地址</label>' +
                            // '                        <div class="layui-input-block">' +
                            // '                            <input type="text" name="url" value="'+data.url+'" required lay-verify="required|url" placeholder="请输入..." autocomplete="off" class="layui-input">' +
                            // '                        </div>' +
                            // '                    </div>' +
                            '                    <div class="layui-form-item">' +
                            '                        <label class="layui-form-label">上传图片</label>' +
                            '                        <div class="layui-input-block">' +
                            '<div class="layui-upload">\n' +
                            '  <button type="button" class="layui-btn" id="test1">上传图片</button>\n' +
                            '  <div class="layui-upload-list">\n' +
                            '    <img style="    width: 100px;height: 100px;" src="'+ data.path+'" class="layui-upload-img" id="demo1">\n' +
                            '    <p id="demoText"></p>\n' +
                            '  </div>\n' +
                            '</div> ' +
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
                        da.field["path"]=$("#demo1").attr("src")
                        getAjax1(JSON.stringify(da.field), "/advertising/save")
                        layer.msg("修改成功")
                        layer.closeAll()
                        a()
                        return false;
                    })
                    //普通图片上传
                    var uploadInst = upload.render({
                        elem: '#test1'
                        ,url: '/advertising/upload' //改成您自己的上传接口
                        ,before: function(obj){
                            //预读本地文件示例，不支持ie8
                            obj.preview(function(index, file, result){
                                // $('#demo1').attr('src', result); //图片链接（base64）
                            });
                        }
                        ,done: function(res){
                            //如果上传失败
                            if(res.code > 0){
                                return layer.msg('上传失败');
                            }else {
                                $('#demo1').attr('src', res.data.src);
                            }
                            //上传成功
                        }
                        ,error: function(){
                            //演示失败状态，并实现重传
                            var demoText = $('#demoText');
                            demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                            demoText.find('.demo-reload').on('click', function(){
                                uploadInst.upload();
                            });
                        }
                    });
                } else if (layEvent === "del") {
                    getAjax1(JSON.stringify(data), "/advertising/del")
                    layer.msg("删除成功")
                    a()
                }
            });


            $("#add").on("click", function () {
                layer.open({
                    type: 1,
                    title: "新增",
                    shade: [0.8, '#393D49'],
                    area: ['500px', '500px'],
                    btn: ["OK", "cancel"],
                    content: '                <form action="" style="margin: 10px 10px"  class="layui-form">' +
                        '                    <div class="layui-form-item">' +
                        '                        <label class="layui-form-label">标题</label>' +
                        '                        <div class="layui-input-block">' +
                        '                            <input type="text" name="ms"  required lay-verify="required" maxlength="20" placeholder="请输入..." autocomplete="off" class="layui-input">' +
                        '                        </div>' +
                        '                    </div>' +
                        // '                    <div class="layui-form-item">' +
                        // '                        <label class="layui-form-label">广告地址</label>' +
                        // '                        <div class="layui-input-block">' +
                        // '                            <input type="text" name="url" required lay-verify="required|url" placeholder="请输入..." autocomplete="off" class="layui-input">' +
                        // '                        </div>' +
                        // '                    </div>' +
                        '                    <div class="layui-form-item">' +
                        '                        <label class="layui-form-label">上传图片</label>' +
                        '                        <div class="layui-input-block">' +
                        '<div class="layui-upload">\n' +
                        '  <button type="button" class="layui-btn" id="test1">上传图片</button>\n' +
                        '  <div class="layui-upload-list">\n' +
                        '    <img style="    width: 100px;height: 100px;" class="layui-upload-img" id="demo1">\n' +
                        '    <p id="demoText"></p>\n' +
                        '  </div>\n' +
                        '</div> ' +
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
                    if(typeof ($("#demo1").attr("src")) == 'undefined'){
                        layer.msg("请上传图片")
                        return false;
                    }
                    data.field["path"] = $("#demo1").attr("src")
                    getAjax1(JSON.stringify(data.field), "/advertising/save")
                    layer.msg("保存成功")
                    layer.closeAll()
                    a()
                    return false;
                })

                //普通图片上传
                var uploadInst = upload.render({
                    elem: '#test1'
                    ,url: '/advertising/upload' //改成您自己的上传接口
                    ,before: function(obj){
                        //预读本地文件示例，不支持ie8
                        obj.preview(function(index, file, result){
                            // $('#demo1').attr('src', result); //图片链接（base64）
                        });
                    }
                    ,done: function(res){
                        //如果上传失败
                        if(res.code > 0){
                            return layer.msg('上传失败');
                        }else {
                            console.log(res)
                            $('#demo1').attr('src', res.data.src);
                        }
                        //上传成功
                    }
                    ,error: function(){
                        //演示失败状态，并实现重传
                        var demoText = $('#demoText');
                        demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                        demoText.find('.demo-reload').on('click', function(){
                            uploadInst.upload();
                        });
                    }
                });
            })
        })
    </script>
</div>