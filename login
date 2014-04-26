<html>
<head>
    <link rel="stylesheet" href="default.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>login and signup</title>
<link rel="stylesheet" href="default.css">
<script type="text/javascript" src="jquery.js">
</script>
<script type="application/javascript">		
$(document).ready(function()
{
	$("#login_button").click(function(){
	var username=$("#login_username");
	var password=$("#login_password");
	if(username!="" && password!="")
	{
		var data=$("#loginForm").serializeArray();
		$.post($("#loginForm").attr("action"),data,function(info){
		$("#login_status").html(info);
		if($("#login_status").html()=="login Successfull")
		{
			window.location = "welcome.php";
			}
		});
		}
	});
	
	$("#loginForm").submit(function(){
		return false;
		});
		
	$("#register").click(function(){
		var name =$("#name").val();
	var username =$("#username").val();
	var email=$("#email").val();
	var password =$("#password").val();
		if(name!="" && $("#status").text()=="Available" && email!="" && password != "")
	{
	var data=$("#signupForm ").serializeArray();
	$.post($("#signupForm").attr("action"),data,function(info){
		$("#Signup_status").html(info);
		clear();
		$("#username").val("");
		});
	}
		else 
			{
				$("#Signup_status").html("All Fields are requied");
				}
		});
	
	
		$("#signupForm").submit(function(){
		return false;
		});
		
function clear(){
	$("#signupForm :input").each(function(index, element) {
        $(this).val("");
    });
	}
	
$(".tab").click(function()
{
var X=$(this).attr('id');
 
if(X=='signup')
{
$("#login").removeClass('select');
$("#signup").addClass('select');
$("#loginbox").slideUp();
$("#signupbox").slideDown();
}
else
{
$("#signup").removeClass('select');
$("#login").addClass('select');
$("#signupbox").slideUp();
$("#loginbox").slideDown();
}
 
});

$("#name").change(function()
{
	var name=$("#name").val();
	var ck_name = /^[A-Za-z ]{3,20}$/;
	if(ck_name.test(name)==false)
	{
		$("#name_status").html('<font color="#cc0000">'+name+': Invalid User Name</font>');
		$("#name").val("");
		}
		else
		$("#name_status").text("");
	});
	
$("#username").change(function() 
{ 
var ck_username = /^[A-Za-z0-9_]{1,20}$/;
var username = $("#username").val();
var msgbox = $("#status");

if(username.length > 3 && (ck_username.test(username)==true))
{
$("#status").html('<img src="loader.gif" align="absmiddle">&nbsp;Checking availability...');

$.ajax({  
    type: "POST",  
    url: "username_check.php",  
    data: "username="+ username,  
    success: function(msg){  
   
   $("#status").ajaxComplete(function(event, request){ 

	if(msg == 'OK')
	{ 
        msgbox.html('<font color="Green">Available</font>');
	}  
	else  
	{  
	     $("#username").removeClass("green");
		 $("#username").addClass("red");
		msgbox.html(msg);
	}  
   });
   } 
   
  }); 

}
else
{
 $("#username").addClass("red"); 
$("#status").html('<font color="#cc0000">'+username+': Invalid User Name</font>');
}



return false;
});

$("#email").change(function() 
{ 

var email = $("#email").val();
var status = $("#email_status");

function validEmail()
{
var x=email;
var atpos=x.indexOf("@");
var dotpos=x.lastIndexOf(".");
if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length)
  {
  return false;
  }
  else
  return true;
}

if(validEmail()==true)
{
$("#email_status").html('<img src="loader.gif" align="absmiddle">&nbsp;Checking availability...');

$.ajax({  
    type: "POST",  
    url: "email_check.php",  
    data: "email="+ email,  
    success: function(msg){  
   
   $("#email_status").ajaxComplete(function(event, request){ 

	if(msg == 'OK')
	{ 
        status.html('<font color="Green">Available</font>');
	}  
	else  
	{  
	     $("#email").removeClass("green");
		 $("#email").addClass("red");
		  status.html(msg);
		  
	}  
   });
   } 
   
  }); 

}
else
{
 $("#email").addClass("red");
$("#email_status").html(email+'<font color="#cc0000">Invalid Email</font>');
}
return false;
});


	
});
</script>
<style>
body
{
	font-family:Arial, Helvetica, sans-serif;
	font-size:12px; 
        background-color:#5500; 
}
#container
{
	width:600px
}
#tabbox
{
	height:40px
}
#panel
{
	background-color:#FFF;
	height:300px;
	
}
.tab
{
background: #dedede;
display: block;
height: 40px;
line-height: 40px;
text-align: center;
width: 80px;
float: right;
font-weight: bold;
-webkit-border-top-left-radius: 4px;
-webkit-border-top-right-radius: 4px;
-moz-border-radius: 4px 4px 0px 0px;
}
.tab:hover{
    color:blue;
}
a
{
color: #000;
margin: 0;
padding: 0;
text-decoration: none;
}
.signup
{
	margin-left:8px;
	
}
.select
{
	background-color:#FFF;
	
}
#loginbox
{
	height:300px;
	padding:10px;
}
#signupbox
{
	height:800px;
	padding:10px;
	display:none;
}


</style>
</head>
<body>
<div style="margin:40px" align="center">
<div id="container">
<div id="tabbox">
<a href="#" id="signup" class="tab signup">Signup</a>
<a href="#" id="login" class="tab select">Login</a>
</div>
<div id="panel">
<div id="loginbox"><h1>Login Form</h1>
  <p>&nbsp;</p>
  <form id="loginForm" action="login.php" method="post">
<table  align="center">
<tr>
<th  width="188" height="37"> User_Name/Email</th> 
<th width="358" align="left"><input type="text" id="login_username" name="login_username" required></th>
</tr>
<tr>
<th height="47">Password</th>
  <th align="left"><input type="password" id="login_password" name="login_password" required></th>
</tr>
<tr>
<th colspan="2"><input name="login_button" type="submit" class="button" id="login_button" value="Login"></th> 
</tr>
</table> 
<span id="login_status"></span>
</form>
</div>
<form id="signupForm" action="register.php" method="POST">
<div id="signupbox"><h1>Singup Form</h1>
<table align="center">
<tr>
<th align="left">Full Name</th>
<th><input type="text" id="name" name="name" method="" required></th>
<th><span id="name_status"></span></th>
</tr>
<tr>
<th align="left">User Name</th>
<th align="left"><input type="text" id="username" name="username" required></th>
<th><span id="status"></span></th>
</tr>
<br>
<tr>
<th align="left">Email</th>
<th align="left"><input type="text" id="email" name="email" required></th>
<th><span id="email_status"></span></th>
</tr>
<tr>
<th align="left">Password</th>
<th align="left"><input type="password" id="password" name="password" required></th>
<th><span id="password_status"></span></th>
</tr>
<tr>
<th colspan="2"><button id="register" class="button" name="register" >Register</button ></th>
</tr>
</table>
<span id="Signup_status"></span>
</div>
</form>
</div >
</div>
</div>
</body>
</html>
