package goodee.gdj58.online.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Paper;
import goodee.gdj58.online.vo.Student;
import goodee.gdj58.online.vo.Test;

@Mapper
public interface StudentMapper {
	int insertPaper(Paper paper);
	List<Map<String, Object>> selectTestOne(int testNo);
	Test selectTestTitle(int testNo);
	List<Test> selectTestList(Map<String, Object> paramMap);
	int testListCount();
	int updateStudentPw(Map<String, Object> paramMap);
	Student login(Student student);
	int deleteStudent(int empNo);
	int insertStudent(Student student);
	List<Student> selectStudentList(Map<String, Object> paramMap);
	int studentListCount(String word);
}
