package com.bakaqc.flower.controller;

import com.bakaqc.flower.dao.OrderDAO;
import com.bakaqc.flower.model.Order;
import com.bakaqc.flower.model.option.OrderStatus;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateOrderController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String id = request.getParameter("id");
        String status = request.getParameter("status");

        Order order = new Order();
        order.setId(Integer.parseInt(id));
        order.setStatus(OrderStatus.create(status));
        OrderDAO.getInstance().update(order);

        String url = request.getHeader("referer");
        response.sendRedirect(url);

    }

}
