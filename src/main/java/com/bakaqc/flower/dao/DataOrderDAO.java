package com.bakaqc.flower.dao;

import com.bakaqc.flower.model.DataOrder;
import com.bakaqc.flower.model.HistoryBuy;
import com.bakaqc.flower.model.option.OrderStatus;
import com.bakaqc.flower.model.option.Payment;
import com.bakaqc.flower.service.Convert;
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

    public int quantitySold(int userID) {
        int amount = 0;

        try {
            Connection conn = JDBC.getConnection();

            PreparedStatement smt = conn.prepareStatement("SELECT o.id, o.user_id, d.amount FROM `data_order` d JOIN `order` o ON d.order_id = o.id WHERE o.status = 'done' AND o.user_id  = ?");
            smt.setInt(1, userID);

            ResultSet rs = smt.executeQuery();

            while (rs.next()) {
                amount = rs.getInt("amount");
            }

            JDBC.closeConnection(conn);
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }

        return amount;
    }

    public int amountCanceled(int userID) {
        int amount = 0;

        try {
            Connection conn = JDBC.getConnection();

            PreparedStatement smt = conn.prepareStatement("SELECT o.id, o.user_id, d.amount FROM `data_order` d JOIN `order` o ON d.order_id = o.id WHERE o.status = 'canceled' AND o.user_id  = ?");
            smt.setInt(1, userID);

            ResultSet rs = smt.executeQuery();

            while (rs.next()) {
                amount = rs.getInt("amount");
            }

            JDBC.closeConnection(conn);
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }

        return amount;
    }

    public List<HistoryBuy> historyBuy(int userId) {

        List<HistoryBuy> list = new ArrayList<>();
        try {
            Connection conn = JDBC.getConnection();

            PreparedStatement smt = conn.prepareStatement("SELECT o.user_id, p.banners, p.name, d.amount, o.total_price, o.payment, o.status, o.create_at "
                    + "FROM `data_order` d JOIN `order` o ON d.order_id = o.id JOIN `product` p ON d.product_id = p.id WHERE o.user_id = ? ORDER BY o.id DESC");
            smt.setInt(1, userId);

            ResultSet rs = smt.executeQuery();

            while (rs.next()) {
                HistoryBuy hb = new HistoryBuy();
                hb.setBannersP(rs.getString("banners"));
                hb.setNameP(rs.getString("name"));
                hb.setAmountP(rs.getInt("amount"));
                hb.setTotalPriceP(rs.getInt("total_price"));
                hb.setPaymentP(Payment.create(rs.getString("payment")));
                hb.setStatusP(OrderStatus.create(rs.getString("status")));
                hb.setCreateAtP(Convert.convert(rs.getTimestamp("create_at")));

                list.add(hb);
            }

            JDBC.closeConnection(conn);
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
        System.out.println(list);
        return list;
    }

    public int countHistoryBuy(int userId) {
        int count = 0;

        try {
            Connection conn = JDBC.getConnection();

            PreparedStatement smt = conn.prepareStatement("SELECT COUNT(*) FROM `data_order` d JOIN `order` o ON d.order_id = o.id JOIN `product` p ON d.product_id = p.id "
                    + "WHERE o.user_id = ?");
            smt.setInt(1, userId);


            ResultSet rs = smt.executeQuery();

            if (rs.next()) {
                count = rs.getInt(1);
            }

            conn.close();
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }

        System.out.println(count);
        return count;
    }
    public List<HistoryBuy> pagingHistoryBuy(int userId, int limit, int offset) {
        List<HistoryBuy> list = new ArrayList<>();

        try {
            Connection conn = JDBC.getConnection();

            PreparedStatement smt = conn.prepareStatement("SELECT o.user_id, p.banners, p.name, d.amount, o.total_price, o.payment, o.status, o.create_at "
                    + "FROM `data_order` d JOIN `order` o ON d.order_id = o.id JOIN `product` p ON d.product_id = p.id WHERE o.user_id = ? ORDER BY o.id DESC LIMIT ? OFFSET ?");
            smt.setInt(1, userId);
            smt.setInt(2, limit);
            smt.setInt(3, (offset - 1) * limit);

            ResultSet rs = smt.executeQuery();

            while (rs.next()) {
                HistoryBuy hb = new HistoryBuy();
                hb.setBannersP(rs.getString("banners"));
                hb.setNameP(rs.getString("name"));
                hb.setAmountP(rs.getInt("amount"));
                hb.setTotalPriceP(rs.getInt("total_price"));
                hb.setPaymentP(Payment.create(rs.getString("payment")));
                hb.setStatusP(OrderStatus.create(rs.getString("status")));
                hb.setCreateAtP(Convert.convert(rs.getTimestamp("create_at")));
                
                list.add(hb);

            }

            conn.close();
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }

        System.out.println(list);
        return list;
    }

    public static void main(String[] args) {
        getInstance().pagingHistoryBuy(1,4,1);
    }

}
