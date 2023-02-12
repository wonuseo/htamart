package controller;

import java.io.PrintWriter;
import java.net.HttpCookie;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

	@PostMapping(value = "/createUser", produces = "application/json;charset=utf-8")
	protected String createUser(User user) throws Exception {

		userDAO.createUser(user);
		return "회원 가입 성공";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(Model model, @RequestParam String userId, @RequestParam String userPassword,
			HttpServletResponse response, HttpServletRequest reques) throws Exception {

		System.out.println("userId " + userId);

		boolean valid = userDAO.validateUser(userId, userPassword);

		ModelAndView mv = new ModelAndView();
		if (valid == true) {

			model.addAttribute("userId", userId);

			System.out.println("로그인 성공");
			System.out.println("모델에 저장된 데이터" + model);
			
			
			mv.setViewName("redirect:/homepage.html");
			return mv;
		} else {
			PrintWriter out = response.getWriter();
			out.print("<script> alert('로그인 실패'); location.href='" + "/htaProject/login.jsp" + "'; </script>");
			return mv;
		}

	}

	@RequestMapping(value = "/sessionOut", method = RequestMethod.GET)
	public ModelAndView sessionOut(SessionStatus status, HttpSession session) throws Exception {

		status.setComplete();
//		status = null;

		System.out.println(session.getAttribute("userId"));
		System.out.println("session 삭제 성공");

		ModelAndView mv = new ModelAndView();

		mv.setViewName("redirect:/homepage.html");

		return mv;
	}
}

