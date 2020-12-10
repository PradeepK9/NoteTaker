package com.uiet.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.uiet.entities.Note;
import com.uiet.helper.FactoryProvider;

public class SavaNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SavaNoteServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		Note note = new Note(title, content, new Date());
		//System.out.println(note.getId()+"         "+note.getTitle()+"          "+note.getContent());
		try {
			SessionFactory factory = FactoryProvider.getFactory();
			Session session = factory.openSession();
			Transaction tx = session.beginTransaction();
			session.save(note);
			tx.commit();
			session.close();
			PrintWriter out = response.getWriter();
			response.setContentType("text/html");
			out.println("<h1 style='text-align:center'>Note is added successfully</h1>");
			out.println("<h1 style='text-align:center'> <a href='all_notes.jsp'>View All</h1>");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
