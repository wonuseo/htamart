package controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("axios")
public class axiosController {
	
	@PostMapping(value="/cart")
	public void cart(@RequestParam("p_id") String p_id, @RequestParam("count") int count) {
		System.out.println("cart**********" + p_id + " " + count);
		
	}
}
