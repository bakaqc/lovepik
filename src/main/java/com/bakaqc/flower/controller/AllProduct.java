package com.bakaqc.flower.controller;

import com.bakaqc.flower.dao.CategoriesDAO;
import com.bakaqc.flower.dao.ProductDAO;
import com.bakaqc.flower.model.Categories;
import com.bakaqc.flower.model.Product;
import java.io.*;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;

public class AllProduct extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Product> listP = ProductDAO.getInstance().selectAll();
        List<Categories> listCAT = CategoriesDAO.getInstance().selectAll();

        request.setAttribute("listCAT", listCAT);
        request.setAttribute("listP", listP);
        RequestDispatcher rd = request.getRequestDispatcher("/view/home_nobanner.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
