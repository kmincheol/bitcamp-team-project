package com.eomcs.lms.dao;

import java.util.List;
import com.eomcs.lms.domain.MiddleLocation;
import com.eomcs.lms.domain.TopLocation;

public interface LocationDao {
  
  List<TopLocation> findTopLocation(int topLocationNo); // 상위지역 번호를 주면 하위 지역을 모두 다 가져오기 위해서...
  List<TopLocation> topLocationList(); // 상위지역 데이터를 다 가져오기 위해서...
  List<MiddleLocation> findMiddleLocation(int topLocationNo); //상위지역 번호를 주면 하위 지역을 가져옴 데이터 형태가 다름.
  List<TopLocation> TopLocationName(int topLocationNo); // 상위 지역번호를 주면 해당하는 지역이름 돌려줌.
  List<MiddleLocation> MiddleLocationName(int middleLocationNo); // 하위 지역번호를 주면 해당하는 지역이름 돌려줌.
}

