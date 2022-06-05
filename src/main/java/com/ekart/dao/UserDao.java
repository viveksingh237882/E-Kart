/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ekart.dao;

import com.ekart.entities.User;
import com.ekart.helper.FactoryProvider;
import java.io.Serializable;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author Awanish kumar singh
 */
public class UserDao {
    
    public static User getUser(String email, String  password){
        
        User user = null;
        Session session = FactoryProvider.getFactory().openSession();
        Transaction t = session.beginTransaction();
        
        String query = "from User where userEmail =: e and userPassword =: p ";
        Query q = session.createQuery(query);
        q.setParameter("e", email);
        q.setParameter("p", password);
        
        user = (User)q.uniqueResult();
        
        t.commit();
        session.close();
        return user;
    }
    
    public static int saveUser(User user){
   
        Session session = FactoryProvider.getFactory().openSession();
        Transaction t = session.beginTransaction();
        int save = (int)session.save(user);
        t.commit();
        session.close();
        return save;
    }
    
    public static int getAlluser(){
        Session session = FactoryProvider.getFactory().openSession();
        Transaction t = session.beginTransaction();
        
        Query q = session.createQuery("from User");
        List<User> l = q.list();
        
        t.commit();
        session.close();
        return l.size();
    }
}
