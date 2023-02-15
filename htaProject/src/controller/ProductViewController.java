package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
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
	public ModelAndView productView(@RequestParam(value = "p_id") String p_id) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		Product product = productDao.getOneProduct(p_id);
		Category category = product.getCategory();
		
		List<Product> all = productDao.getProductdistinction(category.getCategoryId(), product.getProductId());
	
		mv.addObject("product", product);
		mv.addObject("productallData", all);
		mv.addObject("categoryname", category.getCategoryName());
		mv.setViewName("productDetail");
		
		return mv;
	}
	
	@ExceptionHandler(Exception.class)
	public ModelAndView handleException(Exception e) {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("errorMessage", e.getMessage());
		mv.setViewName("error");
		
		return mv;	
	}
	
}
