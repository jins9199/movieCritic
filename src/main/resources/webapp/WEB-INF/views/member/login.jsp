<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta id="_csrf" name="_csrf" content="${_csrf.token}" /> 
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />

<title>Login -MovieCritic</title>
<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
<script src="/resources/css/common.js"></script>
<script src="/resources/jquery/jquery-3.4.1.min.js"></script>
<style>

#login_box{
	border : 1px solid lightgray;
	max-width: 270px;
	max-height: 50%;
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
	margin: 12px;
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
	width:250px;
	height:30px;
	margin: 13px 10px;
	padding-top: 3px;
}

#foot{
	text-align:center;
	font-size:12px;
	padding:8px;
}

</style>
</head>

<body>

<!-- 절대경로 -->
<c:set var="rootPath" value="${pageContext.request.contextPath}"/>

<div id="site_layout">

<!-- 상단 메뉴-->

   <div id="top_menu_wrapper">
	<div id="top_menu">

		<nav id="top_menu1">
		<ul id="left_menu">
		
			<li class="left_menu">		
		<a href="/"><img src="/resources/image/logo.jpg" alt="MovieCritic"></a>
		</li>
		<li class="left_menu">
			<a href="${rootPath}/movie_list" class="top_text1">Browse Movies</a>
				
				<ul id="genre_sub">			<!-- select 기준 적용된 페이지 호출.. -->
					<li class="left_inner_menu"><a href="/movie_list?genre=Action" class="top_text3">Action</a></li>
					<li class="left_inner_menu"><a href="/movie_list?genre=Drama" class="top_text3">Drama</a></li>
					<li class="left_inner_menu"><a href="/movie_list?genre=Fantasy" class="top_text3">Fantasy</a></li>
				</ul>
				
		</li>
		</ul>
		</nav>
		<nav id="top_menu2">
			
			<div id="form" class="right_menu">
	
					
					<input type="text" placeholder="Search" class="top_text2" id="search" autocomplete="off">
					<div id="searchResultsListDiv" onerror="this.style.visibility='hidden'"></div>
			
			</div>
		
					<!-- 로그인 안됐을 경우 , 로그인, 회원가입 버튼 보여줌-->
		<sec:authorize access="!isAuthenticated()">
			<div id="login" class="right_menu">
				<a href="${rootPath}/member/login" class="top_text2">Login</a>
			</div>
			<div id="sign_up" class="right_menu">
				<a href="${rootPath}/member/sign_up" class="top_text2">Sign Up</a>
			</div>
		</sec:authorize>
		
		<!-- 로그인 됐을 경우 , 로그아웃, 마이페이지 버튼 보여줌 -->

			<sec:authorize access="hasAnyAuthority('ROLE_ADMIN', 'ROLE_USER')">
			<div class="right_menu">
					<a href="${rootPath}/member/my_page">
						<img src="/resources/image/toMyPage.png"
						width="30px" height="30px">
					</a>
			</div>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
			<div id="logout" class="right_menu">
					<a href="${rootPath}/member/logout" class="top_text2">Log Out</a>
			</div>
			</sec:authorize>

		<!-- 관리자 로그인 -->

			<sec:authorize access="hasRole('ADMIN')">
				<div id="admin_write" class="right_menu">
					<a href="${rootPath}/write_board" class="top_text2">Write</a>
				</div>
			</sec:authorize>	
		</nav>

	</div>
   </div>
	<!-- 상단 메뉴 끝-->
	<div id = "main_wrapper">
	<section id="login_box">
	<h3> LOG IN TO OPENCRITIC </h3>
	<p>Continue with Facebook</p>
	<div id="or"><span>or</span></div>
	
	<form action="${rootPath}/member/login" method="post">
		
		<div id="id_box">
			<input type="text" placeholder=" ID" class="login" name="memberId" value="${tryId}">
		</div>
		<div id="pw_box">
<%--  폼태그..	<form:password path="memberPw"/> --%>
			<input type="password" placeholder=" Password" class="login" name="memberPw">
			    <c:if test="${not empty errorMsg}">
			    	<span style="color:red; font-size:10px;">Your login attempt was not successful due to <br/>
			        ${errorMsg}</span>
    			</c:if>
		</div>

		<div id="forgot"><a>Forgot Password?</a></div>

		<article>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> <!-- csrf -->
			<input type="submit" id="login_btn" value="Log In"/> 
		</article>
		<div id="foot"><span>Not a member? </span><a href="${rootPath}/member/sign_up" style=text-decoration:none;>Create an account</a></div>
	
	</form>
	</section>
	</div>

</div>

<script>
SCBoxActivation();	
</script>

</body>
</html>