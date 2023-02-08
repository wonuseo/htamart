package controller;

import java.text.ParseException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import model.UserDAO;

@RestController
@RequestMapping("userinfo")
public class UserController {

	@Autowired
	public UserDAO userDAO;
	
	@PostMapping(value="/selectUser", produces = "application/json;charset=utf-8")	
	protected String selectUser(@RequestBody Map<String, Object> vo) {
		try {
			userDAO.selectUser(vo);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return "회원 조회 성공";
	}
	
	@PostMapping(value="/getAlluser", produces = "application/json;charset=utf-8")	
	protected String getAlluser() {
		
//		userDAO.selectUser();
		
		return "회원 조회 성공";

	}
	
	
	
	
	
	
//	@PostMapping(value="/createUser", produces = "application/json;charset=utf-8")	
//	protected String createUser() {
//	
//	userDAO.createUser();
//	
//	return "회원 가입 성공";
//	
//	}
	
}
