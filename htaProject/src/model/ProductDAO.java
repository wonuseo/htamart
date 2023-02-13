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
		List<Product> all = em.createQuery("select p from Product p where p.productName like '%" + keyword + "%' ")
				.getResultList();
		return all;
	}
	
	public List<Product> getAllProduct(String c_id) {
		EntityManager em = DBUtil.getEntityManager();
		Category c = new Category();
		c.setCategoryId(c_id);
		String sql = "select p from Product p where p.category = :category";
		List<Product> all = em.createQuery(sql).setParameter("category", c).getResultList();
		em.close();
		return all;
	}
	
	public Product getOneProduct(String p_id) {
		EntityManager em = DBUtil.getEntityManager();
		String sql = "select p from Product p where p.productId = :p_id";
		Product product = (Product) em.createQuery(sql).setParameter("p_id", p_id).getSingleResult();
		return product;
	}
	
	public List<Product> getProductdistinction(String c_id, String p_id) {
		System.out.println("getProductdistinction 메소드 호출 ----- " + c_id + p_id);
		EntityManager em = DBUtil.getEntityManager();
		
		Category c = new Category();
		
		c.setCategoryId(c_id);
		String sql = "select p from Product p where p.category = :category";
		List<Product> all = em.createQuery(sql).setParameter("category", c).getResultList();
		
		for(int i=0; i<all.size(); i++) {
			if(all.get(i).getProductId().equals(p_id)) {
				all.remove(i);
			}
		}
		return all;
	}
	
	public void insertCart(String p_id, int count) {
		EntityManager em = DBUtil.getEntityManager();
		EntityTransaction tx = em.getTransaction();
		
		try {
			tx.begin();
			
			
		} finally {
			em.close();
		}
	}
}