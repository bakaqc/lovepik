package com.bakaqc.flower.controller;

import static com.bakaqc.flower.controller.UpdateProductController.DEFAULT_FILENAME;
import com.bakaqc.flower.dao.ProductDAO;
import com.bakaqc.flower.model.Product;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.logging.Logger;
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

    private final Logger LOGGER = Logger.getLogger(this.getClass().getName());
    private final String UPLOAD_FILE_PATH = "/img/product_img";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
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
            product.setBanners(image);
            ProductDAO.getInstance().insert(product);
            String url = request.getHeader("referer");
            response.sendRedirect(url);
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

    public String uploadFile(HttpServletRequest request) throws IOException, ServletException {
         // Get the file part from the request
        Part filePart = request.getPart("image");
        LOGGER.info("filePart: " + filePart.toString());
        
        // Get the filename
        String fileName = getFileName(filePart);
        LOGGER.info(fileName);

        // Specify the directory to save the uploaded file
        String savePath = "/img/product_img"; // Change this to your desired directory

        // Create the save directory if it doesn't exist
        File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }

        // Save the file to the specified directory
        File file = new File(savePath, fileName);
        try (InputStream input = filePart.getInputStream()) {
            Files.copy(input, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
        }

        LOGGER.info(fileName);
        return fileName;
    }

    private String getFileName(final Part part) {
        final String partHeader = part.getHeader("content-disposition");
        for (String content : partHeader.split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return DEFAULT_FILENAME;
    }

}
