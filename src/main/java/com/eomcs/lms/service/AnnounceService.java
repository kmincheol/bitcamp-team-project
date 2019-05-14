package com.eomcs.lms.service;

import java.util.List;
import com.eomcs.lms.domain.Announce;

public interface AnnounceService {
  List<Announce> list(int pageNo, int pageSize);
  int add(Announce announce);
  Announce get(int no);
  int update(Announce announce);
  int delete(int no);
  int size();
}
