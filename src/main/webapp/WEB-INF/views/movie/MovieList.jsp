<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>영화목록</title>
	
	<style type="text/css">
		.mvTitle{
			overflow: hidden;
			text-overflow: ellipsis;
			white-space: nowrap;
			max-width: 100%;
		}
		.mvTitle a:hover {
			text-decoration: none;
        }
	</style>
	
    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath }/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
	<script src="https://kit.fontawesome.com/d70fa0d402.js" crossorigin="anonymous"></script>
    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath }/resources/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <%@ include file="../includes/SideBar.jsp" %>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <%@ include file="../includes/TopBar.jsp" %>            
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                     <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">영화목록페이지-MovieList.jsp</h1>
                    </div>                                  

				<!--  -->
							
				<!--  -->
					<div class="row">
						
							
								<c:forEach items="${mvList }" var="mvList">
									<!-- Earnings (Monthly) Card Example -->
									<div class="col-xl-3 col-md-6 col-sm-6 mb-4">
										<div class="card shadow h-100">
											<div class="card-header">
												<a href="${pageContext.request.contextPath }/movieView?mvcode=${mvList.mvcode }">
												<img class="img-fluid" alt="" src="${mvList.mvposter }">
												</a>
											</div>
											<div class="card-body pb-0">
												<div class="row no-gutters align-items-center">
													<div class="col mr-1">
														<div class="h4 mb-0 font-weight-bold text-gray-800 mvTitle">
															<a href="movieView?mvcode=${mvList.mvcode }">${mvList.mvname }</a>	
														  </div>
														</div>
													</div>
											    </div>
													<div class="card-footer mb-1" style="background-color : white; border-top:0px;">
														<div class="text-lg font-weight-bold text-gray-900">
														예매율 ${mvList.reservationRatio }% ::  <i class="fa-regular fa-thumbs-up text-primary"></i> ${mvList.goodlike } | <i class="fa-regular fa-thumbs-down text-danger"></i> ${mvList.badlike }
														</div>
														<div class="text-xs font-weight-bold text-gray-900 mb-1">
															${mvList.mvopen }개봉
														</div>
														<a class="btn-sm btn-danger" href="movieReservationPage?mvcode=${mvList.mvcode }">예매하기</a>
													</div>
												</div>
											</div>
									 </c:forEach>
									
								
							</div>
					<!--  -->      
                
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
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath }/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath }/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath }/resources/js/sb-admin-2.min.js"></script>
	
	<script type="text/javascript">
	var checkMsg = '${msg}';
	if( checkMsg.length > 0 ){
		alert(checkMsg);
	}
	
	</script>
</body>

</html>