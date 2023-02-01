package goodee.gdj58.online.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.online.service.StudentService;
import goodee.gdj58.online.vo.Student;

@Controller
public class StudentController {
	@Autowired StudentService studentService;
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
}
