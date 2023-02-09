package controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import model.UserDAO;

@RestController
@RequestMapping("userinfo")
public class UserController {

	@Autowired
	public UserDAO userDAO;

	
	@PostMapping(value="/createUser", produces = "application/json;charset=utf-8")	
	protected String signUp(@RequestParam String u_id,@RequestParam String u_password, @RequestParam String u_name, @RequestParam String u_phone, @RequestParam String address,@RequestParam String u_date) throws Exception{
		userDAO.createUser(u_id, u_password, u_name, u_phone, address, u_date);
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
	

	
}
