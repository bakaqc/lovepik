package com.bakaqc.flower.controller;

import com.bakaqc.flower.dao.AdminDAO;
import com.bakaqc.flower.model.Admin;
import com.bakaqc.flower.model.option.AdminRole;
import com.bakaqc.flower.service.Hash;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class AdminRegisterController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        RequestDispatcher rd = request.getRequestDispatcher("/view/admin_register.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String userName = request.getParameter("username");
        String password = Hash.hashCode(request.getParameter("password"));
        String rePassword = Hash.hashCode(request.getParameter("re-password"));

        if (AdminDAO.getInstance().selectByUserName(userName) != null) {
            String errorMsg = "Tài khoản đã tồn lại!";
            request.setAttribute("errorUN", errorMsg);

            this.doGet(request, response);

        } else {
            if (password.equals(rePassword)) {

                Admin ad = new Admin();
                ad.setUserName(userName);
                ad.setPassword(password);
                ad.setRole(AdminRole.ADMIN);

                AdminDAO.getInstance().insert(ad);

                response.sendRedirect("admin");

            } else {

                String errorMsg = "Mật khẩu không khớp! Vui lòng kiểm tra lại.";
                request.setAttribute("errorPass", errorMsg);

                request.setAttribute("username", userName);

                this.doGet(request, response);
            }
        }
    }

}
