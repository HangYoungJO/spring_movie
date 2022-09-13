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

    <title>스케줄 관리</title>
	
    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath }/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
	<script src="https://kit.fontawesome.com/d70fa0d402.js" crossorigin="anonymous"></script>
    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath }/resources/css/sb-admin-2.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
	<style type="text/css">
	td{
	color: black;
	
	
	} 
	
	th, td{
	text-align: center;
	
	}
	
	.btn_dNone{
			display: none;
		}
	
	
	
	</style>
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <%@ include file="../includes/AdminSideBar.jsp" %>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <%@ include file="../includes/AdminTopBar.jsp" %>            
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                     <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">관리자스케줄관리페이지-AdminSchedulesPage.jsp</h1>
                    </div>                                  

				<!--  -->
							
				<!--  -->
					<div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">스케줄관리</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>  	
                                            <th>상영관</th>
                                            <th>날짜및시간</th>
                                            <th>극장코드</th>
                                            <th>영화코드</th>                                          
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>  	
                                            <th>상영관</th>
                                            <th>날짜및시간</th>
                                            <th>극장코드</th>
                                            <th>영화코드</th>                                          
                                            <th></th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    
                                    <c:forEach items="${scList }" var="scList">
                                        <tr class="font-weight-bold">
                                            <td class="align-middle">
                                           		 ${scList.scroom }
                                            </td>
                                             <td class="align-middle font-weight-bold">
                                           		 ${scList.scdate } 
                                            </td>                                    
                                            	<td class="align-middle font-weight-bold">${scList.scthcode }</td>
                                            	<td class="align-middle font-weight-bold">${scList.scmvcode }</td>                           
                                            	<td class="align-middle">
                                                <a href="SchedulesCancel?scroom=${scList.scroom }" class="btn btn-danger p-2 font-weight-bold">삭제</a>
                                               	 
                                               
                                            </td>                                   
                                        </tr>
                                    </c:forEach>                                                                           
                                    </tbody>
                                </table>
                            </div>
                        </div>
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
	<!-- Page level plugins -->
    <script src="${pageContext.request.contextPath }/resources/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="${pageContext.request.contextPath }/resources/js/demo/datatables-demo.js"></script>
	
	<script type="text/javascript">
	var checkMsg = '${msg}';
	if( checkMsg.length > 0 ){
		alert(checkMsg);
	}
	
	</script>
</body>


</html>