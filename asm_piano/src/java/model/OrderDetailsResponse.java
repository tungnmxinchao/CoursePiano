/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author TNO
 */
public class OrderDetailsResponse {
    private int orderDetailsID;
    private int courseID;
    private String coursePrice;
    private int amount;
    private int orderID;
    private String image;
    private String nameCourse;
    private String description;

    public OrderDetailsResponse() {
    }

    public OrderDetailsResponse(int orderDetailsID, int courseID, String coursePrice, int amount, int orderID, String image, String nameCourse, String description) {
        this.orderDetailsID = orderDetailsID;
        this.courseID = courseID;
        this.coursePrice = coursePrice;
        this.amount = amount;
        this.orderID = orderID;
        this.image = image;
        this.nameCourse = nameCourse;
        this.description = description;
    }

    public int getOrderDetailsID() {
        return orderDetailsID;
    }

    public void setOrderDetailsID(int orderDetailsID) {
        this.orderDetailsID = orderDetailsID;
    }

    public int getCourseID() {
        return courseID;
    }

    public void setCourseID(int courseID) {
        this.courseID = courseID;
    }

    public String getCoursePrice() {
        return coursePrice;
    }

    public void setCoursePrice(String coursePrice) {
        this.coursePrice = coursePrice;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getNameCourse() {
        return nameCourse;
    }

    public void setNameCourse(String nameCourse) {
        this.nameCourse = nameCourse;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "OrderDetailsResponse{" + "orderDetailsID=" + orderDetailsID + ", courseID=" + courseID + ", coursePrice=" + coursePrice + ", amount=" + amount + ", orderID=" + orderID + ", image=" + image + ", nameCourse=" + nameCourse + ", description=" + description + '}';
    }

    
    
    
}
