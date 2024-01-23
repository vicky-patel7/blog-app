/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.techblog.dao;

import java.sql.*;

/**
 *
 * @author Vicky Patel
 */
public class LikeDao {

    private final Connection con;

    public LikeDao(Connection con) {
        this.con = con;
    }

    public boolean insertLike(int pid, int uid) {
        boolean f = false;
        try {
            String query = "insert into likes (postId, userId) values (?, ?)";
            PreparedStatement pst = this.con.prepareStatement(query);
            pst.setInt(1, pid);
            pst.setInt(2, uid);
            pst.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public int countLikesOnPost(int pid) {
        int count = 0;
        try {
            String q = "select count(*) from likes where postId = ?";
            PreparedStatement pst = this.con.prepareStatement(q);
            pst.setInt(1, pid);
            ResultSet set = pst.executeQuery();
            if (set.next()) {
                count = set.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public boolean isLikedByUser(int pid, int uid) {
        boolean f = false;
        try {
            String q = "select * from likes where postId = ? and userId = ?";
            PreparedStatement pst = this.con.prepareStatement(q);
            pst.setInt(1, pid);
            pst.setInt(2, uid);
            ResultSet r = pst.executeQuery();
            if (r.next()) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
    public boolean deleteLikeByUser(int pid, int uid) {
        boolean f = false;
        try {
            PreparedStatement p = this.con.prepareStatement("delete from likes where postId = ? and userId = ?");
            p.setInt(1, pid);
            p.setInt(2, uid);
            p.executeUpdate();
            f = true;
        }catch(Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
}
