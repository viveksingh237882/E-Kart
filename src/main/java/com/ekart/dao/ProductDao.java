package com.ekart.dao;

import com.ekart.entities.Product;
import com.ekart.helper.FactoryProvider;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author Awanish kumar singh
 */
public class ProductDao {
    
    public static void saveProduct(Product p){
        
        Session session = FactoryProvider.getFactory().openSession();
        Transaction t = session.beginTransaction();
        
        session.save(p);
        
        
        t.commit();
        session.close();
    }
    
    public static List<Product> getAllProduct(){
        
        Session session = FactoryProvider.getFactory().openSession();
        Transaction t = session.beginTransaction();
        
        List<Product> list;
        
        Query q = session.createQuery("from Product");
        list = q.list();
        t.commit();
        session.close();
        return list;
    }
    
    public static List<Product> getAllProductById(int id){
        
        Session session = FactoryProvider.getFactory().openSession();
        Transaction t = session.beginTransaction();
        
        List<Product> list;
        
        Query q = session.createQuery("from Product as p where p.category.categoryId=:p");
        q.setParameter("p", id);
        list = q.list();
        t.commit();
        session.close();
        return list;
    }

}
