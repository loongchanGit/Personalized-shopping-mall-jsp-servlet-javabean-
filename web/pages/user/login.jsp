<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录</title>
	<%@ include file="/pages/common/head.jsp"%>
	<link type="text/css" rel="stylesheet" href="static/css/style.css" >
<script type="text/javascript">
	// 页面加载完成之后
	$(function(){
		$("#code_img").click(function () {//验证码单击刷新
			this.src=this.src;//重新获取验证码图片
		})

		// 给注册按钮添加事件
		$("#sub_btn").click(function(){
			// 获取用户名
			var usernameValue = $("#username").val();
			// 验证用户名是否合法,规则如下：必须由字母，数字，下划线组成，并且长度为5到15位。
			var usernameReg = /^\w{5,15}$/;
			// 验证用户信息
			if (!usernameReg.test(usernameValue)) {
				// 提示用户
				$("span.errorMsg").text("用户名不合法！");
				return false;
			}
			
			// 获取密码
			var passwordValue = $("#password").val();
			// 验证密码是否合法,规则如下：必须由字母，数字，下划线组成，并且长度为5到15位。
			var passwordReg = /^\w{5,15}$/;
			// 验证用户信息
			if (!passwordReg.test(passwordValue)) {
				// 提示用户
				$("span.errorMsg").text("密码不合法！");
				return false;
			}
			
			// 阻止表单提交
			return true;
		});
		
	});



</script>
</head>
<body>
		<div id="login_header">
			<img class="logo_img" alt="" src="static/img/logo.gif" >
		</div>
			<div class="login_banner">
				<div id="l_content">
					<span class="login_word">欢迎登录</span>
				</div>
				<div id="content">
					<div class="login_form">
						<div class="login_box">
							<div class="tit">
								<h1>钉子网登录</h1>
								<a href="pages/user/regist.jsp">立即注册</a>
							</div>
							<div class="msg_cont">
								<b></b>
								<span class="errorMsg">
									${empty requestScope.msg ?"请输入用户名和密码":requestScope.msg}
								</span>
							</div>
							<div class="form">
								<form action="userServlet" method="post">
									<input type="hidden" name="action" value="login">
									<label>用户名称：</label>
									<input class="itxt" type="text" placeholder="请输入用户名" autocomplete="off" 
										tabindex="1" name="username" id="username" value="${empty requestScope.username ?"":requestScope.username}"/>
									<br />
									<br />
									<label>用户密码：</label>
									<input class="itxt" type="password" placeholder="请输入密码" autocomplete="off" 
									 	tabindex="1" name="password" id="password" value="${empty requestScope.password ?"":requestScope.password}"/>
									<br />
									<br />
									<label>验证码：</label>
									<input class="itxt" type="text" placeholder="请输入验证码" name="code" style="width: 150px;" id="code"/>
									<img id="code_img" src="kaptch.jpg" width="100" height="40" id="CodeImg" style="float: right;margin-right: 30px;">
									<br />
									<br />
									<input type="submit" value="登录" id="sub_btn" />
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		<%@include file="/pages/common/footer.jsp"%>
</body>
</html>