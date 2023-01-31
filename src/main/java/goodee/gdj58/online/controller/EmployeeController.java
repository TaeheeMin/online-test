package goodee.gdj58.online.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.online.service.EmployeeService;
import goodee.gdj58.online.vo.Employee;

@Controller
public class EmployeeController {
	@Autowired EmployeeService employeeService;
	
	@GetMapping("/employee/empList")
	public String empList(Model model, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage, @RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage) {
		// request.getParameter와 동일 int currentPage = request.getParameter("currentPage"); 형변환 따로 할 필요 없이 알아서 해줌
		// defaultValue = "1" null 이면 1을 넣어줌
		System.out.println("currentPage : " + currentPage);
		List<Employee> list = employeeService.getEmpList(currentPage, rowPerPage);
		model.addAttribute("list",list); // request.setAttribute랑 동일한
		model.addAttribute("currentPage",currentPage);
		return "employee/empList";
	}
}
