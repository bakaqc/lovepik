package com.bakaqc.flower.controller;

import com.bakaqc.flower.dao.CategoriesDAO;
import com.bakaqc.flower.dao.ProductDAO;
import com.bakaqc.flower.model.Categories;
import com.bakaqc.flower.model.Product;
import java.io.*;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;

public class ViewAllController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        List<Categories> listCAT = CategoriesDAO.getInstance().selectAll();

        int index = 1;
        try {
            String indexP = request.getParameter("index");
            index = Integer.parseInt(indexP);
        } catch (NumberFormatException ex) {
            index = 1;
        } catch (Exception ex) {
            index = 1;
        }

        int limit = 12;
        int offset = index;

        List<Product> listP = ProductDAO.getInstance().pagingProduct(limit, offset);

        int count = ProductDAO.getInstance().countProduct();
        int endP = count / limit;
        if (count % 12 != 0) {
            endP++;
        }

        request.setAttribute("listCAT", listCAT);
        request.setAttribute("listP", listP);
        request.setAttribute("endP", endP);
        request.setAttribute("index", index);

        RequestDispatcher rd = request.getRequestDispatcher("/view/viewall.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
