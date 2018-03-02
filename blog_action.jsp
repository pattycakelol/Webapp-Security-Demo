<%@include file="db.jsp" %>
<%
String title = request.getParameter( "blogtitle" );
String content = request.getParameter( "blogcontent" );
String user = (String) session.getAttribute( "user" );

String sqlStr = "insert into blog(title, content, user) values (?, ?, ?)";
PreparedStatement stmt = con.prepareStatement(sqlStr);
stmt.setString(1,title);
stmt.setString(2,content);
stmt.setString(3,user);

Statement stmt = con.createStatement();
stmt.execute(sqlStr);
response.sendRedirect("blog_list.jsp");
%>