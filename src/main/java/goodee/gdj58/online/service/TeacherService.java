package goodee.gdj58.online.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.TeacherMapper;
import goodee.gdj58.online.vo.Employee;
import goodee.gdj58.online.vo.Teacher;

@Service
@Transactional
public class TeacherService {
	@Autowired private TeacherMapper teacherMapper;
	
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
	public List<Teacher> getTeacherList(int currentPage, int rowPerPage) {
		int beginRow = (currentPage - 1) * rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		return teacherMapper.selectTeacherList(paramMap);
	}
}
