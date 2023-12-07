package com.bakaqc.flower.controller;

import com.bakaqc.flower.dao.CategoriesDAO;
import com.bakaqc.flower.dao.DataOrderDAO;
import com.bakaqc.flower.dao.OrderDAO;
import com.bakaqc.flower.dao.ProductDAO;
import com.bakaqc.flower.model.Categories;
import com.bakaqc.flower.model.DataOrder;
import com.bakaqc.flower.model.Order;
import com.bakaqc.flower.model.Product;
import com.bakaqc.flower.model.User;
import com.bakaqc.flower.model.option.OrderStatus;
import com.bakaqc.flower.model.option.Payment;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

@WebServlet(name = "UserPaymentController", urlPatterns = {"/payment"})
public class UserPaymentController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        List<Categories> listCAT = CategoriesDAO.getInstance().selectAll();

        request.setAttribute("listCAT", listCAT);
        RequestDispatcher rd = request.getRequestDispatcher("/view/user_payment.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        HttpSession session = request.getSession();
        Map<Integer, Integer> cart = (Map<Integer, Integer>) session.getAttribute("cart");
        User user = (User) session.getAttribute("user");

        for (Integer key : cart.keySet()) {
            Integer value = cart.get(key);

            Product product = ProductDAO.getInstance().getById(key);
            int total = product.getPrice() * value;

            Order order = new Order();
            order.setUserID(user.getId());
            order.setTotalPrice(total);
            order.setPayment(Payment.COD);
            order.setStatus(OrderStatus.PROCESSING);

            OrderDAO.getInstance().insert(order);

            Order o = OrderDAO.getInstance().getIdAdd();
            DataOrder dataO = new DataOrder();
            dataO.setOderID(o.getId());
            dataO.setProductID(product.getId());
            dataO.setAmount(value);

            DataOrderDAO.getInstance().insert(dataO);

        }
        
        session.setAttribute("cart", Collections.emptyList());

        String done = "Đặt hàng thành công.";       
        session.setAttribute("done", done);
        response.sendRedirect("cart");
    }

}
