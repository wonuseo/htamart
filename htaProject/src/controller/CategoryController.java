package controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.ProductDAO;
import model.domain.entity.Product;

@Controller
@RequestMapping("category")
public class CategoryController {
	
	@Autowired
	private ProductDAO dao;
	
	@GetMapping(value = "/list")
	public ModelAndView getCategory(@RequestParam("cat") String cat) throws SQLException{
		String c_id = "";
		if(cat.equals("fruit")) {
			c_id = "1";
		}else if (cat.equals("vegetable")){
			c_id ="2";
		}else if (cat.equals("meat")){
			c_id ="3";
		}else if (cat.equals("seafood")){
			c_id ="4";
		}
		
		List<Product> all = dao.getAllProduct(c_id);
		
		for(Product p : all) {
			System.out.println(p.getProductId());
		}
		
		ModelAndView mv= new ModelAndView();
			mv.addObject("allData", all);
			mv.setViewName("list");
			return mv;
	}
	
}





