<%@page import="com.sun.org.glassfish.gmbal.IncludeSubclass"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Notes</title>
<%@include file="all_css_js.jsp"%>
</head>

<body>
	<%@include file="navbar.jsp"%><br>
	<div class="container">
		<h1 class="text-uppercase text-center text-info">Please fill your Note details :</h1>

		<!-- add form -->
		<form action="SavaNoteServlet" method="post">
			<div class="form-group">
				<label for="title">Note Title</label> <input name="title"
					required="required" type="text" class="form-control" id="title"
					placeholder="Enter your note title" aria-describedby="emailHelp">

			</div>
			<div class="form-group">
				<label for="content">Note Content</label>
				<textarea required="required" name="content"  id="content"
					class="form-control" placeholder="Enter your note content"
					style="height: 300px">
				 </textarea>

				<div class="container text-center">
					<button type="submit" class="btn btn-primary">Add</button>
				</div>
		</form>

	</div>
</body>
</html>