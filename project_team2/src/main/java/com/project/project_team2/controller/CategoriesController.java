package com.project.project_team2.controller;

import com.project.project_team2.dao.CategoriesDAO;
import com.project.project_team2.dao.ProductDAO;
import com.project.project_team2.model.Categories;
import com.project.project_team2.model.Product;
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
