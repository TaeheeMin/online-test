package goodee.gdj58.online.restController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import goodee.gdj58.online.controller.EmployeeController;
import goodee.gdj58.online.service.EmployeeService;
import goodee.gdj58.online.service.Idservice;
import lombok.extern.slf4j.Slf4j;

@RestController
public class EmployeeResrContoller {
	@Autowired Idservice idservice;
	
	@GetMapping("/employee/idCheck")
	public String idck(@RequestParam(value = "id") String id) {
		return idservice.getIdCheck(id);
	}
}
