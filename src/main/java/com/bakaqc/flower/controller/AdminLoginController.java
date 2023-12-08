package com.bakaqc.flower.controller;

import com.bakaqc.flower.dao.AdminDAO;
import com.bakaqc.flower.model.Admin;
import com.bakaqc.flower.service.Hash;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class AdminLoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        RequestDispatcher rd = request.getRequestDispatcher("/view/admin_login.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Admin ad = AdminDAO.getInstance().selectByUserName(username);
        if (ad != null && ad.getPassword().equals(Hash.hashCode(password))) {
            HttpSession session = request.getSession();
            session.setAttribute("user", ad);
            response.sendRedirect("admin");
            return;
        }

        if (ad == null) {
            String errorUSN = "Tài khoản không tồn tại!";
            ad = null;

            request.setAttribute("errorUSN", errorUSN);
            this.doGet(request, response);
        }

        String errorMsg = "Sai mật khẩu!";
        request.setAttribute("username", username);
        request.setAttribute("errorMsg", errorMsg);

        this.doGet(request, response);
    }

}
