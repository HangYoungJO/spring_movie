<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>ICIA MOVIE</title>

<!-- Custom fonts for this template-->
<link
	href="${pageContext.request.contextPath }/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link
	href="${pageContext.request.contextPath }/resources/css/sb-admin-2.min.css"
	rel="stylesheet">

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<%@ include file="/WEB-INF/views/includes/SideBar.jsp"%>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<%@ include file="/WEB-INF/views/includes/TopBar.jsp"%>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">로그인페이지-MemberLoginForm.jsp</h1>
					</div>

					<!-- 회원가입 양식 시작 -->
					<div class="row">
						<!-- <div class="col-lg-5 d-none d-lg-block bg-register-image"></div> -->
						<div class="col-xl-7 col-lg-7 ml-auto mr-auto">
							<div class="p-5">
								<div class="text-center">
									<h1 class="h4 text-gray-900 mb-4">로그인</h1>
								</div>
								<form class="user" action="memberLogin" method="post">									
									<div class="form-group">

										<label for="inputMid" class="text-lg font-weight-bold">아이디</label>
										<input type="text" id="inputMid" class="form-control form-control-user"
											name="userId" placeholder="아이디 입력..">
									</div>

									<div class="form-group">

										<label for="inputMpw" class="text-lg font-weight-bold">비밀번호</label>
										<input type="password" id="inputMpw" class="form-control form-control-user"
											name="userPw" placeholder="비밀번호 입력..">

									</div>
									
									<button type="submit"
										class="btn btn-primary btn-user btn-block">로그인</button>
									
								</form>
							
							<hr>
							
							<div class="text-center">
							<a class=small id="kakaoLoginBtn"></a>
							</div>
							
							<div class="text-center">
								<a class="small" href="login.html">Already have an account?
									Login!</a>
							</div>
						</div>
					</div>
				</div>
				<!-- 회원가입 양식 끝 -->

			</div>
			<!-- /.container-fluid -->

		</div>
		<!-- End of Main Content -->

		<!-- Footer -->
		<footer class="sticky-footer bg-white">
			<div class="container my-auto">
				<div class="copyright text-center my-auto">
					<span>Copyright &copy; Your Website 2021</span>
				</div>
			</div>
		</footer>
		<!-- End of Footer -->

	</div>
	<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>



	<!-- Bootstrap core JavaScript-->
	<script src="${pageContext.request.contextPath }/resources/vendor/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script	src="${pageContext.request.contextPath }/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="${pageContext.request.contextPath }/resources/js/sb-admin-2.min.js"></script>
	
	<script type="text/javascript">
	var checkMsg = '${msg}';
	if( checkMsg.length > 0 ){
		alert(checkMsg);
	}
	
	</script>
	
    

    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
  	<script type="text/javascript">
        Kakao.init('2d943f01a09db14fee88aacb2c272980');
       
        console.log(Kakao.isInitialized());
    </script>  
	
	<script type="text/javascript">
	Kakao.Auth.createLoginButton({
		  container: '#kakaoLoginBtn',
		  size: 'large',  
		  success: function(response) {
		    console.log(response);
			// 사용자 정보 가져오기
			Kakao.API.request({
			  url: '/v2/user/me',
			  success: function(res) {
			    console.log(res);
			    console.log("res.id : " + res.id);
			    console.log("res.kakao_account.email : " + res.kakao_account.email);
			    console.log("res.kakao_account.profile.nickname : " + res.kakao_account.profile.nickname);
			    console.log("res.kakao_account.profile.profile_image_url : " + res.kakao_account.profile.profile_image_url);
			    memberkakaoLogin(res.id, res.kakao_account.email, res.kakao_account.profile.nickname, res.kakao_account.profile.profile_image_url);
			    
			    // 아이디, 이메일, 닉네임, 프로필
			    // 컨트롤러 >> 서비스 아이디 == MID 로그인처리
			    // 조회되는 회원정보가 있으면 로그인 처리후 메인페이지로 
			    // 조회되는 회원정보가 없으면 아이디, 이메일, 닉네임, 프로필, 회원가입처리 >> 로그인 페이지로 
			    
			  },
			  fail: function(error) {
			    console.error(error)
			  }
			});
		    
		  },
		  fail: function(error) {
		    console.log(error);
		  },
		});
	
	
	</script>
	<script type="text/javascript">
	function memberkakaoLogin(mid,memail,mname,mprofile) {
		console.log(mid);
		console.log(memail);
		console.log(mname);
		console.log(mprofile);
		location.href = "memberkakaoLogin?mid="+mid+"&memail="+memail+"&mname="+mname+"&mprofile="+mprofile;
	}
	
	</script>
	
</body>
</html>