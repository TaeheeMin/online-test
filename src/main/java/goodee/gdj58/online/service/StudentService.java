package goodee.gdj58.online.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.StudentMapper;
import goodee.gdj58.online.vo.Paper;
import goodee.gdj58.online.vo.Student;
import goodee.gdj58.online.vo.Test;

@Service
@Transactional
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
	public int addPaper(Paper paper) {
		return studentMapper.insertPaper(paper);
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
	public List<Test> getTestList(int currentPage, int rowPerPage) {
		int beginRow = (currentPage - 1) * rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		return studentMapper.selectTestList(paramMap);
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
