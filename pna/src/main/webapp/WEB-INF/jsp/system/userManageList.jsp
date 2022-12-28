<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>



<script language="javascript">
	$(document).ready(function(){
		$("#gridList1").jqGrid({
		   	url:"${pageContext.request.contextPath}/system/userManageList.ajax",
	   		mtype: "POST",
			datatype: "json",			
			/* postData : {'useYn':'Y'}, */
			jsonReader : {
				root: "resultList",
				repeatitems: false
			},
			loadtext : '조회 중 입니다.',
			shrinkToFit:false,
			colModel:[
	   			{label:'ID', name:'userId', width:20},
	   			{label:'성명', name:'userName', width:30},
	   			{label:'사용자권한', name:'userGradeName', width:30},
	   			{label:'사용자권한번호', name:'userGrade', hidden:false, width:30},
	   			{label:'사용여부', name:'useYn', width:20},
	   			{label:'프로젝트', name:'projectName', width:30},
	   			{label:'프로젝트ID', name:'projectId', hidden:false, width:30}
	   		],
	   		loadonce: true,
	   		sortable : true,
	   		showpage : false,
        	rownumbers : true,
	   		rowNum: 9007199254740992,
	   		width: 800,
        	height: 450,
	   		beforeRequest : function () {loadingOn();},
	   		loadComplete: function (data) {if($('#gridList1').getGridParam("records")== 0) alert('조회된 내용이 없습니다.');loadingOff();}
		});

		$("#gridList1").setGridWidth($('#content').width()-25, true);
	});
	
	$(window).bind('resize', function() {
		$("#gridList1").setGridWidth($('#content').width()-25, true);
	}).trigger('resize');
	
	function initData() {
		$('#inputForm').each(function() {this.reset();});
		$('[id=inputForm] #userId').attr("readonly",false);
		$('[id=inputForm] #inputtype').val("insert");
		/* $('#btn_input').attr("data-bs-target","#modalpopup"); */
		$('#modalpopup').modal("show");
	}
	
	function dataSelect() {
		var rowid = $("#gridList1").getGridParam( "selrow" );

		if (rowid == null || rowid < 1) {
			alert("수정할 데이터를 선택하세요");
			return;
		}

		var rowData = $("#gridList1").getRowData(rowid);
		var formData = $('#inputForm').serializeArray();

		jQuery.each(formData, function() {
			for(key in rowData) {
			    if (key == this.name) {
			    	$('[id=inputForm] #'+this.name).val(rowData[key]);
			    }
			}

			if (this.name == "userId") {
				$('[id=inputForm] #'+this.name).attr("readonly",true);
			}
        });

		$('[id=inputForm] #inputtype').val("update");
		/* $('#btn_update').attr("data-target","#modalpopup"); */
		$('#modalpopup').modal('show');
	}
	
	function goSave() {
		if ($('[id=inputForm] #userId').val().trim() == '') {
			alert("사용자 ID를 입력 하세요");
			$('[id=inputForm] #userId').focus();
			return;
		}
		if ($('[id=inputForm] #userName').val().trim() == '') {
			alert("사용자 성명을 입력 하세요");
			$('[id=inputForm] #userName').focus();
			return;
		}
		if ($('[id=inputForm] #userGrade').val() == null) {
			alert("사용자 등급을 선택 하세요");
			$('[id=inputForm] #userGrade').focus();
			return;
		}
		if ($('[id=inputForm] #useYn').val() == null) {
			alert("사용여부 선택 하세요");
			$('[id=inputForm] #useYn').focus();
			return;
		}

		var rtnData;
		var formData = $('#inputForm').serializeArray();

		loadingOn();

		if ($('[id=inputForm] #inputtype').val() == "insert") {
			$.ajax({
	            type : "POST",
	            url : "${pageContext.request.contextPath}/system/userExistCheck.ajax",	            
	            data : formData,
	            async: false,
	            success : function(data){
	           	 if(data != null) {
	       	 		rtnData = data;
	           	 }
	            },
	            error : function(XMLHttpRequest, textStatus, errorThrown){
	                alert("작업 중 오류가 발생하였습니다.");	                	                
	                rtnData = -1;
	            }
	        });

			if (rtnData == -1) {
				loadingOff();
				return;
			} else if (rtnData == 1) {
	   	 		alert("이미 등록된 아이디가 존재합니다.");
	   	 		loadingOff();
	   	 		return;
			}
		}

		$.ajax({
             type : "POST",
             url : "${pageContext.request.contextPath}/system/userManageUpdate.ajax",
             data : formData,
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

		 $('#modalpopup').modal('hide');
	}
</script>
<div class="container float-left">	
	<div class="page-header">
		<h4><i class="bi bi-info-square-fill"></i> 사용자 관리</h4>
	</div>
	<table id="gridList1"></table>
	<p></p>
	<p>
		<button type="button" class="btn btn-sm btn-primary" id="btn_input" name="btn_input" onclick="javascript:initData()"><i class="bi bi-pencil-fill"></i> 추가</button>		
		<button type="button" class="btn btn-sm btn-primary" id="btn_update" name="btn_update" onclick="javascript:dataSelect()"><i class="bi bi-pencil-square"></i> 수정</button>
		<button type="button" class="btn btn-sm btn-primary" onclick="javascript:goDelete();"><i class="bi bi-trash"></i> 삭제</button>
	</p>

</div>

<!-- Modal -->
<div class="modal fade" id="modalpopup" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">사용자 추가/수정</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	<form id="inputForm" name="inputForm">
		  <input type="text" id="inputtype" name="inputtype">
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
        			<option value="${systemGrade.code}">${systemGrade.codeName}</option>
      			</c:forEach>
      		</select>
		  </div>
		  <div class="form-group required control-label">
		    <label for="useYn"><i class="bi bi-check2-circle"></i> 사용여부</label>
  		    <select class="form-control" id="useYn" name="useYn">  		    	
        		<option value="Y">Y</option>
        		<option value="N">N</option>
      		</select>
		  </div>
		</form>
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-sm btn-primary" onclick="javascript:goSave()"><i class="bi bi-save"></i> 저장</button>
        <button type="button" class="btn btn-sm btn-secondary" data-bs-dismiss="modal"><i class="bi bi-x"></i> 닫기</button>
      </div>
    </div>
  </div>
</div>