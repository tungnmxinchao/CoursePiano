/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Timestamp;

/**
 *
 * @author TNO
 */
public class OrderResponse {
    private int orderID;
    private Timestamp orderDate;
    private String fullName;
    private String phoneNum;
    private String address;
    private int userID;
    private String totalCost;
    private int status;

    public OrderResponse() {
    }

    public OrderResponse(int orderID, Timestamp orderDate, String fullName, String phoneNum, String address, int userID, String totalCost, int status) {
        this.orderID = orderID;
        this.orderDate = orderDate;
        this.fullName = fullName;
        this.phoneNum = phoneNum;
        this.address = address;
        this.userID = userID;
        this.totalCost = totalCost;
        this.status = status;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public Timestamp getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Timestamp orderDate) {
        this.orderDate = orderDate;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getTotalCost() {
        return totalCost;
    }

    public void setTotalCost(String totalCost) {
        this.totalCost = totalCost;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "OrderResponse{" + "orderID=" + orderID + ", orderDate=" + orderDate + ", fullName=" + fullName + ", phoneNum=" + phoneNum + ", address=" + address + ", userID=" + userID + ", totalCost=" + totalCost + ", status=" + status + '}';
    }
    
    
}
