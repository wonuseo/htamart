package model;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import org.springframework.stereotype.Repository;

import model.domain.entity.User;
import util.DBUtil;

@Repository
public class UserDAO {

	public void createUser(String userId, String userPassword, String uName, String uPhone, String address, String uDate)
			throws Exception {

		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");		
		// LocalDate date = LocalDate.parse(uDate, formatter);

		EntityManager em = DBUtil.getEntityManager();
		EntityTransaction tx = em.getTransaction();
		try {
			tx.begin();

			User user = new User(userId, userPassword, uName, uPhone, address, LocalDate.parse(uDate, formatter));

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