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
        String birthYear = request.getParameter("yearOfBirth");
        int yearOfBirth = Integer.parseInt(birthYear);
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("phone_number");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String passcode = Hash.hashCode(password);
        String rePassword = request.getParameter("re-password");
        String rePasscode = Hash.hashCode(rePassword);
// Kiểm tra năm sinh
        if (yearOfBirth < 1900 || yearOfBirth > 2023) {
            // Năm sinh không hợp lệ
            String errorMsg = "Năm sinh không hợp lệ! Vui lòng nhập lại.";
            request.setAttribute("errorYear", errorMsg);

            request.setAttribute("fullName", fullName);
            request.setAttribute("address", address);
            request.setAttribute("phoneNumber", phoneNumber);
            request.setAttribute("email", email);
            this.doGet(request, response);
        } else {
            // Năm sinh hợp lệ
// Kiểm tra số điện thoại
            if (phoneNumber.length() != 10) {
                // Số điện thoại không hợp lệ
                String errorMsg = "Số điện thoại phải có 10 kí tự số! Vui lòng nhập lại.";
                request.setAttribute("errorPhone", errorMsg);

                request.setAttribute("fullName", fullName);
                request.setAttribute("yearOfBirth", yearOfBirth);
                request.setAttribute("address", address);
                request.setAttribute("phoneNumber", phoneNumber);
                request.setAttribute("email", email);
                this.doGet(request, response);
            } else {
                // Số điện thoại hợp lệ
                if (UserDAO.getInstance().selectByEmail(email) != null) {
                    String errorMsg = "Email đã tồn lại! Vui lòng sử dụng Email khác.";
                    request.setAttribute("errorEmail", errorMsg);

                    request.setAttribute("fullName", fullName);
                    request.setAttribute("yearOfBirth", yearOfBirth);
                    request.setAttribute("address", address);
                    request.setAttribute("phoneNumber", phoneNumber);
                    request.setAttribute("email", email);

                    this.doGet(request, response);

                } else { // Kiểm tra mật khẩu
                    if (password.length() < 6) {
                        // Mật khẩu không hợp lệ
                        String errorMsg = "Mật khẩu phải ít nhất trên 6 ký tự! Vui lòng nhập lại.";
                        request.setAttribute("errorMissingPass", errorMsg);

                        request.setAttribute("fullName", fullName);
                        request.setAttribute("yearOfBirth", yearOfBirth);
                        request.setAttribute("address", address);
                        request.setAttribute("phoneNumber", phoneNumber);
                        request.setAttribute("email", email);

                        this.doGet(request, response);
                    } else {
                        // Mật khẩu hợp lệ // Kiểm tra mật khẩu nhập lại
                        if (password.equals(rePassword)) {
                            // Mật khẩu nhập lại trùng khớp với mật khẩu
                            User us = new User();
                            us.setFullName(fullName);
                            us.setYearOfBirth(yearOfBirth);
                            us.setGender(UserGender.create(gender));
                            us.setEmail(email);
                            us.setPassword(passcode);
                            us.setAddress(address);
                            us.setPhone_number(phoneNumber);
                            us.setStatus(UserStatus.ACTIVATE);
                            us.setCreatedAt(LocalDateTime.now());

                            UserDAO.getInstance().insert(us);

                            response.sendRedirect("login");

                        } else {
                            // Mật khẩu nhập lại không trùng khớp với mật khẩu
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
        }
    }
}
