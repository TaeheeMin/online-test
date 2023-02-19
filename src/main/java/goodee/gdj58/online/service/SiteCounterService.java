package goodee.gdj58.online.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.SiteCounterMapper;

@Service
@Transactional
public class SiteCounterService {
	@Autowired private SiteCounterMapper siteCounterMapper;
	// 조회수 추가
	public int insertCount() {
		return siteCounterMapper.insertCount();
	}
	// 조회수 업데이트
	public int updateCount() {
		return siteCounterMapper.insertCount();
	}
	// 오늘 방문자수
	public int selectTodayCount() {
		return siteCounterMapper.selectTodayCount();
	}
	// 총 방문자수
	public int selectTotalCount() {
		return siteCounterMapper.selectTotalCount();
	}
}
