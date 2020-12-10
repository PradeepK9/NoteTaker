<%@page import="com.uiet.entities.Note"%>
<%@page import="com.uiet.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Note Taker : Edit Page</title>
<%@include file="all_css_js.jsp"%>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		<h1>Please update your Note :</h1>
		<%
			int noteId = Integer.parseInt(request.getParameter("note_id").trim());
			Session ses = FactoryProvider.getFactory().openSession();
			Note note = (Note) ses.get(Note.class, noteId);
			ses.close();
		%>

		<form action="UpdateServlet" method="post">
			<input value=<%=note.getId()%> name="noteId" type="hidden">
			<div class="form-group">
				<label for="title">Note Title</label> <input name="title"
					required="required" type="text" class="form-control" id="title"
					placeholder="Enter your note title" aria-describedby="emailHelp"
					value="<%=note.getTitle()%>">

			</div>
			<div class="form-group">
				<label for="content">Note Content</label>
				<textarea name="content" required="required" id="content"
					class="form-control" placeholder="Enter you note nontent here"
					style="height: 300px"><%=note.getContent()%>
				 </textarea>

				<div class="container text-center">
					<button type="submit" class="btn btn-success">Save Note</button>
				</div>
		</form>


	</div>
</body>
</html>