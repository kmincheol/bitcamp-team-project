package com.eomcs.lms.service;

import java.util.List;
import com.eomcs.lms.domain.TeamRecruit;

public interface TeamRecruitService {
  List<TeamRecruit> list(int pageNo, int pageSize, int memberNo);
  int add(TeamRecruit teamRecruit);
  TeamRecruit get(int no);
  int update(TeamRecruit teamRecruit);
  int delete(int no);
  int size();
}
