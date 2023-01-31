package goodee.gdj58.online.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import goodee.gdj58.online.service.EmployeeService;
import goodee.gdj58.online.vo.Employee;

@Controller
public class EmployeeController {
	@Autowired EmployeeService employeeService;
	
	@GetMapping("/employee/empList")
	public String empList(Model model) {
		List<Employee> list = employeeService.getEmpList();
		model.addAttribute("list",list); // request.setAttribute랑 동일한
		return "employee/empList";
	}
}
