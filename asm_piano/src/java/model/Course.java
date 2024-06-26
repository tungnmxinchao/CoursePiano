/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author TNO
 */
public class Course {
    private int id;
    private String name;
    private String image;
    private String description;
    private int fee;
    private Date startDate;
    private Date endDate;
    private int category;
    private int createdBy;
    private boolean status;
    private int quanity;

    public Course() {
    }

    public Course(int id, String name, String image, String description, int fee, Date startDate, Date endDate, int category, int createdBy, boolean status, int quanity) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.description = description;
        this.fee = fee;
        this.startDate = startDate;
        this.endDate = endDate;
        this.category = category;
        this.createdBy = createdBy;
        this.status = status;
        this.quanity = quanity;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getFee() {
        return fee;
    }

    public void setFee(int fee) {
        this.fee = fee;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public int getCategory() {
        return category;
    }

    public void setCategory(int category) {
        this.category = category;
    }

    public int getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(int createdBy) {
        this.createdBy = createdBy;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getQuanity() {
        return quanity;
    }

    public void setQuanity(int quanity) {
        this.quanity = quanity;
    }

    @Override
    public String toString() {
        return "Course{" + "id=" + id + ", name=" + name + ", image=" + image + ", description=" + description + ", fee=" + fee + ", startDate=" + startDate + ", endDate=" + endDate + ", category=" + category + ", createdBy=" + createdBy + ", status=" + status + ", quanity=" + quanity + '}';
    }

    
    
    
}
