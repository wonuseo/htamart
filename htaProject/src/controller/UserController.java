package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
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

	
	@PostMapping(value="/createUser", produces = "application/json;charset=utf-8")	
	public void createUser(User user) throws Exception{
		if(user.getUserId() == null || user.getUserPassword() == null || user.getUserName() == null || user.getUserPhone() == null || user.getAddress() == null) {
			throw new Exception("입력값이 올바르지 않습니다.");
		}
		System.out.println(user);		
		userDAO.createUser(user);	
	}


	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(@RequestParam String userId, @RequestParam String userPassword) throws Exception {

		System.out.println("userId " + userId);


		boolean valid = userDAO.validateUser(userId, userPassword);

		ModelAndView mv = new ModelAndView();
		if (valid == true) {

			mv.addObject("userId", userId);
//			model.addAttribute("userId", userId);

			System.out.println("로그인 성공");

			mv.setViewName("redirect:/homepage.html");
			return mv;

		} else {
			return mv;
		}

	}

	@RequestMapping(value = "/sessionOut", method = RequestMethod.GET)
	public ModelAndView sessionOut(SessionStatus status, HttpSession session) throws Exception {

		status.setComplete();
		status = null;

		System.out.println(session.getAttribute("userId"));
		System.out.println("session 삭제 성공");

		ModelAndView mv = new ModelAndView();

		mv.setViewName("redirect:/homepage.html");

		return mv;
	}
	
	@RequestMapping(value = "/isLogin1", method = RequestMethod.POST)
	public String isLogin1(HttpSession session) throws Exception {
		System.out.println("******* islogin");
		return (String) session.getAttribute("userId");
	}
	
	@RequestMapping(value = "/isLogin", method = RequestMethod.POST)
	public String isLogin(Model model) throws Exception {
		String userId = (String) model.getAttribute("userId");
		
		return userId;
	}
	
	@RequestMapping(value = "/inSession", method = RequestMethod.POST)
	public String insession(HttpSession session) throws Exception {
		
		
		if((String)session.getAttribute("userId")!= null) {
			
		}else {
			
		}
		return null;
	}
	
}
