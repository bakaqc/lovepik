package com.bakaqc.flower.controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import com.bakaqc.flower.dao.OrderDAO;
import com.bakaqc.flower.dao.ProductDAO;
import com.bakaqc.flower.dao.UserDAO;
import com.bakaqc.flower.model.Order;
import com.bakaqc.flower.model.User;
import java.util.*;

public class AdminController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        OrderDAO orderDAO = new OrderDAO();
        List<Order> orders = orderDAO.selectAll();
        
         List<Order> process = orderDAO.selectProcess();
         List<Order> ship = orderDAO.selectShip();
          List<Order> done = orderDAO.selectDone();
           List<Order> cancel = orderDAO.selectCancel();
           
        UserDAO userDAO = new UserDAO();
        List<User> users = userDAO.selectAll();
        ProductDAO productDAO = new ProductDAO();
        int productNum = productDAO.selectAll().size();
        request.setAttribute("numPro", productNum);
        request.setAttribute("users", users);
        request.setAttribute("orders", orders);
        request.setAttribute("process", process);
         request.setAttribute("ship", ship);
          request.setAttribute("done", done);
           request.setAttribute("cancel", cancel);
        request.getSession().setAttribute("isActive", 0);

        RequestDispatcher rd = request.getRequestDispatcher("/view/admin.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
    }

}
