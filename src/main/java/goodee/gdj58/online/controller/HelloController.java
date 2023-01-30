package goodee.gdj58.online.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HelloController {
	@GetMapping("hello")
	public String hello() {
		return "hello";
		// /WEB-INF/view/hello.jsp 포워딩함
	}
	
}
