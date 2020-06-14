package com.company.servlet;

import org.hibernate.Session;

import javax.jms.Session;
import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class Search extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;

        String search__ss = (String)req.getSession().getAttribute("search");
        if (search__ss == null) {
            String SearchText = req.getParameter("search");
            if (SearchText == null) {
                req.getRequestDispatcher("/jsp-files/index.jsp").forward(req, resp);
            } else {
                Session session = SF.getInstance().openSession();
                HttpSession session_user = req.getSession();
                List UserList = ((Session) session).createQuery("select * from user where FIO like ':SearchText%'")
                        .setParameter("SearchText", SearchText).list();
                if (UserList.size() > 0) {
                    session_user.setAttribute("requestScope.users",UserList);
                    resp.sendRedirect(req.getContextPath());
                } else {
                    req.getRequestDispatcher("/jsp-files/index.jsp").forward(req, resp);
                }
            }
    }
}