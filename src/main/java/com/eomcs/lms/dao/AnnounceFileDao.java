package com.eomcs.lms.dao;

import java.util.List;
import com.eomcs.lms.domain.AnnounceFile;

public interface AnnounceFileDao {
  int insert(List<AnnounceFile> announceFiles);
  List<AnnounceFile> findByAnnounceNo(int announceNo);
  int deleteByAnnounceNo(int announceNo);
}
