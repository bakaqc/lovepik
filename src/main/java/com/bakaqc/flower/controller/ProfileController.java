package com.bakaqc.flower.controller;

import com.bakaqc.flower.dao.DataOrderDAO;
import com.bakaqc.flower.dao.OrderDAO;
import com.bakaqc.flower.dao.UserDAO;
import com.bakaqc.flower.model.HistoryBuy;
import com.bakaqc.flower.model.User;
import com.bakaqc.flower.model.option.UserGender;
import com.bakaqc.flower.service.Hash;
import java.io.*;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;

public class ProfileController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        HttpSession session = request.getSession();
        User us = (User) session.getAttribute("user");
        int amountSold = DataOrderDAO.getInstance().quantitySold(us.getId());
        int amountCan = DataOrderDAO.getInstance().amountCanceled(us.getId());

        int index = 1;
        try {
            String indexP = request.getParameter("index");
            index = Integer.parseInt(indexP);
        } catch (NumberFormatException ex) {
            index = 1;
        } catch (Exception ex) {
            index = 1;
        }

        int limit = 4;
        int offset = index;

        List<HistoryBuy> listHB = DataOrderDAO.getInstance().pagingHistoryBuy(us.getId(), limit, offset);

        int countH = DataOrderDAO.getInstance().countHistoryBuy(us.getId());
        int endP = countH / limit;
        if (countH % limit != 0) {
            endP++;
        }

        request.setAttribute("amountS", amountSold);
        request.setAttribute("amountC", amountCan);
        request.setAttribute("listHB", listHB);
        request.setAttribute("index", index);
        request.setAttribute("endP", endP);
        request.getRequestDispatcher("/view/user_profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        HttpSession session = request.getSession();
        User us = (User) session.getAttribute("user");

        String newName = request.getParameter("fullName");
        int newYearOfBirth = Integer.parseInt(request.getParameter("newYearOfBirth"));
        String newGender = request.getParameter("gender");
        String newPhoneNumber = request.getParameter("phoneNumber");
        String newAddress = request.getParameter("address");
        String conPassword = Hash.hashCode(request.getParameter("password"));

        if (conPassword == null) {
            String errPass = "Vui lòng xác nhận mật khẩu để thay đổi thông tin";
            request.setAttribute("errPass", errPass);

            request.getRequestDispatcher("/view/user_profile.jsp").forward(request, response);
        } else {
            if (conPassword.equals(us.getPassword())) {
                us.setFullName(newName);
                us.setYearOfBirth(newYearOfBirth);
                us.setGender(UserGender.create(newGender));
                us.setPhone_number(newPhoneNumber);
                us.setAddress(newAddress);

                UserDAO.getInstance().update(us);
                response.sendRedirect("/view/user_profile.jsp");

            } else {
                String errPass = "Xác nhận mật khẩu không đúng! Vui lòng kiểm tra lại.";
                request.setAttribute("errPass", errPass);

                request.getRequestDispatcher("/view/user_profile.jsp").forward(request, response);
            }
        }
    }
}
