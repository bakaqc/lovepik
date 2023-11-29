package com.bakaqc.flower.dao;

import com.bakaqc.flower.model.HistoryBuy;
import com.bakaqc.flower.model.Order;
import com.bakaqc.flower.model.option.OrderStatus;
import com.bakaqc.flower.model.option.Payment;
import com.bakaqc.flower.service.Convert;
import com.bakaqc.flower.service.JDBC;
import java.sql.*;
import java.time.LocalDateTime;
import java.util.*;

public class OrderDAO implements DAO<Order> {

    private static final OrderDAO instance = new OrderDAO();

    public static OrderDAO getInstance() {
        return instance;
    }

    @Override
    public List<Order> selectAll() {
        List<Order> list = new ArrayList<>();

        try {
            Connection conn = JDBC.getConnection();

            PreparedStatement smt = conn.prepareStatement("SELECT * FROM `order`");

            ResultSet rs = smt.executeQuery();

            while (rs.next()) {
                Order od = new Order();
                od.setId(rs.getInt("id"));
                od.setUserID(rs.getInt("user_id"));
                od.setTotalPrice(rs.getInt("total_price"));
                od.setPayment(Payment.create(rs.getString("payment")));
                od.setStatus(OrderStatus.create(rs.getString("status")));
                od.setCreateAt(Convert.convert(rs.getTimestamp("create_at")));

                list.add(od);
            }

            JDBC.closeConnection(conn);
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
        System.out.println(list);

        return list;
    }

    @Override
    public List<Order> selectById(String id) {
        List<Order> list = new ArrayList<>();

        try {
            Connection conn = JDBC.getConnection();

            PreparedStatement smt = conn.prepareStatement("SELECT * FROM `order` WHERE id = ?");
            smt.setString(1, id);

            ResultSet rs = smt.executeQuery();

            while (rs.next()) {
                Order od = new Order();
                od.setId(rs.getInt("id"));
                od.setUserID(rs.getInt("user_id"));
                od.setTotalPrice(rs.getInt("total_price"));
                od.setPayment(Payment.create(rs.getString("payment")));
                od.setStatus(OrderStatus.create(rs.getString("status")));
                od.setCreateAt(Convert.convert(rs.getTimestamp("create_at")));

                list.add(od);
            }

            JDBC.closeConnection(conn);
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
        System.out.println(list);

        return list;
    }

    @Override
    public void insert(Order ob) {
        try {
            Connection conn = JDBC.getConnection();

            PreparedStatement smt = conn.prepareStatement("INSERT INTO `order` (`user_id`, `total_price`, `payment`, `status`, `create_at`) VALUES (?, ?, ?, ?, ?)");
            smt.setInt(1, ob.getUserID());
            smt.setInt(2, ob.getTotalPrice());
            smt.setString(3, ob.getPayment().toString());
            smt.setString(4, ob.getStatus().toString());
            smt.setString(5, Convert.convert(LocalDateTime.now()));

            smt.executeUpdate();

            JDBC.closeConnection(conn);
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
    }

    @Override
    public void update(Order ob) {
        try {
            Connection conn = JDBC.getConnection();

            PreparedStatement smt = conn.prepareStatement("UPDATE `order` SET user_id = ?, total_price = ?, payment = ?, status = ?, create_at = ? WHERE id = ?");
            smt.setInt(1, ob.getUserID());
            smt.setInt(2, ob.getTotalPrice());
            smt.setString(3, ob.getPayment().toString());
            smt.setString(4, ob.getStatus().toString());
            smt.setString(5, Convert.convert(LocalDateTime.now()));
            smt.setInt(6, ob.getId());

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

            PreparedStatement smt = conn.prepareStatement("DELETE FROM `order` WHERE id = ?");
            smt.setString(1, id);

            smt.executeUpdate();

            JDBC.closeConnection(conn);

        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
    }
    
    public static void main(String[] args) {

    }
}
