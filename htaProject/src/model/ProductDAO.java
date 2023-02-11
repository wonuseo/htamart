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
		EntityManager em = DBUtil.getEntityManager();

		List<Product> all = em.createQuery("select p from Product p where p.p_name like '%" + keyword + "%' ").getResultList();

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

	public Product getOneProduct(String c_id) {
		EntityManager em = DBUtil.getEntityManager();

		String sql = "select p from Product p where p.p_id = :p_id";

		Product product = (Product) em.createQuery(sql).setParameter("p_id", c_id).getSingleResult();

		return product;
	}
	
	
	//관련상품 판별하기 위한 작업.. 해당 상품을 제외한 list 반환하기
	public List<Product> getProductdistinction(String c_id, String p_id) {
		System.out.println("getProductdistinction 메소드 호출 ----- " + c_id + p_id);
		EntityManager em = DBUtil.getEntityManager();
		
		Category c = new Category();
		
		c.setC_id(c_id);
		String sql = "select p from Product p where p.category = :category";

		List<Product> all = em.createQuery(sql).setParameter("category", c).getResultList();
		
		for(int i=0; i<all.size(); i++) {
			if(all.get(i).getP_id().equals(p_id)) {
				all.remove(i);
			}
		}
		
		return all;
	}

}
