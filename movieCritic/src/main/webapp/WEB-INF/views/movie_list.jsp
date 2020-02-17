<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Browse movie</title>

<style>

#site_layout{
	margin: -8px;
	padding : 0;
}

#top_menu_wrapper{
	margin:0 auto;
	
}

#top_menu{
	margin:0;
	width:100%;
	height:60px;
	display:flex;
	justify-content:space-around;
	align-items:center;
	background:black;

	
}

#left_menu{
	list-style-type:none;
	
}

.left_menu{
	float:left;
	padding: 0 0 15px 30px;
	margin-left:auto;
}

#top_menu2{
	display:flex;
	
}

.right_menu{
	margin-left:auto;
	padding-left:15px;
	
}
.top_text1{
	font-size: 15px;
	color: white;
	text-decoration:none;
	vertical-align:-8px;
	
}

#sign_up{
	background:#f30;
	
}

.top_text2{
	font-size: 15px;
	color: white;
	vertical-align:-2px;
	text-decoration:none;
	padding-right:15px;
	
}

#search{
	border:none;
	border-bottom: 3px solid white;
	background: transparent;
	height: 25px;
}

.line{
	border-bottom: 2px solid lightgray;
}

#genre_sub{
	display:none;
	height: 115px;
	width:70px;
	padding:0;
	margin: 0px;
	position: absolute;
	z-index:2;
	list-style-type:none;
	text-decoration:none;
	background-color: #fff;
	border: 1px solid gray;
	border-radius: 5px;
}


.left_menu:hover ul#genre_sub {
	display:block;
}

.top_text3{
	text-decoration:none;
	color:#555;
	font-size:15px;
	vertical-align: 8px;
}

.left_inner_menu{
	padding: 10px 0 0 5px ;
}

.left_inner_menu:hover {
	background: lightblue;
}



#middle_wrapper{
	width:100%;
	height:400px;
	border:1px solid blue;
}

#select_wrapper{
	display:flex;
	justify-content:space-around;
	align-items:center;
	width: 1000px;
	margin-top: 50px;
	margin-left: 310px;
	border:1px solid blue;
}

#genre{
	width:250px;
	height:30px;
	
}

#timeframe{
	width:250px;
	height:30px;
}

#sort{
	width:250px;
	height:30px;
}

. select_box{

}

.select_label{
	display:block;
	padding-bottom:5px;
}

</style>

</head>

<body>


<div id="site_layout">

	<!--movieCri-->
	<!-- 상단 메뉴 wrapper-->

	<div id="top_menu_wrapper">
		<!-- 상단 메뉴 -->
		<div id="top_menu">
			<!--상단 왼쪽 메뉴 -->
			<nav id="top_menu1">
				<ul id="left_menu">
		
					<li class="left_menu">		
						<a href="#"><img src="C:\Users\orc4g\Desktop\image\logo.webp" alt="OpenCritic"></a>
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
			<!-- 상단 왼쪽 메뉴 끝 -->
			
			<!-- 상단 오른쪽 메뉴 -->
			<nav id="top_menu2">
			
				<div id="form" class="right_menu">
	
					<form action="#" method="post" class="right_menu">

						<input type="text" placeholder="Search" class="top_text2" id="search">

					</form>			
				</div>
		
				<div id="login" class="right_menu">
					<a href="#" class="top_text2">Login</a>
				</div>
				<div id="sign_up" class="right_menu">
					<a href="#" class="top_text2">Sign Up</a>
				</div>
			</nav>
			<!-- 상단 오른쪽 메뉴 끝 -->
		</div>
		<!-- 상단 메뉴 끝 -->
	</div>
	<!-- 상단 메뉴 wrapper 끝-->

	<div id="middle_wrapper">
		<h1 style="width:100%;padding-top:100px;padding-left:340px;">Browse Movie</h1>
		
		<div id="select_wrapper">

			<div id="select1">
				<label for="genre" class="select_label">Genre</label>
				<select name="genre" id="genre" class="select_box">
					<option value="">All Genre</option>
					<option value="Action">Action</option>
					<option value="Drama">Drama</option>
					<option value="Fantasy">Fantasy</option>
				</select>
			</div>

			<div id="select2">
				<label for="timeframe" class="select_label">Timeframe</label>
				<select name="timeframe" id="timeframe" class="select_box">
					<option value="">All Time</option>
					<option value="2019">2019</option>
					<option value="2018">2018</option>
					<option value="2017">2017</option>
				</select>
			</div>

			<div id="select3">
				<label for="sort" class="select_label">Sort</label>
				<select name="sort" id="sort" class="select_box">
					<option value="score">Score</option>
					<option value="A_Z">A-Z</option>
					<option value="release_date">Release Date</option>
				</select>
			</div>
		</div>
	</div>
</div>
</body>
</html>