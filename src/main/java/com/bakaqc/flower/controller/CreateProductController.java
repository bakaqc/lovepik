package com.bakaqc.flower.controller;

import static com.bakaqc.flower.controller.UpdateProductController.DEFAULT_FILENAME;
import com.bakaqc.flower.dao.ProductDAO;
import com.bakaqc.flower.model.Product;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


@MultipartConfig(fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 11)
public class CreateProductController extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            ProductDAO productDAO = new ProductDAO();
            Product product = new Product();
            String name = request.getParameter("name");
            String categoryID = request.getParameter("category");
            String price = request.getParameter("price");
            String image = uploadFile(request);
            String detail = request.getParameter("detail");
            product.setName(name);
            product.setCategoryId(Integer.parseInt(categoryID));
            product.setCategoryID(Integer.parseInt(categoryID));
            product.setPrice(Integer.parseInt(price));
            product.setDetail(detail);
            productDAO.insert(product);
            String url = request.getHeader("referer");
            response.sendRedirect(url);
        }
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
   

    public String uploadFile(HttpServletRequest request) throws IOException, ServletException {
        String fileName = "";
        int length = getServletContext().getRealPath("/").length();
        String uploadPath = new StringBuilder(getServletContext().getRealPath("/")).delete(length - 10, length - 4).toString() + File.separator + "img";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        try {
            for (Part part : request.getParts()) {
                String temp = getFileName(part);
                if (!temp.equals(DEFAULT_FILENAME) && !temp.trim().isEmpty()) {
                    fileName = temp;
                    part.write(uploadPath + File.separator + fileName);
                    break;
                }
            }
        } catch (FileNotFoundException fne) {
        }
        return fileName;
    }

    private String getFileName(Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf("=") + 2, content.length() - 1);
            }
        }
        return DEFAULT_FILENAME;
    }

}