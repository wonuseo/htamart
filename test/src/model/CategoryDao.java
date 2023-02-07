package model;

import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.stereotype.Repository;

import model.domain.entity.category;
import util.DBUtil;

@Repository
public class CategoryDao {

	// select JPA no JPQL
	public String noJPQL() {
		EntityManager em = DBUtil.getEntityManager();
		category cat = em.find(category.class, 1);
		try {
			if (cat != null) {
				System.out.println("category c_id = " + cat.getC_id() + "\n" + "category c_name" + cat.getC_name());
			} else {
				System.out.println("검색 요청한 category은 미존재합니다");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			em.close();
		}
		return cat.getC_name();
	}
	
	// select JPA JPQL
	public List<String> findElement() {
		EntityManager em = DBUtil.getEntityManager();
		String sql = "select c.c_name from category c";
		List<String> all = em.createQuery(sql).getResultList();
		
		return all;
	}
	
	//namedQuery

}
