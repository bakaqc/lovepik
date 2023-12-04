package com.bakaqc.flower.controller;

import com.bakaqc.flower.dao.CategoriesDAO;
import com.bakaqc.flower.dao.UserDAO;
import com.bakaqc.flower.model.Categories;
import com.bakaqc.flower.model.User;
import com.bakaqc.flower.model.option.UserGender;
import com.bakaqc.flower.service.Hash;
import java.io.*;
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
        String conPassword = Hash.hashCode(request.getParameter("password"));

        HttpSession session = request.getSession();
        User us = (User) session.getAttribute("user");

        if (!conPassword.equals(us.getPassword())) {
            String errPass = "Xác nhận mật khẩu không đúng! Vui lòng kiểm tra lại.";
            request.setAttribute("errPass", errPass);

            request.setAttribute("sessionScope.user.fullName", newName);
            request.setAttribute("sessionScope.user.yearOfBirth", newYearOfBirth);
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
