package com.project.project_team2.controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class AdminController extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {    
        RequestDispatcher rd = request.getRequestDispatcher("/view/admin.jsp");
        rd.forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {  
    }

}
