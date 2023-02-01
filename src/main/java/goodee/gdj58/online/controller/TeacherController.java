package goodee.gdj58.online.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.online.service.TeacherService;
import goodee.gdj58.online.vo.Employee;
import goodee.gdj58.online.vo.Student;
import goodee.gdj58.online.vo.Teacher;


@Controller
public class TeacherController {
	@Autowired private TeacherService teacherService;
	
	// 강사 비밀번호 수정
	@GetMapping("/teacher/modifyTeacherPw")
	public String modifyTeacherPw(HttpSession session) {
		Teacher loginTeacher = (Teacher)session.getAttribute("loginTeacher");
		if(loginTeacher == null) {
			return "redirect:/teacher/loginTeacher";
		}
		return "teacher/modifyTeacherPw";
	}
	
	@PostMapping("/teacher/modifyTeacherPw")
	public String modifyTeacherPw(HttpSession session, @RequestParam(value = "oldPw") String oldPw, @RequestParam(value = "newPw") String newPw) {
		Teacher loginTeacher = (Teacher)session.getAttribute("loginTeacher");
		if(loginTeacher == null) {
			return "redirect:/teacher/loginTeacher";
		}
		int row = teacherService.modifyTeacherPw(oldPw, newPw, loginTeacher.getTeacherNo());
		if(row == 1) {
			System.out.println("강사 비밀번호 수정성공");
		}
		return "redirect:/teacher/teacherMain";
	}
	
	// 강사 로그인
	@GetMapping("/teacher/loginTeacher")
	public String loginTeacher(HttpSession session) {
		Teacher loginTeacher = (Teacher)session.getAttribute("loginTeacher");
		if(loginTeacher != null) {
			System.out.println("강사 로그인중");
			return "redirect:/teacher/teacherMain";
		}
		return "teacher/loginTeacher";
	}
	@PostMapping("/teacher/loginTeacher")
	public String loginTeacher(HttpSession session, Teacher teacher) {
		Teacher resultTeacher =  teacherService.login(teacher);
		if(resultTeacher == null) {
			System.out.println("강사 로그인 실패");
			return "redirect:/teacher/loginTeacher";
		}
		System.out.println("강사 로그인 성공");
		session.setAttribute("loginTeacher", resultTeacher);
		return "redirect:/teacher/teacherMain";
	}
	
	// 강사 로그아웃
	@GetMapping("/teacher/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/teacher/loginTeacher";
	}
	
	// 강사 메인
	@GetMapping("/teacher/teacherMain")
	public String teacherMain(HttpSession session) {
		Teacher loginTeacher = (Teacher)session.getAttribute("loginTeacher");
		if(loginTeacher == null) {
			return "redirect:/teacher/loginTeacher";
		}
		return "teacher/teacherMain";
	}
	
}
