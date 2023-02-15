package controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.ui.Model;

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

	@GetMapping(value = "/showCart")
	public ModelAndView getCartView(@RequestParam(value = "userId") String userId, HttpSession session, Model model) throws Exception {

		ModelAndView mv = new ModelAndView();
		List<Object[]> cartList = cartDAO.selectCart(userDAO.selectOneUser(userId));
		
		if (session.getAttribute("userId") == null) {
			model.addAttribute("errorMessage", "회원 전용 입니다.");
			mv.setViewName("error");
		} else {
			List<Object[]> cartList = cartDAO.selectCart(userDAO.selectOneUser(userId));
			mv.addObject("cartList", cartList);
			mv.setViewName("shoppingCart");
		}
		return mv;
	}
	

	@GetMapping(value="/delete")
	public String deleteCart(@RequestParam(value="cNum") String cNum, 
							 @RequestParam(value="userId") String userId, RedirectAttributes ra) throws Exception {

		cartDAO.deleteCart(cNum);

		ra.addAttribute("userId", userId);

		return "redirect:/shoppingCart/showCart";
	}
	
	@ExceptionHandler(Exception.class)
	public ModelAndView handleException(Exception e) {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("errorMessage", e.getMessage());
		mv.setViewName("error");
		
		return mv;	
	}
	
}
