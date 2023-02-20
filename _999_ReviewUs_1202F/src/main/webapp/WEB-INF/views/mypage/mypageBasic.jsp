<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	img {
		position:relative;
		left: 100px;
	}
	ul, li {
		list-style: none;
	}
	
	a {
		 text-decoration: none;
		 color: black;
		 font-weight: 500;
		 font-size: 1.5rem;
	}
	
	a:hover {
		text-decoration: underline;
	}
	
	nav ul li{
		display: inline-block;
	}
	nav * {
	  vertical-align: middle;
	}
	
	.main-div li a {
		font-size: 1.125rem;
	}
	
	.user-nav {
		display: flex;
		align-items: center;
		margin-right: 100px;
	}
	
	.user-nav li {
		margin-left: 10px;
	}
	
	.user-nav li a {
		font-size: 0.9rem;
	}



    #main_content {display: inline-block; width: 100%;}  
    
    #d_list { float: left; width: 20%; text-align: center;}
    #list_menu { margin-top: 50px;}
    #list_menu li {margin: 10px;  height:50px; list-style: none;}
    .side_link { font-weight:bold; }
    
    h2 { margin-left:-200px;}
    #m_content { text-align:start;  display:inline-block; margin-left:-200px;}
    #main_div { float:right; text-align: center; width: 80%;}
    
    
    .content {   font-size:1.1em; display:inline-block; width:150px; }
    .r_content { width: 150px; font-size:1.1em; margin-bottom:10px;}
    .text_content{ text-align:right; border:none;}
	
    
    #updatebtn { text-align: center;}
  </style>
</head>
<body>
<div>
    <header style="display: flex; align-items: center; justify-content: space-between">
		<h1>
		<!-- /를 붙이면 무조건 루트주소 뒤에 붙는다. -->
		<!-- localhost:8090/user/login.do -->
		<!-- localhost:8090/hello.do -->
			<a href="/index.jsp"><img src="/images/(small)ReviewUs.png" width="200px"></a>
		</h1>
		<nav id="main">
			<ul class="main-nav">
				<li>
					<a href="/board/getBoardList.do">&ensp;BARS ＆ PUBS&emsp;</a>
				</li>			
				<li>
					<a href="/board/getBoardList.do">&ensp;DESSERT PLACES&emsp;</a>
				</li>			
				<li>
					<a href="/board/getBoardList.do">&ensp;RESTAURANTS&emsp;</a>
				</li>			
				<li>
					<a href="/board/getBoardList.do">&ensp;HOTEL</a>
				</li>			
			</ul>
		</nav>
		<nav id="user">
			<ul class="user-nav">

						<li>
							<a href="/mypage/getMypage.do?userId=${loginUser.userId }"><b>${loginUser.userId } 님</b></a>
						</li>
						<li>
							<a href="/user/logout.do">로그아웃</a>
						</li>

			</ul>	
		</nav>
	</header>
  </div>
  <hr>
  <main id="main_content">
    <div id="d_list">
      <ul id="list_menu">
        <li><a class="side_link" href="/mypage/getMypage.do?userId=${loginUser.userId}">기본페이지</a></li>
        <li><a class="side_link" href="/mypage/updateMypage.do?userId=${loginUser.userId}">회원정보 수정</a></li>
        <li><a class="side_link" href="/mypage/deleteMypage.do?userId=${loginUser.userId}">회원탈퇴</a></li>
        <li><a class="side_link" href="/mypage/postMypage.do?userId=${loginUser.userId}">내가 쓴 게시글</a></li>
        <li><a class="side_link" href="/mypage/commentMypage.do?userId=${loginUser.userId}">내가 쓴 댓글</a></li>
      </ul>
    </div>
    <div id="main_div">
  
      <h2>기본페이지</h2>
 
      <br>
      <div id="m_content">
        <label for="id" class="content">아이디 : </label><input type="text" class="r_content" name="id" id="id" value="${getMypage.USER_ID}" readonly><br><br>
        <label for="nickname" class="content">닉네임 : </label><input type="text" class="r_content" name="nickname" id="nickname" value="${getMypage.USER_NM}" readonly><br><br>
        <label for="email" class="content">이메일 : </label><input type="text" class="r_content" name="email" id="email" value="${getMypage.USER_EMAIL}" readonly><br><br>
        <label for="board" class="content">게시글 수 :</label><input type="text" class="r_content text_content" name="board" id="board" value="${getMypage.BOARD_C}" readonly>개<br><br>
        <label for="comment" class="content">댓글 수 : </label><input type="text" class="r_content text_content" name="comment" id="comment"  value="${getMypage.COMMENT_C}" readonly>개&ensp;
        <br><br>
      </div>
      
    </div>
  </main>
  <footer>
  </footer>
</body>
</html>