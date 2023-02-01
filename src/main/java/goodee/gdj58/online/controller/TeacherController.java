package goodee.gdj58.online.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import goodee.gdj58.online.service.TeacherService;
import goodee.gdj58.online.vo.Teacher;


@Controller
public class TeacherController {
	@Autowired private TeacherService teacherService;
	
	// 강사 로그인
	@GetMapping("/teacher/loginTeacher")
	public String loginTeacher(HttpSession session) {
		Teacher loginTeacher = (Teacher)session.getAttribute("loginTeacher");
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
		return "redirect:/teacher/loginTeacher";
	}
	
}
