<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div id="nav" class="col-md-2 nav_and_content nav_div">
		<ul id ="main-menu" class="nav nav-pills nav-stacked">	
			
			<li><a href="/terrier/Home"><span class="fa fa-home" style="font-size:20px;"></span>&nbsp;&nbsp;&nbsp;HOME</a>
			<li><a href="/terrier/notice_management/n_mgt"><span class="glyphicon glyphicon-bullhorn" style="font-size:20px;"></span>&nbsp;&nbsp;공지</a>	
			<!-- <li><a href="/terrier/group_management/g_mgt"><span class="glyphicon glyphicon-th" style="font-size:20px;"></span>&nbsp;&nbsp;그룹 관리</a> -->
			<!-- <li><a href="/terrier/device_management/d_mgt"><span class="glyphicon glyphicon-phone" style="font-size:20px;"></span>&nbsp;&nbsp;단말 관리</a>-->
			
			
			
			<li><a data-toggle="collapse" data-target="#device_management" style="cursor:pointer;"><span class="glyphicon glyphicon-phone" style="font-size:20px;"></span>&nbsp;&nbsp;제어관리</a>
				<ul class="collapse nav nav-pills nav-stacked" id="device_management">
					<li id="d_mgt"><a href="/terrier/device_management/d_mgt">단말 관리</a></li>
					<li id="g_mgt"><a href="/terrier/group_management/g_mgt">그룹 관리</a></li>
				</ul>	
			
			<li><a data-toggle="collapse" data-target="#loss_management" style="cursor:pointer;"><span class="glyphicon glyphicon-erase" style="font-size:20px;"></span>&nbsp;&nbsp;분실 관리</a>
				<ul class="collapse nav nav-pills nav-stacked" id="loss_management">
					<li id="lr_list"><a href="/terrier/loss_management/lr_list">분실 요청 리스트</a></li>
					<li id="l_list"><a href="/terrier/loss_management/l_list">분실 처리</a></li>
					<li id="lf_list"><a href="/terrier/loss_management/lf_list">로그인 실패 리스트</a></li>
				</ul>
				
			<li><a data-toggle="collapse" data-target="#request_management" style="cursor:pointer;"><span class="glyphicon glyphicon-send" style="font-size:20px;"></span>&nbsp;&nbsp;요청 관리</a>
				<ul class="collapse nav nav-pills nav-stacked" id="request_management">
					<li id="w_list"><a href="/terrier/request_management/w_list">요청 대기 리스트</a></li>
					<li id="c_list"><a href="/terrier/request_management/c_list">요청 완료 리스트</a></li>
				</ul>
			
			<li><a data-toggle="collapse" data-target="#statistics_management" style="cursor:pointer;"><span class="glyphicon glyphicon-stats" style="font-size:20px;"></span>&nbsp;&nbsp;통계 관리</a>
				<ul class="collapse nav nav-pills nav-stacked" id="statistics_management">
					<li><a href="/terrier/statistics_management/test">TEST통계</a></li>
					<li id="control"><a href="/terrier/statistics_management/c_measurement_mgt">실시간 사용률 통계</a></li>
					<li><a href="/terrier/statistics_management/measurement_mgt">날짜별 사용률 통계</a></li>					
				</ul>
			<li style="border-bottom: 0px"><a data-toggle="collapse" data-target="#account_management" style="cursor:pointer;"><span class="glyphicon glyphicon-user" style="font-size:20px;"></span>&nbsp;&nbsp;계정 관리</a>
				<ul class="collapse nav nav-pills nav-stacked" id="account_management">
					<li id="audit_list"><a href="/terrier/account_management/audit_list">계정 감사</a></li>
					<li><a href="#">보안 관리</a></li>
					<li><a href="#">권한 관리</a></li>
			</ul> 
				
		</ul>	
</div>

<style>
	.nav_selected {
		background-color: #eeeeee;
		color: #23527c;
	}
</style>

<script>
	var uri = '${requestScope["javax.servlet.forward.request_uri"]}';
	var info = uri.split('/');
	
	if(info[2] == 'group_management')
		info[2] = 'device_management';
	
	if(info[3] == 'w_list_search' || info[3] == 'w_read')
		info[3] = 'w_list';
	else if(info[3] == 'c_list_search' || info[3] == 'c_read')
		info[3] = 'c_list';
	else if(info[3] == 'd_mgt_search')
		info[3] = 'd_mgt';
	
	$('#'+info[2]).addClass('in');
	$('#'+info[3]).addClass('nav_selected');
	
	
</script>
	
