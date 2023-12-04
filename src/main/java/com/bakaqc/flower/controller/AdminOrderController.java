package com.bakaqc.flower.controller;


import com.bakaqc.flower.dao.OrderDAO;
import com.bakaqc.flower.dao.UserDAO;
import com.bakaqc.flower.model.Order;
import com.bakaqc.flower.model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminOrderController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            OrderDAO orderDAO = new OrderDAO();
        List<Order> orders = orderDAO.selectAll();
         UserDAO userDAO = new UserDAO();
        List<User> users = userDAO.selectAll();
         request.setAttribute("users", users);
           // List<Admin> list = adminDAO.selectAll();
            request.setAttribute("orders", orders);
            request.getSession().setAttribute("isActive", 3);
            request.getRequestDispatcher("/view/OrderAdmin.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
    }

}
