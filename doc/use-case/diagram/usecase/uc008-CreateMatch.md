# UC002 - 매치등록 (CreateMatch)

매치를 등록하는 유스케이스이다.

## 주 액터(Primary Actor)

팀장

## 보조 액터(Secondary Actor)

## 사전 조건(Preconditions)

- 팀장으로 로그인 되어 있다.

## 종료 조건(Postconditions)

- 매치를 등록하였다.

## 시나리오(Flow of Evnets)

### 매치 등록하기

1. 팀장은 등록하기 버튼을 클릭한다.
2. 시스템은 매치 등록 폼을 출력한다.
3. 엑터는 필수 입력 정보(경기일, 지역, 경기유형, 소속팀, 비용, 내용)를 기입한 후 클쓰기 버튼을 클릭한다.
4. 시스템은 매치 등록 글을 저장한 후 '매치보드 조회하기' 2번 유스케이스로 간다.
    - 필수 입력 항목이 비어 있다면,
        - 시스템은 필수 입력 항목이 비어 있음을 알린다.
5. 엑터는 필수 입력 정보를 기입한 후 미리보기 버튼을 클릭한다.
6. 시스템은 미리보기 폼을 출력한다.
7. 엑터는 주변 추천 경기장 사이드 바에서 원하는 경기장 사진을 클릭한다.
8. 시스템은 경기장 상세 정보를 출력한다.

### 

## UI 프로토타입
![매치등록하기](./images/CreateMatch.jpg)
![경기장_상세보기](./images/CreateMatchGround.jpg)
![매치등록_미리보기](./images/CreateMatchMirror.jpg)
![매치등록완료](./images/CreatedMatch.jpg)
![매치_필수항목_미선택](./images/necessaryNotNull.jpg)


