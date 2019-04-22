# uc041 - 팀 정보(TeamInfo)
- 팀 정보를 조회 하고 팀 원을 수정하는 유스케이스이다.

## 주 액터(Primary Actor)보

팀장

## 보조 액터(Secondary Actor)

팀원

## 사전 조건(Preconditions)

- 나의 팀정보 페이지로 들어간다.

## 종료 조건(Postconditions)

- 팀을 조회하였다
- 팀을 수정하였다.

### 기본 흐름(Basic Flows)

- 1. 액터 및 보조액터는 팀을 선택한다. 
- 2. 시스템은 팀원 정보와 팀 가입 신청 목록을 출력한다.
- 3. 액터는 팀 가입 신청 목록에서 수락 버튼을 클릭한다.
- 4. 시스템은 팀원 정보에 수락한 회원을 추가하여 출력한다.
- 5. 액터는 팀 가입 신청 목록에서 거절 버튼을 클릭한다.
- 6. 시스템은 팀 가입 신청 목록에서 거절한 회원을 삭제후 출력한다.
- 7. 액터는 팀원 정보에서 포지션 드랍박스를 클릭한다.
- 8. 시스템은 드랍박스에 여러 포지션을 출력한다.
- 9. 액터는 드랍박스에서 포지션 하나를 선택한다.
- 10. 시스템은 선택된 포지션으로 팀원 정보를 다시 출력한다.
- 11. 액터는 팀 정보 수정 버튼을 클릭한다.
- 12. 시스템은 팀 정보 수정 유스케이로 보낸다.

### 대안 흐름(Alternative Flows)


### 예외 흐름(Exception Flows)

 -3.1 보조액터가 팀 가입 신청 목록에서 수락 버튼을 누른다면,
           -  시스템은 경고창을 출력한다.
 -5.1 보조액터가 팀 가입 신청 목록에서 거절 버튼을 누른다면,
           -  시스템은 경고창을 출력한다.   
 -7.1 보조액터가 팀원 정보에서 포지션 드랍박스를 누른다면,
           -  시스템은 경고창을 출력한다.     
 -11.1   보조액터가 팀 정보 수정 버튼을 클릭한다면,
           -  시스템은 경고창을 출력한다.    
    
## UI 프로토타입

### 팀 정보 
![팀정보](./images/myteaminfo.jpg)
    
 
### 경고창
![경고창](./images/teaminfowarning.jpg)  
    
    
    
    
    
    