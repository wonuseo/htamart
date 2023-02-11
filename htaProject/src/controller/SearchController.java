package controller;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.ProductDAO;

@Controller
@RequestMapping("SearchController")
public class SearchController {
	
	@Autowired
	private ProductDAO productdao;
	
	@GetMapping(value="/productsearch")
	public ModelAndView getProductSearch(@RequestParam(value = "keyword") String keyword) throws SQLException {
		System.out.println("메소드 실행 " + keyword);
		ModelAndView mv = new ModelAndView();
		
		if(keyword != null && keyword.length() != 0) {
			mv.addObject("productallData", productdao.findElement(keyword));
		} else {
			mv.addObject("productallData");
		}
		mv.setViewName("list");
		return mv;  
	}
		
}
