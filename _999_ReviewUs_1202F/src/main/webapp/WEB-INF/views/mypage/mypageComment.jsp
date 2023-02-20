<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
       #main_content {display: inline-block; width: 100%;}
      
      #d_list { float: left; width: 20%; text-align: center;}
    #list_menu { margin-top: 50px;}
    #list_menu li {margin: 10px;  height:50px; list-style: none;}
    .side_link { font-weight:bold; }
    
    
    #main_div { float:right; text-align: center; width: 50%; margin-right:300px;}
    
    #boardTable tr { height:20px;}
    
  </style>
  <script src="${pageContext.request.contextPath }/js/jquery-3.6.1.min.js"></script>
  <script>
  $(function() {
		$(".pagination a").on("click", function(e) {
			e.preventDefault();
			
			$("input[name='pageNum']").val($(this).attr("href"));
			$("#searchForm").submit();
		});
		
		//$("#btnSearch").on("click", function() {
		//	$("input[name='pageNum']").val(1);
			
		//	$("#searchForm").submit();
		//});
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
      <ui id="list_menu">
        <li><a class="side_link" href="/mypage/getMypage.do?userId=${loginUser.userId}">기본페이지</a></li>
        <li><a class="side_link" href="/mypage/updateMypage.do?userId=${loginUser.userId}">회원정보 수정</a></li>
        <li><a class="side_link" href="/mypage/deleteMypage.do?userId=${loginUser.userId}">회원탈퇴</a></li>
        <li><a class="side_link" href="/mypage/postMypage.do?userId=${loginUser.userId}">내가 쓴 게시글</a></li>
        <li><a class="side_link" href="/mypage/commentMypage.do?userId=${loginUser.userId}">내가 쓴 댓글</a></li>
      </ui>
    </div>
    <div id="main_div">
      <h2>내가 쓴 댓글</h2>
      <br>
      <table id="boardTable" border="1" style="width: 100%; border-collapse: collapse;">
      	<tr>
			<th style="backgrond: orange; width: 30px;">번호</th>
			<th style="backgrond: orange; width: 200px;">내용</th>
			<th style="backgrond: orange; width: 50px;">등록일</th>
		</tr>
		<c:forEach items="${commentList}" var="comment">
			<tr style="height : 50px;" >
				<td>${comment.cno}</td>
				<td>
					${comment.content}
				</td>
				<td>
					<fmt:formatDate value="${comment.regdate}" pattern="yyyy-MM-dd"/>
				</td>
			</tr>
		</c:forEach>
      </table>
      <br>
 
      <form id="searchForm" action="/mypage/commentMypage.do" method="post">
			<input type="hidden" name="pageNum" value="${pageVO.cri.pageNum }">
			<input type="hidden" name="amount" value="${pageVO.cri.amount }">
		</form>
      <br>
		<div style="text-align:center;">
			<ul class="pagination">
				<c:if test="${pageVO.prev}">
					<li class="pagination_button">
						<a href="${pageVO.cri.pageNum-1}">이전</a>
					</li>
				</c:if>
				<c:forEach var="num" begin="${pageVO.startPage}" end="${pageVO.endPage}">
					<li class="pagination_button" style="list-style:none; color:black; ">
						<a href="${num}" style="text-decoration:none; color:black;">${num}</a>
					</li>
				</c:forEach>
				<c:if test="${pageVO.next}">
					<li class="pagination_button">
						<a href="${pageVO.cri.pageNum+1}">다음</a>
					</li>
				</c:if>	
			</ul>
		</div>    
    </div>
  </main>
  <footer>
  </footer>
</body>
</html>