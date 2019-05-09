package com.eomcs.lms.service;

import java.util.List;
import com.eomcs.lms.domain.Board;
import com.eomcs.lms.domain.Free;

public interface FreeService {
  List<Free> list(int pageNo, int pageSize, int memberNo);
//  int add(Board board);
  Free get(int no);
//  int update(Board board);
//  int delete(int no);
  int size();
}
