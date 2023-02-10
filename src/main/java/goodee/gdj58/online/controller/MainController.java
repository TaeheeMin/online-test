package goodee.gdj58.online.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import goodee.gdj58.online.service.EmployeeService;
import goodee.gdj58.online.vo.Test;

@Controller
public class MainController {
	@Autowired EmployeeService employeeService;
	// 메인
	@GetMapping("/main")
	public String main(Model model) {
		List<Test> list = employeeService.getMainTestList();
		model.addAttribute("list",list);
		return "/main";
	}
	
	// 로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main";
	}
}
