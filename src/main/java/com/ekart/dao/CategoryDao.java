package com.ekart.dao;

import com.ekart.entities.Category;
import com.ekart.helper.FactoryProvider;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author Awanish kumar singh
 */
public class CategoryDao {

    public static int saveCategory(Category c) {

        Session session = FactoryProvider.getFactory().openSession();
        Transaction t = session.beginTransaction();

        int id = (int) session.save(c);

        t.commit();
        session.close();
        return id;
    }

    public static List<Category> getAllCategory() {

        List<Category> lists;
        Session session = FactoryProvider.getFactory().openSession();
        Transaction t = session.beginTransaction();
        Query q = session.createQuery("from Category");
        lists = q.list();

        t.commit();
        session.close();
        return lists;
    }

    public static Category getCategorybyId(int cId) {

        Session session = FactoryProvider.getFactory().openSession();
        
        Category category = session.get(Category.class, cId);
        
        session.close();
        return category;
    }

}
