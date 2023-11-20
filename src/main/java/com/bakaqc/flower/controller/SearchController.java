package com.bakaqc.flower.controller;

import com.bakaqc.flower.dao.CategoriesDAO;
import com.bakaqc.flower.dao.ProductDAO;
import com.bakaqc.flower.model.Categories;
import com.bakaqc.flower.model.Product;
import java.io.*;
import java.util.List;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

@WebServlet(name = "SearchController", urlPatterns = {"/search"})
public class SearchController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String search = request.getParameter("txt");
        List<Product> listN = ProductDAO.getInstance().selectByName(search);
        List<Categories> listCAT = CategoriesDAO.getInstance().selectAll();
        List<Product> listP = ProductDAO.getInstance().randomPd(16);

        request.setAttribute("listCAT", listCAT);
        request.setAttribute("listP", listP);
        request.setAttribute("listP", listN);
        request.setAttribute("txtS", search);
        RequestDispatcher rd = request.getRequestDispatcher("/view/home.jsp");
        rd.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
