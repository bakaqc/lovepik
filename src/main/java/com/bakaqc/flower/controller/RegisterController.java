package com.bakaqc.flower.controller;

import com.bakaqc.flower.dao.UserDAO;
import com.bakaqc.flower.model.User;
import com.bakaqc.flower.model.option.UserGender;
import com.bakaqc.flower.model.option.UserStatus;
import com.bakaqc.flower.service.Hash;
import java.io.*;
import java.time.LocalDateTime;
import javax.servlet.*;
import javax.servlet.http.*;

public class RegisterController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        RequestDispatcher rd = request.getRequestDispatcher("/view/user_register.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String fullName = request.getParameter("fullname");
        int yearOfBirth = Integer.parseInt(request.getParameter("yearOfBirth"));
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("phone_number");
        String email = request.getParameter("email");
        String password = Hash.hashCode(request.getParameter("password"));
        String rePassword = Hash.hashCode(request.getParameter("re-password"));

        if (UserDAO.getInstance().selectByEmail(email) != null) {
            String errorMsg = "Email đã tồn lại! Vui lòng sử dụng Email khác.";
            request.setAttribute("errorEmail", errorMsg);

            request.setAttribute("fullName", fullName);
            request.setAttribute("yearOfBirth", yearOfBirth);
            request.setAttribute("address", address);
            request.setAttribute("phoneNumber", phoneNumber);

            this.doGet(request, response);

        } else {
            if (password.equals(rePassword)) {

                User us = new User();
                us.setFullName(fullName);
                us.setYearOfBirth(yearOfBirth);
                us.setGender(UserGender.create(gender));
                us.setEmail(email);
                us.setPassword(password);
                us.setAddress(address);
                us.setPhone_number(phoneNumber);
                us.setStatus(UserStatus.ACTIVATE);
                us.setCreatedAt(LocalDateTime.now());

                UserDAO.getInstance().insert(us);

                response.sendRedirect("login");

            } else {

                String errorMsg = "Mật khẩu không khớp! Vui lòng kiểm tra lại.";
                request.setAttribute("errorPass", errorMsg);

                request.setAttribute("fullName", fullName);
                request.setAttribute("yearOfBirth", yearOfBirth);
                request.setAttribute("address", address);
                request.setAttribute("phoneNumber", phoneNumber);
                request.setAttribute("email", email);

                this.doGet(request, response);
            }
        }

    }

}
