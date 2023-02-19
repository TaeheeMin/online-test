package goodee.gdj58.online.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SiteCounterMapper {
	int insertCount();
	int updateCount();
	Integer selectTodayCount();
	Integer selectTotalCount();
}
