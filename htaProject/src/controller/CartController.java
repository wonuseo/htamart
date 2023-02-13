package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import model.CartDAO;
import model.UserDAO;

@Controller
@RequestMapping("shoppingCart")
public class CartController {
	
	@Autowired
	private CartDAO cartDAO;
	@Autowired
	private UserDAO userDAO;
	
	@GetMapping(value="/showCart")
	public ModelAndView getCartView(@RequestParam(value="userId") String userId) throws Exception {
		List<Object[]> cartList = cartDAO.selectCart(userDAO.selectOneUser(userId));
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("cartList", cartList);
		
		mv.setViewName("shoppingCart");
		
		return mv;
	}
	
	@GetMapping(value="/delete")
	public String deleteCart(@RequestParam(value="cNum") String cNum, @RequestParam(value="userId") String userId, RedirectAttributes ra) {
		cartDAO.deleteCart(cNum);
		
		ra.addAttribute("userId", userId);
		
		return "redirect:/shoppingCart/showCart";
	}
}
