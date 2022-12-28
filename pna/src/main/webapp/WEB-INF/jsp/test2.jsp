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






<!-- Bootstrap core CSS -->
<%-- <link href="${pageContext.request.contextPath}/css/bootstrap5.0.2/assets/dist/css/bootstrap.min.css" rel="stylesheet"> --%>
<link href="${pageContext.request.contextPath}/aa/bootstrap-5.0.2/dist/css/bootstrap.css" rel="stylesheet">

<!-- modal -->
<%-- <link href="${pageContext.request.contextPath}/aa/css/bootstrap.css" rel="stylesheet" id="bootstrap-css"> --%>
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"> --%>
<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/css/bootstrap5.0.2/sidebars/sidebars.css" rel="stylesheet">
<!-- 이미지 파일 -->
<link href="${pageContext.request.contextPath}/images/bootstrap-icons/bootstrap-icons.css" rel="stylesheet" >

<!-- jqgrid -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/ui.jqgrid.css">


<link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet">





<script src="${pageContext.request.contextPath}/js/jquery-3.6.1.min.js"></script>
<script src="${pageContext.request.contextPath}/aa/js/bootstrap.bundle.js"></script> <!-- 없으면 modal 안됨 -->
<script src="${pageContext.request.contextPath}/aa/bootstrap-5.0.2/dist/js/bootstrap.bundle.js"></script>
<%-- <script	src="${pageContext.request.contextPath}/css/bootstrap5.0.2/assets/dist/js/bootstrap.bundle.min.js"></script> <!-- 없으면 sidebar 안됨 --> --%>
<script	src="${pageContext.request.contextPath}/css/bootstrap5.0.2/sidebars/sidebars.js"></script>
<script src="${pageContext.request.contextPath}/js/loadingoverlay.min.js"></script>

<!-- jqgrid -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/grid.locale-kr.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.jqGrid.min.js"></script>
<!-- modal -->
<%-- <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script> --%>

































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
	$('#btn_pwChange').attr("data-target","#pwChangeModalpopup");
}

function goPwSave() {
	
	 $('#exampleModal').modal('hide');
	console.log("dd");
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
                   	<a href="javascript:goPwChange();" data-toggle="tooltip" title="비밀번호변경"><span class="btn btn-secondary" data-toggle="modal" id="btn_pwChange" name="btn_pwChange"><i class="bi bi-key-fill"></i></span></a>
                	<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
  Launch demo modal
</button>
                </div>
            </div>
        </nav>
	</div>
</div>

<div class="modal fade" id="pwChangeModalpopup" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"><b><i class="bi bi-clipboard-plus"></i> 비밀번호 변경</b></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
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
        <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal"><i class="bi bi-x"></i> 닫기</button>
      </div>
    </div>
  </div>
</div>



<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-sm btn-primary" onclick="javascript:goPwSave()"><i class="bi bi-save"></i> 저장</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>