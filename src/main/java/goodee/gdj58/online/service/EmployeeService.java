package goodee.gdj58.online.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.EmployeeMapper;
import goodee.gdj58.online.vo.Employee;

@Service
// service도 객체가 생김(bean)
@Transactional
// 실행중 예외가 발생하면 메소드에서 트랜잭션, db에게 권한을 주는것이 아니라 스프링이 관리
public class EmployeeService {
	// 빈안에 employeeMapper에 들어갈 수 있는 객체가 있는지 확인한다
	@Autowired private EmployeeMapper employeeMapper;
	
	// 사원 비밀번호수정
	public int modifyEmployeePw(String oldPw, String newPw, int empNo) {
		//System.out.println("oldPw : " + oldPw);
		//System.out.println("newPw : " + newPw);
		//System.out.println("empNo : " + empNo);
		Map<String, Object> paramMap = new HashMap<String, Object>(); // 디형성
		paramMap.put("oldPw", oldPw);
		paramMap.put("newPw", newPw);
		paramMap.put("empNo", empNo);
		return employeeMapper.updateEmployeePw(paramMap);
	}
	
	// 사원로그인
	public Employee login(Employee emp) {
		return employeeMapper.login(emp);
	}
	
	// 사원삭제
	public int removeEmployee(int empNo) {
		return employeeMapper.deleteEmployee(empNo);
	}
	
	// 사원추가
	public int addEmployee(Employee employee) {
		return employeeMapper.insertEmployee(employee);
	}
	
	// 사원목록
	public List<Employee> getEmpList(int currentPage, int rowPerPage, String word) {
		int beginRow = (currentPage - 1) * rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("word", word);
		return employeeMapper.selectEmployeeList(paramMap);
	}
}
