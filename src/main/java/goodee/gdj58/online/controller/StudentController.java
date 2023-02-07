package goodee.gdj58.online.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.online.service.Idservice;
import goodee.gdj58.online.service.StudentService;
import goodee.gdj58.online.vo.Example;
import goodee.gdj58.online.vo.Paper;
import goodee.gdj58.online.vo.Student;
import goodee.gdj58.online.vo.Test;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class StudentController {
	@Autowired StudentService studentService;
	@Autowired private Idservice idservice;
	
	// 2) 학생기능
	// 답안지 제출
	@PostMapping("/student/addPaper")
	public String addPaper(@RequestParam(value = "studentNo") int studentNo
							, @RequestParam(value = "questionNo") int[] questionNo
							, @RequestParam(value = "answer") int[] answer) {
		Paper[] paper = new Paper[questionNo.length];
		for(int i=0; i<questionNo.length; i++) {
			paper[i] = new Paper();
			paper[i].setStudentNo(studentNo);
			paper[i].setQuestionNo(questionNo[i]);
			paper[i].setAnswer(answer[i]);
			int row = studentService.addPaper(paper[i]);
			if(row == 1) {
				log.debug("\u001B[31m" + "답안지 등록 성공");
			}
		}
		return "redirect:/student/testListByStudent"; 
	}
	
	
	// 시험 상세보기
	@GetMapping("/student/testOneByStudent")
	public String getTestOne(Model model
							, @RequestParam(value = "testNo") int testNo) {
		List<Map<String, Object>> list = studentService.getTestOne(testNo);
		Test test = studentService.getTestTitle(testNo); // 테스트 정보
		model.addAttribute("test",test);
		model.addAttribute("list",list);
		log.debug("\u001B[31m" + list.size()/4 + "	<= 문제 개수");
		int questionCount = list.size()/4;
		model.addAttribute("questionCount", questionCount);
		return "student/testOneByStudent";
	}
	
	// 시험 목록
	@GetMapping("/student/testListByStudent")
	public String testList(Model model
			, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage
			, @RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage) {
		log.debug("\u001B[31m" + currentPage + "  <=  currentPage");
		log.debug("\u001B[31m" + rowPerPage + "  <=  rowPerPage");
		List<Test> list = studentService.getTestList(currentPage, rowPerPage);
		int count = studentService.getTestCount();
		int page = 10; // 페이징 목록 개수
		int beginPage = ((currentPage - 1)/page) * page + 1; // 시작 페이지
		int endPage = beginPage + page - 1; // 페이징 목록 끝
		int lastPage = (int)Math.ceil((double)count / (double)rowPerPage); // 마지막 페이지
		if(endPage > lastPage) {
			endPage = lastPage;
		}
		model.addAttribute("list",list);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("rowPerPage", rowPerPage);
		model.addAttribute("beginPage", beginPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("lastPage", lastPage);
		log.debug("\u001B[31m" + beginPage + "  <=  beginPage");
		log.debug("\u001B[31m" + endPage + "  <=  endPage");
		log.debug("\u001B[31m" + lastPage + "  <=  lastPage");
		return "student/testListByStudent";
	}
	
	// 학생 비밀번호 수정
	@GetMapping("/student/modifyStudentPw")
	public String modifyTeacherPw() {
		return "student/modifyStudentPw";
	}
	
	@PostMapping("/student/modifyStudentPw")
	public String modifyStudentPw(HttpSession session, @RequestParam(value = "oldPw") String oldPw, @RequestParam(value = "newPw") String newPw) {
		Student loginStudent = (Student)session.getAttribute("loginStudent");
		int row = studentService.modifyStudentPw(oldPw, newPw, loginStudent.getStudentNo());
		if(row == 1) {
			log.debug("\u001B[31m"+"학생 비밀번호 수정성공");
		}
		return "redirect:/student/studentMain";
	}
	
	// 학생 로그인
	@GetMapping("/loginStudent")
	public String loginStudent() {
		return "student/loginStudent";
	}
	@PostMapping("/loginStudent")
	public String loginStudent(HttpSession session, Student student) {
		Student resultStudent =  studentService.login(student);
		log.debug("\u001B[31m"+"학생 로그인 성공");
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
	public String teacherMain() {
		return "student/studentMain";
	}
	
	// 1) 관리자 기능
	// 학생 삭제
	@GetMapping("/employee/removeStudent")
	public String removeStudent(@RequestParam(value = "studentNo") int  studentNo) {
		int row = studentService.removeStudent(studentNo);
		if(row == 1) {
			log.debug("\u001B[31m"+"학생 삭제성공");
		}
		return "redirect:/employee/studentList"; // 리스트로 이동
	}
	
	// 학생 추가
	@GetMapping("/employee/addStudent")
	public String addStudent() {
		return"employee/addStudent";
	}
	
	@PostMapping("/employee/addStudent")
	public String addStudent(Student student, Model model) {
		// id 중복확인
		String idCheck = idservice.getIdCheck(student.getStudentId());
		if(idCheck != null) { // null이면 아이디 사용가능
			log.debug("\u001B[31m"+"아이디 중복");
			model.addAttribute("errorMsg", "아이디 중복");
			return "redirect:/employee/addTeacher";
		}
		
		int row = studentService.addStudent(student);
		if(row == 0) {
			model.addAttribute("errorMsg", "학생등록 실패");
		}
		log.debug("\u001B[31m"+"학생 등록성공");
		return "redirect:/employee/studentList"; 
	}
	
	// 학생 목록
	@GetMapping("/employee/studentList")
	public String studentList(Model model
								, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage
								, @RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage
								, @RequestParam(value = "word", defaultValue = "") String word) {
		log.debug("\u001B[31m" +  word + "  <=  word");
		log.debug("\u001B[31m" + currentPage + "  <=  currentPage");
		log.debug("\u001B[31m" + rowPerPage + "  <=  rowPerPage");
		List<Student> list = studentService.getStudentList(currentPage, rowPerPage, word);
		int count = studentService.getStudentCount(word);
		int page = 10; // 페이징 목록 개수
		int beginPage = ((currentPage - 1)/page) * page + 1; // 시작 페이지
		int endPage = beginPage + page - 1; // 페이징 목록 끝
		int lastPage = (int)Math.ceil((double)count / (double)rowPerPage); // 마지막 페이지
		if(endPage > lastPage) {
			endPage = lastPage;
		}
		model.addAttribute("list",list);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("rowPerPage", rowPerPage);
		model.addAttribute("word", word);
		model.addAttribute("beginPage", beginPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("lastPage", lastPage);
		log.debug("\u001B[31m" + beginPage + "  <=  beginPage");
		log.debug("\u001B[31m" + endPage + "  <=  endPage");
		log.debug("\u001B[31m" + lastPage + "  <=  lastPage");
		return "employee/studentList";
	}
	
	
}
