package com.project.project_team2.dao;

import com.project.project_team2.service.JDBC;
import com.project.project_team2.model.Categories;
import java.sql.*;
import java.util.*;

public class CategoriesDAO implements DAO<Categories> {

    private static final CategoriesDAO instance = new CategoriesDAO();

    public static CategoriesDAO getInstance() {
        return instance;
    }

    @Override
    public List<Categories> selectAll() {
        List<Categories> list = new ArrayList<>();
        try {
            Connection c = JDBC.getConnection();

            PreparedStatement st = c.prepareStatement("SELECT * FROM categories");

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Categories cat = new Categories();
                cat.setId(rs.getInt("id"));
                cat.setNameCAT(rs.getString("name"));

                list.add(cat);

            }

            c.close();
        } catch (Exception e) {
        }

        System.out.println(list);
        return list;
    }

    @Override
    public List<Categories> selectById(String id) {
        List<Categories> list = new ArrayList<>();
        try {
            Connection c = JDBC.getConnection();

            PreparedStatement st = c.prepareStatement("SELECT * FROM categories WHERE id = ?");
            st.setString(1, id);

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Categories cat = new Categories();
                cat.setId(rs.getInt("id"));
                cat.setNameCAT(rs.getString("name"));

                list.add(cat);

            }

            c.close();
        } catch (Exception e) {
        }

        System.out.println(list);
        return list;
    }

    @Override
    public void insert(Categories ob) {
    }

    @Override
    public void update(Categories ob) {
    }

    @Override
    public void delete(String id) {
    }

    public static void main(String[] args) {
        getInstance().selectAll();
    }

}
