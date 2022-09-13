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

    <title>극장관리</title>
	
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
                        <h1 class="h3 mb-0 text-gray-800">관리자극장관리페이지-AdminTheaterList.jsp</h1>
                    </div>                                  

				<!--  -->
							
				<!--  -->
					<div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">극장관리</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>  	
                                            <th>극장코드</th>
                                            <th>극장이름</th>
                                            <th>극장주소</th>
                                            <th>극장전화번호</th>                                          
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                       <tr>   	
                                           <th>극장코드</th>
                                            <th>극장이름</th>
                                            <th>극장주소</th>
                                            <th>극장전화번호</th>                                          
                                            <th></th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    
                                    <c:forEach items="${thList }" var="thList">
                                        <tr class="font-weight-bold">
                                            <td class="align-middle">
                                           		 ${thList.thcode }
                                            </td>
                                             <td class="align-middle font-weight-bold">
                                           		 ${thList.thname } 
                                            </td>                                    
                                            	<td class="align-middle font-weight-bold">${thList.thaddr }</td>
                                            	<td class="align-middle font-weight-bold">${thList.thtel }</td>                           
                                            	<td class="align-middle">
                                                 <button onclick="adminThViewShow('${thList.thcode }')" class="btn btn-success font-weight-bold">상세정보</button>
                                                <c:choose>
                                            		<c:when test="${thList.thstate == '1' }">                 
                              			
                                            			<button onclick="modifyThState(this,'${thList.thcode }')" class="btn btn-primary font-weight-bold">사용</button>
                                            			
                                            		</c:when>
                                            		<c:when test="${thList.thstate == '0' }">
                                           			                                            			
                                            			<button onclick="modifyThState(this,'${thList.thcode }')" class="btn btn-danger font-weight-bold">중지</button>
                                            		
                                            		</c:when>                                           		
                                            </c:choose> 
                                               
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
	
	<!-- 관람평 보기 Modal -->
	<div class="modal fade" id="adminThViewModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document" style="max-width: 800px;" >
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title text-gray-900 text-primary font-weight-bold" id="exampleModalLabel">극장상세 정보</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
							<div class="row">
								<div class="col-12">
									<div class="text-gray-900">
                                            <!-- Form Row-->
                                            <div class="row gx-3 mb-3">
                                                <!-- Form Group (극장코드)-->
                                                <div class="col-md-6 font-weight-bold">
                                                    <label class="small mb-1" for="thcode">극장코드</label>
                                                    <input class="form-control" id="thcode" name="thcode" type="text"  readonly="readonly" value="">
                                                </div>
                                            </div>
                                            <!-- Form Group (극장이름)-->
                                            <div class="mb-3">
                                                <label class="small mb-1" for="thname">극장이름</label>
                                                <input class="form-control" id="thname" name="thname" type="text" readonly="readonly"  value="">
                                            </div>
                                            <!-- Form Row        -->
                                            <div class="row gx-3 mb-3">
                                                <!-- Form Group (주소)-->
                                                <div class="col-md-6">
                                                    <label class="small mb-1" for="thaddr">극장주소</label>
                                                    <input class="form-control" id="thaddr" name="thaddr" type="text" readonly="readonly" >
                                                </div>
                                                <!-- Form Group (전화번호)-->
                                                <div class="col-md-6">
                                                    <label class="small mb-1" for="thtel">전화번호</label>
                                                    <input class="form-control" id="thtel" name="thtel" type="text" readonly="readonly"  >
                                                </div>
                                            </div>
                                            <button class="btn btn-primary " type="button"  id="openBtn" onclick="modifyOpen()" >정보수정</button>
                                            <button class="btn btn-danger btn_dNone" id="submitBtn" type="button"  onclick="modifyTheater()">수정하기</button>
                                            <button class="btn btn-secondary btn_dNone" id="closeBtn" type="button" onclick="modifyClose()" >취소</button>
									</div>
								</div>

							</div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary" type="button" data-dismiss="modal">닫기</button>
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
	<!-- Page level plugins -->
    <script src="${pageContext.request.contextPath }/resources/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="${pageContext.request.contextPath }/resources/js/demo/datatables-demo.js"></script>
	
	<script type="text/javascript">
	function modifyThState(btnObj, thcode) {
		console.log("극장코드 : " + thcode);
		console.log($(btnObj).text());
		
		if( $(btnObj).hasClass("btn-primary") ){
			var thstate = '0';
		} else if( $(btnObj).hasClass("btn-danger") ) {
			var thstate = '1';
		}
		console.log(thstate);
	

	$.ajax({
		type : "get",
		url : "adminModifyThState",
		data : { "thcode" : thcode, "thstate" : thstate },
		success : function(result){	
			console.log("result : " + result);
			if( result == '1' ){
				$(btnObj).toggleClass("btn-primary");	
				$(btnObj).toggleClass("btn-danger");
				if( thstate == '0'){
					$(btnObj).text("중지");
				} else if ( thstate == '1'){
					$(btnObj).text("사용");
				}
			}
		}
		
	});
		

	}
	
	function adminThViewShow(thcode){
		console.log(thcode); 
		
		$.ajax({
			url : "adminGetThInfo",
			type : "get",
			data : { "thcode" : thcode },
			dataType : "json",
			async : false,
			success : function(result) {
				$("#thname").attr("readonly","readonly");
				$("#thaddr").attr("readonly","readonly");
				$("#thtel").attr("readonly","readonly");
				$("#openBtn").addClass("btn_dNone");
				$("#submitBtn").addClass("btn_dNone");
				$("#closeBtn").addClass("btn_dNone");
				$("#openBtn").removeClass("btn_dNone");
				
				$("#thcode").val(result.thcode);
				$("#thname").val(result.thname);
				$("#thaddr").val(result.thaddr);
				$("#thtel").val(result.thtel);
				thInfoVal = result;
			}
			
		});					
		$("#adminThViewModal").modal('show');
		
	}
	var thInfoVal = "";
	
	function modifyOpen() {
		$("#openBtn").toggleClass("btn_dNone");
		$("#submitBtn").toggleClass("btn_dNone");
		$("#closeBtn").toggleClass("btn_dNone");
		$("#thname").removeAttr("readonly");
		$("#thaddr").removeAttr("readonly");
		$("#thtel").removeAttr("readonly"); 
	}
	
	function modifyClose(preCheck) {
		$("#openBtn").toggleClass("btn_dNone");
		$("#submitBtn").toggleClass("btn_dNone");
		$("#closeBtn").toggleClass("btn_dNone");
		$("#thname").attr("readonly","readonly");
		$("#thaddr").attr("readonly","readonly");
		$("#thtel").attr("readonly","readonly");
		
		if(preCheck){
			previousThInfo();
		}
	}
	
	function previousThInfo() {
		$("#thcode").val(thInfoVal.thcode);
		$("#thname").val(thInfoVal.thname);
		$("#thaddr").val(thInfoVal.thaddr);
		$("#thtel").val(thInfoVal.thtel);
	}
	
	
	function modifyTheater() {
		var thcode = $("#thcode").val();
		var thname = $("#thname").val();
		var thaddr = $("#thaddr").val();
		var thtel = $("#thtel").val(); 
		
		$.ajax({
			type : "get",
			url : "adminModifyThInfo",
			data : { "thcode" : thcode, "thname" : thname, "thaddr" : thaddr, "thtel" : thtel },
			success : function(result){	
				console.log(result);
				modifyClose(false);
				thInfoVal.thcode = thcode;
				thInfoVal.thname = thname;
				thInfoVal.thaddr = thaddr;
				thInfoVal.thtel = thtel;
				
				alert("정보가 수정되었습니다!");
			}
			
		});
	}
	
	$("#adminThViewModal").on('hide.bs.modal', function(){
		/* alert("모달창 닫히기 전!"); */
	});
	
	$("#adminThViewModal").on('hidden.bs.modal', function(){
		/* alert("모달창 닫힘 후!"); */
	});
	
	$("#adminThViewModal").on('show.bs.modal', function(){
		/* alert("모달창 열리기 전!"); */
	});
	
	$("#adminThViewModal").on('shown.bs.modal', function(){
		/* alert("모달창 열린 후!"); */
	});
	</script>
	
	
</body>


</html>