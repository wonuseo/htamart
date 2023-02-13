package model;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import org.springframework.stereotype.Repository;

import model.domain.entity.User;
import util.DBUtil;

@Repository
public class UserDAO {

	public void createUser(User user) throws Exception {
		EntityManager em = DBUtil.getEntityManager();
		EntityTransaction tx = em.getTransaction();

		try {
			tx.begin();
			
			user.setUserDate(new Date());
			em.persist(user);

			tx.commit();
		} finally {
			em.close();
		}
	}
	
	public boolean checkId(String userId) throws Exception {
        EntityManager em = DBUtil.getEntityManager();

        try {
            String query = "SELECT COUNT(u) FROM User u WHERE u.userId = :userId";
            Long count = em.createQuery(query, Long.class)
                    .setParameter("userId", userId)
                    .getSingleResult();

            return count == 0;
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
		
		}finally {

			em.close();
		}
		return result;
	}
	
	public void selectUser(Map<String, Object> vo) {
		EntityManager em = DBUtil.getEntityManager();
		
			try {
				User user = (User) em.createQuery("select u from User u where u_id = :u_id and u_password = :u_password ")
						.setParameter("u_id", vo.get("u_id"))
						.setParameter("u_password",vo.get("u_password"))
						.getSingleResult();
				
				if (user != null) {
					System.out.println("검색하신 회원의 정보입니다." + user.getUserId() 
					+ " " + user.getUserPassword() + " " + user.getUserName() + " " 
							+ user.getUserPhone() + " " + user.getAddress() + " " + user.getUserDate());
				}
			} catch(Exception e) {
				System.out.println("검색하신 회원은 존재하지않습니다.");
			}
			em.close();
		}
	
	public User selectOneUser(String userId) {
		EntityManager em = DBUtil.getEntityManager();
		
		String sql = "select u from User u where u_id = :u_id";
		
		User user = (User) em.createQuery(sql)
				.setParameter("u_id", userId)
				.getSingleResult();
		
		return user;
	}
	
}