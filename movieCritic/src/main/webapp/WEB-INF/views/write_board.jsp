<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/resources/jquery/jquery-3.4.1.min.js"></script>
<style>

#site_layout{
	margin: -8px;
	padding : 0;
	height:100vh;
	background:#fff;
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

#main_write_area{
	
	

}


#main_right_area{
	
	margin: 50px 600px 100px;
	padding: 0;
	width:650px;
	height:600px;
	border: 1px solid green;

}

table {
	width: 
	border: 1px solid #444444;
	border-collapse: collapse;
}

  td {
	border: 1px solid #444444;
	padding: 10px;
	
}

td:nth-child(2n+1){
	background:#fee;
}

#submit_btn_area{
	padding: 10px 0px 0px 575px;
	border: 1px solid red;
}

#submit_inner{
	background:transparent;
	background:#fbb;
	color:#000;
	border: 1px solid black;
}

/* 20200117 write_board.jsp movieImg 업로드 위해 추가함 - ohjin */
.select_img img { margin:20px 0; }

</style>

<script>




</script>

</head>
<body>

<div id="site_layout">

	<!--movieCri-->
	<!-- 상단 메뉴-->

   <div id="top_menu_wrapper">
	<div id="top_menu">

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

	</div>
   </div>
	<!-- 상단 메뉴 끝-->


	<!-- 글쓰기 폼 시작-->

	
	<h2 style="text-align:center; margin-top:30px;">게시글 작성</h2>

		<div id="main_right_area" style="display:flex; justify-content:center;
	align-items:center;">		

			<form method="post" enctype="multipart/form-data">

			
				<table>
	
					<tr>
						<td> Title  </td>
						<td><input type="text" name="title"> </td>
					</tr>
					<tr>
						<td> Starring  </td>
						<td><input type="text"> </td>
					</tr>
					<tr>
						<td> Genre  </td>
						<td><input type="text"> </td>
					</tr>
					<tr>
						<td> Summary  </td>
						<td><textarea cols="70" rows="10" maxlength="500" name="summary"></textarea> </td>
					</tr>
					<tr>
						<td>
						<div style="margin: 10px 0;">
 							<label for="poster">이미지</label>
 							<input type="file" id="poster" name="file" />
 							<div class="select_img"><img src="" /></div> 
							<script>
  								$("#poster").change(function(){
   									if(this.files && this.files[0]) {
    									var reader = new FileReader;
    									reader.onload = function(data) {
     										$(".select_img img").attr("src", data.target.result).width(200);        
    									}
								    	reader.readAsDataURL(this.files[0]);
   									}
  								});
 							</script>
 							
 							<%=request.getRealPath("/") %>
						</div>	
						</td>
					</tr>
					
				</table>

				<div id="submit_btn_area"><button type="submit">작성</button></div>

			
	
			</form>
		</div>

	

	<!--글쓰기 폼 끝-->

</div>

</body>
</html>