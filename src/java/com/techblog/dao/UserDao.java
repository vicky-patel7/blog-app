/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.techblog.dao;

/**
 *
 * @author Vicky Patel
 */
import com.techblog.entities.User;
import java.sql.*;
public class UserDao {
    private final Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }
//    method to insert user to the database
    public boolean saveUser(User user) {
        boolean executed = false;
         try {
             String query = "insert into user(name, email, password, gender) values (?, ?, ?, ?)";
             PreparedStatement pstmt = this.con.prepareStatement(query);
             pstmt.setString(1, user.getName());
             pstmt.setString(2, user.getEmail());
             pstmt.setString(3, user.getPassword());
             pstmt.setString(4, user.getGender());
             pstmt.executeUpdate();
             executed = true;
             System.out.print(query);
             System.out.println("Executed");
         }catch (Exception e) {
             e.printStackTrace();
         }
         return executed;
    }
    
//    get User using email and password
    public User getUserByEmailAndPassword(String email, String password) {
        User user = null;
        try {
            String query = "select * from user where email = ? and password = ?";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            ResultSet set = pstmt.executeQuery();
            if(set.next()) {
                user = new User();
                String name = set.getString("name");
                user.setName(name);
                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
            }
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        return user;
    }
    
    public boolean updateUser(User user) {
        boolean f = false;
        try {
            String query = "update user set name = ?, email = ?, password = ? where id = ?";
            System.out.print(query);
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setInt(4, user.getId());
            pstmt.executeUpdate();
            f = true;
        }catch(Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
//    get user details using userid
    public User getUserById(int userId) {
        User user = new User();
        
        try {
            String query = "select * from user where id = ?";
            PreparedStatement p = this.con.prepareStatement(query);
            p.setInt(1, userId);
            ResultSet s = p.executeQuery();
            if(s.next()) {
                user.setName(s.getString("name"));
                user.setEmail(s.getString("email"));
                user.setGender(s.getString("gender"));
            }
        }catch(Exception e) {
            e.printStackTrace();
        }        
        return user;
    }
}
