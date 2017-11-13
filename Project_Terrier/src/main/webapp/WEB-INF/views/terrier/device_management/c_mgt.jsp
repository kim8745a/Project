<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!-- 스프링url설정링크 -->
<spring:url value="/resources/toggle_css_js/bootstrap-toggle.js" var="toggle_js"></spring:url>
<spring:url value="/resources/toggle_css_js/bootstrap-toggle.min.css" var="toggle_css"></spring:url>
<html>

<!-- 부트스트랩 링크-->
<link rel="stylesheet" href="/webjars/bootstrap/3.3.4/dist/css/bootstrap.min.css">
<!-- 폰트아이콘 링크-->
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- 부트스트랩 토글 링크-->
<link href="${toggle_css}" rel="stylesheet">



<!-- 제이쿼리 스크립-->
<script src="/webjars/jquery/2.1.3/dist/jquery.min.js"></script>
<!-- 부트스트랩 스크랩-->
<script src="/webjars/bootstrap/3.3.4/dist/js/bootstrap.min.js"></script>
<!-- 부트스트랩 토글 스크랩 -->
<script src="${toggle_js}"></script>
<!-- 구글지도스크립트 스크랩-->
<!-- <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&language=ko"></script> -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD1AyPhozLfzLjsoL2RTkE1VqSN5sww8pk"></script>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>단말제어</title>

<style>
.apply_butt{
	margin:0px;
	width:150px;
	background-color: #ffffff;
	border:1px solid #dddddd;
	color:#333333;
}
	
.apply_butt:hover{
	background-color: #e6e6e6;
	border:1px solid #adadad;
}

.emp_info tr td {
	font:12px Arial, Helvetica,sans-serif;
	/* color:#3367d6; */
	/* font-weight:bold; */
	text-align:right;
	padding-left:0px;
	padding-right:5px;
}
.emp_info th{
	font:12px Arial, Helvetica,sans-serif;
	padding-left:5px;
	padding-right:40px;
	font-weight: normal;
}
.border_t{
	border-right: 1px solid #3367d6;
}
.emp_info .padding_left{
	padding-left:40px;
}
.app_col{
	text-align: center;
}

.emp_controll th{
	padding:2px;
}

.emp_controll td {
	text-align:right;
	padding-right:25px;
	
}

.table-hidden tbody{
    overflow-y: scroll;
	display: block;	
}

.table-hidden tr {
	width: 100%;
	display: inline-table;
}

.loc_butt:hover {
	background-color: #e6e6e6;
	border:1px solid #adadad;
}

</style>

</head>
<body>
<!-- 기본정보[버튼]/어플리케이션 리스트 -->
<div class="container-fluid" style="margin-top:20px;">

	<div class="row"><!-- 사용자 정보/어플리케이션 리스트 -->
		
		
		<div class="col-md-7" style="padding-left: 5px;padding-right:0px;">
	    	<div class="panel panel-primary">
	      		<div class="panel-heading" style="background-color: #3367d6;">사용자 정보</div>
	      		<div class="panel-body">
	      			<table class="emp_info">
	      												
	      				<tr>			
	      					<td>사원번호: 	<th class="border_t">${info.employee_num}<td class="padding_left">전화번호: <th>${info.telnum}
	      				<tr>
	      					<td>이름: 	<th class="border_t">${info.name}   <td class="padding_left">OS: 		<th>${info.os}
	      				<tr>
	      					<td>직급: 	<th class="border_t">${info.rank}   <td class="padding_left">제조사:		<th>${info.manufacturer}
	      				<tr>
	      					<td>부서: 	<th class="border_t">${info.department}	<td class="padding_left">주소: 		<th>${info.address}
	      				<tr>
	      					<td>생년월일: <th class="border_t">${info.date_of_birth}
	      			</table>							
	      			
	      		</div>
	    	</div>
	   </div>
	   
	   <div class="col-md-5" style="padding-left: 5px;padding-right:5px;padding-bottom:0px;">
	    	<div class="panel panel-primary">
	      		<div class="panel-heading" style="background-color: #3367d6;">어플리케이션 리스트</div>
	      		<div class="panel-body" style="padding: 0px; height:126px; overflow:auto;">
	      			
	      			<table class="table table-hover table-striped table-rwd-name table-hidden" style="padding: 0px; margin: 0px; font-size: 12px">
	      				<thead class="table-only-hide">
            				<tr>
              					<th>이름</th>
              					<th>사이즈</th>
              					<th>변조 여부</th>
              					<th>버전</th>
              				</tr>
          				</thead>
          				
          				<tbody style="height: 90px;">
            				<c:forEach items="${applist}" var="app">
	            				<tr>
	              					<td width="100" style="word-wrap:break-word;word-break:break-all;">${app.name}</td>
	              					<td width="110" style="word-wrap:break-word;word-break:break-all;">${app.size}</td>
	              					<td width="110" style="word-wrap:break-word;word-break:break-all;">${app.modulate}</td>
	              					<td width="100" style="word-wrap:break-word;word-break:break-all;">${app.version}</td>
	              				</tr>
              				</c:forEach>
              			</tbody>
	      			</table>
	      			
	      		</div>
	    	</div>
	    </div>
	</div><!-- row-fluid -->
	
	<div class="row"><!-- 지도 /제어 -->
			
		<div class="col-md-9"style="padding-left: 5px;padding-right:0px;">
			<div class="panel panel-primary">
	      		<div class="panel-heading" style="background-color: #3367d6;">위치 추적</div>
	      		<div class="panel-body" >
	      			<table>
	      				<tr>
	      					<td colspan="2"><div id="map_canvas" style="width:710px; height:135px; margin-bottom: 5px"></div>
	      					
	      				<tr>
	      					<td style="font:12px Arial, Helvetica,sans-serif; padding:0px 10px; vertical-align:top;">
	      						<!-- <div class="panel panel-primary" style="padding: 5px; border-color: #dddddd; margin-bottom: 10px"> -->	
	      							마지막 위치 : ${curr_location.address}
	      						<!-- </div> -->
	      						
	      				<tr>
	      					<td  style="font:12px Arial, Helvetica,sans-serif; padding:0px 10px; vertical-align:top;">
	      						<!-- <div class="panel panel-primary" style="padding: 5px; border-color: #dddddd; margin-bottom: 0px"> -->
	      							이전 위치 : ${pre_location.address}
	      						<!-- </div> -->
					</table>	      			
	      		</div>
	      		
	    	</div>
	   </div>
	   
	   <div class="col-md-3" style="padding-left: 5px;padding-right:5px;">
	    	<div class="panel panel-primary">
	      		<div class="panel-heading" style="background-color: #3367d6;">제어</div>
	      		<div class="panel-body" style="padding:0 30;">
	      			<table class="emp_controll">
	      				<tr>
	      					<c:choose>
	      						<c:when test="${con.wifi=='on'}">
	      							<td>Wifi
	      							<th><div id="wifidiv"> 
	      							<input id="wifi" type="checkbox" checked data-toggle="toggle" data-size="small" data-width="70"></div>
								</c:when>		
								<c:otherwise>
									<td>Wifi
									<th><div id="wifidiv"> 
									<input id="wifi" type="checkbox" data-toggle="toggle" data-size="small" data-width="70"></div>
								</c:otherwise>	
							</c:choose>
							
						<tr>
							<c:choose>
								<c:when test="${con.bluetooth=='on'}">
									<td>Bluetooth 	
									<th><div id="bluetoothdiv">
									<input id="bluetooth" type="checkbox" checked data-toggle="toggle" data-size="small" data-width="70"></div>
								</c:when>
								<c:otherwise>
									<td>Bluetooth 	
									<th><div id="bluetoothdiv">
									<input id="bluetooth" type="checkbox" data-toggle="toggle" data-size="small" data-width="70"></div>
								</c:otherwise>
							</c:choose>					
						<tr>
							<c:choose>
								<c:when test="${con.tethering=='on'}">
									<td>Tethering	
									<th><div id="tetheringdiv">
									<input id="tethering" type="checkbox" checked data-toggle="toggle" data-size="small" data-width="70"></div>
								</c:when>
								<c:otherwise>
									<td>Tethering	
									<th><div id="tetheringdiv">
									<input id="tethering" type="checkbox"  data-toggle="toggle" data-size="small" data-width="70"></div>
								</c:otherwise>
							</c:choose>
							
						<tr>
							<c:choose>
								<c:when test="${con.camera=='on'}">
									<td>Camera		
									<th><div id="cameradiv">
									<input id="camera" type="checkbox" checked data-toggle="toggle" data-size="small" data-width="70"></div>							
								</c:when>
								<c:otherwise>
									<td>Camera		
									<th><div id="cameradiv">
									<input id="camera" type="checkbox" data-toggle="toggle" data-size="small" data-width="70"></div>
								</c:otherwise>
							</c:choose>
						<tr>
							<c:choose>
								<c:when test="${con.voiceRecord=='on'}">
									<td>VoiceRecord 
									<th><div id="voicediv">
									<input id="voicerecord" type="checkbox" checked data-toggle="toggle" data-size="small" data-width="70"></div>
								</c:when>
								<c:otherwise>
									<td>VoiceRecord
									 <th><div id="voicediv">
									 <input id="voicerecord" type="checkbox"  data-toggle="toggle" data-size="small" data-width="70"></div>
								</c:otherwise>
							</c:choose>
						<tr>
							<td>All <th><div id="alldiv"><input id="all" type="checkbox" checked data-toggle="toggle" data-size="small" data-width="70"></div>							
					</table>
	      		</div>
	    	</div>
		</div>
	</div>
		
	<div class="row"><!-- 어플 -->
		<div class="col-md-12"style="padding-left: 10px;padding-right:5px;">
			<div class="panel panel-primary">
	      		<div class="panel-heading" style="background-color: #3367d6;">어플 로그</div>
	      		<div class="panel-body" style="padding: 0px; height:355px; overflow:auto;">
	      			<div class="dual-list list-left col-md-12" style="padding:0;margin:0;">
			            <div class="well text-right" style="padding:0;margin:0;background-color:#fff">
			                <div class="row">
			                    <div class="col-md-12">
			                        <div class="input-group">
			                            <span class="input-group-addon glyphicon glyphicon-search"></span>
			                            <input type="text" name="SearchDualList" class="form-control" placeholder="search" />
			                        </div>
			                    </div>
			                </div>
				                
			                <div style="padding:0px;margin:0px;">
				                <ul class="list-group" style="height: 300px;overflow-y: scroll;margin:0px;">
				                	<c:forEach items="${applog}" var="log">
					                	<li class="list-group-item">
					                		<table style="padding: 0px; margin: 0px; font-size: 12px">
						          				
						          					<tr style="width: 100%;">
						              					<td style="width:500px">${log.history}</td>
						              					<td style="width:100px; margin-right: 300px;">${log.type}</td>
						              					<td align="right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${log.data_Time}</td>
						              				</tr>            		
						              				      				              				
						              		</table>
					              	</c:forEach>	
				                </ul>
			                </div>
						</div>
					</div>
	      		</div>
	    	</div>
	    </div>
	</div><!-- 어플로그 -->
	
	<div class="row"><!-- 어플 -->
		<div class="col-md-12"style="padding-left: 10px;padding-right:5px;">
			<div class="panel panel-primary">
	      		<div class="panel-heading" style="background-color: #3367d6;">제어 로그</div>
	      		<div class="panel-body" style="padding: 0px; height:355px; overflow:auto;">
	      			<div class="dual-list list-left col-md-12" style="padding:0;margin:0;">
			            <div class="well text-right" style="padding:0;margin:0;background-color:#fff">
			                <div class="row">
			                    <div class="col-md-12">
			                        <div class="input-group">
			                            <span class="input-group-addon glyphicon glyphicon-search"></span>
			                            <input type="text" name="SearchDualList" class="form-control" placeholder="search" />
			                        </div>
			                    </div>
			                </div>
				                
			                <div style="padding:0px;margin:0px;">
				                <ul class="list-group" style="height: 300px;overflow-y: scroll;margin:0px;">
				                	<c:forEach items="${conlog}" var="log">
					                	<li class="list-group-item">
					                		<table style="padding: 0px; margin: 0px; font-size: 12px">
						          				
						          					<tr style="width: 100%;">
						              					<td style="width:500px">${log.type}</td>
						              					<td style="width:100px; margin-right: 300px;">${log.history}</td>
						              					<td align="right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${log.data_Time}</td>
						              				</tr>            		
						              				      				              				
						              		</table>
					              	</c:forEach>	
				                </ul>
			                </div>
						</div>
					</div>
	      		</div>
	    	</div>
	    </div>
	</div><!-- 어플로그 -->

</div><!-- 컨테이너 -->




<script>
  /* 구글 스크립트 */
  var latitude = ${curr_location.latitude};
  var longitude = ${curr_location.longitude};
  
  var myLatlng = new google.maps.LatLng(latitude,longitude); // y, x좌표값
  var mapOptions = { 
        zoom: 15, 
        center: myLatlng, 
        mapTypeId: google.maps.MapTypeId.ROADMAP 
  } 
  var map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions); 
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
  
  
  /* 토글 스크립트 */
	 $('#wifidiv').on('click.bs.toggle', 'div[data-toggle^=toggle]', function(e) 
	{
		 
		 if($('#wifi').prop('checked'))
			{
				 data_send("CW","OFF");
			}
			 else
			{
				 data_send("CW","ON");
			}			
	});/* wifi */
	
	 $('#bluetoothdiv').on('click.bs.toggle', 'div[data-toggle^=toggle]', function(e)
	{
		 
		 if($('#bluetooth').prop('checked'))
		{
			 data_send("CB","OFF");
		}
		 else
		{
			 data_send("CB","ON");
		}
	});
	 
	 $('#tetheringdiv').on('click.bs.toggle', 'div[data-toggle^=toggle]', function(e)
	{

		 if($('#tethering').prop('checked'))
		 {
			 /* alert("off요청"); */
			  data_send("CT","OFF");
		 }
		 else
		{
			 /* alert("on요청"); */
			data_send("CT","ON");
		}
	});

	 $('#cameradiv').on('click.bs.toggle', 'div[data-toggle^=toggle]', function(e)
	{
		 if($('#camera').prop('checked'))
		 {
			 data_send("MC","OFF");
		 }
		 else
		{
			data_send("MC","ON");	 
		}
	});
	 
	 $('#voicediv').on('click.bs.toggle', 'div[data-toggle^=toggle]', function(e)
	{
		 if($('#voicerecord').prop('checked'))
		 {
			 data_send("MR","OFF");
		 }
		 else
		{
			data_send("MR","ON");	 
		}
		 
	});
	 $('#alldiv').on('click.bs.toggle', 'div[data-toggle^=toggle]', function(e)
	{
		 
			if($('#all').prop('checked'))
			{
				$('#wifi').bootstrapToggle('off');
				$('#bluetooth').bootstrapToggle('off');
				$('#tethering').bootstrapToggle('off');
				$('#camera').bootstrapToggle('off');
				$('#voicerecord').bootstrapToggle('off');
				var check="OFF"
			}
			else
			{
				$('#wifi').bootstrapToggle('on');
				$('#bluetooth').bootstrapToggle('on');
				$('#tethering').bootstrapToggle('on');
				$('#camera').bootstrapToggle('on');
				$('#voicerecord').bootstrapToggle('on');
				var check="ON"
			}
		 		 
		 data_send("ALL",check);
	});
  
  
	  function data_send(controller,check)
	  {
		 	alert(check);
			
			var data={}/* 보내는 데이터 */
			data["controller"]=controller;/* 제어내용 */
			data["emp"]="${e_num}";/* 사원번호 */
			data["onoff"]=check;/*onoff내용*/
			
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
							/* 실패했으니 원래 상태로 빽 */
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
						
			});/* ajax */
	  }
	  
	  
	  /*---------------------------웹소켓 연결해서.. 해당div영역 자체를 on,off에 따라 동적으로 변경해주자.-----------------------------*/
	var emp='${info.employee_num}';
	var wsUri = "ws://192.168.0.31:8080/terrier/c_mgt/";
		//192.168.219.105
		//58.141.234.126:8745
		//mem서버측에서 controller_onoff컨트롤러에 body를 담아서 보내야함
		//양식-사원번호:wifi:on
    
		websocket = new WebSocket(wsUri);
    	websocket.onopen = function(evt) { onOpen(evt) };
    	websocket.onmessage = function(event) { onMessage(event) };
    
    	function onOpen(evt) {
    		alert("c_mgt.소켓연결성공");
    		alert(emp);
    	}
   
    function onMessage(evt) { 
     	var info = (evt.data).split(':');
    	var emp_num = info[0];
    	var title=info[1];
    	var active = info[2];
    	
		alert(emp_num);
		alert(title);
		alert(active);
		
  		if(emp_num==emp)
    	{
    			if(title=='CW')
    			{
     				if(active=='ON')
    				{
     					$('#wifi').bootstrapToggle('on');   	    	
    				}
					else if(active=='OFF')
    				{
						$('#wifi').bootstrapToggle('off');
    				}
    				else{return ;}
    			}
    			else if(title=='CB')
    			{
    				if(active=='ON')
    				{
    					$('#bluetooth').bootstrapToggle('on'); 
    				}
    				else if(active=='OFF')
    				{
    					$('#bluetooth').bootstrapToggle('off');
    				}
    				else{return ;}
    			}
    			else if(title=='MC')
    			{
    				if(active=='ON')
    				{
    					$('#camera').bootstrapToggle('on');
    				}
    				else if(active=='OFF')
    				{
    					$('#camera').bootstrapToggle('off');
    				}
    				else{return ;}
    			}
    			else if(title=='MR')
    			{
    				if(active=='ON')
    				{
    					$('#voicerecord').bootstrapToggle('on');
    				}
    				else if(active=='OFF')
    				{
    					$('#voicerecord').bootstrapToggle('off');
    				}
    				else{return ;} 
    					
    			} 
    	}
    	else
	    {return ;}
    			
    }
	
	
    // 필터 부분
    $('[name="SearchDualList"]').keyup(function (e) {
        var code = e.keyCode || e.which;
        if (code == '9') return;
        if (code == '27') $(this).val(null);
        var $rows = $(this).closest('.dual-list').find('.list-group li');
        var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();
        $rows.show().filter(function () {
            var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
            return !~text.indexOf(val);
        }).hide();
    });
</script>
</body>
</html>