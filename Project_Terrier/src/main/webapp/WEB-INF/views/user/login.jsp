<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인페이지</title>

<spring:url value="/resources/css/login.css" var="logincss"></spring:url>
<link href="${logincss}" rel="stylesheet">

<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
</head>
<body>

<div class="main">
    
<div class="container">
<center>
	<div class="middle">
      	<div id="login">
        	<form action="j_spring_security_check" method="post">
   
	          	<fieldset class="clearfix">
	           			<p>
	            		<span class="fa fa-user"></span>
	            		<input type="text"  Placeholder="아이디" name="id" required >
	            		</p> 
	            		
	            		<p>
	            		<span class="fa fa-lock"></span>
	            		<input type="password"  Placeholder="패스워드" name="pw" required>
	            		</p>
	            		 
	          		<div>
	             	 <span style="width:48%; text-align:left;  display: inline-block;">
	              	 	<a class="small-text" href="#">Join Request</a></span>
	             	 <span style="width:50%; text-align:right;  display: inline-block;">
	            	  	<input type="submit" value="로그인"></span>
	         		</div>
	          	</fieldset>
	          
				<div class="clearfix">
				</div>
        	</form>
        	<div class="clearfix"></div>
      </div> <!-- end login -->
      
    <div class="logo">TERRIER
       <div class="clearfix"></div>
   </div>
      
  </div>
</center>
</div>
</div>

<script src="/webjars/jquery/2.1.3/dist/jquery.min.js"></script>
<script src="/webjars/bootstrap/3.3.4/dist/js/bootstrap.min.js"></script>
</body>
</html>
<script>
var ck='${msg}';
if(ck=="logout")
	{
		alert("로그아웃되었습니다.");
	}
</script>