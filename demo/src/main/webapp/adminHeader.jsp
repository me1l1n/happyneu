<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="nav-head">
	<!-- Site logo -->
	<a href="/" class="site-logo">后台管理系统</a>
	<span class="nav-trigger fa" 
		ng-class="{'fa-navicon': isMobile, 'fa-outdent': !isMobile}" 
		toggle-nav-min toggle-off-canvas>
	</span>
</div>


<div class="head-wrap clearfix">
	<!-- navbar right -->
	<ul class="list-unstyled navbar-right">
		<li class="dropdown" dropdown>
			<a href class="user-profile dropdown-toggle" dropdown-toggle>
				<img src="images/admin.jpg" alt="admin-pic">
			</a>
			<!-- Profile drop -->
			<div class="panel panel-default dropdown-menu">
				<div class="panel-body">
					<figure class="photo left">
						<img src="images/admin.jpg" alt="admin-pic">
						<a href="j:;">${admin.username}</a>
					</figure>
					<div class="profile-info">
						<p class="user-name">&nbsp;&nbsp;${admin.username}</p>
					</div>
				</div>
				<div class="panel-footer clearfix">
					<a href="/adminLogin.jsp" class="btn btn-info btn-sm right">退出</a>
				</div>
			</div>
		</li>
		<!-- #end profile-drop -->
	</ul>
</div>


