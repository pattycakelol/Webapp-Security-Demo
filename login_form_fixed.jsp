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
    <title>Secure Login</title>
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
<form method="post" action="login_action_fixed.jsp">
<label>Username:</label><input name="user" /><br>
<label>Password:</label><input name="pass" type="password" /><br>

<input type="submit" value="login"/><br>
Dont have an account? <a style="color: rgb(245, 110, 18);" href="register_form_fixed.html">Register Here!</a>
</form>
</div>

<div class="content">
<h4>
This login form is <font style="color: rgb(245, 110, 18);">protected</font> from SQL Injection.<br><br> 
Unlike the vulnerable login page, this page uses PreparedStatements correctly.<br>
PreparedStatements make a template of the SQL statement where some parameters (labeled "?") are left unspecified.<br>
This way, the result of the query is stored without executing it.<br><br>

Here is the SQL Injection-free code:<br>
<img src="login_form_fixed.png"><br>
Lines 4 and 5 retrieve data from the login form (username and password).<br>
Line 6 uses ?'s in place of where data from lines 4 and 5 would be in the SQL statement.<br>
Lines 9 and 10 then substitute the ?'s as values gathered by 4 and 5.<br><br>

Try performing another SQL Injection using the same line as last time:<br>
<textarea rows="1" cols="13" style="resize: none; overflow: hidden" readonly>
' OR 1=1 -- 
</textarea><br>
SQL Injection will not work on this login page because of the correct usage of PreparedStatements.<br><br>

<font style="color: rgb(245, 110, 18);">Click below to view the login page that is vulnerable to SQL Injection.</font><br>
<button class="nextButton" onclick="document.location = 'login_form.jsp'"/>Vulnerable Login Page</button>
</h4>
</div>

</body>
</html>