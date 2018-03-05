<%@include file="db.jsp" %><%

String user = (String) session.getAttribute( "user" );
String username = (String) session.getAttribute( "username" );
if (null == user) {
	response.sendRedirect("blog_enter_fail.html");
}

//Check user
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery("SELECT title, content, fullname from blog natural join login");
%>
<html>
<style>
body {
	paddng: 0;
	margin: 0;
	background-color: rgb(61,72,80);
	color: white;
}
button.backButton {
	position: absolute;
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
	top: 3%;
	transform: translateY(-50%);
}
.blogitem {
	background-color: rgb(87, 103, 115);
	border: 5px outset rgb(245, 110, 18);
	border-radius: 10px;
	margin:5px;
	padding: 10px;
}
</style>
<head>
<link rel="stylesheet" href="style.css">
<title>XSS Demo</title>
</head>
<body>
<h1>Cross-Site Scripting (XSS) <span style="float:right; padding-right: 10%"> Welcome, <%= username %> &nbsp;&nbsp;&nbsp;&nbsp;<button class="backButton" onclick="document.location = 'home_page.jsp'">Back to Home</button> &nbsp;&nbsp;&nbsp;&nbsp;</span></h1>

<hr>
<div style="padding-left: 10px;">
<b style="color: rgb(245, 110, 18)">What is an XSS attack?</b><br>
<br>
"Cross-Site Scripting (XSS) attacks are a type of injection, in which malicious scripts are injected into otherwise benign and trusted web sites.<br>
XSS attacks occur when an attacker uses a web application to send malicious code, generally in the form of a browser side script, to a different end user.<br>
Flaws that allow these attacks to succeed are quite widespread and occur anywhere a web application uses input from a user within the output it generates without validating or encoding it."<br>
[via <a href="https://www.owasp.org/index.php/Cross-site_Scripting_(XSS)">https://www.owasp.org/index.php/Cross-site_Scripting_(XSS)</a>]<br>
<br>
<b style="color: rgb(245, 110, 18)">tl;dr :</b><br>
A website(may be harmless) that does not protect against XSS may be vulnerable to its users injecting valid javascript code onto it. <br>
When another user visits the website, upon opening the page with the malicious injected code, their browser trustingly runs the code because the javascript is part of the html.<br>
<br>
<b style="color: rgb(245, 110, 18)">How does it work?</b><br>
<br>
Firstly, it is important to know that browsers are very trusting.<br>
When your browser comes across a &lt;script&gt; tag, it goes, "hey thats javascript! I can run that!"<br>
It proceeds to process the javascript code found within the script tags with no regard to how malicious it may be.<br>
<br>
Javascript is dangerous.<br>
Imagine if you could get whatever javascript you wanted to run on another user's computer.<br>
Through XSS, this is possible.<br>
<br>

</div>
<hr>
<h1>Vulnerable Comment Section</h1>
<%	
while ( rs.next() ) {
	out.print("<div class='blogitem'><h2 style='color:rgb(245, 110, 18);'>" + rs.getString(1) + "</h2><h2>" + rs.getString(2) + "</h2>");
	out.print("- " + rs.getString(3) + "</div>");
}

String csrf = "" + System.currentTimeMillis() + Math.random() * 10000000;
session.setAttribute("csrf", csrf);
%>
<hr>
<div style="padding-left: 10px;">
	<h3>Add a comment</h2>
	<div style="padding-top: 5px;">
		<form  method="post" action="blog_action.jsp">
			Title:<br> 
			<textarea name="blogtitle" size=100 maxlength="50" style='width: 400px; resize: none; overflow: hidden;'/></textarea><br>
			Content:<br>
			<textarea name="blogcontent" rows=10 cols=100 style='width: 400px; resize: none;'></textarea><br>
			<input type="submit" value="Add Blog"/>
			
			<input type="hidden" name="csrftoken" value=<% out.print(csrf); %>
		</form>
	</div>
</div>

<%
//Correct
/*
String sqlStr = "SELECT count(*) FROM login WHERE user=? and pass = sha2(?, 256)";
PreparedStatement stmt = con.prepareStatement(sqlStr);
stmt.setString(1,name);
stmt.setString(2,pwd);
ResultSet rs = stmt.executeQuery();
rs.next();
if ( rs.getInt(1) == 1 ) isAuth=true;
*/

//SQL Injection attack
// a ' OR '1'='1' -- 

%>
