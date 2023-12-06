package com.bakaqc.flower.controller;

import com.bakaqc.flower.dao.CategoriesDAO;
import com.bakaqc.flower.dao.UserDAO;
import com.bakaqc.flower.model.Categories;
import com.bakaqc.flower.model.User;
import com.bakaqc.flower.model.option.UserGender;
import com.bakaqc.flower.model.option.UserStatus;
import com.bakaqc.flower.service.Hash;
import java.io.*;
import java.time.LocalDateTime;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;

public class EditProfileController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        List<Categories> listCAT = CategoriesDAO.getInstance().selectAll();

        request.setAttribute("listCAT", listCAT);
        request.getRequestDispatcher("/view/user_edit.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String newName = request.getParameter("fullName");
        int newYearOfBirth = Integer.parseInt(request.getParameter("yearOfBirth"));
        String newGender = request.getParameter("gender");
        String newPhoneNumber = request.getParameter("phoneNumber");
        String newAddress = request.getParameter("address");
        String conPass = request.getParameter("password");
        String conPassword = Hash.hashCode(conPass);

        HttpSession session = request.getSession();
        User us = (User) session.getAttribute("user");
// Kiểm tra năm sinh
        if (newYearOfBirth < 1900 || newYearOfBirth > 2023) {
            // Năm sinh không hợp lệ
            String errorMsg = "Năm sinh không hợp lệ!";
            request.setAttribute("errorNewYear", errorMsg);

            request.setAttribute("sessionScope.user.newName", newName);
            request.setAttribute("sessionScope.user.newYearOfBirth", newYearOfBirth);
            request.setAttribute("sessionScope.user.gender", newGender);
            request.setAttribute("sessionScope.user.phone_number", newPhoneNumber);
            request.setAttribute("sessionScope.user.address", newAddress);
            this.doGet(request, response);
        } else {
            // Năm sinh hợp lệ
// Kiểm tra số điện thoại
            if (newPhoneNumber.length() != 10) {
                // Số điện thoại không hợp lệ
                String errorMsg = "Số điện thoại phải có 10 kí tự số!";
                request.setAttribute("errorNewPhone", errorMsg);

                request.setAttribute("sessionScope.user.newName", newName);
                request.setAttribute("sessionScope.user.newYearOfBirth", newYearOfBirth);
                request.setAttribute("sessionScope.user.gender", newGender);
                request.setAttribute("sessionScope.user.phone_number", newPhoneNumber);
                request.setAttribute("sessionScope.user.address", newAddress);
                this.doGet(request, response);
            } else {
                // Số điện thoại hợp lệ
                // Kiểm tra mật khẩu
                if (conPass.length() < 6) {
                    // Mật khẩu không hợp lệ
                    String errorMsg = "Mật khẩu phải có ít nhất 6 ký tự!";
                    request.setAttribute("errorMissingNewPass", errorMsg);

                    request.setAttribute("sessionScope.user.newName", newName);
                    request.setAttribute("sessionScope.user.newYearOfBirth", newYearOfBirth);
                    request.setAttribute("sessionScope.user.gender", newGender);
                    request.setAttribute("sessionScope.user.phone_number", newPhoneNumber);
                    request.setAttribute("sessionScope.user.address", newAddress);

                    this.doGet(request, response);
                } else {
                    // Mật khẩu hợp lệ // Kiểm tra mật khẩu nhập lại
                    if (!conPassword.equals(us.getPassword())) {
                        String errPass = "Xác nhận mật khẩu không đúng! Vui lòng kiểm tra lại.";
                        request.setAttribute("errPass", errPass);

                        request.setAttribute("sessionScope.user.newName", newName);
                        request.setAttribute("sessionScope.user.newYearOfBirth", newYearOfBirth);
                        request.setAttribute("sessionScope.user.gender", newGender);
                        request.setAttribute("sessionScope.user.phone_number", newPhoneNumber);
                        request.setAttribute("sessionScope.user.address", newAddress);

                        this.doGet(request, response);

                    } else {
                        us.setFullName(newName);
                        us.setYearOfBirth(newYearOfBirth);
                        us.setGender(UserGender.create(newGender));
                        us.setPhone_number(newPhoneNumber);
                        us.setAddress(newAddress);

                        UserDAO.getInstance().update(us);

//            String success = "Chỉnh sửa thông tin thành công.";
//            request.setAttribute("success", success);
//            request.getRequestDispatcher("/view/user_profile.jsp").forward(request, response);
                        response.sendRedirect("profile");
                    }
                }

            }
        }

    }
}
