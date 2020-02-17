<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login -MovieCritic</title>
<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
<style>

#login_box{
	border : 1px solid lightgray;
	width: 300px;
	height: 300px;
	margin: 200px auto;
}

h3, p{
	text-align:center;
}

p {
	background: darkblue;
	color: white;
	width: 250px;
	margin: 0 auto;
}

#or{
	text-align:center;
	margin: 5px 0 5px;
}

#id_box, #pw_box{
	margin-left: 25px;
	margin-top: 5px;
	
}

.login{
	width: 250px;
	height: 25px;
	border-radius: 5px;
	border : 1px solid gray;
}

#forgot{
	text-align:center;
	margin-top:10px;
}

#login_btn{
	text-align:center;
	background:black;
	color:white;
	width:270px;
	height:30px;
	margin: 13px 15px;
	padding-top: 3px;
}

#foot{
	text-align:center;
	font-size:12px;
}

</style>
</head>

<body>

<!-- 절대경로 -->
<c:set var="rootPath" value="${pageContext.request.contextPath}"/>

<div id="site_layout">

	<!--movieCri-->
	<!-- 상단 메뉴-->

   <div id="top_menu_wrapper">
	<div id="top_menu">

		<nav id="top_menu1">
		<ul id="left_menu">
		
		<li class="left_menu">		
		<a href="#"><img src="/resources/image/logo.webp" alt="OpenCritic"></a>
		</li>
		<li class="left_menu">
			<a href="#" class="top_text1">Genre</a>
				
				<ul id="genre_sub">
					<li class="left_inner_menu"><a href="# "class="top_text3">Action</a></li>
					<li class="left_inner_menu"><a href="#" class="top_text3">Comedy</a></li>
					<li class="left_inner_menu"><a href="#" class="top_text3">Drama</a></li>
				</ul>
				
		</li>
		<li class="left_menu">
			<a href="#" class="top_text1">Release Schedule</a>
		</li>
		</ul>
		</nav>
		<nav id="top_menu2">
			
			<div id="form" class="right_menu">
	
				<form action="login.jsp" method="post" class="right_menu">

					<input type="text" placeholder="Search" class="top_text2" id="search">

				</form>			
			</div>
		
					<!-- 로그인 안됐을 경우 , 로그인, 회원가입 버튼 보여줌-->
		<c:if test="${sessionScope.sessionID==null}">		
			<div id="login" class="right_menu">
				<a href="${rootPath}/member/login.do" class="top_text2">Login</a>
			</div>
			<div id="sign_up" class="right_menu">
				<a href="${rootPath}/member/sign_up.do" class="top_text2">Sign Up</a>
			</div>
		</c:if>
		
		<!-- 로그인 됐을 경우 , 로그아웃, 마이페이지 버튼 보여줌 -->
		<c:if test="${sessionScope.sessionID!=null}">
			<div class="right_menu">
					<a href="${rootPath}/member/my_page.do">
						<img src="/resources/image/toMyPage.png"
						width="30px" height="30px">
					</a>
			</div>
			<div id="logout" class="right_menu">
					<a href="${rootPath}/member/logout.do" class="top_text2">Log Out</a>
			</div>
		<!-- 관리자 로그인 -->
			<c:if test="${sessionScope.sessionID=='admin'}">
			<div id="admin_write" class="right_menu">
					<a href="#" class="top_text2">Write</a>
				</div>
			</c:if>
		</c:if>	
		</nav>

	</div>
   </div>
	<!-- 상단 메뉴 끝-->

<section id="login_box">
	<h3> LOG IN TO OPENCRITIC </h3>
	<p>Continue with Facebook</p>
	<div id="or"><span>or</span></div>
	
	<form action="${rootPath}/member/loginProc" method="post">
		
		<div id="id_box">
			<input type="text" placeholder=" ID" class="login" name="memberId">
		</div>
		<div id="pw_box">
			<input type="password" placeholder=" Password" class="login" name="memberPw">
		</div>

		<div id="forgot"><a>Forgot Password?</a></div>

		<article>
			 <input type="submit" id="login_btn" value="Log In"/> 
		</article>
		<div id="foot"><span>Not a member?</span><a href="${rootPath}/member/sign_up" style=text-decoration:none;>Create an account</a></div>
	
	</form>
</section>

</div>

</body>
</html>