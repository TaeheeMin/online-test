package goodee.gdj58.online.restController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import goodee.gdj58.online.service.Idservice;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class TeacherRestContoller {
@Autowired Idservice idservice;
	
	@GetMapping("/teacher/idCheck")
	public String idck(@RequestParam(value = "id") String id) {
		return idservice.getIdCheck(id);
	}
}
