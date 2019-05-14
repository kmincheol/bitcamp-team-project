package com.eomcs.lms.service.impl;

import java.util.HashMap;
import java.util.List;
import org.springframework.stereotype.Service;
import com.eomcs.lms.dao.FreeDao;
import com.eomcs.lms.dao.FreeFileDao;
import com.eomcs.lms.dao.MemberDao;
import com.eomcs.lms.domain.Free;
import com.eomcs.lms.service.FreeService;

// 스프링 IoC 컨테이너가 관리하는 객체 중에서 
// 비즈니스 로직을 담당하는 객체는 
// 특별히 그 역할을 표시하기 위해 @Component 대신에 @Service 애노테이션을 붙인다.
// 이렇게 애노테이션으로 구분해두면 나중에 애노테이션으로 객체를 찾을 수 있다.
@Service
public class FreeServiceImpl implements FreeService {

  FreeDao freeDao;
  MemberDao memberDao;
  FreeFileDao fileDao;

  public FreeServiceImpl(
      FreeDao freeDao, 
      MemberDao memberDao,
      FreeFileDao fileDao) {
    this.freeDao = freeDao;
    this.memberDao = memberDao;
    this.fileDao = fileDao;
  }

  // 비지니스 객체에서 메서드 이름은 가능한 업무 용어를 사용한다.
  @Override
  public List<Free> list(int pageNo, int pageSize) {
      HashMap<String,Object> params = new HashMap<>();

      params.put("size", pageSize);
      params.put("rowNo", (pageNo - 1) * pageSize);
      return freeDao.findAll(params);
    }

  
  @Override
  public Free get(int no) {

    Free free = freeDao.findByNo(no);
    if (free != null) {
      freeDao.increaseCount(no);
    }
    return free;
  }
  
  @Override
  public List<Free> search(String keyword) {
    if (keyword == null)
      return freeDao.findAll(null);
    else 
      return freeDao.findByKeyword(keyword);
  }
  
  @Override
  public int add(Free free) {
    
    int count = freeDao.insert(free);
    
//    List<FreeFile> files = free.getFiles();
//    for (FreeFile f : files) {
//      f.setFreeNo(free.getNo());
//    }

  //  fileDao.insert(free.getFiles());

    return count;
  }


  @Override
  public Free getUpdate(int no) {
    
    Free free = freeDao.detailUpdate(no);
    
    return free;
  }
  
  
  @Override
  public int update(Free free) {
    return freeDao.update(free);
  }

  @Override
  public int delete(int no) {
    fileDao.deleteByFreeNo(no);
    return freeDao.delete(no);
  }

  @Override
  public int size() {
    return freeDao.countAll();
  }

  public static void addComment(Free free) {
    
  }
}







