<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
.down_butt{
	margin-left:5px;
	background-color: #ffffff;
	border:1px solid #dddddd;
	color:#333333;
}
.down_butt:hover {
	background-color: #e6e6e6;
	border:1px solid #adadad;
} 

</style>

<div id="content" class="col-md-10 nav_and_content">
	<div id="title">
		<span class="glyphicon glyphicon-stats"></span>&nbsp;&nbsp;실시간 사용률 통계관리
	</div>
	<div class="container-fluid" style="margin-top:20px; margin-bottom:20px;"><!-- 컨테니어 커스텀설정 -->
	
	
		<div class="row">
			<div class="col-md-12" style="margin-right: 0px; "> 
				<div class="panel panel-primary">
					<div class="panel-heading" style="background-color: #3367d6;"><!-- 판넬머리 -->
					
						전체사원 제어 ON/FF 현황
						<a class="btn icon-btn btn-muted down_butt" href="javascript:pdfdown1()">PDF 다운로드</a>
						
					</div>
					
					<div class="panel-body" id="pdf_div1" style="margin-bottom:5px;">			
						<div class="col-md-8">
							<div id=chart_div1 style="width: 100%; height: 300px;"></div>
						</div>
						
						<div class="col-md-4">
							<table class="table table-bordered"style="width: 100%; height: 300px;">
							    <thead>
							      <tr>
							        <th>Control</th>
							        <th>ON</th>
							        <th>OFF</th>
							      <tr>
							    </thead>
							    
							    <tbody>
							      <tr>
							        <td>Wifi
							        <td>${c_count_on.wifi}
							        <td>${c_count_off.wifi}
							        
							      <tr>
							        <td>Bluetooth
							        <td>${c_count_on.bluetooth}
							        <td>${c_count_off.bluetooth}
							        
							      <tr>
							        <td>Tethering
							        <td>${c_count_on.tethering}
							        <td>${c_count_off.tethering}
							       
							      <tr>
							      	<td>Camera
							      	<td>${c_count_on.camera}
							      	<td>${c_count_off.camera}
							      	
							      <tr>
							      	<td>VoiceRecord
							      	<td>${c_count_on.voiceRecord}
							      	<td>${c_count_off.voiceRecord}
							     
							    </tbody>
							</table>
						</div>
					</div><!-- panel-body부분 -->
					
				</div>
			</div>
		</div><!-- 1번째 row종료 -->	
				
		
		<div class="row">
			<div class="col-md-12" style="margin-right: 4px;"> 
				<div class="panel panel-primary">
					<div class="panel-heading" style="background-color: #3367d6;">
						부서 별 제어 ON현황
						<a class="btn icon-btn btn-muted down_butt" href="javascript:pdfdown2()">PDF 다운로드</a>
					</div>
					
					<div class="panel-body" id="pdf_div2"style="margin-bottom:5px; ">
						<div class="col-md-5">
							<div id=chart_div3 style="width: 100%; height: 300px;"></div>
						</div>					
							
						<div id="load_dep_ctl" class="col-md-7"><!-- 부서클릭시 로드되는div영역 다른jsp존재-->					
						
						</div>
						
					</div>
				</div>
			</div>
		</div>		
		
		<div class="row">	
			<div id="target">
			
			</div>					
		</div>		
	
	</div>
</div>

<script>
	//Load the Visualization API and the corechart package.	
	google.charts.load('current', {'packages':['corechart']});/* 일반적인 차트로드 */     
	google.charts.load('current', {'packages':['bar']}); /* 듀얼이나 트리플은 해당 차트를 로드해야함 */
	// Set a callback to run when the Google Visualization API is loaded.

	google.charts.setOnLoadCallback(drawChart1);
/* 	google.charts.setOnLoadCallback(drawChart2); */
	google.charts.setOnLoadCallback(drawChart3);
	
	$("#load_dep_ctl").load("c_measurement_dep_mgt?department=인사");
	
	/* 듀얼컬럼그래프 div에 크기정해줘야함  */
	function drawChart1() {
  	  var data = google.visualization.arrayToDataTable([
            ['전체사원 제어 현황', 'ON', 'OFF'],
            ['Wifi', ${c_count_on.wifi}, ${c_count_off.wifi}],
            ['Bluetooth', ${c_count_on.bluetooth}, ${c_count_off.bluetooth}],
            ['Tethering', ${c_count_on.tethering}, ${c_count_off.tethering}],
            ['Camera', ${c_count_on.camera}, ${c_count_off.camera}],
            ['VoiceRecord', ${c_count_on.voiceRecord}, ${c_count_off.voiceRecord}]
          ]);
		 var options = {
				 width: 630,
		         series: {
 		           0: {targetAxisIndex: 0},
		         },
		         title: '실시간 ON/OFF'
		       };
       		 var chart = new google.visualization.ColumnChart(chart_div1); 
          	chart.draw(data,options);

    }
	/* 파이그래프 */
	/* function drawChart2() {
        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'control');
        data.addColumn('number', 'status:on');
        data.addRows([
          ['Wifi', ${c_count_on.wifi}],
          ['Bluetooth',${c_count_on.bluetooth}],
          ['Tethering', ${c_count_on.tethering}],
          ['Camera', ${c_count_on.camera}],
          ['VoiceRecord',${c_count_on.voiceRecord}]
        ]);

        // Set chart options
        var options = {
        	animation:{
    			startup: true,
    			duration: 1000,
    			easing: 'out'
    		}
        };

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart_div2'));
        chart.draw(data, options);
        
	} */
	

	/* 컬럼그래프 */
	function drawChart3() {
	    var data = google.visualization.arrayToDataTable([
	      ["Element", "제어 ON", { role: "style" } ],
	      ["생산부", ${dep_ctl_vo.hr_dep}, "#4285f4"],
	      ["인사부", ${dep_ctl_vo.eng_dep}, "#4285f4"],
	      ["기술부", ${dep_ctl_vo.ga_dep}, "#4285f4"],
	      ["총무부", ${dep_ctl_vo.pro_dep}, "#4285f4"]
	    ]);
	    var view = new google.visualization.DataView(data);
	     
	    view.setColumns([0, 1,
	         { calc: "stringify",
	           sourceColumn: 1,
	           type: "string",
	           role: "annotation" },
	         2]);
	    
	    // Set chart options
	    var options = {
	      //title: "Density of Precious Metals, in g/cm^3",
	      //width: 800,
	      //height: 350,
	      //bar: {groupWidth: "95%"},
	      //legend: { position: "none" },
	    };
	
	    var chart = new google.visualization.ColumnChart(document.getElementById('chart_div3'));
	    chart.draw(view, options);
	    
	    google.visualization.events.addListener(chart, 'select', selectHandler);

	    function selectHandler() {
	    	var selection = chart.getSelection();
	    	var message = '';
	    	var column = -1;
	    	
	    	for (var i = 0; i < selection.length; i++) {
	    		var item = selection[i];
	    		if (item.row != null && item.column != null) {
	    			column = item.row;
	    		}
	    	}

	    	var department;
	    	
	    	if (column == 0)
	    		department = "생산";
	    	else if (column == 1)
	    		department = "인사";
	    	else if (column == 2)
	    		department = "기술";
	    	else if (column == 3)
	    		department = "총무";
	    	
	    	$("#load_dep_ctl").load("c_measurement_dep_mgt?department="+department);
	    }
	}
	
	
function pdfdown1(){
			
	html2canvas(document.getElementById('pdf_div1'),{
        onrendered: function(canvas) {
         	var imgData = canvas.toDataURL('image/png',1);
        	var doc=new jsPDF('p','mm',"a4");
        	doc.addImage(imgData,'PNG',8,8,195,95);
    		doc.save('Controller_On/off.pdf');
		}
	 });

}
function pdfdown2(){
	
	html2canvas(document.getElementById('pdf_div2'),{
        onrendered: function(canvas) {
         	var imgData = canvas.toDataURL('image/png',1);
        	var doc=new jsPDF('p','mm',"a4");
        	doc.addImage(imgData,'PNG',8,8,195,95);
    		doc.save('department_On/off.pdf');
		}
	 });

}

	
</script>