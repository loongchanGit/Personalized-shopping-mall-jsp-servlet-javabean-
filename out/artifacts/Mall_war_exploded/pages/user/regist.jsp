<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注册</title>
	<%@ include file="/pages/common/head.jsp"%>
	<link type="text/css" rel="stylesheet" href="static/css/style.css" >
<script type="text/javascript">

	// 页面加载完成之后
	$(function(){

		$("#code_img").click(function () {//验证码单击刷新
			this.src=this.src;//重写获取验证码图片
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
			
			// 获取确认密码
			var repwdValue = $("#repwd").val();
			// 验证确认密码和密码一致
			if (passwordValue != repwdValue) {
				// 提示用户
				$("span.errorMsg").text("确认密码和密码不一致！");
				return false;
			}

			
			
			// 获取验证码信息
			var codeValue = $("#code").val();
			// 验证验证码不为空！
			if (codeValue == "") {
				$("span.errorMsg").text("验证码不能为空！")
				return false;
			}
	
			return true;
		});
		
	});

</script>
<style type="text/css">
	.login_form{
		height:450px;
		margin-top: 25px;
	}
</style>
</head>
<body>
		<div id="login_header">
			<img class="logo_img" alt="" src="static/img/logo.gif" >
		</div>
			<div class="login_banner">
				<div id="l_content">
					<span class="login_word">欢迎注册</span>
				</div>
				<div id="content">
					<div class="login_form">
						<div class="login_box">
							<div class="tit">
								<h1>注册</h1>
								<a href="pages/user/login.jsp">返回</a>
								<a href="pages/index.jsp">返回主页</a>
							</div>
							<div class="msg_cont">
								<b></b>
								<span class="errorMsg">
								${empty requestScope.msg ?"请输入注册信息":requestScope.msg}
								</span>
							</div>
							<div class="form">
								<form action="userServlet" method="post">
									<input type="hidden" name="action" value="regist">
									<label>用户名称：</label>
									<input class="itxt" type="text" placeholder="请输入用户名" autocomplete="off" tabindex="1" name="username" id="username" value="${empty requestScope.username ?"":requestScope.username}"/>
									<br />
									<br />
									<label>用户密码：</label>
									<input class="itxt" type="password" placeholder="请输入密码" autocomplete="off" tabindex="1" name="password" id="password" value="${empty requestScope.password ?"":requestScope.password}"/>
									<br />
									<br />
									<label>确认密码：</label>
									<input class="itxt" type="password" placeholder="确认密码" autocomplete="off" tabindex="1" name="repwd" id="repwd" value="${empty requestScope.password ?"":requestScope.password}"/>
									<br />
									<br />
									<label>电话号码：</label>
									<input class="itxt" type="text" placeholder="请输入电话号码" autocomplete="off" tabindex="1" name="telephone" id="telephone" value="${empty requestScope.telephone ?"":requestScope.telephone}"/>
									<br />
									<br />
									<label>电子邮箱：</label>
									<input class="itxt" type="text" placeholder="请输入邮箱地址" name="email"  id="email"/>
									<br />
									<br />
									<input type="submit" value="注册" id="sub_btn" />
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		<%@include file="/pages/common/footer.jsp"%>
</body>
</html>