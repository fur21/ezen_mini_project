

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
    #userPwd{ width:170px; height:25px; }
    .del_Btn{font-weight:bold; font-size:1.1em;}
    
    #main_div { text-align: center; width: 80%;}
    #m_content { text-align: center;}
    #btnwithdrawal { margin-top: 20px; }
    
    #delBtn{ margin-top: 100px;}
    
  </style>
<script src="${pageContext.request.contextPath }/js/jquery-3.6.1.min.js"></script>
  <script>
  	$(function() {
  		$("#btnPwdCheck").on("click", function() {
  			$.ajax({
  					url: "/mypage/pwdCheck.do?userId=${loginUser.userId}",
  					type: "post",
  					data: $("#deleteForm").serialize(),
  					success: function(obj) {
  						console.log(obj);
  						
  						if(obj == 'deleteOk') {
  							$("#delBtn").attr("disabled", false);
  						} else {			
  							alert("비밀번호가 일치하지 않습니다.");
  							$("#userPwd").focus();
  							
  						}
  					},
  					error: function(e) {
  						console.log(e);
  					}
  			})				
  		});
  	});
  	
  </script>
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
      <h2>회원탈퇴</h2>
      <br>
      <div id="m_content">
        <form id="deleteForm" action="/mypage/deleteUser.do?userId=${loginUser.userId}" method="post">
            <div>
                <input type="password" autocomplete="off"  placeholder="비밀번호 입력" id="userPwd" name="userPwd" required>
                <button class="del_Btn" type="button" id="btnPwdCheck">비밀번호 확인</button>
            </div>
            
            <div id="btndel">
                <button type="submit" id="delBtn" class="del_Btn" disabled>회원탈퇴</button>
            </div>
        </form>
      </div>     
    </div>
  </main>
  <footer>
  </footer>
</body>
</html>