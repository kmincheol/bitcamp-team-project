# uc014 - 비밀번호찾기_본인인증(FindPassword_Authentication)
- 회원이 비밀번호를 찾기위해 휴대폰 인증을 하는 것.

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

- 1. 액터가 비밀번호찾기 버튼을 클릭할 때 이 유스케이스를 시작한다.
- 2. 시스템은 비밀번호찾기 폼을 출력한다.
- 3. 액터가 아이디를 입력한다.
- 4. 액터가 휴대폰 인증 버튼을 클릭한다.
- 5. 시스템은 입력한 아이디가 시스템에 존재한다면
    - '휴대폰 인증' 창을 출력한다.
- 6. 정상적으로 휴대폰 인증에 성공할 시 '비밀번호찾기_본인인증성공' 유스케이스로 이동한다.

### 대안 흐름(Alternative Flows)


### 예외 흐름(Exception Flows)

- 5.1. 시스템은 입력한 아이디가 시스템에 존재하지 않는다면,
    - 입력한 아이디가 없음을 알리는 경고창을 출력한다.
- 6.1. 휴대폰 인증에 실패할 시, 인증에 실패했음을 알리는 경고창을 출력하고 현재 페이지에서 머무른다.
- 6.2. 휴대폰 인증에 성공했으나, 그 번호가 입력한 아이디에 인증된 휴대폰 번호와 일치하지 않는다면, 인증된 휴대폰 번호와 회원정보가 일치하지 않는다는 경고창을 출력하고 현재 페이지에서 머무른다.


## UI 프로토타입

### 비밀번호찾기_인증
![비밀번호찾기_본인인증](./images/uc014-findpassword_authentication.jpg)

### 비밀번호찾기_본인인증_인증예시
![비밀번호찾기_본인인증_인증예시](./images/uc014-findpassword_authentication_ex.jpg)

### 비밀번호찾기_본인인증_아이디 없음
![비밀번호찾기_본인인증_아이디 없음](./images/uc014-findpassword_authentication_no_id.jpg)

### 비밀번호찾기_본인인증_인증실패
![비밀번호찾기_본인인증_인증실패](./images/uc014-findpassword_authentication_fail.jpg)

### 비밀번호찾기_본인인증_정보불일치
![비밀번호찾기_본인인증_정보불일치](./images/uc014-findpassword_authentication_info_mismatch.jpg)

