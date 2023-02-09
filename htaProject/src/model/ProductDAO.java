package model;

import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.stereotype.Repository;

import model.domain.entity.Category;
import model.domain.entity.Product;
import util.DBUtil;

@Repository
public class ProductDAO {

	public List<Product> findElement(String keyword) {
		System.out.println("빠인드 엘리먼트 실행" + keyword); 
		EntityManager em = DBUtil.getEntityManager(); 
		
		List<Product> all = em.createQuery("select p from Product p where p.p_name like '%"+keyword+"%' ").getResultList();
		
		for(int i=0; i<all.size(); i++) {
			System.out.println(all.get(i).getP_name());
		} 
		
		return all;

	}
	
	public List<Product> getAllProduct(String c_id) {
		EntityManager em = DBUtil.getEntityManager();
		Category c = new Category();
		
		c.setC_id(c_id);
		String sql = "select p from Product p where p.category = :category";
		
		List<Product> all = em.createQuery(sql).setParameter("category", c).getResultList();
				
		em.close();
		
		return all;
	}
}
