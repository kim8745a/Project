<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<title>분실 관리</title>

<style>
	.apply_butt{
		margin:0px;
		
		background-color: #ffffff;
		border:1px solid #dddddd;
		color:#333333;
	}
	
	.apply_butt:hover{
		background-color: #e6e6e6;
		border:1px solid #adadad;
	}
	
	.apply_active{
		background-color: #a5c7fe;
		/* color:#ffffff; */
	}
	
	.loc_butt{
		height:24px;
		padding:2px 7px;
		margin:0px;
		
		background-color: #ffffff;
		border:1px solid #dddddd;
		color:#333333;
	}
	
	.loc_butt:hover {
		background-color: #e6e6e6;
		border:1px solid #adadad;
	}
	
	.table-hidden tbody{
	    overflow-y: scroll;
		display: block;	
	}

	.table-hidden tr {
		width: 100%;
		display: inline-table;
	}
</style>

<div id="content" class="col-md-10 nav_and_content">
	<div id="title">
		<span class="glyphicon glyphicon-send"></span>&nbsp;분실 요청 리스트
	</div>
	
	<div class="jumbotron" style="background-color: #3367D6; 
	padding-bottom:5px; padding-top: 5px;">
		
		<form id="search_form" role="form">
		<div class="form-group row">	
			
			<div class="col-md-3">
		        <label for="employee_num" style="color:#ffffff;font-weight:bold;">사번</label>
		        <input class="form-control" id="employee_num" name="employee_num" type="text" placeholder="ex) 16011018" value="${vo.employee_num}">
     		</div>
			
			<div class="col-md-2">
				<label for="department" style="color:#ffffff;font-weight:bold;">부서명</label>
				  <select class="form-control" name="department" >
					  <option value="선택" <c:out value="${vo.department==null?'selected':'' }"/>>선택</option>
					  <option value="인사" <c:out value="${vo.department eq '인사'?'selected':''}"/>>인사</option>
					  <option value="기술"<c:out value="${vo.department eq '기술'?'selected':''}"/>>기술</option>
					  <option value="생산"<c:out value="${vo.department eq '생산'?'selected':''}"/>>생산</option>
					  <option value="총무"<c:out value="${vo.department eq '총무'?'selected':''}"/>>총무</option>
				   </select>
			</div>
			  
			<div class="col-md-2">
				<label for="rank" style="color:#ffffff;font-weight:bold;">직책</label>
				  <select class="form-control" name="rank">
					  <option value="선택" <c:out value="${vo.rank==null?'selected':'' }"/>>선택</option>
					  <option value="사원" <c:out value="${vo.rank eq '사원'?'selected':'' }"/>>사원</option>
					  <option value="주임" <c:out value="${vo.rank eq '주임'?'selected':'' }"/>>주임</option>
					  <option value="대리" <c:out value="${vo.rank eq '대리'?'selected':'' }"/>>대리</option>
					  <option value="과장" <c:out value="${vo.rank eq '과장'?'selected':'' }"/>>과장</option>
					  <option value="차장" <c:out value="${vo.rank eq '차장'?'selected':'' }"/>>차장</option>
					  <option value="부장" <c:out value="${vo.rank eq '부장'?'selected':'' }"/>>부장</option>
				   </select>
			</div>
					  
			<div class="col-md-2">
				<label for="name" style="color:#ffffff;">이름</label>
				<input type="text" class="form-control" id="name" name="name" placeholder="ex) 홍길동" value="${vo.name}">
			</div>
			
			<div class="col-md-2">
				<label for="date" style="color:#ffffff;">요청일</label>
				<c:set var="date" value="${fn:split(vo.date,'%')}" />
				<input type="date" class="form-control" id="date" name="date" value="${date[0]}">
			</div>
						
			<div class="col-md-1">
				<br>
				<button id="search_button" type="submit" class="btn btn-default btn-lg" style=" margin-top:-7px; color:#3367D6;"><span class="glyphicon glyphicon-search"></span> 검색</button>
			</div>
		</div><!-- 그룹 -->
		</form>

	</div><!-- jumbotron search -->
	
	<table class="table table-hover table-striped table-bordered" style="margin-bottom:10px;">
		<thead>
			<tr>
				<td>요청 번호
				<td>사번
				<td>부서명
				<td>직책
				<td>이름
				<td>요청일
				<td>확인란
		</thead>
		
		<tbody>
			<c:forEach items="${list}" var="list">
				<tr class="${list.bno}_list">
					<td style="cursor: pointer;" onclick="view_controll(${list.bno});">${list.bno}
					<td style="cursor: pointer;" onclick="view_controll(${list.bno});">${list.employee_num}
					<td style="cursor: pointer;" onclick="view_controll(${list.bno});">${list.department}
					<td style="cursor: pointer;" onclick="view_controll(${list.bno});">${list.rank}
					<td style="cursor: pointer;" onclick="view_controll(${list.bno});">${list.name}
					<td style="cursor: pointer;" onclick="view_controll(${list.bno});">${list.date}
					<td align="center" style="cursor: pointer;" onclick="view_controll(${list.bno});"><button class="btn icon-btn btn-muted apply_butt" onClick="loss_check('${list.bno}')"><span class="glyphicon glyphicon-ok"></span>분실 확인</button>
				
				<tr class="controll_view ${list.bno}_content" id="${list.bno}_controll_view" style="display: none; font-size: 13px">
		      		<td colspan="7">
		      			${list.history}
		      		</td>
		      	</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<c:set var="uri" value="${fn:split(requestScope['javax.servlet.forward.request_uri'],'/')}" />
	<c:set var="send_data" value="&employee_num=${vo.employee_num}&department=${vo.department}&rank=${vo.rank}&name=${vo.name}&date=${date[0]}"/>
	
	<div class="text-center">
		<ul class="pagination">
			<!-- 이전표시를 남기는것 조건문 -->
			<c:if test="${pageMaker.prev}">
				<c:choose>
				    <c:when test="${uri[2] eq 'lr_list'}">
				    	<li><a href="l_list${pageMaker.makeSearch(pageMaker.startPage -1)}">&laquo;</a></li>
				    </c:when>
					
					<c:otherwise>
						<li><a href="lr_list_search${pageMaker.makeSearch(pageMaker.startPage -1)}${send_data}">&laquo;</a></li>
					</c:otherwise>
				</c:choose>
			</c:if>
			
			<!-- 아래번호판을 선택했을때 액션들 -->
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				<li
					<c:out value="${pageMaker.cri.page==idx?'class=active':''}"/>>
					<c:choose>
						<c:when test="${uri[2] eq 'lr_list'}">
							<a href="lr_list${pageMaker.makeSearch(idx)}">${idx}</a><!-- 페이지를 누를때마다 계속 uri요청을 하여 리바인딩하는형식 -->
						</c:when>
						
						<c:otherwise>
							<a href="lr_list_search${pageMaker.makeSearch(idx)}${send_data}">${idx}</a><!-- 페이지를 누를때마다 계속 uri요청을 하여 리바인딩하는형식 -->
						</c:otherwise>
					</c:choose>
				</li>
			</c:forEach>
			
			<!-- 다음 표시를 남기는 조건문 -->
			<c:if test="${pageMaker.next && pageMaker.endPage>0}">
				<c:choose>
						<c:when test="${uri[2] eq 'lr_list'}">
							<li><a href="lr_list${pageMaker.makeSearch(pageMaker.endPage+1)}">&raquo;</a></li>
						</c:when>
						
						<c:otherwise>
							<li><a href="lr_list_search${pageMaker.makeSearch(pageMaker.endPage+1)}${send_data}">&raquo;</a></li>
						</c:otherwise>
				</c:choose>
			</c:if>		
			
		</ul>
	</div><!-- ./center -->
	
	
	
	
	
	
</div>

<script>
var padding_height;

function view_controll(bno)
{
	if($("#"+bno+"_controll_view").css("display") == "none")
	{
		$("#"+bno+"_controll_view").show("fest");
		padding_height = $("#content").height()+30 - $('.nav_div').height();
		$('.nav_div').css('min-height', $("#content").height()+30);
	}
	else
	{
		$("#"+bno+"_controll_view").hide("fest");
		$('.nav_div').css('min-height', $("#content").height()+30 - padding_height );
	}
}

function loss_check(bno){
	$("." + bno + "_content").remove();
	$("." + bno + "_list").hide("fest");
	
	$.ajax({
		url : "/terrier/loss_management/loss_check",
        type: "get",
        data : { "bno" : bno },
        success : function(responseData){
        	if(responseData == "SUCCESS")
        		alert("확인");
        },
	    error: function() {
	    	alert("에러");
	    }        
	});
}

$(document).ready(function(){
	var formObj=$("form[role='form']");
	$("#search_button").on("click",function(){//검색 활성화	
		formObj.attr("action","lr_list_search");
		formObj.attr("method","get");
		formObj.submit();
	});
	
});//ready


</script>

