package goodee.gdj58.online.restController;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ChartRestController {
	
	@GetMapping("/monthData")
	public Map<Integer, Integer> monthData(){
		Map<Integer, Integer> map = new HashMap<>();
		// 서비스에서 넘겨받는 모델값 대신 mock데이터 생성
		for(int i = 1; i < 13; i++) {
			map.put(i, (int)(Math.random()*500));
		}
		return map; // json 객체{} -> [],[]
	}
}
