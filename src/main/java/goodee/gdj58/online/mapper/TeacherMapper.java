package goodee.gdj58.online.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Example;
import goodee.gdj58.online.vo.Question;
import goodee.gdj58.online.vo.Teacher;
import goodee.gdj58.online.vo.Test;

@Mapper
public interface TeacherMapper {
	// 문제 등록
	int insertExample(Example example);
	int insertQuestion(Question question);

	// 시험 상세보기
	List<Question> selectQuestion(int testNo);
	List<Map<String, Object>> selectExample(int testNo);
	List<Map<String, Object>> selectTestAnswer(int testNo);
	
	
	List<Map<String, Object>> selectTestOne(int testNo);
	Map<String, Object> selectTestDetail(int testNo);
	Test selectTestTitle(int testNo);

	
	// 시험 삭제
	int deleteTest(int testNo);
	int deleteQuestion(int testNo);
	int deleteExample(int testNo);
	
	// 시험 등록
	int insertTest(Test test);
	
	// 시험 목록
	List<Map<String, Object>> selectTestList(Map<String, Object> paramMap);
	int testListCount();
	
	// 비밀번호 변경
	int updateTeacherPw(Map<String, Object> paramMap);
	
	// 로그인
	Teacher login(Teacher teacher);
	
	// 등록, 삭제
	int deleteTeacher(int teacherNo);
	int inserTeacher(Teacher teacher);
	
	// 선생님 목록 
	List<Teacher> selectTeacherList(Map<String, Object> paramMap);
	int teacherListCount(String word);
}
