<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>ICIA MOVIE</title>

    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath }/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath }/resources/css/sb-admin-2.min.css" rel="stylesheet">

	<style type="text/css">
	.listArea div{
		border-radius: 5px;	
	}
	
	.listArea{
	min-height: 300px;
	max-height: 300px;
	overflow: scroll;
	} 
	
	
	.listArea div:hover {
	cursor: pointer;
	}
	
	/* .listTitle{
	overflow: hidden;  
	text-overflow: ellipsis; 
	white-space: nowrap; 
	max-width: 100px; 
	}   */
	
	.selectReserve .card{
	/* min-height: 300px;
	max-height: 300px; */
	border: 0px; 
	}  
	
	.card{
	background-color: white;
	}
	
	.selectView{
	display: none;
	}
	
	.scTimeBtn{
	color: black;
	border: 1px solid darkgrey;
	}
	</style>
	
	<script type="text/javascript">
	var loginCheck = '${sessionScope.loginId}';
	if(loginCheck.length == 0){
		alert("로그인 후 이용가능합니다!");
		location.href= "MemberLoginForm";
	}
	
	</script>
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
                        <h1 class="h3 mb-0 text-gray-800">영화예매페이지-MovieReservationPage.jsp</h1>
                    </div>                                  

				<!--  -->
				<!-- 영화,극장,날짜및시간,상영관 선택 -->
				<div class="row" style="min-height : 400px;">
					<div class="col-xl-4 col-lg-6">
						<div class="card mb-2">
							<div class="card-header py-3 text-center bg-primary">
							<h6 class="m-0 font-weight-bold h5 text-white">영화
							</h6>
						</div>
						<div class="card-body listArea text-gray-900" id="mvList">
							<c:forEach items="${reMvList }" var="mvInfo">
							<div class="p-2 font-weight-bold text-lg listTitle" id="${mvInfo.mvcode }" onclick="mvSelect(this, '${mvInfo.mvcode }', '${mvInfo.mvposter }')">${mvInfo.mvname }</div>
							</c:forEach>
						
							</div>	
						</div>		
					</div>
					
					<div class="col-xl-3 col-lg-6">
						<div class="card mb-2">
							<div class="card-header py-3 text-center bg-primary">
							<h6 class="m-0 font-weight-bold h5 text-white">극장
							</h6>
						</div>
						<div class="card-body listArea text-gray-900" id="thList">		
						
							</div>	
						</div>		
					</div>
					
					<div class="col-xl-2 col-lg-6">
						<div class="card mb-2">
							<div class="card-header py-3 text-center bg-primary">
							<h6 class="m-0 font-weight-bold h5 text-white">날짜
							</h6>
						</div>
						<div class="card-body listArea text-gray-900 text-center" id="scDateList">		
						
							</div>	
						</div>		
					</div>
					
					<div class="col-xl-3 col-lg-6">
						<div class="card mb-2">
							<div class="card-header py-3 text-center bg-primary">
							<h6 class="m-0 font-weight-bold h5 text-white">상영관 및 시간
							</h6>
						</div>
						<div class="card-body listArea text-gray-900" id="scRoomTimeList">		
						
							</div>	
						</div>		
					</div>
				</div>
				
				<!--  -->
				<!-- 선책항목 확인 -->
					<div class="row selectReserve pt-2 bg-white">
					<!-- 선택 영화 정보 -->
						<div class="col-12">
							<div class="card mb-2">
								<div class="card-header py-3 text-center bg-primary">
									<h6 class="m-0 font-weight-bold h5 text-white">선택 정보 확인
									</h6>
								</div>
							</div>
						</div>		
						
						<div class="col-xl-3 col-md-4">
							<div class="card mb-2">
								<div class="card-body text-center align-items-center text-gray-900">
									<img class="img-fluid" id="viewSelMvPoster"
										style="max-height: 200px;">
									<div class="p-2 font-weight-bold text-lg" id="viewSelMvName">
									</div>
								</div>
							</div>
						</div>						
						
						<div class="col-xl-3 col-md-8"> 
							<div class="card mb-2">
                                <div class="card-body text-gray-900" >
                                	<div class="p-2 font-weight-bold text-lg" ><span class="selectView">극장 : </span> <span id="viewSelThName"></span>  </div>
                                	<div class="p-2 font-weight-bold text-lg" ><span class="selectView">일시 : </span> <span id="viewSelScDate"></span> <span id="viewSelScTime"></span> </div>
                                	<div class="p-2 font-weight-bold text-lg" ><span class="selectView">상영관 : </span> <span id="viewSelScRoom"></span> </div>
                                	<div class="p-2 font-weight-bold text-lg" ><span class="selectView">인원 : </span> <span id="viewSelPeople"></span> <span id="viewPeopleText" style="display: none;" >명</span></div>
                                </div>								
							</div>
						</div>
						
						
						<div class="col-xl-3 col-md-6">
							<div class="card mb-2">
								<div class="card-body text-gray-900" id="peopleList">	
									<div class="p-2 font-weight-bold text-lg"> 인원 선택 </div>
									<button class="btn btn-sm font-weight-bold ml-1 my-2 mr-1 scTimeBtn px-3 py-2" onclick="peopleSelect(this)">1</button>
									<button class="btn btn-sm font-weight-bold ml-1 my-2 mr-1 scTimeBtn px-3 py-2" onclick="peopleSelect(this)">2</button>
									<button class="btn btn-sm font-weight-bold ml-1 my-2 mr-1 scTimeBtn px-3 py-2" onclick="peopleSelect(this)">3</button>
									<button class="btn btn-sm font-weight-bold ml-1 my-2 mr-1 scTimeBtn px-3 py-2" onclick="peopleSelect(this)">4</button>
									<button class="btn btn-sm font-weight-bold ml-1 my-2 mr-1 scTimeBtn px-3 py-2" onclick="peopleSelect(this)">5</button>
								</div>
							</div>
						</div>
						
						<div class="col-xl-3 col-md-6">
							<div class="card mb-2">
								<div class="card-body">
									<form action="movieReservation" method="post" onsubmit="return reservationFormCheck();">
										<input type="text" name="remid" id="remid" value="${sessionScope.loginId }" placeholder="예매자 아이디...">
										<input type="text" name="rescthcode" id="rescthcode" placeholder="극장코드...">
										<input type="text" name="rescroom" id="rescroom" placeholder="상영관...">
										<input type="text" name="rescdate" id="rescdate" placeholder="날짜및시간...">
										<input type="text" name="reamount" id="reamount" placeholder="예매인원..."> 
										<input class="btn btn-danger font-weight-bold text-lg py-2" type="submit" value="예매하기">
									</form>
								</div>
							</div>
						</div>
					<!-- /.container-fluid -->
            </div>
            <!-- End of Main Content -->


        </div>
        <!-- End of Content Wrapper -->
	</div>
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
    <!-- End of Page Wrapper -->
	</div>
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
	
	<script type="text/javascript">
		var selectReMvcode = ""; // 선택한 영화코드
		var selectReThcode = ""; // 선택한 극장코드
		var selectReScDate = "";
		
	function mvSelect(selObj, selMvcode, selMvposter){
		selectReMvcode = selMvcode;
		
		/* 극장 선택 내용 초기화 */
		$("#viewSelThName").text("");
		/* 날짜 선택 내용 초기화 */
		$("#viewSelScDate").text("");
		/* 상영관 및 시간 내용 초기화*/
		$("#viewSelScRoom").text("");
		$("#viewSelScTime").text("");
		/* 날짜 목록 초기화 */
		$("#scDateList").html("");
		/* 상영관 및 시간 목록 초기화 */
		$("#scRoomTimeList").html("");
		
		/* 예매정보 폼 초기화 */
		$("#rescthcode").val("");
		$("#rescroom").val("");
		$("#rescdate").val("");
		
		// 영화목록 css 변경
		$("#mvList div").css("background-color","").css("color","");
		$(selObj).css("background-color","#5a5c69").css("color","white");
		console.log("선택한 영화 코드 : " + selMvcode);
		
		// 극장목록 조화 및 출력 		
		var output = "";
		$.ajax({
			type : "get",
			url : "getThList",
			data : { "mvcode" : selMvcode },
			dataType : "json",
			async : false,
			success : function(thList){
				for(var i = 0; i < thList.length; i++){
				console.log(thList[i].thname);
				output += "<div class=\"p-2 font-weight-bold text-lg listTitle\" onclick=\"thSelect(this,'"+thList[i].thcode+"')\">"+thList[i].thname+"</div>"
				}
			}
			
		});
		$("#thList").html(output);
		console.log("선택한 영화 제목 : " + $(selObj).text() );
		console.log("선택한 영화 포스터 : " + selMvposter);
		
		/* 선택내용 출력 */
		$("#viewSelMvPoster").attr("src",selMvposter);
		$("#viewSelMvName").text( $(selObj).text() );
	}
	/* 극장선택 */
	function thSelect(selObj, selThcode){
		selectReThcode = selThcode;
		selectReScDate = "";
		/* 날짜 선택 내용 초기화 */
		$("#viewSelScDate").text("");
		/* 상영관 및 시간 목록 초기화 */
		$("#scRoomTimeList").html("");
		/* 상영관 및 시간 선택 내용 초기화 */
		$("#viewSelScTime").text("");
		$("#viewSelScRoom").text("");
		/* 예매정보 폼 초기화 */
		$("#rescroom").val("");
		$("#rescdate").val("");
		
		// 극장목록 css 변경
		$("#thList div").css("background-color","").css("color","");
		$(selObj).css("background-color","#5a5c69").css("color","white");	
		console.log("선택한 극장 코드 : " + selThcode);
		console.log("선택한 극장 이름 : " + $(selObj).text());
		
		// 예매가능한 날짜 목록 조회 및 출력
		var output = "";		
		$.ajax({
			type : "get",
			url : "getScDateList",
			data : { "mvcode" : selectReMvcode, "thcode" : selThcode },
			dataType : "json",
			async : false,
			success : function(scDateList){				
				for(var i = 0; i < scDateList.length; i++){
					console.log(scDateList[i].scdate);
					output += "<div class=\"p-2 font-weight-bold text-lg listTitle\" onclick=\"scDateSelect(this,'"+scDateList[i].scdate+"')\">"+scDateList[i].scdate+"</div>"
					}
				}
			
		});
		$("#scDateList").html(output);
		
		/* 극장 선택 내용 출력 */
		$(".selectView").removeClass("selectView");
		$("#viewSelThName").text( $(selObj).text() );
		
		/* 예매정보 폼 */
		$("#rescthcode").val( selThcode );
	}
	
	function scDateSelect(selObj, selScDate){
		selectReScDate = selScDate;
		
		/* 날짜목록 css 변경 */
		$("#scDateList div").css("background-color","").css("color","");
		$(selObj).css("background-color","#5a5c69").css("color","white");	
		
		/* 선택 내용 초기화 */
		$("#viewSelScRoom").text("");
		$("#viewSelScTime").text("");
		
		/* 예매정보 폼 초기화 */
		$("#rescroom").val("");
		$("#rescdate").val("");
		
		// 예매가능한 상영관 및 시간 목록 조회 및 출력
		var output = "";		
		$.ajax({
			type : "get",
			url : "getScRoomTimeList",
			data : { "mvcode" : selectReMvcode, "thcode" : selectReThcode, "scdate" : selScDate },
			dataType : "json",
			async : false,
			success : function(scRoomTimeList){	
				console.log(scRoomTimeList);
				var scRoom = ""; //상영관
				for(var i = 0; i < scRoomTimeList.length; i++){
					if( scRoom != scRoomTimeList[i].scroom){
						if( i != 0 ){
							output += "<hr class=\"my-1\">";
						}
						output += "<div class=\"p-1 font-weight-bold text-lg\">"+scRoomTimeList[i].scroom+"</div>"
						scRoom = scRoomTimeList[i].scroom;	
					}
					output += "<button class=\"btn btn-sm font-weight-bold mx-1 my-2 scTimeBtn\" onclick=scRoomTimeSelect(this,'"+scRoomTimeList[i].scroom+"') >"+scRoomTimeList[i].scdate+"</button>"
							  
					}
				}
			
		});
		$("#scRoomTimeList").html(output);
		
		/* 선택내용 출력 */
		$("#viewSelScDate").text( $(selObj).text() );

	}
	
	function scRoomTimeSelect(selObj, scroom){
		/* 상영관 및 시간 목록 css 변경 */
		$("#scRoomTimeList button").css("background-color","").css("color","");
		$(selObj).css("background-color","#5a5c69").css("color","white");
		
		/* 상영관 및 시간 선택 내역 출력 */
		$("#viewSelScTime").text( $(selObj).text() );
		$("#viewSelScRoom").text(scroom);
		
		/* 예매정보 폼 */
		$("#rescdate").val(selectReScDate +" " +$(selObj).text());
		$("#rescroom").val(scroom);
	}

	function peopleSelect(selObj){
		/* 인원수 선택 목록 css 변경 */
		$("#peopleList button").css("background-color","").css("color","");
		$(selObj).css("background-color","#5a5c69").css("color","white");

		/* 예매인원 수 선택 내용 출력 */
		$("#viewSelPeople").text( $(selObj).text() );
		$("#viewPeopleText").text("display","");
		
		/* 예매정보 폼 */
		$("#reamount").val($(selObj).text());
	}	
		
	function reservationFormCheck(){
		if(selectReMvcode.length == 0){
			alert("영화를 선택해주세요!");
			return false;
		}
		if( $("#rescthcode").val().length == 0 ){
			alert("극장을 선택해 주세요!");
			return false;
		}
		if( selectReScDate.length == 0 ){
			alert("날짜를 선택해 주세요!");
			return false;
		}
		if( $("#rescroom").val().length == 0 || $("#rescdate").val().length == 0){
			alert("상영관 및 시간을 선택해주세요!");
			return false;
		}
		if( $("#reamount").val().length == 0 ){
			alert("예매인원을 선택해 주세요!");
			return false;
		}
	
		if( $("#remid").val().length == 0 ){
			alert("로그인후 이용 가능 합니다.");
			return false;
	}	
		//return false;
}	
		
		
	</script>
	
	<script type="text/javascript">
	var checkMvCode = '${param.mvcode}';
	console.log("checkMvCode : " + checkMvCode);
	if( checkMvCode.length > 0 ){
		$("#"+checkMvCode).click();
	}
	</script>
</body>

</html>