/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Category;
import helper.SQLconnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author taink
 */
public class CategoryDAO {
    
    Category getOneById(int aInt) {
        String query = "SELECT * FROM production.categories as prd\n"
                + "WHERE prd.category_id = ? ";
        
        try (Connection conn = SQLconnection.getConnection();
                PreparedStatement ps = (conn != null) ? conn.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, aInt);
                ResultSet rs = ps.executeQuery();
                while (rs != null && rs.next()) {
                    Category category = new Category();
                    category.setCategory_id(rs.getInt("category_id"));
                    
                    category.setCategory_name(rs.getString("category_name"));
                    return category;
                }
            }
        } catch (Exception e) {
        }
        return null;
    }
    
}
