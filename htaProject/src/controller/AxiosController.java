package controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

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

	@PostMapping(value = "/cart")
	public boolean cart(@RequestParam(value = "p_id") String productId, @RequestParam(value = "userId") String userId,
			@RequestParam(value = "productCount") String productCount, Cart cart) throws Exception {

		boolean result = false;
		if (userId == null || userId.length() == 0) {

		} else {
			User user = userDAO.selectOneUser(userId);
			Product product = productDAO.getOneProduct(productId);

			cart.setUser(user);
			cart.setProduct(product);

			cartDAO.insertCart(cart);
			result = true;
		}
		return result;
	}
}
