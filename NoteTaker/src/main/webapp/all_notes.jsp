<%@page import="com.uiet.entities.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.uiet.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Note Taker : All Notes</title>
<%@include file="all_css_js.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%><br>
	<div class="container">
		<h1 class="text-uppercase text-center text-danger">Your All Notes
			are here</h1>
		<br>
		<div class="row">
			<div class="col-12">
				<%
					Session ses = FactoryProvider.getFactory().openSession();
					Query query = ses.createQuery("from Note");
					List<Note> list = query.list();
					for (Note note : list) {
				%>
				<div class="card mt-3" style="">
					<img src="img/notes.png" class="m-4 mx-auto"
						style="max-width: 100px" "card-img-top" alt="...">
					<div class="card-body px-5">
						<h4 class="card-title"><%=note.getTitle()%></h4>
						<p class="card-text"><%=note.getContent()%></p>
						<br> <i><b>Last updated Date and Time : </b><%=note.getAddedDate()%></i>
						<div class="container mt-3" style="text-align: center">
							<a href="DeleteServlet?note_id=<%=note.getId()%>"
								class="btn btn-danger">Delete</a> 
								<a href="edit.jsp?note_id=<%=note.getId()%>"
								class="btn btn-primary">Update</a>
						</div>
					</div>
				</div>
				<%
					}
					ses.close();
				%>
			</div>
		</div>

	</div>
</body>
</html>