package com.project.project_team2.dao;

import com.project.project_team2.model.DataOrder;
import com.project.project_team2.service.JDBC;
import com.project.project_team2.model.Product;
import com.project.project_team2.service.Convert;
import java.sql.*;
import java.util.*;

public class DataOrderDAO implements DAO<DataOrder> {

    private static final DataOrderDAO instance = new DataOrderDAO();

    public static DataOrderDAO getInstance() {
        return instance;
    }

    @Override
    public List<DataOrder> selectAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<DataOrder> selectById(String id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(DataOrder ob) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(DataOrder ob) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(String id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
