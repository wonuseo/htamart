package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.ProductDAO;
import model.domain.entity.Category;
import model.domain.entity.Product;

@Controller
@RequestMapping("productView")
public class ProductViewController {
	
	@Autowired
	private ProductDAO productDao;
	
	@GetMapping(value="/details")
	public ModelAndView productView(@RequestParam(value = "p_id") String p_id) {
		//p_id만의 고유한 상품 객체
		Product product = productDao.getOneProduct(p_id);
		System.out.println("id값 " + p_id);
		//교유한 상품 객체의 카테고리객체 획득
		Category category = product.getCategory();
		
		//고유한 상품 객체의 id값을 이용해 그에 해당된 상품을 제외한 list 반환하는 메소드 호출
		List<Product> all = productDao.getProductdistinction(category.getCategoryId(), product.getProductId());
	
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("product", product);
		mv.addObject("productallData", all);
		mv.addObject("categoryname", category.getCategoryName());
		mv.setViewName("productDetail");
		
		return mv;
	}
}
