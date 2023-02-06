package goodee.gdj58.online.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Teacher;
import goodee.gdj58.online.vo.Test;

@Mapper
public interface TeacherMapper {
	int insertQuestion(Map<String, Object> paramMap);
	List<Map<String, Object>> selectTestOne(int testNo);
	int deleteTest(int testNo);
	int insertTest(Test test);
	List<Test> selectTestList(Map<String, Object> paramMap);
	int testListCount();
	int updateTeacherPw(Map<String, Object> paramMap);
	Teacher login(Teacher teacher);
	int deleteTeacher(int teacherNo);
	int inserTeacher(Teacher teacher);
	List<Teacher> selectTeacherList(Map<String, Object> paramMap);
	int teacherListCount(String word);
}
