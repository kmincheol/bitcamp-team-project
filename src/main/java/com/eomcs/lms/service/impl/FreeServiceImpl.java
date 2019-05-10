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
  public List<Free> list(int pageNo, int pageSize, int memberNo) {

    if (memberNo <= 0) {
      HashMap<String,Object> params = new HashMap<>();
      params.put("size", pageSize);
      params.put("rowNo", (pageNo - 1) * pageSize);
      
      return freeDao.findAll(params);
      

    } else {
      HashMap<String,Object> params = new HashMap<>();

      if (memberNo > 0) {
        params.put("memberNo", memberNo);
      } else {
        params.put("memberNo", null);
      }
      params.put("size", pageSize);
      params.put("rowNo", (pageNo - 1) * pageSize);
      return freeDao.findAll(params);
    }
  }

//  @Override
//  public Free get(int no) {
//    
//    Free free = freeDao.findByNo(no);
//    
//    if (free != null) {
//      freeDao.increaseCount(no);
//    }
//    
//    return free;
//  }
  
  @Override
  public Free get(int no) {
    // 이제 조금 서비스 객체가 뭔가를 하는 구만.
    // Command 객체는 데이터를 조회한 후 조회수를 높이는 것에 대해 신경 쓸 필요가 없어졌다.
    
    // lms_photo 테이블의 데이터와 lms_photo_file 테이블의 데이터를 조인하여 결과를 가져온다. 
    // 그 결과를 PhotoBoard 객체에 저장한다.
    // 특히 lms_photo_file 데이터는 PhotoFile 객체에 저장되고, 
    // 그 목록은 PhotoBoard 객체에 포함되어 리턴된다.
    Free free = freeDao.findByNoWithFile(no);
    if (free != null) {
      freeDao.increaseCount(no);
    }
    return free;
  }
  
  @Override
  public int add(Free free) {
    return freeDao.insert(free);
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
    return freeDao.delete(no);
  }

  @Override
  public int size() {
    return freeDao.countAll();
  }
}







