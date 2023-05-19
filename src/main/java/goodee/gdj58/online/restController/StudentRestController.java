package goodee.gdj58.online.restController;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import goodee.gdj58.online.service.Idservice;
import goodee.gdj58.online.service.StudentService;
import goodee.gdj58.online.vo.Student;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@RestController
public class StudentRestController {
	@Autowired Idservice idservice;
	@Autowired StudentService studentService;
	
	@GetMapping("/student/idCheck")
	public String idck(@RequestParam(value = "id") String id) {
		return idservice.getIdCheck(id);
	}
	@GetMapping("/testList")
	public List<Map<String, Object>> getTestList(HttpSession session) {
		Student loginStudent = (Student)session.getAttribute("loginStudent");
		List<Map<String, Object>> getTestList = studentService.getTestTotalList(loginStudent.getStudentNo());
		//log.debug("\u001B[31m"+getTestList.toString());
		
		List<Map<String, Object>> list = new ArrayList<>();
		for(Map<String, Object> test : getTestList) {
			Map<String, Object> map = new HashMap<>();
			map.put("title", test.get("testTitle"));
			map.put("start", test.get("testDate"));
			if(test.get("state").equals("응시")) {
				map.put("backgroundColor", "#1cc88a");
				map.put("textColor", "#000000");
				map.put("borderColor", "#fafafa");
				
			} else if(test.get("state").equals("미응시")) {
				map.put("backgroundColor", "#e74a3b");
				map.put("textColor", "#fafafa");
				map.put("borderColor", "#fafafa");
			}
			list.add(map);
			//log.debug("\u001B[31m"+list.toString());
		}
		

		return list;
	}
}
