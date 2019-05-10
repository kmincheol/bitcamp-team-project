package com.eomcs.lms.dao;

import java.util.List;
import com.eomcs.lms.domain.FreeFile;

public interface FreeFileDao {
  int insert(List<FreeFile> FreeFiles);
  List<FreeFile> findByFreeNo(int FreeNo);
  int deleteByFreeNo(int FreeNo);
}
