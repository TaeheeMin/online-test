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
import goodee.gdj58.online.service.TeacherService;
import goodee.gdj58.online.vo.Employee;
import goodee.gdj58.online.vo.Teacher;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TeacherController {
	@Autowired private Idservice idservice;
	@Autowired private TeacherService teacherService;
	
	// 2) 강사 기능
	// 강사 비밀번호 수정
	@GetMapping("/teacher/modifyTeacherPw")
	public String modifyTeacherPw() {
		return "teacher/modifyTeacherPw";
	}
	
	@PostMapping("/teacher/modifyTeacherPw")
	public String modifyTeacherPw(HttpSession session, @RequestParam(value = "oldPw") String oldPw, @RequestParam(value = "newPw") String newPw) {
		Teacher loginTeacher = (Teacher)session.getAttribute("loginTeacher");
		int row = teacherService.modifyTeacherPw(oldPw, newPw, loginTeacher.getTeacherNo());
		if(row == 1) {
			log.debug("\u001B[31m"+"강사 비밀번호 수정 성공");
		}
		return "redirect:/teacher/teacherMain";
	}
	
	// 강사 로그인
	@GetMapping("/loginTeacher")
	public String loginTeacher() {
		log.debug("\u001B[31m"+"loginTeacher 폼");
		return "teacher/loginTeacher";
	}
	@PostMapping("/loginTeacher")
	public String loginTeacher(HttpSession session, Teacher teacher) {
		Teacher resultTeacher =  teacherService.login(teacher);
		log.debug("\u001B[31m"+"강사 로그인 성공");
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
	public String teacherMain() {
		return "teacher/teacherMain";
	}
	
	// 1) 관리자 기능
	// 강사 삭제
	@GetMapping("/employee/removeTeacher")
	public String removeTeacher(@RequestParam(value = "teacherNo") int  teacherNo) {
		int row = teacherService.removeTeacher(teacherNo);
		if(row == 1) {
			log.debug("\u001B[31m"+"강사 삭제 성공");
		}
		return "redirect:/employee/teacherList"; // 리스트로 이동
	}
	
	// 강사 추가
	@GetMapping("/employee/addTeacher")
	public String addTeacher(HttpSession session) {
		return"employee/addTeacher";
	}
	
	@PostMapping("/employee/addTeacher")
	public String addTeacher(Teacher teacher, HttpSession session, Model model) {
		// id 중복확인
		String idCheck = idservice.getIdCheck(teacher.getTeacherId());
		if(idCheck != null) { // null이면 아이디 사용가능
			System.out.println("아이디 중복");
			model.addAttribute("msg", "아이디 중복");
			return "redirect:/employee/addTeacher";
		}
		
		int row = teacherService.addTeacher(teacher);
		if(row == 0) {
			model.addAttribute("msg", "강사등록 실패");
		}
		System.out.println("강사 등록성공");
		return "redirect:/employee/teacherList"; 
	}

	// 강사 목록
	@GetMapping("/employee/teacherList")
	public String teacherList(Model model
							, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage
							, @RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage
							, @RequestParam(value = "word", defaultValue = "") String word) {
		log.debug("\u001B[31m" +  word + "  <=  word");
		log.debug("\u001B[31m" + currentPage + "  <=  currentPage");
		log.debug("\u001B[31m" + rowPerPage + "  <=  rowPerPage");
		List<Teacher> list = teacherService.getTeacherList(currentPage, rowPerPage, word);
		model.addAttribute("list",list);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("word",word);
		return "employee/teacherList";
	}
}
