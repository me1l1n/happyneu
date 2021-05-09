<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="site-nav clearfix" role="navigation" collapse-nav-accordion highlight-active>
	<div class="nav-title panel-heading"><i>功能列表</i></div>
	<ul class="list-unstyled nav-list">
		<li>
			<a href="#/home">
				<i class="fa fa-desktop icon"></i>
				<span class="text">首页</span>
			</a>
		</li>
		<li>
			<a href="#/order">
				<i class="fa fa-reorder icon"></i>
				<span class="text">订单管理</span>
			</a>
		</li>
<%--		<li>--%>
<%--			<a href="#/leave1">--%>
<%--				<i class="fa fa-money icon"></i>--%>
<%--				<span class="text">提现管理</span>--%>
<%--			</a>--%>
<%--		</li>--%>
		<li>
			<a href="#/advertising">
				<i class="fa fa-buysellads icon"></i>
				<span class="text">广告管理</span>
			</a>
		</li>
		<li>
			<a href="#/leave">
				<i class="fa fa-leanpub icon"></i>
				<span class="text">公告管理</span>
			</a>
		</li>
		<li>
			<a href="#/opinion">
				<i class="fa fa-gavel icon"></i>
				<span class="text">反馈管理</span>
			</a>
		</li>
		<li>
			<a href="#/problem">
				<i class="fa fa-undo icon"></i>
				<span class="text">常见问题管理</span>
			</a>
		</li>
	</ul>
</nav>


<!-- theme settings -->
<div class="theme-settings clearfix" style="position: fixed;
    bottom: 0px;">
	<div class="panel-heading"><i>颜色切换</i></div>
	<ul class="list-unstyled clearfix">
		<li ng-class="{active: theme-zero}" ng-model="themeModel" btn-radio="'theme-zero'" ng-change="onThemeChange(themeModel)">
			<a href="javascript:;">
				<span class="side-top"></span>
				<span class="header"></span>
				<span class="side-rest"></span>
			</a>
		</li>

		<li ng-class="{active: theme-one}" ng-model="themeModel" btn-radio="'theme-one'" ng-change="onThemeChange(themeModel)">
			<a href="javascript:;">
				<span class="side-top"></span>
				<span class="header"></span>
				<span class="side-rest"></span>
			</a>
		</li>

		<li ng-class="{active: theme-two}" ng-model="themeModel" btn-radio="'theme-two'" ng-change="onThemeChange(themeModel)">
			<a href="javascript:;">
				<span class="side-top"></span>
				<span class="header"></span>
				<span class="side-rest"></span>
			</a>
		</li>

		<li ng-class="{active: theme-three}" ng-model="themeModel" btn-radio="'theme-three'" ng-change="onThemeChange(themeModel)">
			<a href="javascript:;">
				<span class="side-top"></span>
				<span class="header"></span>
				<span class="side-rest"></span>
			</a>
		</li>

		<li ng-class="{active: theme-four}" ng-model="themeModel" btn-radio="'theme-four'" ng-change="onThemeChange(themeModel)">
			<a href="javascript:;">
				<span class="side-top"></span>
				<span class="header"></span>
				<span class="side-rest"></span>
			</a>
		</li>
	</ul>
</div>
<!-- #end theme settings -->
<script>
	if('${admin}' == ''){
		window.location.href="/adminLogin.jsp"
	}
</script>