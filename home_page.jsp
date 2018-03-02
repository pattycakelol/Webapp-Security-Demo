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
button.otherButtons {
    border: none;
    background-color: rgb(83, 175, 63);
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
	border-radius: 5px;
	width:100%;
}
button:hover {
    opacity: 0.8;
}
div.header {
	position: relative;
	background-image: url("bg.jpg");
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
	vertical-align: middle;
	top: 0%;
	height: 10%;
	z-index: 3;
}
div.otherButtons {
	background-color: rgb(48,55,63);
	position: absolute;
	left: 0%;
	bottom: 0%;
	width: 20%;
	height: 90%;
	box-shadow: 10px 0 30px rgba(0, 0, 0, 0.2);
	z-index: 2;
}
div.content {
	position: absolute;
	right: 0%;
	bottom: 0%;
	width: 80%;
	height: 90%;
	z-index: 1;
}
</style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Security Demo</title>
    </head>
	<body>
		<div class="header">
		<div style="padding:10px">
		<table width="100%">
			<td width="40%">
				<h1 style="padding-top: 10px">
					Security Demo Website
				</h1>
			</td>
			<td>
				<h1>Welcome, <font style="color: rgb(245, 110, 18);"><%= username %></font></h1>
			</td>
			<td>
				<button class="backButton" onclick="document.location = 'index.html'"/>Back to Index</button>
			</td>
		</table>
		</div>
		</div>
		
		<div class="content">
			<div style="padding:10px">
				To do:<br>
				-CAPTCHA (google? make my own?) at index<br>
				-Format this section<br>
				-Format blog<br>
				-Create fixed blog<br>
				<br>
				Homepage text:<br>
				Over the years, security has become a more and more important aspect of application design.<br>
				<br>
				During the tech industry's early stages of growth, there was a great focus on the functionality of a product.<br>
				Applications were dished out left and right, but little thought was given as to how secure they were.<br>
				<br>
				Today, attacks on insecure code happen on a daily basis, leading to a huge need for application security.<br> 
				Web application security has become particularly important now that almost everything today relies on the internet.<br>
				<br>
				[OWASP talk]
			<br>
			</div>
		</div>
		
		<div class="otherButtons">
			<div style="padding:10px">
				<table cellpadding="5" align="center">
					<tr><td>
						<center><h2>Demonstrations:</h2></center>
					</td></tr>
					<tr><td>
						<%
						if (null == user) {
							out.print("<button class='otherButtons' onclick=\"document.location = 'login_form.jsp';\"/>SQL Injection</button>");
						}
						else {
							out.print("<button class='otherButtons' onclick=\"document.location='login_form.jsp'\"/>SQL Injection</button>");
							out.print("<button class='otherButtons' style='background-color: red;' onclick=\"document.location = 'logout_action.jsp'\"/>Logout</button>");
						}
						%>
					</td></tr>
					<tr><td>
						<button class="otherButtons" onclick="document.location = 'blog_list.jsp'"/>Cross-Site Scripting (XSS)</button>
					</td></tr>
				</table>
				<center><button class="otherButtons" style="width: 50%" onclick="document.location = 'about.html'"/>About</button></center>
			</div>
		</div>
	</body>
</html>