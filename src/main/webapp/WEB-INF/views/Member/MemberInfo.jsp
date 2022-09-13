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
						<h1 class="h3 mb-0 text-gray-800">내정보페이지-MemberInfo.jsp</h1>
					</div>

					<!-- 회원가입 양식 시작 -->
					<div class="row">
                            <div class="col-xl-4">
                                <!-- Profile picture card-->
                                <div class="card mb-4 mb-xl-0">
                                    <div class="card-header text-primary font-weight-bold" style="color : #4e73df;">프로필이미지</div>
                                    <div class="card-body text-center">
                                        <!-- Profile picture image-->
                                        <img class="img-profile rounded-circle" src="${pageContext.request.contextPath }/resources/mprofileUpLoad/${sessionScope.loginProfile}">
                                        <!-- Profile picture help block-->
                                        <div class="small font-italic text-muted mb-4">JPG or PNG no larger than 5 MB</div>
                                        <!-- Profile picture upload button-->
                                        <button class="btn btn-primary" type="button">새 이미지 업로드</button>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-8">
                                <!-- Account details card-->
                                <div class="card mb-4">
                                    <div class="card-header text-primary font-weight-bold" style="color : #4e73df;">회원 정보</div>
                                    <div class="card-body">
                                        <form>
                                            <!-- Form Group (username)-->
                                            <div class="row gx-3 mb-3">
                                            <div class="col-md-6">
                                                <label class="small mb-1" for="inputUsername">이름</label>
                                                <input class="form-control" id="inputUsername" type="text" value="${memberInfo.mname }">
                                            </div>
                                            
                                            <div class="col-md-6">
                                                    <label class="small mb-1" for="inputBirthday">생일</label>
                                                    <input class="form-control" id="inputBirthday" type="text" name="birthday" value="${memberInfo.mbirth }">
                                            </div>
                                            </div>
                                            <!-- Form Row-->
                                            <div class="row gx-3 mb-3">
                                                <!-- Form Group (first name)-->
                                                <div class="col-md-6">
                                                    <label class="small mb-1" for="inputFirstName">아이디</label>
                                                    <input class="form-control" id="inputFirstName" type="text" value="${memberInfo.mid }">
                                                </div>
                                                <!-- Form Group (last name)-->
                                                <div class="col-md-6">
                                                    <label class="small mb-1" for="inputLastName">비밀번호</label>
                                                    <input class="form-control" id="inputLastName" type="password" value="${memberInfo.mpw }">
                                                </div>
                                            </div>                                       
                                             <div class="mb-3">
                                                <label class="small mb-1" for="inputEmailAddress">이메일</label>
                                                <input class="form-control" id="inputEmailAddress" type="email" value="${memberInfo.memail }">
                                            </div>
                                                <!-- Form Group (location)-->
                                            <div class="row gx-3 mb-3">
                                            <div class="col-md-6">
                                                <label class="small mb-1" for="inputUsername">우편번호</label>
                                                <input class="form-control" id="inputUsername" type="text" value="${memberInfo.mpostcode }">
                                            </div>
                                            </div>
                                                <div class="mb-3">
                                                    <label class="small mb-1" for="inputLocation">주소</label>
                                                    <input class="form-control" id="inputLocation" type="text" value="${memberInfo.maddr }">
                                                </div>
                                      	    <div class="row gx-3 mb-3">
                                            
                                            <div class="col-md-6">
                                                    <label class="small mb-1" for="inputBirthday">상세주소</label>
                                                    <input class="form-control" id="inputBirthday" type="text" name="birthday" value="${memberInfo.mdetailAddr }">
                                            </div>
                                            <div class="col-md-6">
                                                    <label class="small mb-1" for="inputBirthday">참고주소</label>
                                                    <input class="form-control" id="inputBirthday" type="text" name="birthday" value="${memberInfo.mextraAddr }">
                                            </div>
                                            </div>
                                            <!-- Form Group (email address)-->
                                           
                                            <!-- Form Row-->
                                            <div class="row gx-3 mb-3">
                                                <!-- Form Group (phone number)-->
                                                
                                                <!-- Form Group (birthday)-->
                                              
                                            </div>
                                            <!-- Save changes button-->
                                            <button class="btn btn-primary" type="button">내정보 수정</button>
                                        </form>
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
	