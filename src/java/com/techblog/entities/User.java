/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.techblog.entities;
import java.sql.*;
/**
 *
 * @author Vicky Patel
 */
public class User {
    private int id;
    private String name;
    private String email;
    private String password;
    private String gender;
    private Timestamp datetime;

//    constructors

    public User(int id, String name, String email, String password, String gender, Timestamp datetime) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.datetime = datetime;
    }
    
    
    public User(String name, String email, String password, String gender) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.gender = gender;
    }

    public User() {
    }


    
    
//    getters and setters

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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Timestamp getDatetime() {
        return datetime;
    }

    public void setDatetime(Timestamp datetime) {
        this.datetime = datetime;
    }
    
    
}
