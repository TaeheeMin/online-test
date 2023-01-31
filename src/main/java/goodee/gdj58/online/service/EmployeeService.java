package goodee.gdj58.online.service;

import java.util.List;

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
	@Autowired
	// 빈안에 employeeMapper에 들어갈 수 있는 객체가 있는지 확인한다
	private EmployeeMapper employeeMapper;
	
	public List<Employee> getEmpList() {
		return employeeMapper.selectEmployeeList();
	}
}
