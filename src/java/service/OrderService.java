/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.OrderDAO;
import entity.Order;
import helper.SQLconnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author taink
 */
public class OrderService{

    OrderDAO dAO = new OrderDAO();

    public List<Order> getAllPagging(int pageIndex,int pageSize) {
        return dAO.getAll(pageIndex,pageSize);
    }

    public int count() {
        return dAO.countAll();
    }

}
