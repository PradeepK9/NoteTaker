package com.uiet.helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {
	private static SessionFactory factory = null;

	public static SessionFactory getFactory() {
		if (factory == null) {
			factory = new Configuration().configure("com/uiet/cfgs/hibernate.cfg.xml").buildSessionFactory();
		}
		return factory;
	}

	public void closeFactory() {
		if (factory.isOpen()) {
			factory.close();
		}
	}
}
