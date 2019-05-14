package com.eomcs.lms.dao;

import java.util.List;
import java.util.Map;
import com.eomcs.lms.domain.Free;
import com.eomcs.lms.domain.TeamRecruit;

public interface FreeDao {
  int insert(Free free);
  List<Free> findAll(Map<String,Object> params);
  Free findByNo(int no);
  Free findByNoWithFile(int no);
  List<Free> findByKeyword(String keyword);
  int increaseCount(int no);
  Free detailUpdate(int no);
  int update(Free free);
  int delete(int no);
  int countAll();
}







