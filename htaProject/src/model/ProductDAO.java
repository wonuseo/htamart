package model;

import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.stereotype.Repository;

import model.domain.entity.Category;
import model.domain.entity.Product;
import util.DBUtil;

@Repository
public class ProductDAO {
	
	
	//TypeQuery  Query  Positional parameters set parameter
	public List<Product> getAllProduct(String c_id) {
		EntityManager em = DBUtil.getEntityManager();
		Category c = new Category();
		
		c.setC_id(c_id); 
		String sql = "select p from Product p where p.category = :category";
		
		List<Product> all = em.createQuery(sql)
				.setParameter("category", c)
				.getResultList();
		
		em.close();
		
		return all;
	}
}
