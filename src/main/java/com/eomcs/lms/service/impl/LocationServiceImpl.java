package com.eomcs.lms.service.impl;

import java.util.List;
import org.springframework.stereotype.Service;
import com.eomcs.lms.dao.LocationDao;
import com.eomcs.lms.domain.MiddleLocation;
import com.eomcs.lms.domain.TopLocation;
import com.eomcs.lms.service.LocationService;

@Service
public class LocationServiceImpl implements LocationService {

  LocationDao locationDao;
  
  public LocationServiceImpl(LocationDao locationDao) {
    this.locationDao = locationDao;
  }

  @Override
  public List<TopLocation> findToplocation(int topLocationNo) {
    return locationDao.findTopLocation(topLocationNo);
  }

  @Override
  public List<TopLocation> topLocationList() {
    return locationDao.topLocationList();
  }

  @Override
  public List<MiddleLocation> findMiddleLocation(int topLocationNo) {
    return locationDao.findMiddleLocation(topLocationNo);
  }

  @Override
  public TopLocation TopLocationName(int topLocationNo) {
    return locationDao.TopLocationName(topLocationNo);
  }

  @Override
  public MiddleLocation MiddleLocationName(int middleLocationNo) {
    return locationDao.MiddleLocationName(middleLocationNo);
  }


}


