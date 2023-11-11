package com.project.project_team2.dao;

import com.project.project_team2.service.JDBC;
import com.project.project_team2.model.Product;
import com.project.project_team2.service.Convert;
import java.sql.*;
import java.util.*;

public class DataOrderDAO implements DAO<Product> {

    private static final DataOrderDAO instance = new DataOrderDAO();

    public static DataOrderDAO getInstance() {
        return instance;
    }
    
    

    @Override
    public List<Product> selectAll() {
        List<Product> list = new ArrayList<>();
        try {
            Connection c = JDBC.getConnection();

            PreparedStatement st = c.prepareStatement("SELECT * FROM product");

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Product pd = new Product();
                pd.setId(rs.getInt("id"));
                pd.setCategoryId(rs.getInt("category_id"));
                pd.setName(rs.getString("name"));
                pd.setBanners(rs.getString("banners"));
                List<String> thumb = Convert.toList(rs.getString("thumb"));
                pd.setThumb(thumb);
                pd.setPrice(rs.getInt("price"));
                pd.setDetail(rs.getString("detail"));

                list.add(pd);

            }

            c.close();
        } catch (Exception e) {
        }

        System.out.println(list);
        return list;
    }

    @Override
    public List<Product> selectById(int id) {
        List<Product> list = new ArrayList<>();
        try {
            Connection c = JDBC.getConnection();

            PreparedStatement st = c.prepareStatement("SELECT * FROM product WHERE id = ?");
            st.setInt(1, id);

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Product pd = new Product();
                pd.setId(rs.getInt("id"));
                pd.setCategoryId(rs.getInt("category_id"));
                pd.setName(rs.getString("name"));
                pd.setBanners(rs.getString("banners"));
//                pd.setThumb(rs.getString("thumb"));
                pd.setPrice(rs.getInt("price"));
                pd.setDetail(rs.getString("detail"));

                list.add(pd);

            }

            c.close();
        } catch (Exception e) {
        }

        System.out.println(list);
        return list;
    }

    @Override
    public void insert(Product ob) {
    }

    @Override
    public void update(Product ob) {
    }

    @Override
    public void delete(int id) {
    }

    public static void main(String[] args) {
        getInstance().selectById(2);
    }

}
