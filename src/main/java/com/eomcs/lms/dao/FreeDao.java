package com.eomcs.lms.dao;

import java.util.List;
import java.util.Map;
import com.eomcs.lms.domain.Free;

public interface FreeDao {
  int insert(Free free);
  List<Free> findAll(Map<String,Object> params);
  Free findByNo(int no);
  int increaseCount(int no);
  
  Free detailUpdate(int no);
  
  int update(Free free);
  int delete(int no);
  int countAll();
}







