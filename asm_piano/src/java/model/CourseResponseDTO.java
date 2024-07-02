/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;
import java.sql.Timestamp;

/**
 *
 * @author TNO
 */
public class CourseResponseDTO {
    private int id;
    private String name;
    private String image;
    private String description;
    private String fee;
    private Date startDate;
    private Date endDate;
    private int category;
    private int createdBy;
    private boolean status;
    private int quanity;
    private String userCreated;
    private String category_name;
    private Timestamp lastUpdate;

    public CourseResponseDTO() {
    }

    public CourseResponseDTO(int id, String name, String image, String description, String fee, Date startDate, Date endDate, int category, int createdBy, boolean status, int quanity, String userCreated, String category_name, Timestamp lastUpdate) {
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
        this.userCreated = userCreated;
        this.category_name = category_name;
        this.lastUpdate = lastUpdate;
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

    public String getFee() {
        return fee;
    }

    public void setFee(String fee) {
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

    public String getUserCreated() {
        return userCreated;
    }

    public void setUserCreated(String userCreated) {
        this.userCreated = userCreated;
    }

    public String getCategory_name() {
        return category_name;
    }

    public void setCategory_name(String category_name) {
        this.category_name = category_name;
    }

    public Timestamp getLastUpdate() {
        return lastUpdate;
    }

    public void setLastUpdate(Timestamp lastUpdate) {
        this.lastUpdate = lastUpdate;
    }

    @Override
    public String toString() {
        return "CourseResponseDTO{" + "id=" + id + ", name=" + name + ", image=" + image + ", description=" + description + ", fee=" + fee + ", startDate=" + startDate + ", endDate=" + endDate + ", category=" + category + ", createdBy=" + createdBy + ", status=" + status + ", quanity=" + quanity + ", userCreated=" + userCreated + ", category_name=" + category_name + ", lastUpdate=" + lastUpdate + '}';
    }
  
}
