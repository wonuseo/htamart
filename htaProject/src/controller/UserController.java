package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import model.UserDAO;
import model.domain.entity.User;

@RestController
@RequestMapping("userinfo")
@SessionAttributes({ "userId" })
public class UserController<user> {

	@Autowired
	public UserDAO userDAO;

	@PostMapping(value = "/createUser", produces = "application/json;charset=utf-8")
	public ModelAndView createUser(User user) throws Exception {
		ModelAndView mv = new ModelAndView();
	
		userDAO.createUser(user);
		mv.setViewName("redirect:/login.html");
			
		return mv;
	}
	
	@PostMapping(value = "dedupId")
	public boolean dedupId(@RequestParam(value = "u_id") String userIdCheck) throws Exception {
		boolean check = userDAO.checkId(userIdCheck);
	
		return check;
	}
	
	@PostMapping(value = "/validateUser")
	public boolean validateUser(@RequestParam(value = "userId") String userId, @RequestParam(value = "userPassword") String userPassword) throws Exception {
		System.out.println(userId + ":" + userPassword);
		boolean check = userDAO.validateUser(userId, userPassword);
		
		return check;
	}
	

//	@RequestMapping(value = "/login", method = RequestMethod.POST)
//	public ModelAndView login(@RequestParam String userId1, @RequestParam String userPassword1, HttpSession session) throws Exception {
//
//		ModelAndView mv = new ModelAndView();
//		session.setAttribute("userId", userId1);
//		mv.setViewName("redirect:/homepage.html");
//
//		return mv;
//	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(@RequestParam String userId1, @RequestParam String userPassword1) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("userId", userId1);
		mv.setViewName("redirect:/homepage.html");
		
		return mv;
	}

	@RequestMapping(value = "/sessionOut", method = RequestMethod.GET)
	public ModelAndView sessionOut(SessionStatus status) throws Exception {
		ModelAndView mv = new ModelAndView();
		status.setComplete();
		status = null;

		mv.setViewName("redirect:/userinfo/refresh");

		return mv;
	}
	
	@RequestMapping(value = "/refresh", method = RequestMethod.GET)
	public ModelAndView refresh() throws Exception { 
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("redirect:/homepage.html");
		
		return mv;
	}
	
	
	@RequestMapping(value = "/isLogin", method = RequestMethod.POST)
	public String isLogin(Model model) throws Exception {
		
		String userId = (String) model.getAttribute("userId");
		
		return userId;
	}
	
//	@RequestMapping(value = "/isLogin", method = RequestMethod.POST)
//	public String isLogin(HttpSession session) throws Exception {
//		String userId = (String) session.getAttribute("userId");
//		
//		return userId;
//	}

	@ExceptionHandler(Exception.class)
	public ModelAndView handleException(Exception e) {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("errorMessage", e.getMessage());
		mv.setViewName("error");
		
		return mv;	
	}
	
	
}

