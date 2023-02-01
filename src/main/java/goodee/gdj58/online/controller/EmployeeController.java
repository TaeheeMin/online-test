package goodee.gdj58.online.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.online.mapper.IdMapper;
import goodee.gdj58.online.service.EmployeeService;
import goodee.gdj58.online.service.Idservice;
import goodee.gdj58.online.service.StudentService;
import goodee.gdj58.online.service.TeacherService;
import goodee.gdj58.online.vo.Employee;
import goodee.gdj58.online.vo.Student;
import goodee.gdj58.online.vo.Teacher;

@Controller
public class EmployeeController {
	@Autowired EmployeeService employeeService;
	@Autowired private Idservice idservice;
	@Autowired private TeacherService teacherService;
	@Autowired private StudentService studentService;
	
	// 비밀번호 수정
	@GetMapping("/employee/modifyEmpPw")
	public String modifyEmpPw(HttpSession session) {
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			return "redirect:/employee/loginEmp";
		}
		return "employee/modifyEmpPw";
	}
	
	@PostMapping("/employee/modifyEmpPw")
	public String modifyEmpPw(HttpSession session, @RequestParam(value = "oldPw", required = true) String oldPw, @RequestParam(value = "newPw", required = true) String newPw) {
		// required = true -> null 못들어오게함 defalut값이라 생략가능
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			return "redirect:/employee/loginEmp";
		}
		int row = employeeService.modifyEmployeePw(oldPw, newPw, loginEmp.getEmpNo());
		if(row == 1) {
			System.out.println("사원 비밀번호 수정성공");
		}
		return "redirect:/employee/empList";
	}
	
	// 로그인
	@GetMapping("/employee/loginEmp")
	public String loginEmp(HttpSession session) {
		// 로그인 필요 -> employee/loginEmp
		// 이미 로그인 중이면 리스트 -> redirect:/employee/empList
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp != null) {
			return "redirect:/employee/empList";
		}
		return "employee/loginEmp";
	}
	
	@PostMapping("/employee/loginEmp")
	public String loginEmp(HttpSession session, Employee emp) {
		Employee resultEmp =  employeeService.login(emp);
		if(resultEmp == null) {
			System.out.println("사원 로그인 실패");
			return "redirect:/employee/loginEmp";
		}
		System.out.println("사원 로그인 성공");
		session.setAttribute("loginEmp", resultEmp);
		return "redirect:/employee/empList";
	}
	
	// 로그아웃
	@GetMapping("/employee/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/employee/loginEmp";
	}
	
	// 삭제
	@GetMapping("/employee/removeEmp")
	public String removeEmp(@RequestParam(value = "empNo") int  empNo, HttpSession session) {
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			return "redirect:/employee/loginEmp";
		}
		int row = employeeService.removeEmployee(empNo);
		if(row == 1) {
			System.out.println("사원 삭제성공");
		}
		return "redirect:/employee/empList"; // 리스트로 이동
	}
	
	// 사원 추가
	@GetMapping("/employee/addEmp")
	public String addEmp(HttpSession session) {
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			return "redirect:/employee/loginEmp";
		}
		return"employee/addEmp"; // forword
	}
	
	// addEmp 배개변수 받아옴 -> 오버로딩
	@PostMapping("/employee/addEmp")
	public String addEmp(Employee employee, HttpSession session, Model model) {
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			return "redirect:/employee/loginEmp";
		}
		
		// id 중복확인
		String idCheck = idservice.getIdCheck(employee.getEmpId());
		if(idCheck != null) { // null이면 아이디 사용가능
			System.out.println("아이디 중복");
			model.addAttribute("msg", "아이디 중복");
			return "redirect:/employee/addEmp";
		}
		
		int row = employeeService.addEmployee(employee);
		if(row == 0) {
			model.addAttribute("msg", "사원등록 실패");
		}
		System.out.println("사원 등록성공");
		return "redirect:/employee/empList"; // CM -> C
		// sendRedirect와 동일 -> redirect:
	}
	
	// 사원 목록
	@GetMapping("/employee/empList")
	public String empList(Model model, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage, @RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage, HttpSession session) {
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			return "redirect:/employee/loginEmp";
		}
		// request.getParameter와 동일 int currentPage = request.getParameter("currentPage"); 형변환 따로 할 필요 없이 알아서 해줌
		// defaultValue = "1" null 이면 1을 넣어줌
		// System.out.println("currentPage : " + currentPage);
		List<Employee> list = employeeService.getEmpList(currentPage, rowPerPage);
		model.addAttribute("list",list); // request.setAttribute랑 동일한
		model.addAttribute("currentPage",currentPage);
		return "employee/empList";
	}
	
	// 강사 삭제
	@GetMapping("/teacher/removeTeacher")
	public String removeTeacher(@RequestParam(value = "teacherNo") int  teacherNo, HttpSession session) {
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			return "redirect:/employee/loginEmp";
		}
		int row = teacherService.removeTeacher(teacherNo);
		if(row == 1) {
			System.out.println("강사 삭제성공");
		}
		return "redirect:/teacher/teacherList"; // 리스트로 이동
	}
	
	// 강사 추가
	@GetMapping("/teacher/addTeacher")
	public String addTeacher(HttpSession session) {
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			return "redirect:/employee/loginEmp";
		}
		return"teacher/addTeacher";
	}
	
	@PostMapping("/teacher/addTeacher")
	public String addTeacher(Teacher teacher, HttpSession session, Model model) {
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			return "redirect:/employee/loginEmp";
		}
		
		// id 중복확인
		String idCheck = idservice.getIdCheck(teacher.getTeacherId());
		if(idCheck != null) { // null이면 아이디 사용가능
			System.out.println("아이디 중복");
			model.addAttribute("msg", "아이디 중복");
			return "redirect:/teacher/addTeacher";
		}
		
		int row = teacherService.addTeacher(teacher);
		if(row == 0) {
			model.addAttribute("msg", "강사등록 실패");
		}
		System.out.println("강사 등록성공");
		return "redirect:/teacher/teacherList"; 
	}

	// 강사 목록
	@GetMapping("/teacher/teacherList")
	public String teacherList(Model model, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage, @RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage, HttpSession session) {
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			return "redirect:/employee/loginEmp";
		}
		List<Teacher> list = teacherService.getTeacherList(currentPage, rowPerPage);
		model.addAttribute("list",list);
		model.addAttribute("currentPage",currentPage);
		return "teacher/teacherList";
	}
	
	// 학생 삭제
	@GetMapping("/student/removeStudent")
	public String removeStudent(@RequestParam(value = "studentNo") int  studentNo, HttpSession session) {
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			return "redirect:/employee/loginEmp";
		}
		int row = studentService.removeStudent(studentNo);
		if(row == 1) {
			System.out.println("학생 삭제성공");
		}
		return "redirect:/student/studentList"; // 리스트로 이동
	}
	
	// 학생 추가
	@GetMapping("/student/addStudent")
	public String addStudent(HttpSession session) {
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			return "redirect:/employee/loginEmp";
		}
		return"student/addStudent";
	}
	
	@PostMapping("/student/addStudent")
	public String addStudent(Student student, HttpSession session, Model model) {
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			return "redirect:/employee/loginEmp";
		}
		
		// id 중복확인
		String idCheck = idservice.getIdCheck(student.getStudentId());
		if(idCheck != null) { // null이면 아이디 사용가능
			System.out.println("아이디 중복");
			model.addAttribute("msg", "아이디 중복");
			return "redirect:/student/addTeacher";
		}
		
		int row = studentService.addStudent(student);
		if(row == 0) {
			model.addAttribute("msg", "학생등록 실패");
		}
		System.out.println("학생 등록성공");
		return "redirect:/student/studentList"; 
	}
	
	// 학생 목록
	@GetMapping("/student/studentList")
	public String studentList(Model model, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage, @RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage, HttpSession session) {
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			return "redirect:/employee/loginEmp";
		}
		List<Student> list = studentService.getStudentList(currentPage, rowPerPage);
		model.addAttribute("list",list);
		model.addAttribute("currentPage",currentPage);
		return "student/studentList";
	}
}
