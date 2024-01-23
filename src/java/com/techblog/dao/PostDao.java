/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.techblog.dao;

import com.techblog.entities.Category;
import com.techblog.entities.Post;
import java.util.ArrayList;
import java.sql.*;
import java.util.List;

/**
 *
 * @author Vicky Patel
 */
public class PostDao {
    Connection con;
    public PostDao(Connection con) {
        this.con = con;
    }
    public ArrayList<Category> getAllCategories() {
        ArrayList<Category> list = new ArrayList<>();
        try {
            String query = "select * from categories";
            Statement st = this.con.createStatement();
            ResultSet set = st.executeQuery(query);
            while(set.next()) {
                int cid = set.getInt("cid");
                String name = set.getString("name");
                String description = set.getString("description");
                Category cat = new Category(cid, name, description);
                list.add(cat);
            }
        }catch(Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public boolean savePost(Post p) {
        boolean f = false;
        try {
            String query = "insert into posts (ptitle, pcontent, pcode, ppic, catId, userId) values (?,?,?,?,?,?)";
            PreparedStatement pstm = this.con.prepareStatement(query);
            pstm.setString(1, p.getPtitle());
            pstm.setString(2, p.getPcontent());
            pstm.setString(3, p.getPcode());
            pstm.setString(4, p.getPpic());
            pstm.setInt(5, p.getCid());
            pstm.setInt(6, p.getUserId());
            pstm.executeUpdate();
            f = true;
        }catch(Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
    
    //get all the posts
    public List<Post> getAllPosts() {
        List<Post> list = new ArrayList<>();
        try {
            PreparedStatement p = con.prepareStatement("select * from posts order by id desc");
            ResultSet s = p.executeQuery();
            while(s.next()) {
                int pid = s.getInt("id");
                String ptitle = s.getString("ptitle");
                String pcontent = s.getString("pcontent");
                String pcode = s.getString("pcode");
                String ppic = s.getString("ppic");
                Timestamp date = s.getTimestamp("pdate");
                int catId = s.getInt("catId");
                int userId = s.getInt("userId");
                Post newPost = new Post(pid, ptitle, pcontent, pcode, ppic, date, catId, userId);
                list.add(newPost);
            }  
        }catch(Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    //get all the posts by the cateogryid
    public List<Post> getPostsByCategory(int categoryId) {
        List<Post> list = new ArrayList<>();
        try {
            PreparedStatement p = con.prepareStatement("select * from posts where catId = ?");
            p.setInt(1, categoryId);
            ResultSet s = p.executeQuery();
            while(s.next()) {
                int pid = s.getInt("id");
                String ptitle = s.getString("ptitle");
                String pcontent = s.getString("pcontent");
                String pcode = s.getString("pcode");
                String ppic = s.getString("ppic");
                Timestamp pdate = s.getTimestamp("pdate");
                int userId = s.getInt("userId");
                int catId = s.getInt("catId");
                Post newPost = new Post(pid, ptitle, pcontent, pcode, ppic, pdate, catId, userId);
                list.add(newPost);
            }  
        }catch(Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public Post getPostById(int postId) {
        Post post = new Post();
        try {
            PreparedStatement p = this.con.prepareStatement("select * from posts where id = ?");
            p.setInt(1, postId);
            ResultSet s = p.executeQuery();
            if(s.next()){
                post.setPid(s.getInt("id"));
                post.setCid(s.getInt("catId"));
                post.setPtitle(s.getString("ptitle"));
                post.setPcontent(s.getString("pcontent"));
                post.setPcode(s.getString("pcode"));
                post.setPdate(s.getTimestamp("pdate"));
                post.setPpic(s.getString("ppic"));
                post.setUserId(s.getInt("userId"));
            } 
        }catch(Exception e) {
            e.printStackTrace();
        }
        return post;
    }
    
}
