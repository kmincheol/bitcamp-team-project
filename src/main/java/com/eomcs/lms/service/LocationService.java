package com.eomcs.lms.service;

import java.util.List;
import com.eomcs.lms.domain.MiddleLocation;
import com.eomcs.lms.domain.TopLocation;

public interface LocationService {
  List<TopLocation> findToplocation(int topLocationNo);
  List<TopLocation> topLocationList();
  List<MiddleLocation> findMiddleLocation(int topLocationNo);
  String TopLocationName(int topLocationNo);
  String MiddleLocationName(int middleLocationNo);
}
