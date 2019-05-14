package com.eomcs.lms.dao;

import java.util.List;
import com.eomcs.lms.domain.MatchFile;

public interface MatchFileDao {
  int insert(List<MatchFile> matchFiles);
  List<MatchFile> findByMatchNo(int matchNo);
  int deleteByMatchNo(int matchNo);
}
