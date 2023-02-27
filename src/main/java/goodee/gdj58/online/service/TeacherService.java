package goodee.gdj58.online.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.TeacherMapper;
import goodee.gdj58.online.vo.Example;
import goodee.gdj58.online.vo.Question;
import goodee.gdj58.online.vo.Teacher;
import goodee.gdj58.online.vo.Test;

@Service
@Transactional
public class TeacherService {
	@Autowired private TeacherMapper teacherMapper;
	
	// 보기 등록
	public int addExample(Example example) {
		return teacherMapper.insertExample(example);
	}
	
	// 문제 등록
	public int addQuestion(Question question) {
		return teacherMapper.insertQuestion(question);
	}
	
	// 시험 상세보기
	public Test getTestTitle(int testNo) {
		return teacherMapper.selectTestTitle(testNo);
	}
	public List<Map<String, Object>> getTestOne(int testNo) {
		return teacherMapper.selectTestOne(testNo);
	}
	public List<Map<String, Object>> getTestAnswer(int testNo) {
		return teacherMapper.selectTestAnswer(testNo);
	}
	
	// 시험 삭제
	public int removeTest(int testNo) {
		return teacherMapper.deleteTest(testNo);
	}
	
	// 시험 등록
	public int addTest(Test test) {
		return teacherMapper.insertTest(test);
	}
	
	// 강사 시험 목록
	public List<Test> getTestList(int currentPage, int rowPerPage) {
		int beginRow = (currentPage - 1) * rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		return teacherMapper.selectTestList(paramMap);
	}
	
	// 시험 개수
	public int getTestCount() {
		return teacherMapper.testListCount();
	}
	
	// 강사 비밀번호수정
	public int modifyTeacherPw(String oldPw, String newPw, int teacherNo) {
		//System.out.println("oldPw : " + oldPw);
		//System.out.println("newPw : " + newPw);
		//System.out.println("teacherNo : " + teacherNo);
		Map<String, Object> paramMap = new HashMap<String, Object>(); // 디형성
		paramMap.put("oldPw", oldPw);
		paramMap.put("newPw", newPw);
		paramMap.put("teacherNo", teacherNo);
		return teacherMapper.updateTeacherPw(paramMap);
	}
	
	// 강사로그인
	public Teacher login(Teacher teacher) {
		return teacherMapper.login(teacher);
	}
	
	// 강사삭제
	public int removeTeacher(int teacherNo) {
		return teacherMapper.deleteTeacher(teacherNo);
	}
	
	// 강사추가
	public int addTeacher(Teacher teacher) {
		return teacherMapper.inserTeacher(teacher);
	}
	
	// 강사목록
	public List<Teacher> getTeacherList(int currentPage, int rowPerPage, String word) {
		int beginRow = (currentPage - 1) * rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("word", word);
		return teacherMapper.selectTeacherList(paramMap);
	}
	
	// 사원 목록 개수
	public int getTeacherCount(String word) {
		return teacherMapper.teacherListCount(word);
	}
}
