package com.eomcs.lms.service;

import java.util.List;
import com.eomcs.lms.domain.TopLocation;

public interface LocationService {
  List<TopLocation> findToplocation(int topLocationNo);
}
