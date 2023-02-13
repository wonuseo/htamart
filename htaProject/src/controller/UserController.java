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
	public ModelAndView createUser(User user) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		boolean check = userDAO.checkId(user.getUserId());
		
		if(check == true) {
			userDAO.createUser(user);
			mv.setViewName("redirect:/login.html");
			System.out.println("check true");
		}else {
			mv.addObject("errorMessage", "이미 존재하는 아이디입니다.");
			mv.setViewName("redirect:/login.html");
			System.out.println("check false");
		}
		
		return mv;
	}




	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(Model model, @RequestParam String userId, @RequestParam String userPassword) throws Exception {

		System.out.println("userId " + userId);


		boolean valid = userDAO.validateUser(userId, userPassword);

		ModelAndView mv = new ModelAndView();
		if (valid == true) {

			mv.addObject("userId", userId);
//			model.addAttribute("userId", userId);

			System.out.println("로그인 성공");
			System.out.println("모델에 저장된 데이터" + model);

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
	
	@RequestMapping(value = "/isLogin", method = RequestMethod.POST)
//	@ResponseBody
	public String isLogin(HttpSession session) throws Exception {
		return (String) session.getAttribute("userId");
	}
	
	@RequestMapping(value = "/inSession", method = RequestMethod.POST)
	public String insession(HttpSession session) throws Exception {
		
		
		if((String)session.getAttribute("userId")!= null) {
			
		}else {
			
		}
		return null;
	}
	
}
