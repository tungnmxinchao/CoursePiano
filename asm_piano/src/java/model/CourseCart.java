/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author TNO
 */
public class CourseCart {
    private String id;
    private String courseName;
    private String fee;
    private int total;

    public CourseCart() {
    }

    public CourseCart(String id, String courseName, String fee, int total) {
        this.id = id;
        this.courseName = courseName;
        this.fee = fee;
        this.total = total;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getFee() {
        return fee;
    }

    public void setFee(String fee) {
        this.fee = fee;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    @Override
    public String toString() {
        return "CourseCart{" + "id=" + id + ", courseName=" + courseName + ", fee=" + fee + ", total=" + total + '}';
    }

}
