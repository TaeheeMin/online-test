package goodee.gdj58.online.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.StudentMapper;
import goodee.gdj58.online.vo.Student;
import goodee.gdj58.online.vo.Teacher;

@Service
@Transactional
public class StudentService {
	@Autowired private StudentMapper studentMapper;
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
	// 학생삭제
	public int removeStudent(int studentNo) {
		return studentMapper.deleteStudent(studentNo);
	}
	
	// 학생추가
	public int addStudent(Student student) {
		return studentMapper.insertStudent(student);
	}
	
	// 학생목록
	public List<Student> getStudentList(int currentPage, int rowPerPage) {
		int beginRow = (currentPage - 1) * rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		return studentMapper.selectStudentList(paramMap);
	}
}
