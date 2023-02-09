package goodee.gdj58.online.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.IdMapper;

@Service
@Transactional
public class Idservice {
	@Autowired private IdMapper idMapper;

	public String getIdCheck(String id) {
		// null이면 아이디 사용가능
		String resultIdck = "NO";
		if(idMapper.selectIdCheck(id) == null) {
			resultIdck = "YES";
		}
		return resultIdck;
	}
}
