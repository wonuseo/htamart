package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import model.CartDAO;
import model.ProductDAO;
import model.UserDAO;
import model.domain.entity.Cart;
import model.domain.entity.Product;
import model.domain.entity.User;

@RestController
@RequestMapping("axios")
public class AxiosController {
	
	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private CartDAO cartDAO;
	
	@PostMapping(value="/cart")
	public void cart(@RequestParam(value="p_id") String productId, @RequestParam(value="userId") String userId, Cart cart) throws Exception {
		
		User user = userDAO.selectOneUser(userId);
		Product product = productDAO.getOneProduct(productId);
		
		cart.setUser(user);
		cart.setProduct(product);
		
		cartDAO.insertCart(cart);
	}
	
	@ExceptionHandler(Exception.class)
	public ModelAndView handleException(Exception e) {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("errorMessage", e.getMessage());
		mv.setViewName("error");
		
		return mv;	
	}
	
}
