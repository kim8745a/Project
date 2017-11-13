<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.board_num {
	min-width: 1px;
}

.apply_butt{
	margin:0px;
	width:100%;
	background-color: #ffffff;
	border:1px solid #dddddd;
	color:#333333;
}

.apply_butt:hover{
	background-color: #e6e6e6;
	border:1px solid #adadad;
}

</style>

<div id="content" class="col-md-10 nav_and_content">

	<div id="title">
		<span class="glyphicon glyphicon-bullhorn"></span>&nbsp;&nbsp;계정 감사
	</div>
	
	<form id="auditform" action="/terrier/account_management/audit_list/search" method="get">
	
	<div class="col-md-6" style="float: right; padding:0px 0px 10px 0px;">
		<div class="col-md-3" style="padding-right: 0">
			<select class="form-control" name="condition">
				<option value="Ipaddress">IP</option>
				<option value="admin_Id">계정</option>
				<option value="behavior">기록</option>
			</select>
		</div>
		<div class="col-md-7" style="padding-right: 0">
			<input type="text" class="form-control" name="value">
		</div>
		<div class="col-md-2" style="padding-right: 0">
			<a class="btn icon-btn btn-muted apply_butt" href="#" id="search"><span class="glyphicon glyphicon-search"></span> 검색</a>
		</div>
	</div>
	
	</form>
	
	<fmt:formatDate pattern="yyyy-MM-dd" value="${time}" var="nowtime"/>

	<table class="table table-hover table-striped table-bordered" style="margin-bottom:10px;">
		<thead>
			<tr>
				<td class="board_num">번호
				<td class="board_title">IP
				<td class="board_writer">계정
				<td class="board_date">기록
				<td class="board_hit">기록일
		</thead>
		
		<tbody>
			<c:forEach items="${list}" var="list">
				<tr>
					<td>${list.idadmin_audit}
					<td>${list.ipaddress}
					<td>${list.admin_Id}
					<td>${list.behavior}</td>
					<td>${list.date}
				</tr>
			</c:forEach>	
			
			
		</tbody>
	</table>
	
<div class="text-center">
	<ul class="pagination">
		<!-- 이전표시를 남기는것 조건문 -->
		<c:if test="${pageMaker.prev}">
			<li><a href="audit_list${pageMaker.makeSearch(pageMaker.startPage -1)}">&laquo;</a></li>
		</c:if>
		
		<!-- 아래번호판을 선택했을때 액션들 -->
		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
			<li
				<c:out value="${pageMaker.cri.page==idx?'class=active':''}"/>>
				<a href="audit_list${pageMaker.makeSearch(idx)}">${idx}</a><!-- 페이지를 누를때마다 계속 uri요청을 하여 리바인딩하는형식 -->
			</li>
		</c:forEach>
		
		<!-- 다음 표시를 남기는 조건문 -->
		<c:if test="${pageMaker.next && pageMaker.endPage>0}">
			<li><a href="audit_list${pageMaker.makeSearch(pageMaker.endPage+1)}">&raquo;</a></li>
		</c:if>		
		
	</ul>
</div><!-- ./center -->

	

</div><!-- col-md-10 -->


<script>
var ok='${msg}';
if(ok=="OK")
	{
		alert("작성성공");
	}
var r_ok='${r_msg}';
if(r_ok=="OK")
	{
		alert("삭제성공");
	}
else if(r_ok=="NO")
	{
		alert("작성자가 다릅니다");
	}
	
	$("#search").click(function(e){
		$("#auditform").submit();
		e.preventDefault();
	});
	
	
</script>