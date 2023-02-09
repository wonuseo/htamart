package runtest;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import model.domain.entity.Category;
import model.domain.entity.Product;
import util.DBUtil;

public class RunningTest {

	public static void getAllCategory() {
		EntityManager em = DBUtil.getEntityManager();
		String sql = "select c from Category c";
		List<Category> all = em.createQuery(sql).getResultList();
		Category[] cat = all.toArray(new Category[all.size()]);
		System.out.println(cat.getClass());
		for(Category c : cat) {
			System.out.println(c.getC_id() + " " + c.getC_name());
		}
		em.close();
	}
	
	public static void insertProduct() {
		EntityManager em = DBUtil.getEntityManager();
		EntityTransaction tx = em.getTransaction();
		Category c = new Category("4", "fdf");
		try {
			tx.begin();
			//Category category2 = new Category("3", "fruit");
			Product category2 = new Product("2", "dd", c, 5000, "34", "ymmu", "yes");
			em.persist(category2);
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			em.close();
		}
		
	}
	
	public static void main(String[] args) {
		
		getAllCategory();
		
	}

}
