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
						<h1 class="h3 mb-0 text-gray-800">회원가입페이지-MemberJoinForm.jsp</h1>
					</div>

					<!-- 회원가입 양식 시작 -->
					<div class="row">
						<!-- <div class="col-lg-5 d-none d-lg-block bg-register-image"></div> -->
						<div class="col-xl-7 col-lg-7 ml-auto mr-auto">
							<div class="p-5">
								<div class="text-center">
									<h1 class="h4 text-gray-900 mb-4">계정생성</h1>
								</div>
								<form class="user" action="memberJoin" method="post" enctype="multipart/form-data" onsubmit="return joinFormCheck()">									
									<div class="form-group">

										<label for="inputMid" class="text-lg font-weight-bold">아이디</label>
										<input type="text" id="inputMid" class="form-control form-control-user"
											name="mid" placeholder="아이디 입력.."> <span id="idCheckMsg"
											style="color: red; font-size: 13px;"></span>
									</div>

									<div class="form-group">

										<label for="inputMpw" class="text-lg font-weight-bold">비밀번호</label>
										<input type="password" id="inputMpw" class="form-control form-control-user"
											name="mpw" placeholder="비밀번호 입력..">

									</div>

									<div class="form-group row">

										<div class="col-sm-6 mb-3 mb-sm-0">
											<label for="inputMname" class="text-lg font-weight-bold">이름</label>
											<input type="text" id="inputMname" class="form-control form-control-user"
												name="mname" placeholder="이름 입력..">
										</div>

										<div class="col-sm-6">

											<label for="inputMbirth" class="text-lg font-weight-bold">생년월일</label>
											<input type="date" id="inputMbirth" class="form-control form-control-user"
												name="mbirth" placeholder="생년월일..">
										</div>

									</div>

									<div class="form-group">

										<label for="inputMemail" class="text-lg font-weight-bold">이메일</label>
										<input type="email" id="inputMemail" class="form-control form-control-user"
											name="memail" placeholder="이메일 입력..">

									</div>
									<div class="form-group row">
										<div class="col-12 mb-3 mb-sm-0">
											<label for="inputMaddress" class="text-lg font-weight-bold">주소</label>
										</div>
										<div class="col-sm-6 mb-3 mb-sm-0">
											<input type="text" class="form-control form-control-user"
												name="mpostcode" id="sample6_postcode" placeholder="우편번호">
										</div>
										<div class="col-sm-6">
											<input type="button"
												class="btn btn-primary btn-user btn-block" value="우편번호찾기" onclick="sample6_execDaumPostcode()">
										</div>
									</div>
									<div class="form-group">
										<input type="text" class="form-control form-control-user"
											name="maddr" id="sample6_address" placeholder="주소">
									</div>
									<div class="form-group row">
										<div class="col-sm-6 mb-3 mb-sm-0">
											<input type="text" class="form-control form-control-user"
												name="mdetailAddr" id="sample6_detailAddress" placeholder="상세주소">
										</div>
										<div class="col-sm-6 mb-3 mb-sm-0">
											<input type="text" class="form-control form-control-user"
												name="mextraAddr" id="sample6_extraAddress" placeholder="참고항목">
										</div>
									</div>
									<div class="form-group">
										<label for="inputMfile" class="text-lg font-weight-bold">프로필이미지</label>
											<input type="file" class="form-control form-control-user"
												name="mfile" id="inputMfile">
									</div>
									<button type="submit"
										class="btn btn-primary btn-user btn-block">계정생성</button>

								</form>
							
							<hr>
							<div class="text-center">
								<a class="small" href="forgot-password.html">Forgot
									Password?</a>
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
	<!-- 다음우편번호 서비스 -->	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="${pageContext.request.contextPath }/resources/memberJs/daumPostCode.js"></script>
	
	<script type="text/javascript">
		var inputIdCheck = false;
	
		$(document).ready(function(){
			console.log("스크립트 확인!");
			
			$("#inputMid").focusout(function(){
				var inputId = $("#inputMid").val();
				console.log("inputId : " + inputId);
				
				if( inputId.length == 0 ){
					$("#idCheckMsg").text("아이디를 입력해주세요!").css("color","red");
					inputIdCheck = false;
				} else {
					
					$.ajax({
						type : "get",
						url : "memberIdCheck",
						data : {"inputId" : inputId},
						success : function(result){
						if( result == "OK"){	
							$("#idCheckMsg").text("사용가능한 아이디입니다!").css("color","green");
							inputIdCheck = true;
						} else {
							$("#idCheckMsg").text("이미 사용중인 아이디입니다!").css("color","red");
							inputIdCheck = false;
						}
					}
					});
				}
				
			})
												
		});
	
	</script>
	<script type="text/javascript">
	function joinFormCheck(){
		// 아이디 입력확인 
		if( !inputIdCheck ){
			alert("아이디를 입력해주세요!");
			$("#inputMid").focus();
			return false;
		}
		// 비밀번호 입력 확인 
		if( $("#inputMpw").val().length == 0 ){
			alert("비밀번호를 입력해주세요!");
			$("#inputMpw").focus();
			return false;
		}
		// 이름 입력 확인 
		if( $("#inputMname").val().length == 0 ){
			alert("이름을 입력해주세요!");
			$("#inputMname").focus();
			return false;
		}
		
		
	}
	
	
	</script>
</body>
</html>