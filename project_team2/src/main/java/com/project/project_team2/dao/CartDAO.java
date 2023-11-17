package com.project.project_team2.dao;

import com.project.project_team2.model.Cart;
import com.project.project_team2.service.JDBC;
import com.project.project_team2.model.Product;
import com.project.project_team2.service.Convert;
import java.sql.*;
import java.util.*;

public class CartDAO implements DAO<Cart> {

    private static final CartDAO instance = new CartDAO();

    public static CartDAO getInstance() {
        return instance;
    }

    @Override
    public List<Cart> selectAll() {
        return null;
    }

    @Override
    public List<Cart> selectById(String id) {
        return null;
    }

    @Override
    public void insert(Cart ob) {
    }

    @Override
    public void update(Cart ob) {
    }

    @Override
    public void delete(String id) {
    }

}
