package com.bakaqc.flower.controller;

import com.bakaqc.flower.dao.UserDAO;
import com.bakaqc.flower.model.User;
import com.bakaqc.flower.model.option.UserGender;
import com.bakaqc.flower.model.option.UserStatus;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CreateAccountController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String fullname = request.getParameter("fullname");
            String year = request.getParameter("year");
            String email = request.getParameter("email");
            String gender = request.getParameter("gender");
            String status = request.getParameter("status");
            String address = request.getParameter("address");
            String password = request.getParameter("password");
            String phone = request.getParameter("phone");
            String url = request.getHeader("referer");
            if (UserDAO.getInstance().selectByEmail(email) != null) {
                request.setAttribute("error", "Email existed!");
                List<User> users = UserDAO.getInstance().selectAll();
                request.setAttribute("users", users);
                request.getRequestDispatcher("/view/AccountAdmin.jsp").forward(request, response);
            } else {
                User user = new User();
                user.setPassword(password);
                user.setAddress(address);
                user.setEmail(email);
                user.setFullName(fullname);
                user.setPhone_number(phone);
                user.setStatus(UserStatus.create(status));
                user.setGender(UserGender.create(gender));
                user.setYearOfBirth(Integer.parseInt(year));
                UserDAO.getInstance().insert(user);
                response.sendRedirect(url);
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
    }

}
