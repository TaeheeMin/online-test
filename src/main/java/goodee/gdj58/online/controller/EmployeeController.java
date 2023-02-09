package goodee.gdj58.online.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.online.service.EmployeeService;
import goodee.gdj58.online.service.Idservice;
import goodee.gdj58.online.vo.Employee;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class EmployeeController {
	@Autowired EmployeeService employeeService;
	@Autowired private Idservice idservice;
	
	// 사원 비밀번호 수정
	@GetMapping("/employee/modifyEmpPw")
	public String modifyEmpPw() {
		return "employee/modifyEmpPw";
	}
	
	@PostMapping("/employee/modifyEmpPw")
	public String modifyEmpPw(HttpSession session, @RequestParam(value = "oldPw", required = true) String oldPw, @RequestParam(value = "newPw", required = true) String newPw) {
		// required = true -> null 못들어오게함 defalut값이라 생략가능
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		int row = employeeService.modifyEmployeePw(oldPw, newPw, loginEmp.getEmpNo());
		if(row == 1) {
			log.debug("\u001B[31m"+"사원 비밀번호 수정성공");
		}
		return "redirect:/employee/empList";
	}
	
	// 사원 로그인
	@GetMapping("/loginEmp")
	public String loginEmp() {
		log.debug("\u001B[31m"+"loginEmp 폼");
		return "employee/loginEmp";
	}
	
	@PostMapping("/loginEmp")
	public String loginEmp(Employee emp, HttpSession session) {
		log.debug("\u001B[31m"+"사원 로그인 성공");
		Employee resultEmp =  employeeService.login(emp);
		session.setAttribute("loginEmp", resultEmp);
		return "redirect:/employee/empList";
	}
	
	// 사원 로그아웃
	@GetMapping("/employee/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/employee/loginEmp";
	}
	
	// 사원 삭제
	@GetMapping("/employee/removeEmp")
	public String removeEmp(@RequestParam(value = "empNo") int empNo) {
		int row = employeeService.removeEmployee(empNo);
		if(row == 1) {
			log.debug("\u001B[31m"+"사원 삭제성공");
		}
		return "redirect:/employee/empList"; // 리스트로 이동
	}
	
	// 사원 추가
	@GetMapping("/employee/addEmp")
	public String addEmp(HttpSession session) {
		return"employee/addEmp"; // forward
	}
	
	// addEmp 배개변수 받아옴 -> 오버로딩
	@PostMapping("/employee/addEmp")
	public String addEmp(Employee employee, Model model) {
		/*
		// id 중복확인
		String idCheck = idservice.getIdCheck(employee.getEmpId());
		if(idCheck != null) { // null이면 아이디 사용가능
			log.debug("\u001B[31m"+"아이디 중복");
			model.addAttribute("errorMsg", "아이디 중복");
			return "redirect:/employee/addEmp";
		}
		*/
		int row = employeeService.addEmployee(employee);
		if(row == 0) {
			model.addAttribute("errorMsg", "사원등록 실패");
		}
		log.debug("\u001B[31m" + "사원 등록성공");
		return "redirect:/employee/empList"; // CM -> C
		// sendRedirect와 동일 -> redirect:
	}
	
	// 사원 목록
	@GetMapping("/employee/empList")
	public String empList(Model model
							, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage
							, @RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage
							, @RequestParam(value = "word", defaultValue = "") String word) {
		// request.getParameter와 동일 int currentPage = request.getParameter("currentPage"); 형변환 따로 할 필요 없이 알아서 해줌
		// defaultValue = "1" null 이면 1을 넣어줌
		log.debug("\u001B[31m" +  word + "  <=  word");
		log.debug("\u001B[31m" + currentPage + "  <=  currentPage");
		log.debug("\u001B[31m" + rowPerPage + "  <=  rowPerPage");
		int count = employeeService.getEmpCount(word);
		List<Employee> list = employeeService.getEmpList(currentPage, rowPerPage, word);
		int page = 10; // 페이징 목록 개수
		int beginPage = ((currentPage - 1)/page) * page + 1; // 시작 페이지
		int endPage = beginPage + page - 1; // 페이징 목록 끝
		int lastPage = (int)Math.ceil((double)count / (double)rowPerPage); // 마지막 페이지
		if(endPage > lastPage) {
			endPage = lastPage;
		}
		model.addAttribute("list", list); // request.setAttribute랑 동일한
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("rowPerPage", rowPerPage);
		model.addAttribute("word", word);
		model.addAttribute("beginPage", beginPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("lastPage", lastPage);
		log.debug("\u001B[31m" + beginPage + "  <=  beginPage");
		log.debug("\u001B[31m" + endPage + "  <=  endPage");
		log.debug("\u001B[31m" + lastPage + "  <=  lastPage");
		return "employee/empList";
	}
}
