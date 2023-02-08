package model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;

import org.springframework.stereotype.Repository;

import model.domain.entity.User;
import util.DBUtil;

@Repository // (퍼시스턴스 레이어, DB나 파일같은 외부 I/O 작업을 처리함)
public class UserDAO {
	// String sql = "select u.u_id, u.u_password from user u where = u.u_id ";
//	session.setAttribute("userInfo", user);

	public static void getAlluser() {
		EntityManager em =DBUtil.getEntityManager();
		
		String sql = "select u from User u";
		List<User> all = em.createQuery(sql).getResultList();
		User[] users = all.toArray(new User[all.size()]);
		System.out.println(users.getClass());
		
		for(User u : users) {
			System.out.println( u.getU_id() + " " + u.getU_name() + " " + u.getU_password() + " " + u.getU_phone() + " " + u.getAddress() + " " + u.getU_date());
		}
		em.close();
	}

	public void selectUser(Map<String, Object> vo) throws ParseException {
		EntityManager em = DBUtil.getEntityManager();

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		 
        Date u_date = formatter.parse((String) vo.get("u_date"));
        
		try {
			String sql = "select u from User u "
					+ "where u_id = :u_id "
					+ "and u_password = :u_password "
					+ "and u_name = :u_name "
					+ "and u_phone = :u_phone "
					+ "and address = :address "
					+ "and u_date = :u_date";
			try {
				User user = (User) em.createQuery(sql)
						.setParameter("u_id", (String) vo.get("u_id"))
						.setParameter("u_password", (String) vo.get("u_password"))
						.setParameter("u_name", (String) vo.get("u_name"))
						.setParameter("u_phone", (String) vo.get("u_phone"))
						.setParameter("address", vo.get("address"))
						.setParameter("u_date", u_date)
						.getSingleResult();
				
				
				if (user != null) {
					System.out.println("검색하신 회원의 정보입니다." + user.getU_id() + " " + user.getU_name() + " " + user.getU_password() + " " + user.getU_phone() + " " + user.getAddress() + " " + user.getU_date());
				}
			} catch(NoResultException noResultException) {
				System.out.println("검색하신 회원은 존재하지않습니다.");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			em.close();
		}
	}
	public void createUser() {
		EntityManager em = DBUtil.getEntityManager();
		EntityTransaction tx = em.getTransaction();
		try {
			tx.begin();
			
			


//			User user = new User("id03", "1111", "병선", "010444", "인천",'2023-02-03 00:00:00.0');
//			em.persist(user);
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			em.close();
		}
	}
	}
//	public static void main(String[] args) { 
//
//		getAlluser();
//}
//}