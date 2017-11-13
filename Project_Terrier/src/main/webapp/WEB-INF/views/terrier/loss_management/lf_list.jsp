<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="/webjars/jquery-knob/1.2.13/dist/jquery.knob.min.js"></script>

<title>로그인 실패 리스트</title>

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
		    
		    
			<tbody id="table_list"><!-- 리스트 상세명단 -->
		      
		      <c:forEach items="${list}" var="list">
		      	<tr id="${list.employee_num}_user_info">
		      		<td style="cursor: pointer;" onclick="view_controll(${list.employee_num});">${list.employee_num}
		      		<td style="cursor: pointer;" onclick="view_controll(${list.employee_num});">${list.department}
					<td style="cursor: pointer;" onclick="view_controll(${list.employee_num});">${list.rank}
					<td style="cursor: pointer;" onclick="view_controll(${list.employee_num});">${list.phone}
					<td style="cursor: pointer;" onclick="view_controll(${list.employee_num});">${list.name}			
		      	
		      	<tr class="controll_view" id="${list.employee_num}_controll_view" style="display: none; font-size: 13px">
		      		<td colspan="5">
		      			<table border="1" bordercolor="#dddddd" style="width:100%;" >
		      				<tr>
		      					<td align="center" id="${list.employee_num}_fdate">잠금 날짜 : 
		      					<td align="center" id="${list.employee_num}_chart" rowspan="2"><div id="${list.employee_num}chart_div1" style='width: 450px;padding:0;margin:0'></div>
		      					<td align="center">캡처 사진
		      					<td id="${list.employee_num}_ini" align="center">[] 인식률
		      					<td align="center" rowspan="2">
		      						<button class="btn icon-btn btn-muted apply_butt" onClick="c_mdt('${list.employee_num}')"><span class="glyphicon glyphicon-cog"></span> 단말 상세제어</button><br><br>
		      						<button class="btn icon-btn btn-muted apply_butt" onClick="go_unlock('${list.employee_num}')"><span class="glyphicon glyphicon-refresh"></span> 잠금 해제</button>
		      				<tr>
		      					<td style="width:320px;">
		      						<table class="table table-hover table-striped table-rwd-name table-hidden" style="padding: 0px; margin: 0px; font-size: 12px">
					      				<thead class="table-only-hide">
				            				<tr>
				              					<th>내용</th>
				              					<th>날짜</th>
				              				</tr>
				          				</thead>
				          				
				          				<tbody id="${list.employee_num}_log" style="height: 170px;">
				              			</tbody>
					      			</table>
		      					</td>
		      					<td align="center"><img src="http://58.141.234.126:50029/web_fail_log?emp=${list.employee_num}" width="150" height="200">
		      					<td id="${list.employee_num}_reco" align="center"><input type="text" class="knob" value="0" data-width="90" data-height="90" data-fgColor="#3367d6" data-readonly="true">
		      			</table>
		      			
		      		</td>
		      	</tr>
		      	
		      </c:forEach>
		      
		    </tbody>
	
		</table>
	</div><!-- container -->

<script>
var padding_height;

function view_controll(e_num)
{
	
	if($("#"+e_num+"_controll_view").css("display") == "none")
	{
		$.ajax({
			url : "/terrier/loss_management/lf_controll_view",
	        type: "get",
	        data : { "emp_num" : e_num },
	        success : function(responseData){
	            var data = responseData;
	            
	            var log_su_c = 0;
	            var log_fa_c = 0;
	            var log_cf_c = 0;
	            var log_ul_c = 0;
	            
	            // 초기화
	            $("#" + e_num + "_fdate").html("잠금 날짜 : ");
	            $("#" + e_num + "_log").html("");

	            // 웹소켓으로 왔을 경우 무시하는 if문 처리 해야함 
	            var num_val = responseData.num_val;
	            var info2 = num_val.split(",");
	            
	            $("#" + e_num + "_ini").html("[" + info2[0] + "] 인식률");
	            $("#" + e_num + "_reco").html("<input type='text' class='knob' value='" + info2[1] + "' data-width='90' data-height='90' data-fgColor='#3367d6' data-readonly='true'>");
	            go_knob();
	            //
	            
	            $("#" + e_num + "_fdate").append(responseData.date);
	            
	            $.each(responseData.log_vo, function(i, l_v){
	            	var log_contents = '';
	            	
	            	if(l_v.history == 'yes'){
	            		log_contents = '로그인 성공';
	            		log_su_c = log_su_c + 1; 
	            	}
	            	else if(l_v.history == 'no'){
	            		log_contents = '로그인 실패';
	            		log_fa_c = log_fa_c + 1;
	            	}
	            	else if(l_v.history == 'nno'){
	            		log_contents = '계정 잠금';
	            		log_cf_c = log_cf_c + 1;
	            	}
	            	else{
	            		log_contents = '잠금 해제';
	            		log_ul_c = log_ul_c + 1;
	            	}
	            		
	            	$("#" + e_num + "_log").append("<tr><td width='150' style='word-wrap:break-word;word-break:break-all;'>" + log_contents + "<td width='160' style='word-wrap:break-word;word-break:break-all;'>" + l_v.date);
	            });
	            
	            drawChart1(log_su_c,log_fa_c,log_cf_c,log_ul_c,e_num);
	        },
		    error: function() {
		    	alert("에러");
		    }        
		});
		
		$("#"+e_num+"_controll_view").show("fest");
		padding_height = $("#content").height()+30 - $('.nav_div').height();
		$('.nav_div').css('min-height', $("#content").height()+30);
	}
	else
	{
		$("#"+e_num+"_controll_view").hide("fest");
		$('.nav_div').css('min-height', $("#content").height()+30 - padding_height );
	}
}

$(document).ready(function(){
	var formObj=$("form[role='form']");
	$("#search_button").on("click",function(){//검색 활성화	
		formObj.attr("action","lf_list_search");
		formObj.attr("method","get");
		formObj.submit();
	});
	
});//ready


//웹 소켓
var wsUri = "ws://58.141.234.126:9405/terrier/l_mgt/";
websocket = new WebSocket(wsUri);
websocket.onopen = function(evt) { onOpen(evt) };
websocket.onmessage = function(event) { onMessage(event) };
    
function onOpen(evt) {
	alert("l_mgt.소켓연결성공");
}
   
function onMessage(evt) { 
	var info = (evt.data).split('-');
    
	var emp_num = info[0];
	var initial = info[1];
	var num_value = info[2];
	
	var department;
	var rank;
	var phone;
	var name;

    $.ajax({
		url : "/terrier/loss_management/dynamic_html",
        type: "get",
        data : { "emp_num" : emp_num },
        success : function(responseData){
            var data = responseData;
            department = responseData.department;
            rank = responseData.rank;
        	phone = responseData.phone;
        	name = responseData.name;
        	
        	var element = "<tr>"
       	    
        	element += "<td style='cursor: pointer;' onclick='view_controll(" + emp_num + ");'>" + emp_num;
       	    element += "<td style='cursor: pointer;' onclick='view_controll(" + emp_num + ");'>" + department;
       	    element += "<td style='cursor: pointer;' onclick='view_controll(" + emp_num + ");'>" + rank;
       	    element += "<td style='cursor: pointer;' onclick='view_controll(" + emp_num + ");'>" + phone;
       	    element += "<td style='cursor: pointer;' onclick='view_controll(" + emp_num + ");'>" + name;
       		// 클릭 했을때 나오는 내용
       	    element += "<tr class='controll_view' id='" + emp_num + "_controll_view' style='display:none ; font-size: 13px'>";
       	    element += "<td colspan='5'>";
       	    element += "<table border='1' bordercolor='#dddddd' style='width:100%;'>";
       	    element += "<tr>";
       	    element += "<td align='center' id='" + emp_num + "_fdate'>잠금 날짜 :"; 
       	 	element += "<td align='center' id='" + emp_num + "_chart' rowspan='2'><div id='" + emp_num + "chart_div1' style='width: 450px;padding:0;margin:0'></div>";
       	 	element += "<td align='center'>캡처 사진";
       	 	element += "<td  id='" + emp_num + "_ini' align='center'>[" + initial + "] 인식률";
       	 	element += "<td align='center' rowspan='2'>";
       	 	element += "<button class='btn icon-btn btn-muted apply_butt' onClick='c_mdt(" + emp_num + ")'><span class='glyphicon glyphicon-cog'></span> 단말 상세제어</button><br><br>";
       	 	element += "<button class='btn icon-btn btn-muted apply_butt' onClick='go_unlock(" + emp_num + ")'><span class='glyphicon glyphicon-refresh'></span> 잠금 해제</button>";
       	 	element += "<tr>";
       	 	element += "<td style='width:320px;'>";
       	 	element += "<table class='table table-hover table-striped table-rwd-name table-hidden' style='padding: 0px; margin: 0px; font-size: 12px'>";
       	 	element += "<thead class='table-only-hide'>";
       	 	element += "<tr>";
       	 	element += "<th>내용</th>";
       	 	element += "<th>날짜</th>";
       	 	element += "</tr>";
       	 	element += "</thead>";
       	 	element += "<tbody id='" + emp_num + "_log' style='height: 170px;'>";
       	 	element += "</tbody>";
       	 	element += "</table>";
       	 	element += "</td>";
       	 	element += "<td align='center'><img src='http://58.141.234.126:50029/web_fail_log?emp=" + emp_num + "' width='150' height='200'>";
       	 	element += "<td id='" + emp_num + "_reco' align='center'><input type='text' class='knob' value='" + num_value + "' data-width='90' data-height='90' data-fgColor='#3367d6' data-readonly='true'>";
       	 	element += "</table>";
       	 	element += "</td>";
       	 	element += "</tr>";
       	    
       	    $("#table_list").append(element);
       	 	go_knob();
        },
	    error: function() {
	    	alert("에러");
	    }        
	});
}

// 구글 차트
google.charts.load('current', {'packages':['corechart']});/* 일반적인 차트로드 */
google.charts.setOnLoadCallback(drawChart1);
function drawChart1(log_su_c,log_fa_c,log_cf_c,log_ul_c,e_num){/* ---------------------------------------------------바그래프 */
	
	var data = google.visualization.arrayToDataTable([
        ["Element", "Density", { role: "style" } ],
        ["성공", 0, "#4285f4"],
        ["실패", 0, "#4285f4"],
        ["잠금", 0, "#4285f4"],
        ["해제", 0, "#4285f4"]
    ]);
	
	if(log_su_c != 0 || log_fa_c != 0 || log_cf_c != 0 || log_ul_c != 0)
    {
		data = google.visualization.arrayToDataTable([
	        ["Element", "Density", { role: "style" } ],
	        ["성공", log_su_c, "#4285f4"],
	        ["실패", log_fa_c, "#4285f4"],
	        ["잠금", log_cf_c, "#4285f4"],
	        ["해제", log_ul_c, "#4285f4"]
	    ]);
    }
	
    var view = new google.visualization.DataView(data);
    view.setColumns([0, 1,
                     { calc: "stringify",
                       sourceColumn: 1,
                       type: "string",
                       role: "annotation" },
                     2]);
    var options = {
      width: 450,
      bar: {groupWidth: "95%"},
      legend: { position: "none" },
    };
    
    if(e_num == "")
    {
 		<c:forEach items="${list}" var="list">
 	   		var chart1 = new google.visualization.BarChart(document.getElementById('${list.employee_num}chart_div1'));
 			chart1.draw(view, options);
 		</c:forEach>
    }
    else
    {
 		var chart1 = new google.visualization.BarChart(document.getElementById(e_num+'chart_div1'));
 		chart1.draw(view, options);
    }
}


function c_mdt(e_num)
{
	url = "http://58.141.234.126:9405/terrier/device_management/c_mgt?e_num=" + e_num;
	specs = "width=1000,height=750,top=0";
	window.open(url,"", specs);
}

function go_unlock(e_num)
{
	$.ajax({
		url : "/terrier/loss_management/unlock",
        type: "get",
        data : { "emp_num" : e_num },
        success : function(responseData){
            var data = responseData;
            alert("잠금 해제 하셨습니다.");
            $("#" + e_num + "_user_info").remove();
            $("#" + e_num + "_controll_view").remove();
        },
	    error: function() {
	    	alert("에러");
	    }        
	});
}

$(".knob").knob({
    draw: function () {

      // "tron" case
      if (this.$.data('skin') == 'tron') {

        var a = this.angle(this.cv)  // Angle
            , sa = this.startAngle          // Previous start angle
            , sat = this.startAngle         // Start angle
            , ea                            // Previous end angle
            , eat = sat + a                 // End angle
            , r = true;

        this.g.lineWidth = this.lineWidth;

        this.o.cursor
        && (sat = eat - 0.3)
        && (eat = eat + 0.3);

        if (this.o.displayPrevious) {
          ea = this.startAngle + this.angle(this.value);
          this.o.cursor
          && (sa = ea - 0.3)
          && (ea = ea + 0.3);
          this.g.beginPath();
          this.g.strokeStyle = this.previousColor;
          this.g.arc(this.xy, this.xy, this.radius - this.lineWidth, sa, ea, false);
          this.g.stroke();
        }

        this.g.beginPath();
        this.g.strokeStyle = r ? this.o.fgColor : this.fgColor;
        this.g.arc(this.xy, this.xy, this.radius - this.lineWidth, sat, eat, false);
        this.g.stroke();

        this.g.lineWidth = 2;
        this.g.beginPath();
        this.g.strokeStyle = this.o.fgColor;
        this.g.arc(this.xy, this.xy, this.radius - this.lineWidth + 1 + this.lineWidth * 2 / 3, 0, 2 * Math.PI, false);
        this.g.stroke();

        return false;
      }
    }
});
  
function go_knob(){
	$(".knob").knob({
	    draw: function () {

	      // "tron" case
	      if (this.$.data('skin') == 'tron') {

	        var a = this.angle(this.cv)  // Angle
	            , sa = this.startAngle          // Previous start angle
	            , sat = this.startAngle         // Start angle
	            , ea                            // Previous end angle
	            , eat = sat + a                 // End angle
	            , r = true;

	        this.g.lineWidth = this.lineWidth;

	        this.o.cursor
	        && (sat = eat - 0.3)
	        && (eat = eat + 0.3);

	        if (this.o.displayPrevious) {
	          ea = this.startAngle + this.angle(this.value);
	          this.o.cursor
	          && (sa = ea - 0.3)
	          && (ea = ea + 0.3);
	          this.g.beginPath();
	          this.g.strokeStyle = this.previousColor;
	          this.g.arc(this.xy, this.xy, this.radius - this.lineWidth, sa, ea, false);
	          this.g.stroke();
	        }

	        this.g.beginPath();
	        this.g.strokeStyle = r ? this.o.fgColor : this.fgColor;
	        this.g.arc(this.xy, this.xy, this.radius - this.lineWidth, sat, eat, false);
	        this.g.stroke();

	        this.g.lineWidth = 2;
	        this.g.beginPath();
	        this.g.strokeStyle = this.o.fgColor;
	        this.g.arc(this.xy, this.xy, this.radius - this.lineWidth + 1 + this.lineWidth * 2 / 3, 0, 2 * Math.PI, false);
	        this.g.stroke();

	        return false;
	      }
	    }
	  });
} 
</script>

