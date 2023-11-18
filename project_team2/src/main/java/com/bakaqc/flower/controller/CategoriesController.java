package com.bakaqc.flower.controller;

import com.bakaqc.flower.dao.CategoriesDAO;
import com.bakaqc.flower.dao.ProductDAO;
import com.bakaqc.flower.model.Categories;
import com.bakaqc.flower.model.Product;
import java.io.*;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;

public class CategoriesController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String catID = request.getParameter("id");
        List<Product> list = ProductDAO.getInstance().selectByCATId(catID);
        List<Categories> listCAT = CategoriesDAO.getInstance().selectAll();

        request.setAttribute("listCAT", listCAT);
        request.setAttribute("listP", list);
        request.setAttribute("tag", catID);
        RequestDispatcher rd = request.getRequestDispatcher("/view/home.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
