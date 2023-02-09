package model;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import org.springframework.stereotype.Repository;

import model.domain.entity.User;
import util.DBUtil;

@Repository
public class UserDAO {

	public void createUser(String u_id, String u_password, String u_name, String u_phone, String address, String u_date)
			throws Exception {

		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		// LocalDate date = LocalDate.parse(u_date, formatter);

		EntityManager em = DBUtil.getEntityManager();
		EntityTransaction tx = em.getTransaction();
		try {
			tx.begin();

			User user = new User(u_id, u_password, u_name, u_phone, address, LocalDate.parse(u_date, formatter));

			em.persist(user);

			tx.commit();
		} finally {
			em.close();
		}
	}

	public boolean validateUser(String userId, String userPassword) throws Exception{
		EntityManager em = DBUtil.getEntityManager();
		boolean result = false;
		
		String sql =  "select u from User u where u_id = :u_id and u_password = :u_password";
		
		try {
			List<User> user = em.createQuery(sql)
				.setParameter("u_id", userId)
				.setParameter("u_password", userPassword)
				.getResultList();
			
			if(user.size() != 0) result = true;
			
		} catch (Exception e) {
			System.out.println("해당되는 유저 없음");
		} finally {
			em.close();
		}
		return result;
	}
	
	
	
}