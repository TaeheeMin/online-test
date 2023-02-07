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
import goodee.gdj58.online.service.TeacherService;
import goodee.gdj58.online.vo.Example;
import goodee.gdj58.online.vo.Question;
import goodee.gdj58.online.vo.Teacher;
import goodee.gdj58.online.vo.Test;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TeacherController {
	@Autowired private Idservice idservice;
	@Autowired private TeacherService teacherService;
	// 3) 시험 관련 기능
	// 시험 등록
	@PostMapping("/teacher/addQuestion")
	public String addQuestion(Question question
								, @RequestParam(value = "exampleContent") String[] exampleContent
								, @RequestParam(value = "exampleIdx") int[] exampleIdx
								, @RequestParam(value = "examplAnswer") int examplAnswer) {
		int addQuestion = teacherService.addQuestion(question);
		log.debug("\u001B[31m" + question.getQuestionNo() + "	<=questionNo");
		
		if(addQuestion == 1) {
			log.debug("\u001B[31m" + "문제 등록성공");
		}
		// 보기 4개 고정
		Example[] example = new Example[4];
		for(int i=0; i<example.length; i++) {
			example[i] = new Example();
			example[i].setQuestionNo(question.getQuestionNo());
			example[i].setExampleContent(exampleContent[i]);
			example[i].setExampleIdx(exampleIdx[i]);
			example[i].setExampleAnswer("오답");
			if(examplAnswer == (i+1)) {
				example[i].setExampleAnswer("정답");
			} 
			int addExample = teacherService.addExample(example[i]);
			if(addExample == 1) {
				log.debug("\u001B[31m" + (i+1) + "보기 등록 성공");
			}
		}
		return "redirect:/teacher/testOne?testNo="+question.getTestNo(); 
	}
	
	// 시험 상세보기
	@GetMapping("/teacher/testOne")
	public String getTestOne(Model model
							, @RequestParam(value = "testNo") int testNo
							, @RequestParam(value = "question", defaultValue = "1") int question) {
		List<Map<String, Object>> list = teacherService.getTestOne(testNo);
		Test test = teacherService.getTestTitle(testNo); // 테스트 정보
		model.addAttribute("test",test);
		model.addAttribute("list",list);
		log.debug("\u001B[31m" + list.size()/4 + "	<= 문제 개수");
		int questionCount = list.size()/4;
		/*
		if(list.size()/4 == 1) {
			questionCount = 1;
		} else if(list.size()/4 > 1 && list.size()/4 < 6) {
			questionCount = 5;
		} else if(list.size()/4 > 5) {
			questionCount = 10;
		}*/
		model.addAttribute("questionCount", questionCount);
		model.addAttribute("question", question);
		return "teacher/testOne";
	}
	
	// 시험 삭제
	@GetMapping("/teacher/removeTest")
	public String removeTest(@RequestParam(value = "testNo") int testNo) {
		int row = teacherService.removeTest(testNo);
		if(row == 1) {
			log.debug("\u001B[31m"+"시험 삭제 성공");
		}
		log.debug("\u001B[31m" + testNo + "	<= testNo");
		return "redirect:/teacher/testList";
	}
	
	// 시험 등록
	@GetMapping("/teacher/addTest")
	public String addTest() {
		return "teacher/addTest";
	}
	@PostMapping("/teacher/addTest")
	public String addTest(@RequestParam(value = "testTitle") String testTitle
							, @RequestParam(value = "testDate") String testDate) {
		Test test = new Test();
		test.setTestTitle(testTitle);
		test.setTestDate(testDate);
		int row  = teacherService.addTest(test);
		if(row == 1) {
			log.debug("\u001B[31m"+"시험 등록완료");
		}
		return "redirect:/teacher/testList";
	}
	
	// 시험 목록
	@GetMapping("/teacher/testList")
	public String testList(Model model
			, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage
			, @RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage) {
		log.debug("\u001B[31m" + currentPage + "  <=  currentPage");
		log.debug("\u001B[31m" + rowPerPage + "  <=  rowPerPage");
		List<Test> list = teacherService.getTestList(currentPage, rowPerPage);
		int count = teacherService.getTestCount();
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
		return "teacher/testList";
	}

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
			log.debug("\u001B[31m" + "아이디 중복");
			model.addAttribute("msg", "아이디 중복");
			return "redirect:/employee/addTeacher";
		}
		
		int row = teacherService.addTeacher(teacher);
		if(row == 0) {
			model.addAttribute("msg", "강사등록 실패");
		}
		log.debug("\u001B[31m" + "강사 등록성공");
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
		int count = teacherService.getTeacherCount(word);
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
		return "employee/teacherList";
	}
}
