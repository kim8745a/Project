<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 구글지도스크립트 스크랩-->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD1AyPhozLfzLjsoL2RTkE1VqSN5sww8pk"></script>

<title>분실 처리</title>

<style>
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
	
	.apply_active{
		background-color: #a5c7fe;
		/* color:#ffffff; */
	}
</style>

<div id="content" class="col-md-10 nav_and_content">
	<div id="title">
		<span class="glyphicon glyphicon-erase"></span>&nbsp;분실 관리
	</div>
	
	<div class="jumbotron" style="background-color: #3367D6; 
	padding-bottom:5px; padding-top: 5px;">
		
		<form id="search_form" role="form">
		<div class="form-group row">	
			<div class="col-md-2">
		        <label for="employee_num" style="color:#ffffff;font-weight:bold;">사원번호</label>
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
				<label for="phone" style="color:#ffffff;">번호</label>
				<input type="text" class="form-control" id ="phone" name="phone" placeholder="ex) 01000000000" value="${vo.phone}">
			</div>	
			<div class="col-md-2">
				<label for="name" style="color:#ffffff;">이름</label>
				<input type="text" class="form-control" id="name" name="name" placeholder="ex) 홍길동" value="${vo.name}">
			</div>
						
			<div class="col-md-2">
				<br>
				<button id="search_button" type="submit" class="btn btn-default btn-lg" style=" margin-top:-7px; color:#3367D6;"><span class="glyphicon glyphicon-search"></span> 검색</button>
			</div>
		</div><!-- 그룹 -->
		</form>

	</div><!-- jumbotron search -->
		
	
		
	<!-- 테이블 -->
	<table class="table table-striped table-bordered">
			<thead><!-- 리스트목록 -->
		      <tr >
		        <th>사 번</th>
		        <th>부 서 명</th>
		        <th>직 책</th>
		        <th>번 호</th>
		        <th>이 름</th>   
		      </tr>
		    </thead>
		    
		    
			<tbody><!-- 리스트 상세명단 -->
		      
		      <c:forEach items="${list}" var="list">
		      	
		      		<td style="cursor: pointer;" onclick="view_controll(${list.employee_num});">${list.employee_num}
		      		<td style="cursor: pointer;" onclick="view_controll(${list.employee_num});">${list.department}
					<td style="cursor: pointer;" onclick="view_controll(${list.employee_num});">${list.rank}
					<td style="cursor: pointer;" onclick="view_controll(${list.employee_num});">${list.phone}
					<td style="cursor: pointer;" onclick="view_controll(${list.employee_num});">${list.name}
								
		      	
		      	<tr class="controll_view" id="${list.employee_num}_controll_view" style="display: none;">
		      		<td colspan="6">
		      			<div class="row" style="margin:0px 20px;">
		      				<table style="width:100%; padding:0; margin:0">
		      					<tr>
		      						<td style="padding:5px 43px 5px 5px; border-right: 1px solid #3367d6;"><button class="btn icon-btn btn-muted apply_butt" id="${list.employee_num}_ring" onClick="loss_control('${list.employee_num}','Alarm')"><span class="glyphicon glyphicon-volume-up"></span> 벨 울리기</button></td>
		      						<td style="padding:5px 5px 5px 43px;"><button class="btn icon-btn btn-muted apply_butt" onClick="loss_control('${list.employee_num}','Backup')"><span class="glyphicon glyphicon-copy"></span> 데이터 백업</button></td>
					      			<td style="padding:5px 0px 5px 5px; margin:0; border-right: 1px solid #3367d6;">
					   					<input type="checkbox" id="${list.employee_num}_img">이미지&nbsp;
										<input type="checkbox" id="${list.employee_num}_number">연락처
									</td>
		      						<td style="padding:5px 5px 5px 43px;"><button class="btn icon-btn btn-muted apply_butt" id="${list.employee_num}_gps" onClick="loss_control('${list.employee_num}','Gps')"><span class="glyphicon glyphicon-map-marker"></span> 원격 GPS 실행/추적</button></td>
		      						<td style="padding:5px;">마지막 위치 : <span id="${list.employee_num}_address">충북 청주시 인천 동막역</span></td>
		      					</tr>
		      				</table>
		   				</div>
		      			
		      			<div id="${list.employee_num}_map_view" class="row" style="margin:10px 20px">
		      				<div id="${list.employee_num}_map_view_canvas" style="width:100%; height:500px;"></div>
		      			</div>
		      		</td>
		      	</tr>
		      	
		      </c:forEach>
		      
		    </tbody>
	
		</table>
	</div><!-- container -->

<script>
var padding_height;

function loss_control(emp_num,control)
{
	var on_off = '';
	
	if(control == 'Alarm')
	{
		if($("#"+emp_num+"_ring").hasClass("apply_active") == true)
		{
			$("#"+emp_num+"_ring").removeClass('apply_active');
			on_off = 'OFF';
		}
		else
		{
			$("#"+emp_num+"_ring").addClass('apply_active');
			on_off = 'ON';
		}
		
		push_loss(emp_num,control,on_off);
	}
	else if(control == 'Gps')
	{
		if($("#"+emp_num+"_gps").hasClass("apply_active") == true)
		{
			$("#"+emp_num+"_gps").removeClass('apply_active');
			on_off = 'OFF';
		}
		else
		{
			$("#"+emp_num+"_gps").addClass('apply_active');
			on_off = 'ON';
		}
		
		push_loss(emp_num,control,on_off);
	}
	else if(control == 'Backup')
	{
		if($("#"+emp_num+"_img").is(":checked"))
		{
			on_off = "Img";
			push_loss(emp_num,control,on_off);
		}
		if($("#"+emp_num+"_number").is(":checked"))
		{
			on_off = "Number";
			push_loss(emp_num,control,on_off);
		}
		$("#"+emp_num+"_img").attr('checked', false) ;
		$("#"+emp_num+"_number").attr('checked', false) ;
	}
}

function view_controll(e_num)
{
	var latitude;
	var longitude;
	
	if($("#"+e_num+"_controll_view").css("display") == "none")
	{
		$.ajax({
			url : "/terrier/loss_management/controll_view",
	        type: "get",
	        data : { "emp_num" : e_num },
	        success : function(responseData){
	            var data = responseData;
	            
	            latitude = data.g_vo.latitude;
	            longitude = data.g_vo.longitude;
	            
	            $("#"+e_num+"_address").text(data.g_vo.address);
	            
	            if(data.c_vo.alarm == "on")
	            	$("#"+e_num+"_ring").addClass('apply_active');
	            
	            if(data.c_vo.gps == "on")
	            	$("#"+e_num+"_gps").addClass('apply_active');
	            
	            $("#"+e_num+"_controll_view").show("fest");
	            
	            /* 구글 스크립트 */
	    		var myLatlng = new google.maps.LatLng(latitude,longitude); // y, x좌표값
	    		var mapOptions = { 
	    		      zoom: 15, 
	    		      center: myLatlng, 
	    		      mapTypeId: google.maps.MapTypeId.ROADMAP 
	    		} 
	    		var map = new google.maps.Map(document.getElementById(e_num+"_map_view"+'_canvas'), mapOptions); 
	    		var marker = new google.maps.Marker({ 
	    		   position: myLatlng, 
	    		   map: map, 
	    		   title: "현재 위치" 
	    		}); 
	    		var infowindow = new google.maps.InfoWindow({ 
	    		   //content: "<h1>회사이름</h1>", 
	    		   maxWidth: 300 
	    		}); 
	    		google.maps.event.addListener(marker, 'click', function() { 
	    		infowindow.open(map, marker); 
	    		});
				
	        },
		    error: function() {
		    	alert("에러");
		    }        
		});
		
		padding_height = $("#content").height()+30 - $('.nav_div').height();
		$('.nav_div').css('min-height', $("#content").height()+30);
	}
	else
	{
		$("#"+e_num+"_controll_view").hide("fest");
		$('.nav_div').css('min-height', $("#content").height()+30 - padding_height );
	}
}

function push_loss(e_num,controller,check)
{
	//alert(e_num+":"+controller+":"+check);
	
	var data={};
	data["controller"]=controller;
	data["emp"]=e_num;
	data["onoff"]=check;
	
	$.ajax({
		type:"GET",
		contentType:'application/json,charset=UTF-8',
		dataType:'jsonp',
		data:data,
		crossDomain:true,
		url:'http://58.141.234.126:55376/process/devicepush?data',
		jsonp:'callback',
		success:function(data)
		{
			
			alert("전송 성공");
			if(data.check=="true")
				{
					alert("check : " + data.check);
				}
			else
				{
					alert("check : " + data.check);
				}
		},
		error:function(jqXHR,exception)
		{
			alert("전송실패");
			alert(jqXHR.status);
			alert(exception);
			console.log(jqXHR);
			return false;
		}
				
	});
}

$(document).ready(function(){
	var formObj=$("form[role='form']");
	$("#search_button").on("click",function(){//검색 활성화	
		formObj.attr("action","l_list_search");
		formObj.attr("method","get");
		formObj.submit();
	});
	
});//ready


</script>

