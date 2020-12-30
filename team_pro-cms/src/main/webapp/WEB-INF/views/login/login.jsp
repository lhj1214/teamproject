<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>로그인</title>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background: #ffffff;
	padding: 60px 0;
}

div {
	display: block;
}

#login-form>div {
	margin: 15px 0;
}

.btn_global {
	display: block;
	width: 100%;
	height: 56px;
	line-height: 55px;
	margin: 12px 0 14px;
	border-radius: 0;
	border: solid 1px rgba(0, 0, 0, .1);
	box-shadow: 0 2px 6px 0 rgba(61, 80, 81, .08);
	background-color: #878787;
	color: #fff;
	font-size: 16px;
	font-weight: 700;
	letter-spacing: -.5px;
	cursor: pointer;
	text-align: center;
	-webkit-appearance: none;
}

@media ( max-width : 768px) {
	#header .h_logo {
		width: 165px;
		height: 32px;
		background-image: url(resources/img/d .png);
		background-position: 50% 0;
		background-size: contain;
	}
}

#header .h_logo {
	background-image: url("resources/img/d.png");
	display: block;
	overflow: hidden;
	width: 250px;
	height: 180px;
	margin: 0 auto;
	background-position: -1px -1px;
	font-size: 15px;
	color: transparent;
}

.blind {
	position: absolute;
	clip: rect(0, 0, 0, 0);
	width: 1px;
	height: 1px;
	margin: -1px;
	overflow: hidden;
}

.bar {
	display: inline-block;
	width: 1px;
	height: 12px;
	text-indent: -999em;
	background: #e4e4e5;
	vertical-align: bottom;
}

.position_a {
	margin-bottom: 5%;
}
</style>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"
	charset="utf-8"></script>
<!-- naver 로그인 라이브러리 -->
<script>

</script>
</head>
<body onload="loginChk('<%= session.getAttribute("login")%>')">
	<%@ include file="/WEB-INF/views/default/header.jsp"%>
	<div class="container" align="center" id="content">
		<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
			<div class="panel panel-success">
				<div id="header">
					<h1>
						<a href="#" class="sp h_logo" id="log.team"> <span
							class="blind">환영합니다!</span>
						</a>
					</h1>
				</div>
				<div class="panel-body">
					<form id="login-form" method="post" action="userChk">
						<div>
							<input type="text" class="form-control" name="userid" id="userid"
								placeholder="ID" autofocus>
						</div>
						<div>
							<input type="password" class="form-control" name="userpwd"
								id="userpwd" placeholder="Password">
						</div>
						<div>
							<button type="button" class="btn_global" onclick="inputChk()">로그인</button>
						</div>
						<div>
							<div>
								<span> <input type="checkbox" id="login_chk"> <label>
										로그인 상태 유지 </label>
								</span>
							</div>
						</div>
						<a id="custom-login-btn" href="javascript:loginWithKakao()"> <img
							src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg"
							width="222" />
						</a>
						<!-- 네이버아이디로로그인 버튼 노출 영역 -->
						<div id="naverIdLogin"></div>
					</form>
				</div>

			</div>
		</div>
	</div>
	<!-- 네이버아디디로로그인 초기화 Script -->
	<script type="text/javascript">
	var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "lghlRZ2x21u9zidXG7JU",
			callbackUrl: "http://localhost:8090/team/naverLogin",
			callbackHandle: true,
			isPopup: true, /* 팝업을 통한 연동처리 여부 */
			loginButton: {color: "green", type: 3, height: 48.13} /* 로그인 버튼의 타입을 지정 */
		}
	);
	
	/* 설정정보를 초기화하고 연동을 준비 */
	naverLogin.init();
</script>
	<!-- // 네이버아이디로로그인 초기화 Script -->
	<hr>
	<div class="position_a" align="center">
		<div class="find_info">
			<a target="_self" id="idinquiry" href="searchForm?menu=idinquiry">아이디 찾기</a>
			<span class="bar" aria-hidden="true">|</span>
			<a target="_self" id="pwdinquiry" href="searchForm?menu=pwdinquiry">비밀번호 찾기</a>
			<span class="bar" aria-hidden="true">|</span>
			<a target="_self" id="register" 
				href="<%=request.getContextPath() %>/member/registerForm">회원가입</a>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/default/footer.jsp"%>
<script src="<%=request.getContextPath() %>/resources/js/login.js"></script>
</body>
</html>