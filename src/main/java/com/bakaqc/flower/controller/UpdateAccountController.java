package com.bakaqc.flower.controller;

import com.bakaqc.flower.dao.UserDAO;
import com.bakaqc.flower.model.User;
import com.bakaqc.flower.model.option.UserGender;
import com.bakaqc.flower.model.option.UserStatus;
import java.io.IOException;
import java.io.PrintWriter;
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
        String id = request.getParameter("id");
        String fullname = request.getParameter("fullname");
        String year = request.getParameter("year");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        String status = request.getParameter("status");
        String address = request.getParameter("address");
        
        String url = request.getHeader("referer");
        if (UserDAO.getInstance().selectByEmail(email) != null) {
            request.setAttribute("error", "Email existed!");
            request.getRequestDispatcher(url).forward(request, response);
        } else {
            User user = new User();
            user.setId(Integer.parseInt(id));
            user.setAddress(address);
            user.setEmail(email);
            user.setFullName(fullname);
            user.setStatus(UserStatus.create(status));
            user.setGender(UserGender.create(gender));
            user.setYearOfBirth(Integer.parseInt(year));
            UserDAO.getInstance().update(user);
            response.sendRedirect(url);
        }
    }

}
