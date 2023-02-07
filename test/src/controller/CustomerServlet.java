package controller;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import model.CategoryDao;

//@Controller
@RestController
@RequestMapping("CustomerServlet")
public class CustomerServlet {
	
	@Autowired
	public CategoryDao catDao;
	
	@GetMapping(value="axios", produces = "application/json; charset=UTF-8")
	public String m2() {
		String name = catDao.noJPQL();
		return name;
	}
	
	@GetMapping(value="category", produces = "application/json; charset=UTF-8")
	public ModelAndView getCustomers() throws SQLException {
		ModelAndView mv = new ModelAndView();
		mv.addObject("category", catDao.findElement());
		mv.setViewName("list");
		return mv;
	}

}
