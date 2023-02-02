package goodee.gdj58.online.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.online.service.Idservice;
import goodee.gdj58.online.service.StudentService;
import goodee.gdj58.online.vo.Employee;
import goodee.gdj58.online.vo.Student;

@Controller
public class StudentController {
	@Autowired StudentService studentService;
	@Autowired private Idservice idservice;
	
	// 2) 학생기능
	// 학생 비밀번호 수정
	@GetMapping("/student/modifyStudentPw")
	public String modifyTeacherPw(HttpSession session) {
		Student loginStudent = (Student)session.getAttribute("loginStudent");
		if(loginStudent == null) {
			return "redirect:/student/loginStudent";
		}
		return "student/modifyStudentPw";
	}
	
	@PostMapping("/student/modifyStudentPw")
	public String modifyStudentPw(HttpSession session, @RequestParam(value = "oldPw") String oldPw, @RequestParam(value = "newPw") String newPw) {
		Student loginStudent = (Student)session.getAttribute("loginStudent");
		if(loginStudent == null) {
			return "redirect:/student/loginStudent";
		}
		int row = studentService.modifyStudentPw(oldPw, newPw, loginStudent.getStudentNo());
		if(row == 1) {
			System.out.println("학생 비밀번호 수정성공");
		}
		return "redirect:/student/studentMain";
	}
	
	// 학생 로그인
	@GetMapping("/student/loginStudent")
	public String loginStudent(HttpSession session) {
		Student loginStudent = (Student)session.getAttribute("loginStudent");
		if(loginStudent != null) {
			System.out.println("학생 로그인중");
			return "redirect:/student/studentMain";
		}
		return "student/loginStudent";
	}
	@PostMapping("/student/loginStudent")
	public String loginStudent(HttpSession session, Student student) {
		Student resultStudent =  studentService.login(student);
		if(resultStudent == null) {
			System.out.println("학생 로그인 실패");
			return "redirect:/student/loginStudent";
		}
		System.out.println("학생 로그인 성공");
		session.setAttribute("loginStudent", resultStudent);
		return "redirect:/student/studentMain";
	}
	
	// 학생 로그아웃
	@GetMapping("/student/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/student/loginStudent";
	}
	
	// 학생 메인
	@GetMapping("/student/studentMain")
	public String teacherMain(HttpSession session) {
		Student loginStudent = (Student)session.getAttribute("loginStudent");
		if(loginStudent == null) {
			return "redirect:/student/loginStudent";
		}
		return "student/studentMain";
	}
	
	// 1) 관리자 기능
	// 학생 삭제
	@GetMapping("/employee/removeStudent")
	public String removeStudent(@RequestParam(value = "studentNo") int  studentNo, HttpSession session) {
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			return "redirect:/employee/loginEmp";
		}
		int row = studentService.removeStudent(studentNo);
		if(row == 1) {
			System.out.println("학생 삭제성공");
		}
		return "redirect:/employee/studentList"; // 리스트로 이동
	}
	
	// 학생 추가
	@GetMapping("/employee/addStudent")
	public String addStudent(HttpSession session) {
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			return "redirect:/employee/loginEmp";
		}
		return"employee/addStudent";
	}
	
	@PostMapping("/employee/addStudent")
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
			return "redirect:/employee/addTeacher";
		}
		
		int row = studentService.addStudent(student);
		if(row == 0) {
			model.addAttribute("msg", "학생등록 실패");
		}
		System.out.println("학생 등록성공");
		return "redirect:/employee/studentList"; 
	}
	
	// 학생 목록
	@GetMapping("/employee/studentList")
	public String studentList(Model model, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage, @RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage, HttpSession session) {
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			return "redirect:/employee/loginEmp";
		}
		List<Student> list = studentService.getStudentList(currentPage, rowPerPage);
		model.addAttribute("list",list);
		model.addAttribute("currentPage",currentPage);
		return "employee/studentList";
	}
}
