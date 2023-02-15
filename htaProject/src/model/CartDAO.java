package model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import org.springframework.stereotype.Repository;

import model.domain.entity.Cart;
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
		
		List<Object[]> all = null;
		try {
			all = em.createQuery("select p, c.productCount, c.user, c.cNum from Cart c, Product p where c.product = p.productId and c.user = :user")
					.setParameter("user", user)
					.getResultList();
		} finally {
			em.close();
		}
		
		return all;
	}
	

	public Cart selectCartNum(int cNum) {
		EntityManager em = DBUtil.getEntityManager();
		
		Cart cart = (Cart) em.createQuery("select c from Cart c where c.cNum = :cNum")
				.setParameter("cNum", cNum)
				.getSingleResult();
		
		return cart;
	}
	
	
	public void deleteCart(String cNum) throws Exception {
		EntityManager em = DBUtil.getEntityManager();
		EntityTransaction tx = em.getTransaction();		
		
		try {
			tx.begin();

			em.createQuery("delete from Cart c where c.cNum = :cNum")
			.setParameter("cNum", Integer.parseInt(cNum))
			.executeUpdate();

			tx.commit();
		} finally {
			em.close();
		}
	}
	
}
