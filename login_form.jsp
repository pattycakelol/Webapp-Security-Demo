<%
String user = (String) session.getAttribute( "user" );
String username = (String) session.getAttribute( "username" );
if (null == user) {
	username = "User";
}
%>
<html>
<style>
body {
	paddng: 0;
	margin: 0;
	background-color: rgb(61,72,80);
	color: white;
}
html, body {
	height: 100%;
}
button.backButton {
	position: absolute;
	float: right;
	vertical-align: middle;
    border: none;
    background-color: rgb(245, 110, 18);
    padding: 15px 15px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
	border-radius: 5px;
	right: 1%;
	top: 50%;
	transform: translateY(-50%);
}
button.nextButton {
	vertical-align: middle;
    border: none;
    background-color: rgb(245, 110, 18);
    padding: 15px 15px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
	border-radius: 5px;
}
div.wrapper {
	position: relative;
	background-image: url("bg.jpg");
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
	vertical-align: middle;
	top: 0%;
	height: 10%;
	z-index: 3;
}
div.content {
    padding: 25px;
	width: 600px;
	margin:0 auto;
	//text-align: center;
}
</style>
<head>
    <title>Vulnerable Login</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<div class="wrapper">
	<div style="padding:10px">
		<table width="100%">
			<td style="vertical-align: bottom">
				<h1 style="padding-top: 10px">
					SQL Injection
				</h1>
			</td>
			<td>
				<h1>Welcome, <font style="color: rgb(245, 110, 18);"><%= username %></font></h1>
			</td>
			<td>
				<button class="backButton" onclick="document.location = 'home_page.jsp'"/>Back to Home</button>
			</td>
			<td/>
		</table>
	</div>
</div>

<div style="float: left;">
<h2>Please login</h2>
<form method="post" action="login_action.jsp">
<label>Username:</label><input name="user" /><br>
<label>Password:</label><input name="pass" type="password" /><br>

<input type="submit" value="login"/><br>
Dont have an account? <a style="color: rgb(245, 110, 18);" href="register_form.html">Register Here!</a>
</form>
</div>

<div class="content">
<h4>
This login form is <font style="color: rgb(245, 110, 18);">vulnerable</font> to SQL Injection.<br><br> 
This means that the user may be able abuse the user input to execute SQL code in the website's database.<br><br>
Rather than providing expected input (username and password), the user may try to submit valid SQL code in an input field to, in this case, gain access to an account. <br><br>

The cause of this vulnerability is shown here:<br>
<img src="login_form_vulnerable.png"><br>
Lines 4 and 5 retrieve data from the login form (username and password).<br>
Line 6 showcases the issue. The variables from lines 4 and 5 are simply concatenated into the SQL query, allowing for whatever SQL code the user inputs to be executed.<br><br>

The person reading this could easily make your own account and log in, but where's the fun in that?<br>
Instead, try entering the following into the username text box and click "login":<br>
<textarea rows="1" cols="13" style="resize: none; overflow: hidden" readonly>
' OR 1=1 -- 
</textarea><br>
Make sure that you include the space at the end or you will recieve an error.<br>
This code essentially makes the "where" condition in the SQL statement always true, while commenting out the rest of it so that no password is necessary to log in.<br>
<br>
You will notice that you have now logged in as the last created user in the website's database.<br><br>

<font style="color: rgb(245, 110, 18);">Click below to view the fixed login page with SQL prevention.</font><br>
<button class="nextButton" onclick="document.location = 'login_form_fixed.jsp'"/>Secure Login Page</button>
</h4>
</div>

</body>
</html>