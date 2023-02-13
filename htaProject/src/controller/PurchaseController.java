package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.ProductDAO;
import model.domain.entity.Product;

@Controller
@RequestMapping("purchase")
public class PurchaseController {
	
	@Autowired
	private ProductDAO productDAO;
	
	@PostMapping(value="/final")
	public ModelAndView purchaseOne(@RequestParam(value = "p_id") String p_id, @RequestParam(value = "p_count") int p_count, HttpServletRequest request,HttpSession session) {
		Product product = productDAO.getOneProduct(p_id);
		ModelAndView mv = new ModelAndView();
		List<Product> productList = new ArrayList<Product>();
		productList.add(product);
		mv.addObject("product", productList);
		mv.addObject("count", p_count);
		mv.setViewName("purchase");
		
		return mv;
	}
}
	
