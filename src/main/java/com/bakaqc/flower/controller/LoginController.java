package com.bakaqc.flower.controller;

import com.bakaqc.flower.dao.UserDAO;
import com.bakaqc.flower.model.User;
import com.bakaqc.flower.model.option.UserStatus;
import com.bakaqc.flower.service.Hash;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        RequestDispatcher rd = request.getRequestDispatcher("/view/user_login.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = UserDAO.getInstance().selectByEmail(email);

        if (user != null && user.getPassword().equals(Hash.hashCode(password)) && user.getStatus() == UserStatus.ACTIVATE) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            response.sendRedirect("home");

            return;
        }

        String errorMsg = "Sai mật khẩu!";
        if (user != null && user.getStatus() == UserStatus.DEACTIVATE) {
            String errorEmail = "Tài khoản đã bị khóa!";
            request.setAttribute("errorEmail", errorEmail);

            this.doGet(request, response);
        }
        if (user == null) {
            String errorEmail = "Tài khoản không tồn tại!";
            email = null;

            request.setAttribute("errorEmail", errorEmail);

            this.doGet(request, response);
        }

        request.setAttribute("email", email);
        request.setAttribute("errorMsg", errorMsg);

        this.doGet(request, response);
    }

}
