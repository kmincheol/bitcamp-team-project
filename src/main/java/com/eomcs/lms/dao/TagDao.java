package com.eomcs.lms.dao;

import java.util.List;
import com.eomcs.lms.domain.Tag;

public interface TagDao {
  int insert(List<Tag> tags);
  List<Tag> findByTagNo(int tagNo);
  int deleteByTagNo(int tagNo);
}
