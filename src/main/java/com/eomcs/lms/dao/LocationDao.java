package com.eomcs.lms.dao;

import java.util.List;
import com.eomcs.lms.domain.TopLocation;

public interface LocationDao {
  
  List<TopLocation> findLocation(int topLocationNo);
  
}

