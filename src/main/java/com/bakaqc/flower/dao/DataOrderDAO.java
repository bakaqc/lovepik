package com.bakaqc.flower.dao;

import com.bakaqc.flower.model.DataOrder;
import com.bakaqc.flower.service.JDBC;
import java.sql.*;
import java.util.*;

public class DataOrderDAO implements DAO<DataOrder> {

    private static final DataOrderDAO instance = new DataOrderDAO();

    public static DataOrderDAO getInstance() {
        return instance;
    }

    @Override
    public List<DataOrder> selectAll() {
        List<DataOrder> list = new ArrayList<>();
        try {
            Connection c = JDBC.getConnection();

            PreparedStatement st = c.prepareStatement("SELECT * FROM data_order");

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                DataOrder dataO = new DataOrder();
                dataO.setOderID(rs.getInt("order_id"));
                dataO.setProductID(rs.getInt("product_id"));
                dataO.setAmount(rs.getInt("amount"));

                list.add(dataO);

            }

            c.close();
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }

        System.out.println(list);
        return list;
    }

    @Override
    public List<DataOrder> selectById(String id) {
        List<DataOrder> list = new ArrayList<>();
        try {
            Connection c = JDBC.getConnection();

            PreparedStatement st = c.prepareStatement("SELECT * FROM data_order WHERE order_id = ?");
            st.setString(1, id);

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                DataOrder dataO = new DataOrder();
                dataO.setOderID(rs.getInt("order_id"));
                dataO.setProductID(rs.getInt("product_id"));
                dataO.setAmount(rs.getInt("amount"));

                list.add(dataO);

            }

            c.close();
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }

        System.out.println(list);
        return list;
    }

    @Override
    public void insert(DataOrder ob) {
        try {
            Connection conn = JDBC.getConnection();

            PreparedStatement smt = conn.prepareStatement("INSERT INTO data_order(order_id, product_id, amount) VALUES (?, ?, ?)");
            smt.setInt(1, ob.getOderID());
            smt.setInt(2, ob.getProductID());
            smt.setInt(3, ob.getAmount());

            smt.executeUpdate();

            JDBC.closeConnection(conn);
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
    }

    @Override
    public void update(DataOrder ob) {
        try {
            Connection conn = JDBC.getConnection();

            PreparedStatement smt = conn.prepareStatement("UPDATE data_order SET product_id = ?, amount = ? WHERE order_id = ?");
            smt.setInt(1, ob.getProductID());
            smt.setInt(2, ob.getAmount());
            smt.setInt(3, ob.getOderID());

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

            PreparedStatement smt = conn.prepareStatement("DELETE FROM data_order WHERE order_id = ?");
            smt.setString(1, id);

            smt.executeUpdate();

            JDBC.closeConnection(conn);

        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
    }

    public static void main(String[] args) {
        getInstance().delete("30");
    }

}
