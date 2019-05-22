package com.eomcs.lms.service.impl;

import java.util.List;
import org.springframework.stereotype.Service;
import com.eomcs.lms.dao.LocationDao;
import com.eomcs.lms.domain.TopLocation;
import com.eomcs.lms.service.LocationService;

@Service
public class LocationServiceImpl implements LocationService {

  LocationDao locationDao;
  
  public LocationServiceImpl(LocationDao locationDao) {
    this.locationDao = locationDao;
  }

  @Override
  public List<TopLocation> findlocation(int topLocationNo) {
    return locationDao.findLocation(topLocationNo);
  }


}


