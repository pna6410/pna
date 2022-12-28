<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


</head>
<body>

<div class="container float-left">
	<button type="button" class="btn btn-sm btn-primary" id="btn_input" name="btn_input" data-toggle="modal" data-target="#modalpopup"><i class="bi bi-pencil-fill"></i> 추가</button>
</div>

<div class="modal fade" id="modalpopup" name="modalpopup" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"><b><i class="bi bi-clipboard-plus"></i> 사용자 추가/수정</b></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
		<form id="inputForm" name="inputForm">
		  <input type="hidden" id="inputtype" name="inputtype">
		  <div class="form-group required control-label">
		    <label for="userId"><i class="bi bi-check2-circle"></i> 사용자 ID</label>
		    <input type="text" class="form-control" id="userId" name="userId" maxlength="10">
		  </div>
		  <div class="form-group required control-label">
		    <label for="userName"><i class="bi bi-check2-circle"></i> 사용자</label>
		    <input type="text" class="form-control" id="userName" name="userName" maxlength="50">
		  </div>
		  <div class="form-group required control-label">
		    <label for="userGrade"><i class="bi bi-check2-circle"></i> 사용자권한</label>
  		    <select class="form-control" id="userGrade" name="userGrade">
        		<c:forEach var="systemGrade" items="${systemGrade}" varStatus="status">
        			<option value="${systemGrade.code}">${systemGrade.codename}</option>
      			</c:forEach>
      		</select>
		  </div>
		  <div class="form-group required control-label">
		    <label for="useyn"><i class="bi bi-check2-circle"></i> 사용여부</label>
  		    <select class="form-control" id="useyn" name="useyn">
        		<option value="Y">Y</option>
        		<option value="N">N</option>
      		</select>
		  </div>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-primary" onclick="javascript:goSave()"><i class="bi bi-save"></i> 저장</button>
        <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal"><i class="bi bi-x"></i> 닫기</button>
      </div>
    </div>
  </div>
</div>

</body>
</html>