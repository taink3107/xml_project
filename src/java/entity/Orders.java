/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author taink
 */
@XmlRootElement(name = "orders")
public class Orders {    
    private List<Order> order;
    public Orders() {
    }

    public Orders(List<Order> orders) {
        this.order = orders;
    }

    public List<Order> getOrders() {
        return order;
    }

    public void setOrders(List<Order> orders) {
        this.order = orders;
    }
    
}
