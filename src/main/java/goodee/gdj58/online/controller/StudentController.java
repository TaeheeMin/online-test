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
	// 2) 학생기능
	// 답안지 제출
	@PostMapping("/student/addPaper")
	public String addPaper(@RequestParam(value = "studentNo") int studentNo
							, @RequestParam(value = "testNo") int testNo
							, @RequestParam(value = "questionNo") int[] questionNo
							, @RequestParam(value = "answer") int[] answer) {
		studentService.addPaper(studentNo, testNo, questionNo, answer);
		return "redirect:/student/testOneByStudent?testNo="+testNo; 
	}
	
	
	// 시험 상세보기
	@GetMapping("/student/testOneByStudent")
	public String getTestOne(Model model, HttpSession session
							, @RequestParam(value = "testNo") int testNo) {
		Student loginStudent = (Student)session.getAttribute("loginStudent");
		List<Map<String, Object>> list = studentService.getTestOne(testNo);
		Test test = studentService.getTestTitle(testNo); // 테스트 정보
		model.addAttribute("test", test);
		model.addAttribute("list", list);
		log.debug("\u001B[31m" + list.size()/4 + "	<= 문제 개수");
		int questionCount = list.size()/4;
		model.addAttribute("questionCount", questionCount);
		
		List<Map<String, Object>> answer = studentService.getTestAnswer(testNo, loginStudent.getStudentNo());
		int score = studentService.getScore(testNo, loginStudent.getStudentNo());
		log.debug("\u001B[31m" + score + "	<=score");
		model.addAttribute("answer", answer);
		model.addAttribute("score", score);
		return "student/testOneByStudent";
	}
	
	// 시험 목록
	@GetMapping("/student/testListByStudent")
	public String testList(Model model, HttpSession session
			, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage
			, @RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage) {
		log.debug("\u001B[31m" + currentPage + "  <=  currentPage");
		log.debug("\u001B[31m" + rowPerPage + "  <=  rowPerPage");
		Student loginStudent = (Student)session.getAttribute("loginStudent");
		List<Map<String, Object>> list = studentService.getTestList(currentPage, rowPerPage, loginStudent.getStudentNo());
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
	public String modifyStudentPw(HttpSession session, @RequestParam(value = "oldPw") String oldPw, @RequestParam(value = "newPw") String newPw, Model model) {
		Student loginStudent = (Student)session.getAttribute("loginStudent");
		int row = studentService.modifyStudentPw(oldPw, newPw, loginStudent.getStudentNo());
		if(row == 1) {
			log.debug("\u001B[31m"+"학생 비밀번호 수정성공");
			return "redirect:/student/testListByStudent";
		} else {
			model.addAttribute("msg", "다시 시도해주세요.");
			model.addAttribute("url", "/student/modifyStudentPw");
			return "alert";
		}
		
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
		return "redirect:/student/testListByStudent";
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
	@PostMapping("/employee/addStudent")
	public String addStudent(Student student, Model model) {

		int row = studentService.addStudent(student);
		log.debug("\u001B[31m"+"학생 등록"+"row : "+row);
		
		if(row == 0) {
			model.addAttribute("errorMsg", "학생등록 실패");
		}
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
