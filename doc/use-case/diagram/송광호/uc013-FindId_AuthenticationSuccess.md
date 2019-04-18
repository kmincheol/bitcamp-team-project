# uc013 - 아이디찾기_본인인증성공(FindId_AuthenticationSuccess)
- 회원이 휴대폰 인증에 성공하여 아이디를 찾는 것.

## 주 액터(Primary Actor)
회원

## 보조 액터(Secondary Actor)

## 사전 조건(Preconditions)
- 회원으로 로그인 되지 않은 상태이다.

## 종료 조건(Postconditions)
- 아이디를 조회하였다.

## 시나리오(Flow of Events)

### 기본 흐름(Basic Flows)

- 1. 액터가 아이디찾기_본인인증 유스케이스에서 휴대폰 인증을 성공해 본인임이 확인된다면 이 유스케이스를 시작한다.
- 2. 시스템은 인증된 휴대폰번호와 일치하는 회원정보를 찾아서 아이디찾기_본인인증성공 폼을 출력한다.
- 3. 액터가 로그인 버튼을 클릭한다.
- 4. 시스템은 '로그인' 유스케이스로 간다.

### 대안 흐름(Alternative Flows)


### 예외 흐름(Exception Flows)


## UI 프로토타입

### 아이디찾기_본인인증성공
![아이디찾기_본인인증성공](./images/15_아이디찾기_본인인증성공.jpg)


