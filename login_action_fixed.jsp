<%@include file="db.jsp" %><%

//Check user
String user = request.getParameter( "user" );
String pass = request.getParameter( "pass" );
String sqlStr = "SELECT fullname FROM login WHERE user=? and pass = sha2(?, 256)";
PreparedStatement stmt = con.prepareStatement(sqlStr);
stmt.setString(1,user);
stmt.setString(2,pass);
ResultSet rs = stmt.executeQuery();

if ( rs.next() ) {
	session.setAttribute( "user", user );
	session.setAttribute( "username", rs.getString(1) );
	session.setMaxInactiveInterval(60*20);
	response.sendRedirect("login_success.jsp");	
} else {
	response.sendRedirect("login_form_fixed.jsp");
}
%>