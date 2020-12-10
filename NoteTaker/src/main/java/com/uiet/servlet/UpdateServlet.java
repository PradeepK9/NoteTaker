package com.uiet.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.uiet.entities.Note;
import com.uiet.helper.FactoryProvider;

public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdateServlet() {
		super();

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int noteId = Integer.parseInt(request.getParameter("noteId").trim());
		Session ses = FactoryProvider.getFactory().openSession();
		Transaction tx = ses.beginTransaction();
		Note note = (Note) ses.get(Note.class, noteId);
		note.setTitle(title);
		note.setContent(content);
		note.setAddedDate(new Date());
		tx.commit();
		ses.close();
		response.sendRedirect("all_notes.jsp");
	}

}
