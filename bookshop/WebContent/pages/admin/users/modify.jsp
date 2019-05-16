<%@page import="cn.edu.nsu.bookshop.db.last.roles.Roles"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cn.edu.nsu.bookshop.db.last.roles.RolesDAO"%>
<%@page import="cn.edu.nsu.bookshop.db.last.users.Users"%>
<%@page import="cn.edu.nsu.bookshop.db.last.users.UsersDAO"%>
<%@page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>修改人员-网上书店</title>
<meta charset="utf-8">
<!--全局CSS-->
<link rel="stylesheet" type="text/css" href="/bookshop/css/admin/share/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/bookshop/css/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="/bookshop/css/admin/share/myStyle.css">
<!--私有CSS-->
<link href="/bookshop/plugins/datetimePicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">

</head>
<body>
    <!-- 页面顶部导航条 -->
	<div class="row panel titlePanel">
		<div class="col-md-12">
			<div class="col-md-3">
				<h3>
					<i class="fa fa-dashboard"></i> 人员管理
				</h3>
			</div>
			<div class="col-md-6">
				<div style="text-align: center;"></div>
			</div>
			<div class="col-md-3">
				<ul class="functionTip app-breadcrumb breadcrumb">
					<li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
					<li class="breadcrumb-item"><a href="">人员管理 / 修改</a></li>
				</ul>
			</div>
		</div>
	</div>
    <!-- 页面内容体 -->
    
	<div class="row">
	   <div class="col-md-12">
		  <form  action="/bookshop/pages/admin/shares/success.html">
			  			<div class="panel-group" id="accordion">
				
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title" style="text-align:left;">
							<a data-toggle="collapse" data-parent="#accordion" 
							   href="#collapse1">
								<i class="fa fa-hand-o-right" aria-hidden="true"></i>基本信息
							</a>
						</h4>
					</div>
					<div id="collapse1" class="panel-collapse collapse in">
						<div class="panel-body">
			              	<div class="col-md-12 row">
			              	<%
			              		// 从user表中查询修改的用户
			              		String users_idStr = request.getParameter("users_id");
			              		int users_id = Integer.parseInt(users_idStr);
			              		UsersDAO usersDAO = new UsersDAO();
			              		Users user = usersDAO.getById(users_id);
								// 显示要修改的用户
								
			              	%>
			              	
			              	
			              	
								<div class="form-group col-md-6 form-inline" >
								  <label class="control-label-required">姓名</label>
								  <input class="form-control" type="text" name="user_name" value="<%=user.getUsers_name() %>" placeholder="请输入人员的姓名">
								</div>
								
								<div class="form-group col-md-6 form-inline" >
								  <label class="control-label-required">性别</label>
								  <select class="form-control" name="roles_id">
								       <option>男</option>
								       <option>女</option>
								  </select>			
								</div>
								
								<div class="form-group col-md-6 form-inline" >
								  <label class="control-label-required">职务</label>
								  <select class="form-control">
								  <%
								  RolesDAO rolesDAO = new RolesDAO();
								  ArrayList<Roles> roles = rolesDAO.getAll();
								  for(int i = 0; i < roles.size(); i++){
									  Roles role = roles.get(i);
									  %>
									  <option value="<%=role.getRoles_id() %>" <%=(user.getRoles_id()==role.getRoles_id())?"selected":"" %>><%=role.getRoles_name() %></option>
									  <% 
								  }
								  %>
								  
								  </select>			
								</div>
								
								<div class="form-group col-md-6 form-inline" >
								  <label class="control-label-required">身份<br>证号</label>
								  <input class="form-control" type="text" name="users_idNum" value="<%=user.getUsers_idNum() %>" placeholder="请输入人员的省份证号码">
								</div>
								
								<div class="form-group col-md-6 form-inline" >
								  <label class="control-label-required">手机</label>
								  <input class="form-control" type="text" name="users_mobile" value="<%=user.getUsers_mobile() %>" placeholder="请输入人员的手机号码">
								</div>
								
								<div class="form-group col-md-6 form-inline" >
									<label class="control-label-required">地址</label>
									<textarea class="form-control" rows="4" cols="40" name="users_address" placeholder="请输入人员的地址"><%=user.getUsers_address() %></textarea>
								</div>
								
								<div class="form-group col-md-6 form-inline" >
								  <label class="control-label-required">邮编</label>
								  <input class="form-control" type="text" name="users_postcode" value="<%=user.getUsers_postcode() %>" placeholder="请输入人员的邮政编码">
								</div>
								
								<div class="form-group col-md-6 form-inline" >
								  <label class="control-label-norequired">头像</label>
								  <input class="form-control" type="file">
								</div>
						   </div>
              
						</div>
						
					</div>
				</div>				
				
				
			
			   <div class="panel panel-default">
					<div class="panel-footer" style="text-align: center;">
							 <button type="button" class="btn btn-primary" onclick="navTo('/bookshop/pages/admin/users/list.html')"><i class="fa fa-fw fa-lg fa-times-circle"></i>返回</button>
							 <button type="submit" class="btn btn-warning"><i class="fa fa-fw fa-lg fa-check-circle"></i>提交</button> 
				    </div>
				</div>
			
			
			</div>
		  </form>
	    </div>
		
	</div>

	<!--全局JS -->
	<script src="/bookshop/js/admin/share/jquery-3.2.1.min.js"></script>
	<script src="/bookshop/js/admin/share/bootstrap.min.js"></script> 
	<script src="/bookshop/js/admin/share/share.js"></script>
	<!--私有JS-->
	<script src="/bookshop/js/admin/share/cityDrop.js"></script>

</body>