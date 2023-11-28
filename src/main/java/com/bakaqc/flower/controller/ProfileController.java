package com.bakaqc.flower.controller;

import com.bakaqc.flower.dao.OrderDAO;
import com.bakaqc.flower.model.HistoryBuy;
import com.bakaqc.flower.model.User;
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
        int amountSold = OrderDAO.getInstance().quantitySold(us.getId());
        int amountCan = OrderDAO.getInstance().amountCanceled(us.getId());
        List<HistoryBuy> list = OrderDAO.getInstance().historyBuy(us.getId());
        
        request.setAttribute("amountS", amountSold);
        request.setAttribute("amountC", amountCan);
        request.setAttribute("listBuy", list);
        request.getRequestDispatcher("/view/user_profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
