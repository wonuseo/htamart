package model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import org.springframework.stereotype.Repository;

import model.domain.entity.Cart;
import model.domain.entity.Product;
import model.domain.entity.User;
import util.DBUtil;

@Repository
public class CartDAO {

	public void insertCart(Cart cart) throws Exception {
		EntityManager em = DBUtil.getEntityManager();
		EntityTransaction tx = em.getTransaction();

		try {
			tx.begin();

			em.persist(cart);

			tx.commit();
		} finally {
			em.close();
		}
	}

	public List<Object[]> selectCart(User user) throws Exception {
		EntityManager em = DBUtil.getEntityManager();
		
		String sql = "select p, c.productCount, c.user, c.cNum from Cart c, Product p where c.product = p.productId and c.user = :user";
				
		List<Object[]> all = em.createQuery(sql)
				.setParameter("user", user)
				.getResultList();
		
		return all;
	}
	
	public void deleteCart(String cNum) {
		EntityManager em = DBUtil.getEntityManager();
		EntityTransaction tx = em.getTransaction();
		
		String sql = "delete from Cart c where c.cNum = :cNum";
		try {
			tx.begin();

			em.createQuery(sql).setParameter("cNum", Integer.parseInt(cNum)).executeUpdate();

			tx.commit();
		} finally {
			em.close();
		}
	}
}
