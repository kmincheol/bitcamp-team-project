package com.eomcs.lms.dao;

import java.util.List;
import com.eomcs.lms.domain.MiddleLocation;
import com.eomcs.lms.domain.TopLocation;

public interface LocationDao {
  
  List<TopLocation> findTopLocation(int topLocationNo);
  List<TopLocation> topLocationList();
  List<MiddleLocation> findMiddleLocation(int topLocationNo);
}

