# Use-Case

## Actors

<img src="./diagram/Actor.png" width="300"></img>

### 비회원
- 시스템에 로그인 하지 않은 사용자

### 회원
- 시스템에 로그인 한 사용자

### 관리자
- 관리자에 등록된 로그인 사용자

### 팀장
- 팀장에 등록된 로그인 사용자

### 팀원
- 팀원에 등록된 로그인 사용자

## Use-Cases

### [로그인하기](uc011-Login.md)(회원)
- 회원이 로그인을 하는 것 .

### [아이디찾기_본인인증](uc012-FindId_Authentication.md)(회원)
- 회원이 아이디를 찾기위해 휴대폰 인증을 하는 것.

### [아이디찾기_본인인증성공](uc013-FindId_AuthenticationSuccess.md)(회원)
- 회원이 휴대폰 인증에 성공하여 아이디를 찾는 것.

### [비밀번호찾기_본인인증](uc014-FindPassword_Authentication.md)(회원)
- 회원이 비밀번호를 찾기위해 휴대폰 인증을 하는 것.

### [비밀번호찾기_본인인증성공](uc015-FindPassword_AuthenticationSuccess.md)(회원)
- 회원이 휴대폰 인증에 성공하여 비밀번호를 찾는 것.

### [회원정보관리](uc021-MemberManagement.md)(관리자)
- 회원정보를 조회, 수정, 삭제, 경고하는 것.

### [팀관리](uc022-TeamManagement)(관리자)
- 팀정보를 조회, 수정, 삭제하는 것.

### [게시물관리](uc023-BoardManagemnet)(관리자)
- 게시물을 조회, 삭제하는 것.

### [신고게시판관리](uc024-ReportBoardManagement)(관리자)
- 신고게시물을 조회, 삭제, 경고하는것.

### [고객문의관리](uc025-CustomerEnquiryManagement)(관리자)
- 고객이 등록한 질문 및 개선사항을 조회, 답변, 삭제하는 것.
