<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="/resources/css/common.css"/>
<script src="/resources/css/common.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script src="/resources/jquery/jquery-3.4.1.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>

#main_wrapper{
	max-height:500px;
	background:black;
	color:white;
	display:flex;
	justify-content:center;
	width:100%;
	height:75%; /* 1vw , 1vh = viewport의 1% */
}

#main_info_area{

	margin: 5px 10px 0 0;
	width:25%;
	min-width:400px;

}

.main_info_text{
	padding-bottom: 20px;
	border-bottom: 1px solid #777;
	width: 100%;
}

div.main_info_text h1,h2,h3,h4,h5,h6 {
	padding-bottom:6px;
}

div.main_info_text div.rating_circle_average{
	margin-top:30px;
}

.ratingCircle{
    border-radius: 50%;
    height: 28px;
    width: 28px;
    text-align: center;
    background-color: #000;
    color:white;
    cursor:pointer;
    font-size:15px;
    font-weight:50px;
    margin-left:10px;
}

#main_trailer_area{
	width:700px;
	height: 350px;
	margin: 50px 0 0 15px;
}

.still_cuts{
	width:30%;
	height:50%;
}

#middle_area{
	padding: 5% 15% 20% 10%;


}


#middle_poster_area{
	float:left;
	width:30%;
	height:70%;
	margin-left:12%;
}

.posters{
	width:100%;
	height:100%;	
}

#middle_detail_area{
	float:left;
	margin-left: 50px;
	width:40%;
	height:100%;
	word-break:break-all;
	font-weight:200px;
	font-size:13px;
	line-height:25px;

}

.middle_details_text{
	font-size:15px;
	font-weight:bold;
}

#bottom_area{
	width:100%;
	overflow:hidden;
}

#bottom_area::-webkit-scrollbar, #site_layout::-webkit-scrollbar{
	display:none;
}

#movie_score{
	margin-left:15%;
	margin-top:60px;
	float:left;
	width: 25%;

}

.rating_circle_average{
    border-radius: 50%;
    height: 70px;
    width: 70px;
    text-align: center;
    background-color: #eee;
    color:white;
    cursor:pointer;
    float:left;
    margin:12px 0px 12px 12px;
    font-size:40px;
    font-weight:1000px;
}

div.score_distribution_area ul li{
	list-style-type:none;
	border:1px solid red;
	padding:0;
	width:100%;

}

.score_distribution_area{
	margin:0;
	padding:0;

	width:80%;
}

meter{
	width:75%; 
	height:17px;
	float:right; 
	padding-top:8px; 
	padding-right:3px;
}

#user_score{
	margin-top:60px;
	margin-left:50px;
	float:left;
	width: 30%;
	margin-bottom:10%;
}

#write_review{
	margin: 20px 0;
	border-radius:20px;
	font-size: 15px;
	background:black;
	padding:7px 20px 7px;
}

#write_review a{
	text-decoration:none;
	color:white;
}

.critic_reviews{
	height: 15%;
	border-top:1px solid #aaa;
	word-break:break-all;
	padding:20px 0;
}

/* modal */
#main_write_area{
	border:1px solid blue;
	margin:2% 10% 5% 10%;
}


#input_table {
	width:100%;
	margin:0;
	border: 1px solid #444444;
	border-collapse: collapse;
}

#input_table  td {
	border: 1px solid #444444;
	padding: 10px;
	width:30%;
	word-break:break-all;
}

#input_table td:nth-child(2n+1){
	background:#fee;
	width:30%;
}

#submit_btn_area{
	padding: 10px 0;
	margin: 10px 46%;
}


#submit_inner{
	background:transparent;
	background:#fbb;
	color:#000;
	border: 1px solid black;
}

/* 20200117 write_board.jsp movieImg 업로드 위해 추가함 - ohjin */
.select_img img { 
	margin:20px 0; 
}

</style>
</head>

<body>
<!-- 절대경로 -->
<c:set var="rootPath" value="${pageContext.request.contextPath}"/>

<!--전체 레이아웃-->

<div id="site_layout">

	<!--movieCri-->
	<!-- 상단 메뉴-->

   <div id="top_menu_wrapper">
	<div id="top_menu">

		<nav id="top_menu1">
		<ul id="left_menu">
		
		<li class="left_menu">		
			<img src="/resources/image/logo.jpg" alt="MovieCritic" onclick="goIndex()">
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
			<sec:authorize access="hasRole('ADMIN')">
				<div id="admin_write" class="right_menu">
					<a class="top_text2" onclick="editMovie()" style="cursor:pointer;">Edit</a>
				</div>
			</sec:authorize>
		</nav>

	</div>
   </div>
	<!-- 상단 메뉴 끝-->
	<!-- edit modal -->
	
	<div id="modalDiv" style="display:none; position:fixed; z-index:100; width:70%; height:70%; overflow:auto; margin:2.5% 13%; background:white;">
	<!-- 글쓰기 폼 시작-->

	<a style="cursor:pointer;">
		<span id="closeModal" style="color:#333; float:right; font-size:22px; font-weight:bold; padding:10px;" onclick="closeModal()">
			X
		</span>
	</a>
	<a href="${rootPath}/movie_info/deletion?movieId=${view.movieId}">
		<button type="button" style="float:left; background-color:orange;font-weight:bold; border:1px solid black;">
			Delete
		</button>
	</a>
		
	<h2 style="text-align:center; margin:30px; float:center;">게시글 수정</h2>

		<div id="main_write_area">		

			<form method="post" enctype="multipart/form-data" action="/editMovieInfo?${_csrf.parameterName}=${_csrf.token}">
				<input type="hidden" name="movieId" value="${view.movieId}">
			<%--컨트롤러에 인자가 안들어오는것 같은데.. csrf값은 확실히 나왔고. --%>
			
				<table id="input_table">
					<tr>
						<td> Title  </td>
						<td><input type="text" name="title" style="width:50%;" pattern="\w{1,30}" value="${view.title}" /> </td>
					</tr>
					<tr>
						<td> Starring  </td>
						<td><textarea id = "starring" name="starring" style="width:80%;"></textarea></td>
					</tr>
					<tr>
						<td> Genre  </td>
						<td><input type="text" name="genre" pattern="\w{1,20}" value="${view.genre}"> </td>
					</tr>
					<tr>
						<td> Director  </td>
						<td><input type="text" name="director" pattern="\w{1,20}" value="${view.director}"> </td>
					</tr>
					<tr>
						<td> Runtime  </td>
						<td><input type="text" name="runtime" value="${view.runtime}"> </td>
					</tr>
					
					<tr>
						<td> Release Date  </td>
						<td>
							<input type="text" name="releaseDate" id="datepicker" pattern="\d{2}\/\d{2}\/\d{4}"  autocomplete="off"
										value="<fmt:formatDate value="${view.releaseDate}" pattern="MM/dd/yyyy"/>"> 
						</td>
					</tr>
					<tr>
						<td> Summary  </td>
						<td><textarea id="summary" cols="70" rows="10" maxlength="500" name="summary"></textarea> </td>
					</tr>
					<tr>
						<td>
						<div style="margin: 10px 0;">
 							<label for="poster">Poster</label>
 							
 							<%= request.getRealPath("/") %>
						</div>
 						</td>
 						<td>
 							<input type="file" id="poster" name="file" />
  						
 							<div class="select_img"><img src="" /></div>
 						</td>
 					</tr>
 					<tr> 
						<td>
						<div style="margin: 10px 0;">
 							<label for="stillCuts">StillCuts</label>
 						</div>
 						</td>
 						<td>
 							<input multiple="multiple" type="file" id="stillCuts" name="file" />
 							 <!-- for문을 교체!! -->
 							<div class="select_img2"><img src="" /></div>
 							<div class="select_img3"><img src="" /></div>
 							<div class="select_img4"><img src="" /></div>
						</td>
					</tr>
					
				</table>
				

				<div id="submit_btn_area">
					<input type="submit" value="저장"/>
					<sec:csrfInput/>
				</div>
				

			
	
			</form>
		</div>

	

	<!--글쓰기 폼 끝-->
	</div>
	<!-- edit modal -->


	<!-- 트레일러-->	

	<div id="main_wrapper">
	
		<div id="main_info_area">
		
			<div class="main_info_text">
			<h1>${view.title} <span style="font-size:14px;"><fmt:formatDate value="${view.releaseDate}" pattern="yyyy"/></span></h1>
			</div>

			<div class="main_info_text" style="display:flex;">
				<div style="display:flex; flex-direction:column;">
					<h3 style="">SCORE</h3>
					<div style="word-break:break-all; width:55%;"> Mixed or average reviews based on ${totalCount} Ratings</div>
				</div> 
				<div class="rating_circle_average" style="float:right;">
					${scoreAverage}
				</div>
			</div>			
			
			<div class="main_info_text">
			<h6>VOTE NOW</h6>
			
			<div style="display: flex;">
				    <div id="ratingCircle_0" class="ratingCircle">0</div>
				    <div id="ratingCircle_1" class="ratingCircle">1</div>
				    <div id="ratingCircle_2" class="ratingCircle">2</div>
				    <div id="ratingCircle_3" class="ratingCircle">3</div>
				    <div id="ratingCircle_4" class="ratingCircle">4</div>
				    <div id="ratingCircle_5" class="ratingCircle">5</div>
				    <div id="ratingCircle_6" class="ratingCircle">6</div>
				    <div id="ratingCircle_7" class="ratingCircle">7</div>
				    <div id="ratingCircle_8" class="ratingCircle">8</div>
				    <div id="ratingCircle_9" class="ratingCircle">9</div>
				    <div id="ratingCircle_10" class="ratingCircle">10</div>
				</div>
				
				
			
			</div>
		</div>

		<div id="main_trailer_area">

<!-- 			<video src="/resources/image/1917-trailer-3_h480p.avi" controls style="width:100%;height:90%;"></video> -->
			<img class="still_cuts" src="${view.stillCut1}">
			<img class="still_cuts" src="${view.stillCut2}">
			<img class="still_cuts" src="${view.stillCut3}">

		</div>

	</div>

	<!-- 트레일러 끝-->	

	<!-- 영화 정보-->

	<div id="middle_area">

		<div id="middle_poster_area">
			<img class="posters" src="${view.poster}">	<%--경로설정을 하지않았는데 들어가는 이유.. 톰캣 metadata? --%> 
		</div>	<%-- 프로젝트 내부에 저장하면 배포시 삭제되서 엑박뜸.. 프로젝트 외부에 폴더 만들고 server.xml에서 docBase, path 설정 --%>

		<div id="middle_detail_area">

			<h2>Movie Details and Credits</h2>
			<fmt:setLocale value="en_us"/>
			<h6><fmt:formatDate value="${view.releaseDate}" dateStyle="long"/></h6>

					<p><span class="middle_details_text">Starring : </span> 
						${view.starring}
					</p>
					<p><span class="middle_details_text">Summary : </span>
						${view.summary}
					</p>
					<p><span class="middle_details_text">Director : </span>  
						${view.director}
					</p>
					<p><span class="middle_details_text">Genre : </span>
						${view.genre}
					</p>
					<p><span class="middle_details_text">Runtime : </span>
						${view.runtime} 
					</p>



		</div>


	</div>

	<!-- 영화 정보 끝-->

	<!-- bottom_area-->

	<div id="bottom_area">
		<!-- 리뷰점수  -->
		<div id="movie_score">

			<h3>Movie Score</h3>
	
			<!--점수표시 이미지-->
			<div>
			
			</div>
			<!--점수표시 이미지 끝-->
	
			<!-- Positive ?? 보류-->		
			<div>
	
			</div>
			<!-- Positive ?? 보류-->	

			<h2>Critic Reviews</h2>

			<div class="critic_reviews">
			
			</div>
			<div class="critic_reviews">
		
			</div>
			<div class="critic_reviews">
		
			</div>

			<a href="#">SEE ALL REVIEWS</a>							

		</div>
		
	
		<div id="user_score">
			<div id="user_score_wrapper" style="display:flex; justify-content:space-between;">
				<h3>User Score</h3> <div id="write_review"><a href="/view_review?movieId=${view.movieId}">Write a Review</a></div>
			</div>
			
			<div id="score_distribution_wrapper" style="display:flex; justify-content:space-between;">
				
				<div style="display:flex;flex-direction:column;">
					<!--점수표시 이미지-->
					<div class="rating_circle_average" style="margin-top:40px;">
					${scoreAverage}
					</div>
					<div style="font-weight:bold;font-size:15px;">
					Score Average
					</div>
					<!--점수표시 이미지 끝-->
				</div>
				
				<!-- 점수 분포도 -->
				<div class="score_distribution_area">		
					<canvas id="myChart"></canvas>
				</div>
				<!-- 점수 분포도 -->
				
				
			</div>
			

			
			<h2>User Reviews</h2>
	
			<c:forEach items="${reviewList}" var="reviewList" begin="0" end="5">
			<div class="critic_reviews">
					<div class="rating_circle_average" style="width:38px;height:38px; font-size:25px;">${reviewList.rating}</div>
					<div style="display:flex; flex-direction:column; padding:7px 0 0 20px;">
	  					<div>
						 	작성자 : ${reviewList.writer}
						</div>
						<div>
	   						<span style="font-size:14px; color:#999;"><fmt:formatDate value="${reviewList.registerDate}" pattern="yyyy.MM.dd"/></span>
	 					</div>
 					</div>
  
  					<p style="padding-left:8px;padding-bottom:50px;">${reviewList.content}</p>
 			</div>
 			</c:forEach>   

			<div style="text-align:center; font-size:18px; border:1.5px solid #888; padding:10px 0 10px 0; margin: 30px 30px;">
				<a href="/view_review?movieId=${view.movieId}"
				style="text-decoration:none; color:black; font-weight:bold;">SEE ALL ${totalCount} REVIEWS</a>
			</div>							
		

		</div>
		<!-- 리뷰점수 -->
	</div>
	<!-- bottom_area-->
	
	

</div>

<!--전체 레이아웃 끝-->


		
<script type="text/javascript">

//점수분포
var ctx = document.getElementById('myChart').getContext('2d');
var chart = new Chart(ctx, {
	type:	'horizontalBar',
	data:{
		labels:	['Positive', 'Mixed', 'Negative'],
		datasets:	[{
			label : 'Preference Distribution',
			backgroundColor: [
				'rgba(50, 255, 50, 1)',
				'rgba(255, 150, 80, 1)',
				'rgba(255, 30, 30, 1)'
				],
	        borderColor: 'rgb(255, 99, 132)',
	        data: [${positiveCount}, ${mixedCount}, ${negativeCount}]
		}]
	},
	options: {
        scales	: { //X,Y축 옵션
            xAxes: [{
                ticks: {
                    beginAtZero:true  //Y축의 값이 0부터 시작
                }
            }]
        }
    }
})

var editMovie = function(){
	var modalDiv = document.getElementById('modalDiv');
	var siteDiv = document.getElementById("site_layout");
	var summaryText = document.getElementById("summary");
	var starringText = document.getElementById("starring");
	modalDiv.style.display = "block";
	siteDiv.style.backgroundColor= "rgba(0,0,0,0.5)";
	summaryText.value = `${view.summary};`
	starringText.value = '${view.starring}';
}

var closeModal = function(){
	var modalDiv = document.getElementById('modalDiv');
	var siteDiv = document.getElementById('site_layout');
	siteDiv.style.backgroundColor = "white";
	modalDiv.style.display = "none";
}


$(document).ready(function(){
	
	var markScore;  
	for(var x=0; x<=10; x++){
        var circle = document.querySelectorAll(".ratingCircle")[x];
        circle.onmouseover = function(e){
            var score = this.innerHTML;
            for(var i=0; i <= score; i++) {
                if(i<4 ) {
                    var id = "ratingCircle_" + i;
                    document.getElementById(id).style.backgroundColor = "red";
                }else if( i < 7){
                    var id = "ratingCircle_" + i;
                    document.getElementById(id).style.backgroundColor = "orange";
                }else if ( i< 11){
                    var id = "ratingCircle_" + i;
                    document.getElementById(id).style.backgroundColor = "#1aff00";
                }
            }
        }
        circle.onmouseout = function(e){
            if(markScore == null){
                var score = this.innerHTML;
                for(var i=0; i <= score; i++) {
                    var id = "ratingCircle_" + i;
                    document.getElementById(id).style.backgroundColor = "#000";
                }
            }else{
                for(var i=10; i >markScore; i--){
                    var id = "ratingCircle_" + i;
                    document.getElementById(id).style.backgroundColor = "#000";
                }
                
            }
            console.log("markScore="+markScore);
        }
        circle.onclick = function(e){
            markScore = this.innerHTML;
            document.getElementById("markRating").value = markScore;
            console.log("markScore="+markScore);
        }
    }
		
	SCBoxActivation();
	coloring();
	imagePreview();


})

$( function() {
		  $( "#datepicker" ).datepicker();
		  	dateFormat: 'yyyy.mm.dd'
		  	showOn: "both"
		  	buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif"
	} )

	

</script>

</body>
</html>