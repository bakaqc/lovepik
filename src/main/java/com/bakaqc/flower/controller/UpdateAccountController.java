package com.bakaqc.flower.controller;

import com.bakaqc.flower.dao.UserDAO;
import com.bakaqc.flower.model.User;
import com.bakaqc.flower.model.option.UserGender;
import com.bakaqc.flower.model.option.UserStatus;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateAccountController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String id = request.getParameter("id");
        String fullname = request.getParameter("fullname");
        String year = request.getParameter("year");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        String status = request.getParameter("status");
        String address = request.getParameter("address");
        String url = request.getHeader("referer");
        User u = UserDAO.getInstance().selectByEmail(email);
        if (u != null && u.getId() != Integer.parseInt(id)) {
            request.setAttribute("error", "Email existed!");
            List<User> users = UserDAO.getInstance().selectAll();
            request.setAttribute("users", users);
            request.getRequestDispatcher("/view/AccountAdmin.jsp").forward(request, response);
        } else {
            User user = new User();
            user.setPassword(u.getPassword());
            user.setId(Integer.parseInt(id));
            user.setAddress(address);
            user.setEmail(email);
            user.setFullName(fullname);
            user.setPhone_number(u.getPhone_number());
            user.setStatus(UserStatus.create(status));
            user.setGender(UserGender.create(gender));
            user.setYearOfBirth(Integer.parseInt(year));
            UserDAO.getInstance().update(user);
            response.sendRedirect(url);
        }
    }

}
