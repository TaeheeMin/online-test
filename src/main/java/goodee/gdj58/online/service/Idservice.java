package goodee.gdj58.online.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.controller.EmployeeController;
import goodee.gdj58.online.mapper.IdMapper;
import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class Idservice {
	@Autowired private IdMapper idMapper;

	public String getIdCheck(String id) {
		// null이면 아이디 사용가능 -> yes
		String resultIdck = "NO";
		if(idMapper.selectIdCheck(id) == null) {
			resultIdck = "YES";
		}
		log.debug("\u001B[31m" + resultIdck + "아이디 중복 결과 ");
		return resultIdck;
	}
}
