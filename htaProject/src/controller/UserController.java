package controller;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
@SessionAttributes({"userId", "userPassword" })
public class UserController {

	@Autowired
	public UserDAO userDAO;

	@PostMapping(value="/createUser", produces = "application/json;charset=utf-8")	
	protected String createUser(User user) throws Exception{
		
		userDAO.createUser(user);
		return "회원 가입 성공";
	}

	@PostMapping(value = "/login")
	public ModelAndView login(Model sessionData, @RequestParam String userId, @RequestParam String userPassword, HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		System.out.println(userId + " " + userPassword);
		response.setContentType("text/html; charset=utf-8");

		boolean valid = userDAO.validateUser(userId, userPassword);

		ModelAndView mv = new ModelAndView();
		
		if (valid == true) {
			System.out.println("로그인 성공");
			sessionData.addAttribute("userId", userId);
			mv.addObject("loginId_model", "model data");
//			response.sendRedirect("/htaProject/sessionId.jsp");
			mv.setViewName("redirect:/homepage.html");
		} else {
			System.out.println("로그인 실패");
			PrintWriter out = response.getWriter();
			out.print("<script> alert('로그인 실패'); location.href='" + "/htaProject/login.jsp" + "'; </script>");
			// response.sendRedirect("/htaProject/login.html");
		}

		return mv;
	}

	@RequestMapping(value = "/logout", method = RequestMethod.POST)
	public String logout(SessionStatus status, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		System.out.println("로그아웃 성공");
		status.setComplete();
		status = null;
		
		return "redirect:/login.html";	
	}

}
