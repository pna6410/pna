<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>

<!-- css -->
<link href="${pageContext.request.contextPath}/c5.0.2/css/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/images/bootstrap-icons/bootstrap-icons.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/css/bootstrap5.0.2/sidebars/sidebars.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet">
<!-- jqgrid -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/ui.jqgrid.css">


<!-- js -->
<script src="${pageContext.request.contextPath}/js/jquery-3.6.1.min.js"></script>
<script src="${pageContext.request.contextPath}/c5.0.2/js/bootstrap.bundle.js"></script>
<!-- jqgrid -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/grid.locale-kr.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.jqGrid.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/loadingoverlay.min.js"></script>

<script language=javascript>

	$(document).ready(function () {
	    $('#sidebarCollapse').on('click', function () {
	        $('#sidebar').toggleClass('active');
	    });
	    $("body").tooltip({ selector: '[data-toggle=tooltip]',placement: 'bottom' });  // body 안의 모든 data-toggle=tooltip인 것들은 전부 아래로 title값이 나오도록 설정
	    
	    
	    menuParentIdSelect = sessionStorage.getItem("menuParentIdSelect");
	    menuIdSelect = sessionStorage.getItem("menuIdSelect");
	
	    if (menuParentIdSelect != null && menuParentIdSelect != '') {
	  	$('#homeSubmenu_' + menuParentIdSelect).addClass("show");
	  	$('#ahomeSubmenu_' + menuParentIdSelect).attr("aria-expanded",true);
	    }
	});
	
	function logout() {
		topLoginfm.action = "<c:url value='/logout.do'/>";
		topLoginfm.submit();
	}
	
	function loadingOn() { /* js 파일 있어야함 */
		$.LoadingOverlay("show", {
			background       : "rgba(0, 0, 0, 0.5)",
			image            : "",
			maxSize          : 60,
			fontawesome      : "fa fa-spinner fa-pulse fa-fw",
			fontawesomeColor : "#FFFFFF",
		});
	}
	function loadingOff() {
		$.LoadingOverlay("hide");
	}
	
	function loadProgram(parentMenuId,menuId,menuname,progrmaUrl,projectid) {
		sessionStorage.setItem("menuParentIdSelect",parentMenuId);
		sessionStorage.setItem("menuIdSelect",menuId);
	/* 	$('#topMenuId').val(parentMenuId);
		$('#leftMenuId').val(menuId);
		$('#leftMenuName').val(menuname);
		$('#searchprojectid').val(projectid); */
		$('#topMenuFrom').attr("action","${pageContext.request.contextPath}"+progrmaUrl);
		$('#topMenuFrom').submit();
	}
	
	function goPwChange() {
		$('#pwInputForm').each(function() {this.reset();});
		/* $('#btn_pwChange').attr("data-bs-target","#pwChangeModalpopup"); */
	}
	
	function goPwSave() {
		
		var usr_pwd = $("#userPassword").val();
		var usr_rep_pwd = $("#userRepassword").val();
		var blank_pattern = /[\s]/g;
		var usrPwd = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=()-])(?=.*[0-9]).{6,20}$/;
	
		if(usr_pwd ==""){
			alert("비밀번호 입력 해주세요");
			$("#userPassword").focus();
			return;
		}
	
		if(usr_pwd != usr_rep_pwd ){
			alert("비밀번호가 일치 하지 않습니다.");
			$("#userRepassword").focus();
			return;
		}
	
		if( blank_pattern.test(usr_pwd) == true){
		   alert('공백은 사용할 수 없습니다.');
		   $("#userRepassword").focus();
		   return;
		}
	
		/* if(!usrPwd.test(usr_pwd)){
			alert("비밀번호는 6~20자 이내의 영문/숫자/특수문자 조합 입니다.");
			$("#userPassword").focus();
			return;
		} */
	
	    loadingOn();
	
	    $.ajax({
	        type : "POST",
	        url : "${pageContext.request.contextPath}/system/userPwUpdate.ajax",
	        data : "userPw="+usr_pwd,
	        async: false,
	        success : function(data){
	        	if(data != null) {
	        		alert("정상적으로 처리되었습니다.")
	        		/* goSearch(); */
	        	}
	        },
	        error : function(XMLHttpRequest, textStatus, errorThrown){
	            alert("작업 중 오류가 발생하였습니다.")
	        }
	    });
	
		loadingOff();
		
		$('#pwChangeModalpopup').modal('hide');	
	}
</script>

</head>
<body>
<form id="topMenuFrom" name="topMenuFrom" method="POST" action="<c:url value='/main.do'/>">
</form>
<form id="topLoginfm" name="topLoginfm"></form>

<div class ="wrapper">
	<nav id = "sidebar">
		<div class="flex-shrink-0 p-3 bg-white" >
			<a href="/pna/main.do"	class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
				<!-- <svg class="bi pe-none me-2" width="30" height="24"><use xlink:href="#bootstrap"></use></svg> -->
				<span class="fs-5 fw-semibold">메인 제목 넣을 곳</span>
			</a>
			<ul class="list-unstyled ps-0">
				<li class="mb-1">
					<button	class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="false">Home</button>
					<div class="collapse" id="home-collapse">
						<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
							<li><a href="javascript:loadProgram('1','2','사용자관리','/test.do','00001')"
								class="link-dark d-inline-flex text-decoration-none rounded">Overview</a></li>
							<li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">Updates</a></li>
							<li><a href="#"	class="link-dark d-inline-flex text-decoration-none rounded">Reports</a></li>
						</ul>
					</div>
				</li>
				<li class="mb-1">
					<button	class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="false">Dashboard</button>
					<div class="collapse" id="dashboard-collapse">
						<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
							<li><a href="javascript:loadProgram('2','3','사용자관리','/test2.do','00001')"
								class="link-dark d-inline-flex text-decoration-none rounded">Overview</a></li>
							<li><a href="#"	class="link-dark d-inline-flex text-decoration-none rounded">Weekly</a></li>
							<li><a href="#"	class="link-dark d-inline-flex text-decoration-none rounded">Monthly</a></li>
							<li><a href="#"	class="link-dark d-inline-flex text-decoration-none rounded">Annually</a></li>
						</ul>
					</div>
				</li>
				<li class="mb-1">
					<button	class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false">Orders</button>
					<div class="collapse" id="orders-collapse">
						<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
							<li><a href="#"	class="link-dark d-inline-flex text-decoration-none rounded">New</a></li>
							<li><a href="#"	class="link-dark d-inline-flex text-decoration-none rounded">Processed</a></li>
							<li><a href="#"	class="link-dark d-inline-flex text-decoration-none rounded">Shipped</a></li>
							<li><a href="#"	class="link-dark d-inline-flex text-decoration-none rounded">Returned</a></li>
						</ul>
					</div>
				</li>
				<li class="border-top my-3"></li>
				<li class="mb-1">
					<button	class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#account-collapse"	aria-expanded="false">Account</button>
					<div class="collapse" id="account-collapse">
						<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
							<li><a href="#"	class="link-dark d-inline-flex text-decoration-none rounded">New...</a></li>
							<li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">Profile</a></li>
							<li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">Settings</a></li>
							<li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">Signout</a></li>
						</ul>
					</div>
				</li>
			</ul>
		</div>
		<div class="flex-shrink-0 p-3 bg-white" >
			<a href="/pna/main.do"	class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
				<!-- <svg class="bi pe-none me-2" width="30" height="24"><use xlink:href="#bootstrap"></use></svg> -->
				<span class="fs-5 fw-semibold">메인 제목 넣을 곳</span>
			</a>
		<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
			<ul class="list-unstyled components">
	       	    <c:forEach var="sideMenuList" items="${sideMenuList}" varStatus="status">
	       	    	<c:if test="${status.index == 0}">
	       	    		<li class="mb-1">
	       	    			<button	class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#homeSubmenu_${sideMenuList.menuId}" aria-expanded="false"><c:out value="${sideMenuList.menuName}" escapeXml="true"></c:out></button>           	    		
	       	    			<div class="collapse" id="homeSubmenu_${sideMenuList.menuId}">
								<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">           	    		
	       	    	</c:if>
	       	     	<c:if test="${status.index > 0 && sideMenuList.level==1}">
	       	    				</ul>
	       	    			</div>
	       	    		</li>
	       	    		<li class="mb-1">
	       	    		  <button	class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#homeSubmenu_${sideMenuList.menuId}" aria-expanded="false"><c:out value="${sideMenuList.menuName}" escapeXml="true"></c:out></button>           	    		
	       	    			<div class="collapse" id="homeSubmenu_${sideMenuList.menuId}">
								<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
	       	    	</c:if>
	       	    	<c:if test="${status.index > 0 && sideMenuList.level==2}">
	       	    		<li><a href="javascript:loadProgram('${sideMenuList.parentMenuId}','${sideMenuList.menuId}','${sideMenuList.menuName}','${sideMenuList.programUrl}','${sideMenuList.projectId}')"
									class="link-dark d-inline-flex text-decoration-none rounded"><c:out value="${sideMenuList.menuName}" escapeXml="true"></c:out></a></li>           	    		
	       	    	</c:if>
				</c:forEach>
	
	    			</ul>
	    		</li>
			</ul>	
		</div>		
	</nav>
	<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
	<div id = "content">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                	<button type="button" id="sidebarCollapse" class="btn btn-secondary"><i class="bi bi-list"></i></button>
                   	<a href="<c:url value='/main.do'/>" data-toggle="tooltip" title="메인화면"><span class="btn btn-secondary"><i class="bi bi-house-door"></i></span></a>
                   	<a href="javascript:logout();" data-toggle="tooltip" title="로그아웃"><span class="btn btn-secondary"><i class="bi bi-box-arrow-right"></i></span></a> 
                   	<!-- <a href="javascript:goPwChange();" data-toggle="tooltip" title="비밀번호변경"><span class="btn btn-secondary" data-bs-toggle="modal" id="btn_pwChange" name="btn_pwChange"><i class="bi bi-key-fill"></i></span></a> -->                	
                   	<a href="javascript:goPwChange();" data-toggle="tooltip" title="비밀번호변경"><span class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#pwChangeModalpopup" id="btn_pwChange" name="btn_pwChange"><i class="bi bi-key-fill"></i></span></a>
                </div>
            </div>
        </nav>
		<!-- 본문 -->
		  	<c:if test="${pageUrl != null && pageUrl != '' }">
		    	<jsp:include page="/WEB-INF/jsp/${pageUrl}" flush="true"/>
		    </c:if>
		  <!-- /본문 -->
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="pwChangeModalpopup" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">비밀번호 변경</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	<form id="pwInputForm" name="pwInputForm">
		  <input type="hidden" id="inputtype" name="inputtype">
		  <div class="form-group required control-label">
		    <label for="userPassword"><i class="bi bi-check2-circle"></i> 신규 비밀번호</label>
		    <input type=password class="form-control" id="userPassword" name="userPassword" maxlength="20">
		  </div>
		  <div class="form-group required control-label">
		    <label for="userRepassword"><i class="bi bi-check2-circle"></i> 확인 비밀번호</label>
		    <input type="password" class="form-control" id="userRepassword" name="userRepassword" maxlength="20">
		  </div>
		</form>
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-sm btn-primary" onclick="javascript:goPwSave()"><i class="bi bi-save"></i> 저장</button>
        <button type="button" class="btn btn-sm btn-secondary" data-bs-dismiss="modal"><i class="bi bi-x"></i> 닫기</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>