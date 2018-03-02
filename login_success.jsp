<% String username = (String) session.getAttribute( "username" ); %>
<html>
<style>
body {
	paddng: 0;
	margin: 0;
	background-color: rgb(61,72,80);
	color: white;
	position: relative;
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
div.wrapper {
	position: relative;
	background-image: url("bg.jpg");
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
	vertical-align: middle;
	top: 0%;
	height: 10%;
	z-index: 3;
}
div.verticalCenter {
	position: absolute;
	top: 20%;
	left: 50%;
	transform: translateY(-50%) translateX(-50%);
}
</style>
<head>
    <title>Login Successful</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<div class="wrapper">
	<div style="padding:10px">
		<table width="100%">
			<td style="vertical-align: bottom">
				<h1 style="padding-top: 10px">
					Login Successful
				</h1>
			</td>
			<td>
				<button class="backButton" onclick="document.location = 'home_page.jsp'"/>Back to Home</button>
			</td>
			<td/>
		</table>
	</div>
</div>
<div class="verticalCenter">
	<h2>You have logged in as: <%= username %></h2>
</div>
</center>
</body>
</html>