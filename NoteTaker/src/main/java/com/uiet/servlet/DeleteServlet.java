package com.uiet.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.uiet.entities.Note;
import com.uiet.helper.FactoryProvider;

public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			int noteId = Integer.parseInt(request.getParameter("note_id").trim());
			Session ses = FactoryProvider.getFactory().openSession();
			Transaction tx = ses.beginTransaction();
			Note note = (Note) ses.get(Note.class, noteId);
			ses.delete(note);
			tx.commit();
			ses.close();
			response.sendRedirect("all_notes.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
