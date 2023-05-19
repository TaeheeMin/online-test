package goodee.gdj58.online.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.StudentMapper;
import goodee.gdj58.online.vo.Paper;
import goodee.gdj58.online.vo.Score;
import goodee.gdj58.online.vo.Student;
import goodee.gdj58.online.vo.Test;
import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class StudentService {
	@Autowired private StudentMapper studentMapper;
	
	// 2) 학생 기능
	// 점수확인
	public int getScore(int testNo, int studentNo) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("testNo", testNo);
		paramMap.put("studentNo", studentNo);
		return studentMapper.score(paramMap);
	}
	
	// 답안지 확인
	public List<Map<String, Object>> getTestAnswer(int testNo, int studentNo) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("testNo", testNo);
		paramMap.put("studentNo", studentNo);
		return studentMapper.selectTestAnswer(paramMap);
	} 
	
	// 답안지 제출
	public int addPaper(int studentNo, int testNo, int[] questionNo, int[] answer) {
		int row = 0;
		int scoreCount = 0;
		
		// paper 등록
		Paper[] paper = new Paper[questionNo.length];
		for(int i=0; i<questionNo.length; i++) {
			paper[i] = new Paper();
			paper[i].setStudentNo(studentNo);
			paper[i].setQuestionNo(questionNo[i]);
			paper[i].setAnswer(answer[i]);
			int getAnswer = studentMapper.selectAnswer(questionNo[i]);
			log.debug("\u001B[31m" + getAnswer +"	<=" + questionNo[i] + "번답안");
			log.debug("\u001B[31m" + answer[i] +"	<=" + questionNo[i] + "번답제출");
			if(getAnswer == answer[i]) {
				paper[i].setAnswerCheck("정답");
				scoreCount++;
			} else {
				paper[i].setAnswerCheck("오답"); 
			}
			row = studentMapper.insertPaper(paper[i]);
			log.debug("\u001B[31m" + "답안지 등록 성공");
		}
		
		// score 등록
		Score score = new Score();
		score.setStudentNo(studentNo);
		score.setTestNo(testNo);
		score.setQuestion(questionNo.length);
		score.setScore(scoreCount);
		log.debug("\u001B[31m" + score + "<=score");
		studentMapper.insertScore(score);
		
		return row;
	}
	public int getAnswer(int questionNo) {
		return studentMapper.selectAnswer(questionNo);
	}
	
	
	// 시험 상세보기
	public Test getTestTitle(int testNo) {
		return studentMapper.selectTestTitle(testNo);
	}
	public List<Map<String, Object>> getTestOne(int testNo) {
		return studentMapper.selectTestOne(testNo);
	}
	
	// 학생 시험 목록
	public List<Map<String, Object>> getTestList(int currentPage, int rowPerPage, int studentNo) {
		int beginRow = (currentPage - 1) * rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("studentNo", studentNo);
		return studentMapper.selectTestList(paramMap);
	}
	
	public List<Map<String, Object>> getTestTotalList(int studentNo) {
		return studentMapper.selectTestTotalList(studentNo);
	}
	// 시험 개수
	public int getTestCount() {
		return studentMapper.testListCount();
	}
	
	// 학생 비밀번호수정
	public int modifyStudentPw(String oldPw, String newPw, int studentNo) {
		//System.out.println("oldPw : " + oldPw);
		//System.out.println("newPw : " + newPw);
		//System.out.println("studentNo : " + studentNo);
		Map<String, Object> paramMap = new HashMap<String, Object>(); // 디형성
		paramMap.put("oldPw", oldPw);
		paramMap.put("newPw", newPw);
		paramMap.put("studentNo", studentNo);
		return studentMapper.updateStudentPw(paramMap);
	}
	
	// 학생 로그인
	public Student login(Student student) {
		return studentMapper.login(student);
	}
	
	// 1) 관리자 기능
	// 학생삭제
	public int removeStudent(int studentNo) {
		return studentMapper.deleteStudent(studentNo);
	}
	
	// 학생추가
	public int addStudent(Student student) {
		return studentMapper.insertStudent(student);
	}
	
	// 학생목록
	public List<Student> getStudentList(int currentPage, int rowPerPage, String word) {
		int beginRow = (currentPage - 1) * rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("word", word);
		return studentMapper.selectStudentList(paramMap);
	}
	// 학생 목록 개수
	public int getStudentCount(String word) {
		return studentMapper.studentListCount(word);
	}
}
