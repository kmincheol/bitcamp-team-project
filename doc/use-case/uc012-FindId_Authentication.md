# uc012 - 아이디찾기_본인인증(FindId_Authentication)
- 회원이 아이디를 찾기위해 휴대폰 인증을 하는 것.

## 주 액터(Primary Actor)
회원

## 보조 액터(Secondary Actor)
본인인증시스템

## 사전 조건(Preconditions)
- 회원으로 로그인 되지 않은 상태이다.

## 종료 조건(Postconditions)
- 휴대폰 인증에 성공하였다.

## 시나리오(Flow of Events)

### 기본 흐름(Basic Flows)

- 1. 액터가 아이디찾기 버튼을 클릭할 때 이 유스케이스를 시작한다.
- 2. 시스템은 아이디찾기 폼을 출력한다.
- 3. 액터가 휴대폰 인증 버튼을 클릭한다.
- 4. 시스템은 '휴대폰 인증' 창을 출력한다.
- 5. 정상적으로 휴대폰 인증에 성공할 시, '아이디찾기_본인인증성공' 유스케이스로 이동한다.

### 대안 흐름(Alternative Flows)


### 예외 흐름(Exception Flows)

- 5.1 휴대폰 인증에 실패할 시, 인증에 실패했음을 알리는 경고창을 출력하고 현재 페이지에서 머무른다.


## UI 프로토타입

### 아이디찾기_본인인증
![아이디찾기_본인인증](./images/uc012-findid_authentication.jpg)

### 아이디찾기_본인인증_인증창
![아이디찾기_본인인증_인증창](./images/uc012-findid_authentication_window.jpg)

### 아이디찾기_본인인증_인증실패
![아이디찾기_본인인증_인증실패](./images/uc012-findid_authentication_fail.jpg)
