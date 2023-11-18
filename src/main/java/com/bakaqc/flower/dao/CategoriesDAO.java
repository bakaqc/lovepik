package com.bakaqc.flower.dao;

import com.bakaqc.flower.service.JDBC;
import com.bakaqc.flower.model.Categories;
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
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
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
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }

        System.out.println(list);
        return list;
    }

    @Override
    public void insert(Categories ob) {
        try {
            Connection conn = JDBC.getConnection();

            PreparedStatement smt = conn.prepareStatement("INSERT INTO categories(name) VALUES (?)");
            smt.setString(1, ob.getNameCAT());

            smt.executeUpdate();

            JDBC.closeConnection(conn);
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
    }

    @Override
    public void update(Categories ob) {
        try {
            Connection conn = JDBC.getConnection();

            PreparedStatement smt = conn.prepareStatement("UPDATE categories SET name = ? WHERE id = ?");
            smt.setString(1, ob.getNameCAT());

            smt.executeUpdate();

            JDBC.closeConnection(conn);
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
    }

    @Override
    public void delete(String id) {
        try {
            Connection conn = JDBC.getConnection();

            PreparedStatement smt = conn.prepareStatement("DELETE FROM categories WHERE id = ?");
            smt.setString(1, id);

            smt.executeUpdate();

            JDBC.closeConnection(conn);

        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
    }

    public static void main(String[] args) {
        getInstance().selectAll();

    }

}
