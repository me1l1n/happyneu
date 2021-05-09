<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="description" content="Appboard - Admin Template with Angularjs">
    <meta name="keywords" content="appboard, webapp, admin, dashboard, template, ui">
    <meta name="author" content="solutionportal">
    <!-- <base href="/"> -->

    <title>后台管理系统</title>
    <%@include file="h-head.jsp"%>
</head>

<body ng-app="app" id="app" class="app {{themeActive}}" custom-page ng-controller="AppCtrl">
    <header class="site-head clearfix" id="site-head" ng-controller="HeadCtrl" ng-include=" '/adminHeader.jsp' ">
        <!-- linked header (static) view -->
    </header>


    <div class="main-container clearfix">
        <aside class="nav-wrap" id="site-nav" ng-controller="NavCtrl" ng-include=" '/adminNav.jsp' " custom-scrollbar>

        </aside>

        <div class="content-container" id="content" ng-view>
            <!-- content using routing -->
        </div>

        <footer id="site-foot" class="site-foot clearfix">
            <p class="left">&copy; Copyright 2020 后台管理系统</p>
            <p class="right">v1.0</p>
        </footer>

    </div>

    <!-- !End -->
</body>

</html>