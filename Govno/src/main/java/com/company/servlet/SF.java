package com.company.servlet;

import com.company.servlet.entity.UserLogin;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import com.company.servlet.entity.User;

public class SF {
    private static SessionFactory sf;
    private static void init(){
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        } catch (Exception x){
            System.err.println("Sorry, no MSSQL!");
        }

        Configuration cfg = new Configuration()
                .addAnnotatedClass(User.class)
                .addAnnotatedClass(UserSession.class);

        cfg.setProperty("hibernate.connection.url", "jdbc:sqlserver://localhost\\Username;database=User;CharacterSet=UTF-8");
        cfg.setProperty("hibernate.connection.username", "User");
        cfg.setProperty("hibernate.connection.password", "123");
        cfg.setProperty("hibernate.hbm2ddl.auto", "update");

        StandardServiceRegistryBuilder builder = new StandardServiceRegistryBuilder();
        builder.applySettings(cfg.getProperties());
        sf = cfg.buildSessionFactory(builder.build());
    }

    static {
        init();
    }

    private SF(){}

    public static SessionFactory getInstance(){
        if(sf == null) {
            init();
        }
        return sf;
    }
}