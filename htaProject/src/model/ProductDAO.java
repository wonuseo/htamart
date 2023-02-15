package model;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import org.springframework.stereotype.Repository;
import model.domain.entity.Category;
import model.domain.entity.Product;
import util.DBUtil;
@Repository
public class ProductDAO {
	
	public List<Product> findElement(String keyword) {
		EntityManager em = DBUtil.getEntityManager();
		
		List<Product> all = null;
		
		try {
			all = em.createQuery("select p from Product p where p.productName like '%" + keyword + "%' ")
					.getResultList();
		} finally {
			em.close();
		}
		
		return all;
	}
	
	public List<Product> getAllProduct(String c_id) {
		EntityManager em = DBUtil.getEntityManager();
		
		Category c = new Category();
		c.setCategoryId(c_id);
		
		List<Product> all = null;
		try {
			all = em.createQuery("select p from Product p where p.category = :category")
					.setParameter("category", c)
					.getResultList();
		}finally {
			em.close();
		}
		
		return all;
	}
	
	public Product getOneProduct(String p_id) {
		EntityManager em = DBUtil.getEntityManager();
		
		Product product = null;
		try {
			product = (Product) em.createQuery("select p from Product p where p.productId = :p_id")
					.setParameter("p_id", p_id)
					.getSingleResult();
		}finally {
			em.close();
		}
		
		return product;
	}
	
	public List<Product> getProductdistinction(String c_id, String p_id) {
		EntityManager em = DBUtil.getEntityManager();
		
		Category c = new Category();
		c.setCategoryId(c_id);
		
		List<Product> all = null;
		try {
			all = em.createQuery("select p from Product p where p.category = :category")
					.setParameter("category", c)
					.getResultList();
			
			for(int i=0; i<all.size(); i++) {
				if(all.get(i).getProductId().equals(p_id)) {
					all.remove(i);
				}
			}
			
		}finally {
			em.close();
		}
		
		return all;
	}
}