<%@include file="db.jsp" %>
<%
String title = request.getParameter( "blogtitle" );
String content = request.getParameter( "blogcontent" );
String user = (String) session.getAttribute( "user" );

String sqlStr = "insert into blog(title, content, user) values ('" + title + "', '" + content + "', '" + user + "')";
Statement stmt = con.createStatement();
stmt.execute(sqlStr);

response.sendRedirect("blog_list.jsp");
%>