/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Order;
import helper.SQLconnection;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author taink
 */
public class OrderDAO {

    CustomerDAO cus_dAO = new CustomerDAO();
    StaffDAO staff_dAo = new StaffDAO();
    StoreDAO store_dAo = new StoreDAO();

    public List<Order> getAll(int index) {
        int size = 10;
        String query = "SELECT * FROM sales.orders as ors\n"
                + "ORDER BY ors.order_id\n"
                + "OFFSET (?-1)*? ROWS FETCH NEXT ? ROWS ONLY";
        List<Order> orders = new ArrayList<>();
        try (Connection conn = SQLconnection.getConnection();
                PreparedStatement ps = (conn != null) ? conn.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, index);
                ps.setObject(2, size);
                ps.setObject(3, size);
                ResultSet rs = ps.executeQuery();
                while (rs != null && rs.next()) {
                    Order order = new Order();
                    order.setOrder_id(rs.getInt("order_id"));
                    order.setOrder_date(String.valueOf(rs.getDate("order_date")));
                    order.setRequired_date(String.valueOf(rs.getDate("required_date")));
                    order.setShipped_date(String.valueOf(rs.getDate("shipped_date")));
                    order.setCustomer(cus_dAO.getById(rs.getInt("customer_id")));
                    order.setStaff(staff_dAo.getById(rs.getInt("staff_id")));
                    order.setStore(store_dAo.getById(rs.getInt("store_id")));
                    order.setOrder_status(rs.getInt("order_status"));
                    orders.add(order);
                }
                return orders;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public static void main(String[] args) {
        OrderDAO dAO = new OrderDAO();
        System.out.println(dAO.getAll(2));
    }
}
