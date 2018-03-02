<%@include file="db.jsp" %><%

//Check user
String user = request.getParameter( "user" );
String pass = request.getParameter( "pass" );
String sqlStr = "SELECT fullname FROM login WHERE user='" + user + "' and pass = sha2('"+ pass + "', 256)";
sqlStr = sqlStr.toLowerCase();
if (sqlStr.contains("drop") || sqlStr.contains("insert") || sqlStr.contains("delete") || sqlStr.contains("rename") || sqlStr.contains("create") || sqlStr.contains("alter")) {
	response.sendRedirect("nicetry.html");
}
else {
	PreparedStatement stmt = con.prepareStatement(sqlStr);
	ResultSet rs = stmt.executeQuery();

	if ( rs.next() ) {
		session.setAttribute( "user", user );
		session.setAttribute( "username", rs.getString(1) );
		session.setMaxInactiveInterval(60*20);
		response.sendRedirect("login_success.jsp");	
	} else {
		response.sendRedirect("login_form.jsp");
	}
}
%>



<%
//Correct
/*
String sqlStr = "SELECT fullname FROM login WHERE user=? and pass = sha2(?, 256)";
PreparedStatement stmt = con.prepareStatement(sqlStr);
stmt.setString(1,user);
stmt.setString(2,pass);
ResultSet rs = stmt.executeQuery();
rs.next();
if ( rs.getInt(1) == 1 ) isAuth=true;
*/

//SQL Injection attack
//' OR '1'='1' -- 
//' or 1=1 order by user desc -- 

%>
