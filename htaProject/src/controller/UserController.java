package controller;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.support.SessionStatus;

import model.UserDAO;
import model.domain.entity.User;

@RestController
@RequestMapping("userinfo")
public class UserController {

	@Autowired
	public UserDAO userDAO;

	@PostMapping(value="/createUser", produces = "application/json;charset=utf-8")	
	protected String createUser(User user) throws Exception{
		
		userDAO.createUser(user);
		return "회원 가입 성공";
	}
	
	
	
	
	
	
	
	
	
	@PostMapping(value="/login")
	protected void login(@RequestParam("userId") String userId, @RequestParam("userPassword") String userPassword, HttpSession session, HttpServletResponse response, HttpServletRequest request) throws Exception{
		System.out.println(userId + " " + userPassword);
		response.setContentType("text/html; charset=utf-8");
		
		boolean valid = userDAO.validateUser(userId, userPassword);
		
		if(valid == true) {
			System.out.println("로그인 성공");
			session.setAttribute("loginId", userId);
			response.sendRedirect("/htaProject/sessionId.jsp");
		} else {
			System.out.println("로그인 실패");
			PrintWriter out = response.getWriter();
			out.print("<script> alert('로그인 실패'); location.href='" + "/htaProject/login.html" + "'; </script>");
			//response.sendRedirect("/htaProject/login.html");
		}
	}
	
	
	@RequestMapping(value = "/logout", method = RequestMethod.POST)
	public String logout(SessionStatus status, HttpSession session, HttpServletResponse response) {
		
		session.getAttribute("loginId");

		status.setComplete();
		System.out.println("로그아웃 성공");
		return "redirect:/logout.jsp";
	}
	
	
	
	
	
	
	
	
	@PostMapping(value="/selectUser", produces = "application/json;charset=utf-8")	
	protected String seletUser(@RequestBody Map<String, Object> vo) throws Exception{
		
		userDAO.selectUser(vo);
		return "조회 성공";
	}
	
}
