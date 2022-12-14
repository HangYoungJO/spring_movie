<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>시작페이지</title>

    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath }/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath }/resources/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body>

    <div class="container">

		<div class="card o-hidden border-0 shadow-lg " style="margin-top: 200px;">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				<div class="row">
						<div class="col-12">
							<div class="card mb-2">
                                <div class="card-header py-3 text-center ">
                                    <h6 class="m-0 font-weight-bold h5 ">시작페이지</h6>
                                </div>
                            </div>							
						</div>					
				
					<div class="col-xl-6 col-lg-6">
                        <div class="p-5">
                            <div class="text-center">
                            	<button onclick="adminMain()" class="btn btn-danger p-5 text-lg font-weight-bold">관리자 페이지</button>
                            </div>
                        </div>					
					</div>
					<div class="col-xl-6 col-lg-6">
                        <div class="p-5">
                            <div class="text-center">
                            	<a href="movieMain" class="btn btn-primary p-5 text-lg font-weight-bold">일반 페이지</a>
                            </div>
                        </div>					
					</div>
				</div>
			</div>
		</div>
	</div>
	
    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath }/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath }/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath }/resources/js/sb-admin-2.min.js"></script>
	
	<script type="text/javascript">
		function adminMain() {
			/* var confirmVal = confirm("확인"); */
			var inputPw = prompt("비밀번호 입력");
			location.href = "adminMain?inputPw="+inputPw;
		}
	
	
	
	
	
	</script>
	
	
</body>

</html>