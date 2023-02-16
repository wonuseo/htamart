package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.CartDAO;
import model.ProductDAO;
import model.UserDAO;
import model.domain.entity.Cart;
import model.domain.entity.Product;
import model.domain.entity.User;

@Controller
@RequestMapping("purchase")
public class PurchaseController {

	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private CartDAO cartDAO;

	@GetMapping(value = "/final")
	public ModelAndView purchaseOne(@RequestParam(value = "p_id") String productId,
			@RequestParam(value = "p_count") int count, @RequestParam(value = "u_id") String userId,
			HttpSession session, Model model) throws Exception {

		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("userId") == null) {
			mv.addObject("errorMessage", "회원 전용 입니다.");
			mv.setViewName("error");
		} else {
			Product product = productDAO.getOneProduct(productId);
			User user = userDAO.selectOneUser(userId);

			List<Product> productList = new ArrayList<Product>();
			List<Integer> productCount = new ArrayList<Integer>();
			productList.add(product);
			productCount.add(count);
			mv.addObject("product", productList);
			mv.addObject("count", productCount);
			mv.addObject("user", user);

			mv.setViewName("purchase");
		}
		return mv;
	}

	@PostMapping(value = "/final2")
	public ModelAndView purchaseCart(@RequestParam(value = "p_id") List<String> productId,
			@RequestParam(value = "p_count") List<String> productCount, @RequestParam(value = "cNum") List<String> cNum,
			@RequestParam(value = "u_id") String userId) throws Exception {

		ModelAndView mv = new ModelAndView();
		User user = userDAO.selectOneUser(userId);
		List<Product> productList = new ArrayList<Product>();

		for (int i = 0; i < productId.size(); i++) {
			Product product = productDAO.getOneProduct(productId.get(i));
			productList.add(product);
		}
		mv.addObject("product", productList);
		mv.addObject("count", productCount);
		mv.addObject("cNum", cNum);
		mv.addObject("user", user);

		mv.setViewName("purchase");

		return mv;
	}

	@PostMapping(value = "/receipt")
	public ModelAndView receipt(@RequestParam(value = "name") String name, @RequestParam(value = "tel") String tel,
			@RequestParam(value = "address") String address, @RequestParam(value = "cNum") List<String> cartNum,
			@RequestParam(value = "p_id") String productNum, @RequestParam(value = "count") String count) throws Exception {
		ModelAndView mv = new ModelAndView();

		mv.addObject("name", name);
		mv.addObject("tel", tel);
		mv.addObject("address", address);
		
		if(cartNum.size() == 0) {
			Product product = productDAO.getOneProduct(productNum);
		    int productPrice = product.getProductPrice();
			mv.addObject("product", productDAO.getOneProduct(productNum));
			mv.addObject("count", count);
			mv.addObject("type", "one");
			mv.addObject("productPrice", productPrice);
		} else {
			List<Cart> cartList = new ArrayList<Cart>();
			for (String s : cartNum) {
				cartList.add(cartDAO.selectCartNum(Integer.parseInt(s)));
				cartDAO.deleteCart(s);
			}
			mv.addObject("receipt", cartList);
			mv.addObject("type", "cart");
		}

		mv.setViewName("receipt");

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
