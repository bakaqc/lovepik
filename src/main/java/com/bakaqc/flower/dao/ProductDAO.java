package com.bakaqc.flower.dao;

import com.bakaqc.flower.service.JDBC;
import com.bakaqc.flower.model.Product;
import com.bakaqc.flower.service.Convert;
import java.sql.*;
import java.util.*;

public class ProductDAO implements DAO<Product> {

    private static final ProductDAO instance = new ProductDAO();

    public static ProductDAO getInstance() {
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
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }

        System.out.println(list);
        return list;
    }

    @Override
    public List<Product> selectById(String id) {
        List<Product> list = new ArrayList<>();
        try {
            Connection c = JDBC.getConnection();

            PreparedStatement st = c.prepareStatement("SELECT * FROM product WHERE id = ?");
            st.setString(1, id);

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Product pd = new Product();
                pd.setId(rs.getInt("id"));
                pd.setCategoryId(rs.getInt("category_id"));
                pd.setName(rs.getString("name"));
                pd.setBanners(rs.getString("banners"));
                List<String> thumb = Convert.toList(rs.getString("thumb"));
                pd.setPrice(rs.getInt("price"));
                pd.setDetail(rs.getString("detail"));

                list.add(pd);

            }

            c.close();
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }

        System.out.println(list);
        return list;
    }

    public Product getById(String id) {
        List<Product> list = new ArrayList<>();
        try {
            Connection c = JDBC.getConnection();

            PreparedStatement st = c.prepareStatement("SELECT * FROM product WHERE id = ?");
            st.setString(1, id);

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Product pd = new Product();
                pd.setId(rs.getInt("id"));
                pd.setCategoryId(rs.getInt("category_id"));
                pd.setName(rs.getString("name"));
                pd.setBanners(rs.getString("banners"));
                List<String> thumb = Convert.toList(rs.getString("thumb"));
                pd.setPrice(rs.getInt("price"));
                pd.setDetail(rs.getString("detail"));

                return pd;

            }

            c.close();
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }

        System.out.println(list);
        return null;
    }

    public List<Product> selectByName(String search) {
        List<Product> list = new ArrayList<>();
        try {
            Connection c = JDBC.getConnection();

            PreparedStatement st = c.prepareStatement("SELECT * FROM `product` WHERE name like ?");
            st.setString(1, "%" + search + "%");

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Product pd = new Product();
                pd.setId(rs.getInt("id"));
                pd.setCategoryId(rs.getInt("category_id"));
                pd.setName(rs.getString("name"));
                pd.setBanners(rs.getString("banners"));
                List<String> thumb = Convert.toList(rs.getString("thumb"));
                pd.setPrice(rs.getInt("price"));
                pd.setDetail(rs.getString("detail"));

                list.add(pd);

            }

            c.close();
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }

        System.out.println(list);
        return list;
    }

    @Override
    public void insert(Product ob) {
        try {
            Connection conn = JDBC.getConnection();

            PreparedStatement smt = conn.prepareStatement("INSERT INTO `product` (`category_id`, `name`, `banners`, `thumb`, `price`, `detail`) "
                    + "VALUES (?, ?, ?, ?, ?, ?)");

            smt.setInt(1, ob.getCategoryID());
            smt.setString(2, ob.getName());
            smt.setString(3, ob.getBanners());
            smt.setString(4, Convert.toJson(ob.getThumb()));
            smt.setInt(5, ob.getPrice());
            smt.setString(6, ob.getDetail());

            smt.executeUpdate();

            JDBC.closeConnection(conn);
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
    }

    @Override
    public void update(Product ob) {
        try {
            Connection conn = JDBC.getConnection();

            PreparedStatement smt = conn.prepareStatement("UPDATE product SET category_id = ?, name = ?, banners = ?, thumb = ?, price = ?, detail = ? WHERE id = ? ");
            smt.setInt(1, ob.getCategoryID());
            smt.setString(2, ob.getName());
            smt.setString(3, ob.getBanners());
            smt.setString(4, Convert.toJson(ob.getThumb()));
            smt.setInt(5, ob.getPrice());
            smt.setString(6, ob.getDetail());
            smt.setInt(7, ob.getId());
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

            PreparedStatement smt = conn.prepareStatement("DELETE FROM product WHERE id = ?");
            smt.setString(1, id);

            smt.executeUpdate();

            JDBC.closeConnection(conn);
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
    }

    public List<Product> selectByCATId(String catID) {
        List<Product> list = new ArrayList<>();
        try {
            Connection c = JDBC.getConnection();

            PreparedStatement st = c.prepareStatement("SELECT * FROM product WHERE category_id = ?");
            st.setString(1, catID);

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Product pd = new Product();
                pd.setId(rs.getInt("id"));
                pd.setCategoryId(rs.getInt("category_id"));
                pd.setName(rs.getString("name"));
                pd.setBanners(rs.getString("banners"));
                pd.setPrice(rs.getInt("price"));
                pd.setDetail(rs.getString("detail"));

                list.add(pd);

            }

            c.close();
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }

        System.out.println(list);
        return list;
    }

    public String getNameCAT(String pid) {
        try {
            Connection c = JDBC.getConnection();

            PreparedStatement st = c.prepareStatement("SELECT categories.name FROM categories JOIN product ON categories.id = product.category_id WHERE product.id = ?");
            st.setString(1, pid);

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                return rs.getString("name");

            }

            c.close();
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }

        return null;
    }

    public List<Product> randomPd(int limit) {
        List<Product> list = new ArrayList<>();
        try {
            Connection c = JDBC.getConnection();

            PreparedStatement st = c.prepareStatement("SELECT * FROM product ORDER BY RAND() LIMIT ?");
            st.setInt(1, limit);

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Product pd = new Product();
                pd.setId(rs.getInt("id"));
                pd.setCategoryId(rs.getInt("category_id"));
                pd.setName(rs.getString("name"));
                pd.setBanners(rs.getString("banners"));
                pd.setPrice(rs.getInt("price"));
                pd.setDetail(rs.getString("detail"));

                list.add(pd);

            }

            c.close();
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }

        System.out.println(list);
        return list;
    }

    public static void main(String[] args) {

        System.out.println(getInstance().getNameCAT("30"));
    }

}
