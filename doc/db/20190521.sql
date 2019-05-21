-- 후기게시판
DROP TABLE IF EXISTS revw RESTRICT;

-- 종목유형
DROP TABLE IF EXISTS spt_clsf RESTRICT;

-- 자유게시판
DROP TABLE IF EXISTS free RESTRICT;

-- 팀
DROP TABLE IF EXISTS tm RESTRICT;

-- 질문
DROP TABLE IF EXISTS qstn RESTRICT;

-- 팀원모집
DROP TABLE IF EXISTS rcrm RESTRICT;

-- 회원
DROP TABLE IF EXISTS mbr RESTRICT;

-- 팀원
DROP TABLE IF EXISTS tm_mbr RESTRICT;

-- 댓글
DROP TABLE IF EXISTS cmt RESTRICT;

-- 경기
DROP TABLE IF EXISTS mtch RESTRICT;

-- 경기태그
DROP TABLE IF EXISTS mtch_tag RESTRICT;

-- 경기신청
DROP TABLE IF EXISTS mtchaply RESTRICT;

-- 팀경고
DROP TABLE IF EXISTS warn RESTRICT;

-- 시도지역
DROP TABLE IF EXISTS toplc RESTRICT;

-- 시군구지역
DROP TABLE IF EXISTS midlc RESTRICT;

-- 읍면동지역
DROP TABLE IF EXISTS btmlc RESTRICT;

-- 연령대
DROP TABLE IF EXISTS age RESTRICT;

-- 팀유형
DROP TABLE IF EXISTS tm_type RESTRICT;

-- 팀수준
DROP TABLE IF EXISTS tm_lev RESTRICT;

-- 답변
DROP TABLE IF EXISTS ans RESTRICT;

-- 공지사항
DROP TABLE IF EXISTS anunc RESTRICT;

-- 후기게시판
CREATE TABLE revw (
  tm_id   INTEGER(30) NOT NULL COMMENT '평가팀', -- 평가팀
  tm_id2  INTEGER(30) NOT NULL COMMENT '피평가팀', -- 피평가팀
  mtch_id INTEGER(30) NOT NULL COMMENT '경기번호', -- 경기번호
  cont    MEDIUMTEXT  NULL     COMMENT '내용', -- 내용
  gpa     INTEGER     NOT NULL COMMENT '별점수' -- 별점수
)
COMMENT '후기게시판';

-- 후기게시판
ALTER TABLE revw
  ADD CONSTRAINT PK_revw -- 후기게시판 기본키
    PRIMARY KEY (
      tm_id,   -- 평가팀
      tm_id2,  -- 피평가팀
      mtch_id  -- 경기번호
    );

-- 종목유형
CREATE TABLE spt_clsf (
  spt_clsf_id   INTEGER(30)  NOT NULL COMMENT '종목유형번호', -- 종목유형번호
  spt_clsf_name VARCHAR(255) NULL     COMMENT '종목이름' -- 종목이름
)
COMMENT '종목유형';

-- 종목유형
ALTER TABLE spt_clsf
  ADD CONSTRAINT PK_spt_clsf -- 종목유형 기본키
    PRIMARY KEY (
      spt_clsf_id -- 종목유형번호
    );

-- 자유게시판
CREATE TABLE free (
  free_id INTEGER(30) NOT NULL COMMENT '자유게시판번호', -- 자유게시판번호
  mbr_id  INTEGER(30) NULL     COMMENT '회원번호', -- 회원번호
  titl    VARCHAR(50) NOT NULL COMMENT '제목', -- 제목
  cont    MEDIUMTEXT  NOT NULL COMMENT '내용', -- 내용
  vw_cnt  INTEGER     NULL     DEFAULT 0 COMMENT '조회수', -- 조회수
  cdt     DATETIME    NULL     DEFAULT now() COMMENT '작성일', -- 작성일
  mdt     DATETIME    NULL     DEFAULT now() COMMENT '최근수정일' -- 최근수정일
)
COMMENT '자유게시판';

-- 자유게시판
ALTER TABLE free
  ADD CONSTRAINT PK_free -- 자유게시판 기본키
    PRIMARY KEY (
      free_id -- 자유게시판번호
    );

ALTER TABLE free
  MODIFY COLUMN free_id INTEGER(30) NOT NULL AUTO_INCREMENT COMMENT '자유게시판번호';

-- 팀
CREATE TABLE tm (
  tm_id        INTEGER(30)  NOT NULL COMMENT '팀번호', -- 팀번호
  name         VARCHAR(50)  NOT NULL COMMENT '팀명', -- 팀명
  tm_intd      VARCHAR(255) NULL     COMMENT '팀소개', -- 팀소개
  area         VARCHAR(100) NOT NULL COMMENT '지역', -- 지역
  age_id       INTEGER(30)  NOT NULL COMMENT '연령대번호', -- 연령대번호
  tm_type_id   INTEGER(30)  NOT NULL COMMENT '팀유형번호', -- 팀유형번호
  tm_lev_id    INTEGER(30)  NOT NULL COMMENT '팀수준번호', -- 팀수준번호
  spt_clsf_id  INTEGER(30)  NOT NULL COMMENT '종목유형번호', -- 종목유형번호
  tm_ambl_phot MEDIUMTEXT   NULL     COMMENT '팀앰블럼사진경로', -- 팀앰블럼사진경로
  tm_unf_wth   BOOLEAN      NULL     DEFAULT 0 COMMENT '팀유니폼여부', -- 팀유니폼여부
  tm_unf_phot  MEDIUMTEXT   NULL     COMMENT '팀유니폼사진', -- 팀유니폼사진
  cdt          DATETIME     NULL     DEFAULT now() COMMENT '팀개설일자', -- 팀개설일자
  mdt          DATETIME     NULL     DEFAULT now() COMMENT '팀정보수정일자' -- 팀정보수정일자
)
COMMENT '팀';

-- 팀
ALTER TABLE tm
  ADD CONSTRAINT PK_tm -- 팀 기본키
    PRIMARY KEY (
      tm_id -- 팀번호
    );

-- 팀 유니크 인덱스
CREATE UNIQUE INDEX UIX_tm
  ON tm ( -- 팀
    name ASC -- 팀명
  );

ALTER TABLE tm
  MODIFY COLUMN tm_id INTEGER(30) NOT NULL AUTO_INCREMENT COMMENT '팀번호';

-- 질문
CREATE TABLE qstn (
  qstn_id   INTEGER(30)  NOT NULL COMMENT '질문게시판번호', -- 질문게시판번호
  mbr_id    INTEGER(30)  NULL     COMMENT '회원번호', -- 회원번호
  titl      VARCHAR(50)  NOT NULL COMMENT '제목', -- 제목
  cont      MEDIUMTEXT   NOT NULL COMMENT '내용', -- 내용
  qstn_type VARCHAR(255) NOT NULL COMMENT '문의유형', -- 문의유형
  ans_stat  BOOLEAN      NULL     DEFAULT 0 COMMENT '답변상태', -- 답변상태
  cdt       DATETIME     NULL     DEFAULT now() COMMENT '작성일' -- 작성일
)
COMMENT '질문';

-- 질문
ALTER TABLE qstn
  ADD CONSTRAINT PK_qstn -- 질문 기본키
    PRIMARY KEY (
      qstn_id -- 질문게시판번호
    );

ALTER TABLE qstn
  MODIFY COLUMN qstn_id INTEGER(30) NOT NULL AUTO_INCREMENT COMMENT '질문게시판번호';

-- 팀원모집
CREATE TABLE rcrm (
  rcrm_id   INTEGER(30) NOT NULL COMMENT '팀원모집번호', -- 팀원모집번호
  tm_id     INTEGER(30) NULL     COMMENT '팀번호', -- 팀번호
  titl      VARCHAR(50) NOT NULL COMMENT '제목', -- 제목
  cont      MEDIUMTEXT  NOT NULL COMMENT '내용', -- 내용
  vw_cnt    INTEGER     NULL     DEFAULT 0 COMMENT '조회수', -- 조회수
  cdt       DATETIME    NULL     DEFAULT now() COMMENT '작성일', -- 작성일
  mdt       DATETIME    NULL     DEFAULT now() COMMENT '최근수정일', -- 최근수정일
  rcrm_stat BOOLEAN     NULL     DEFAULT 0 COMMENT '모집상태', -- 모집상태
  rcrm_prsn INTEGER     NULL     COMMENT '모집인원' -- 모집인원
)
COMMENT '팀원모집';

-- 팀원모집
ALTER TABLE rcrm
  ADD CONSTRAINT PK_rcrm -- 팀원모집 기본키
    PRIMARY KEY (
      rcrm_id -- 팀원모집번호
    );

ALTER TABLE rcrm
  MODIFY COLUMN rcrm_id INTEGER(30) NOT NULL AUTO_INCREMENT COMMENT '팀원모집번호';

-- 회원
CREATE TABLE mbr (
  mbr_id     INTEGER(30)  NOT NULL COMMENT '회원번호', -- 회원번호
  user_id    VARCHAR(15)  NOT NULL COMMENT '아이디', -- 아이디
  pwd        VARCHAR(20)  NOT NULL COMMENT '비밀번호', -- 비밀번호
  name       VARCHAR(50)  NOT NULL COMMENT '이름', -- 이름
  bth_dt     DATETIME     NOT NULL COMMENT '생년월일', -- 생년월일
  gndr       CHAR(2)      NOT NULL COMMENT '성별', -- 성별
  tel        VARCHAR(30)  NOT NULL COMMENT '휴대폰번호', -- 휴대폰번호
  email      VARCHAR(40)  NULL     COMMENT '이메일', -- 이메일
  post       INTEGER      NOT NULL COMMENT '우편번호', -- 우편번호
  bas_addr   VARCHAR(255) NOT NULL COMMENT '기본주소', -- 기본주소
  det_addr   VARCHAR(255) NOT NULL COMMENT '상세주소', -- 상세주소
  prof_phot  MEDIUMTEXT   NULL     COMMENT '프로필사진', -- 프로필사진
  s_intd     VARCHAR(255) NULL     COMMENT '자기소개', -- 자기소개
  login_type VARCHAR(255) NOT NULL COMMENT '로그인유형', -- 로그인유형
  stat       VARCHAR(255) NULL     DEFAULT "정상" COMMENT '상태', -- 상태
  cdt        DATETIME     NULL     DEFAULT now() COMMENT '가입일', -- 가입일
  lcd        DATETIME     NULL     DEFAULT now() COMMENT '최근접속일', -- 최근접속일
  mgr        BOOLEAN      NULL     DEFAULT 0 COMMENT '관리자여부' -- 관리자여부
)
COMMENT '회원';

-- 회원
ALTER TABLE mbr
  ADD CONSTRAINT PK_mbr -- 회원 기본키
    PRIMARY KEY (
      mbr_id -- 회원번호
    );

-- 회원 유니크 인덱스
CREATE UNIQUE INDEX UIX_mbr
  ON mbr ( -- 회원
    user_id ASC -- 아이디
  );

-- 회원 유니크 인덱스2
CREATE UNIQUE INDEX UIX_mbr2
  ON mbr ( -- 회원
    tel ASC -- 휴대폰번호
  );

ALTER TABLE mbr
  MODIFY COLUMN mbr_id INTEGER(30) NOT NULL AUTO_INCREMENT COMMENT '회원번호';

-- 팀원
CREATE TABLE tm_mbr (
  tm_mbr_id INTEGER(30)  NOT NULL COMMENT '팀번호', -- 팀번호
  mbr_id    INTEGER(30)  NOT NULL COMMENT '회원번호', -- 회원번호
  tlead_wth BOOLEAN      NULL     COMMENT '팀장여부', -- 팀장여부
  pstn      VARCHAR(255) NULL     COMMENT '포지션' -- 포지션
)
COMMENT '팀원';

-- 팀원
ALTER TABLE tm_mbr
  ADD CONSTRAINT PK_tm_mbr -- 팀원 기본키
    PRIMARY KEY (
      tm_mbr_id, -- 팀번호
      mbr_id     -- 회원번호
    );

-- 댓글
CREATE TABLE cmt (
  cmt_id  INTEGER(30)  NOT NULL COMMENT '댓글번호', -- 댓글번호
  free_id INTEGER(30)  NULL     COMMENT '자유게시판번호', -- 자유게시판번호
  mbr_id  INTEGER(30)  NULL     COMMENT '회원번호', -- 회원번호
  pcd     INTEGER      NOT NULL COMMENT '순서', -- 순서
  lev     INTEGER      NOT NULL COMMENT '단계', -- 단계
  cont    VARCHAR(255) NOT NULL COMMENT '내용', -- 내용
  wrt_dt  DATETIME     NULL     DEFAULT now() COMMENT '작성일시', -- 작성일시
  mdt     DATETIME     NULL     DEFAULT now() COMMENT '최근수정일' -- 최근수정일
)
COMMENT '댓글';

-- 댓글
ALTER TABLE cmt
  ADD CONSTRAINT PK_cmt -- 댓글 기본키
    PRIMARY KEY (
      cmt_id -- 댓글번호
    );

ALTER TABLE cmt
  MODIFY COLUMN cmt_id INTEGER(30) NOT NULL AUTO_INCREMENT COMMENT '댓글번호';

-- 경기
CREATE TABLE mtch (
  mtch_id     INTEGER(30)  NOT NULL COMMENT '경기번호', -- 경기번호
  tm_id       INTEGER(30)  NOT NULL COMMENT '경기개설팀번호', -- 경기개설팀번호
  tm_id2      INTEGER(30)  NULL     COMMENT '경기참여팀번호', -- 경기참여팀번호
  spt_clsf_id INTEGER(30)  NULL     COMMENT '종목유형번호', -- 종목유형번호
  titl        VARCHAR(50)  NOT NULL COMMENT '제목', -- 제목
  cont        MEDIUMTEXT   NOT NULL COMMENT '내용', -- 내용
  vw_cnt      INTEGER      NULL     DEFAULT 0 COMMENT '조회수', -- 조회수
  cdt         DATETIME     NULL     DEFAULT now() COMMENT '작성일', -- 작성일
  mdt         DATETIME     NULL     DEFAULT now() COMMENT '최근수정일', -- 최근수정일
  game_dt     DATETIME     NOT NULL COMMENT '경기날짜', -- 경기날짜
  area        VARCHAR(100) NOT NULL COMMENT '지역', -- 지역
  stdm_psti   VARCHAR(255) NULL     COMMENT '경기장이름', -- 경기장이름
  stdm_lat    VARCHAR(100) NULL     COMMENT '경기장위치위도', -- 경기장위치위도
  stdm_long   VARCHAR(100) NULL     COMMENT '경기장위치경도', -- 경기장위치경도
  tel         VARCHAR(30)  NOT NULL COMMENT '연락처', -- 연락처
  cost        INTEGER      NULL     COMMENT '비용' -- 비용
)
COMMENT '경기';

-- 경기
ALTER TABLE mtch
  ADD CONSTRAINT PK_mtch -- 경기 기본키
    PRIMARY KEY (
      mtch_id -- 경기번호
    );

ALTER TABLE mtch
  MODIFY COLUMN mtch_id INTEGER(30) NOT NULL AUTO_INCREMENT COMMENT '경기번호';

ALTER TABLE mtch
  AUTO_INCREMENT = 1;

-- 경기태그
CREATE TABLE mtch_tag (
  mtch_tag_id INTEGER(30) NOT NULL COMMENT '경기태그번호', -- 경기태그번호
  mtch_id     INTEGER(30) NULL     COMMENT '경기번호', -- 경기번호
  mbr_id      INTEGER(30) NULL     COMMENT '회원번호', -- 회원번호
  tag_name    VARCHAR(50) NOT NULL COMMENT '태그이름' -- 태그이름
)
COMMENT '경기태그';

-- 경기태그
ALTER TABLE mtch_tag
  ADD CONSTRAINT PK_mtch_tag -- 경기태그 기본키
    PRIMARY KEY (
      mtch_tag_id -- 경기태그번호
    );

ALTER TABLE mtch_tag
  MODIFY COLUMN mtch_tag_id INTEGER(30) NOT NULL AUTO_INCREMENT COMMENT '경기태그번호';

-- 경기신청
CREATE TABLE mtchaply (
  tm_id     INTEGER(30) NOT NULL COMMENT '팀번호', -- 팀번호
  mtch_id   INTEGER(30) NOT NULL COMMENT '경기번호', -- 경기번호
  aply_dt   DATETIME    NOT NULL COMMENT '신청일', -- 신청일
  aply_stat VARCHAR(20) NOT NULL COMMENT '신청상태' -- 신청상태
)
COMMENT '경기신청';

-- 경기신청
ALTER TABLE mtchaply
  ADD CONSTRAINT PK_mtchaply -- 경기신청 기본키
    PRIMARY KEY (
      tm_id,   -- 팀번호
      mtch_id  -- 경기번호
    );

-- 팀경고
CREATE TABLE warn (
  warn_id  INTEGER(30) NOT NULL COMMENT '팀경고번호', -- 팀경고번호
  warn_res MEDIUMTEXT  NOT NULL COMMENT '경고사유', -- 경고사유
  warn_dt  DATETIME    NULL     DEFAULT now() COMMENT '경고일', -- 경고일
  tm_id    INTEGER(30) NULL     COMMENT '팀번호' -- 팀번호
)
COMMENT '팀경고';

-- 팀경고
ALTER TABLE warn
  ADD CONSTRAINT PK_warn -- 팀경고 기본키
    PRIMARY KEY (
      warn_id -- 팀경고번호
    );

ALTER TABLE warn
  MODIFY COLUMN warn_id INTEGER(30) NOT NULL AUTO_INCREMENT COMMENT '팀경고번호';

-- 시도지역
CREATE TABLE toplc (
  toplc_id INTEGER(30) NOT NULL COMMENT '시도지역번호', -- 시도지역번호
  toplc_no CHAR(2)     NOT NULL COMMENT '지역번호', -- 지역번호
  name     VARCHAR(50) NOT NULL COMMENT '이름' -- 이름
)
COMMENT '시도지역';

-- 시도지역
ALTER TABLE toplc
  ADD CONSTRAINT PK_toplc -- 시도지역 기본키
    PRIMARY KEY (
      toplc_id -- 시도지역번호
    );

ALTER TABLE toplc
  MODIFY COLUMN toplc_id INTEGER(30) NOT NULL AUTO_INCREMENT COMMENT '시도지역번호';

-- 시군구지역
CREATE TABLE midlc (
  midlc_id INTEGER(30) NOT NULL COMMENT '시군구지역번호', -- 시군구지역번호
  midlc_no CHAR(2)     NOT NULL COMMENT '지역번호', -- 지역번호
  name     VARCHAR(50) NOT NULL COMMENT '이름', -- 이름
  toplc_id INTEGER(30) NOT NULL COMMENT '시도지역번호' -- 시도지역번호
)
COMMENT '시군구지역';

-- 시군구지역
ALTER TABLE midlc
  ADD CONSTRAINT PK_midlc -- 시군구지역 기본키
    PRIMARY KEY (
      midlc_id -- 시군구지역번호
    );

ALTER TABLE midlc
  MODIFY COLUMN midlc_id INTEGER(30) NOT NULL AUTO_INCREMENT COMMENT '시군구지역번호';

-- 읍면동지역
CREATE TABLE btmlc (
  btmlc_id INTEGER(30) NOT NULL COMMENT '읍면동지역번호', -- 읍면동지역번호
  btmlc_no CHAR(2)     NOT NULL COMMENT '지역번호', -- 지역번호
  name     VARCHAR(50) NOT NULL COMMENT '이름', -- 이름
  midlc_id INTEGER(30) NOT NULL COMMENT '시군구지역번호' -- 시군구지역번호
)
COMMENT '읍면동지역';

-- 읍면동지역
ALTER TABLE btmlc
  ADD CONSTRAINT PK_btmlc -- 읍면동지역 기본키
    PRIMARY KEY (
      btmlc_id -- 읍면동지역번호
    );

ALTER TABLE btmlc
  MODIFY COLUMN btmlc_id INTEGER(30) NOT NULL AUTO_INCREMENT COMMENT '읍면동지역번호';

-- 연령대
CREATE TABLE age (
  age_id INTEGER(30) NOT NULL COMMENT '연령대번호', -- 연령대번호
  ages   VARCHAR(50) NULL     COMMENT '연령' -- 연령
)
COMMENT '연령대';

-- 연령대
ALTER TABLE age
  ADD CONSTRAINT PK_age -- 연령대 기본키
    PRIMARY KEY (
      age_id -- 연령대번호
    );

-- 팀유형
CREATE TABLE tm_type (
  tm_type_id INTEGER(30) NOT NULL COMMENT '팀유형번호', -- 팀유형번호
  types      VARCHAR(50) NULL     COMMENT '팀유형명' -- 팀유형명
)
COMMENT '팀유형';

-- 팀유형
ALTER TABLE tm_type
  ADD CONSTRAINT PK_tm_type -- 팀유형 기본키
    PRIMARY KEY (
      tm_type_id -- 팀유형번호
    );

-- 팀수준
CREATE TABLE tm_lev (
  tm_lev_id INTEGER(30) NOT NULL COMMENT '팀수준번호', -- 팀수준번호
  levs      VARCHAR(50) NULL     COMMENT '팀수준명' -- 팀수준명
)
COMMENT '팀수준';

-- 팀수준
ALTER TABLE tm_lev
  ADD CONSTRAINT PK_tm_lev -- 팀수준 기본키
    PRIMARY KEY (
      tm_lev_id -- 팀수준번호
    );

-- 답변
CREATE TABLE ans (
  ans_id  INTEGER(30) NOT NULL COMMENT '답변번호', -- 답변번호
  qstn_id INTEGER(30) NOT NULL COMMENT '질문게시판번호', -- 질문게시판번호
  titl    VARCHAR(50) NOT NULL COMMENT '제목', -- 제목
  cont    MEDIUMTEXT  NOT NULL COMMENT '답변', -- 답변
  ans_dt  DATETIME    NULL     DEFAULT now() COMMENT '답변일' -- 답변일
)
COMMENT '답변';

-- 답변
ALTER TABLE ans
  ADD CONSTRAINT PK_ans -- 답변 기본키
    PRIMARY KEY (
      ans_id,  -- 답변번호
      qstn_id  -- 질문게시판번호
    );

ALTER TABLE ans
  MODIFY COLUMN ans_id INTEGER(30) NOT NULL AUTO_INCREMENT COMMENT '답변번호';

-- 공지사항
CREATE TABLE anunc (
  anunc_id INTEGER(30) NOT NULL COMMENT '공지사항게시판번호', -- 공지사항게시판번호
  mbr_id   INTEGER(30) NULL     COMMENT '회원번호', -- 회원번호
  titl     VARCHAR(50) NOT NULL COMMENT '제목', -- 제목
  cont     MEDIUMTEXT  NOT NULL COMMENT '내용', -- 내용
  vw_cnt   INTEGER     NULL     DEFAULT 0 COMMENT '조회수', -- 조회수
  cdt      DATETIME    NULL     DEFAULT now() COMMENT '작성일', -- 작성일
  mdt      DATETIME    NULL     DEFAULT now() COMMENT '최근수정일' -- 최근수정일
)
COMMENT '공지사항';

-- 공지사항
ALTER TABLE anunc
  ADD CONSTRAINT PK_anunc -- 공지사항 기본키
    PRIMARY KEY (
      anunc_id -- 공지사항게시판번호
    );

ALTER TABLE anunc
  MODIFY COLUMN anunc_id INTEGER(30) NOT NULL AUTO_INCREMENT COMMENT '공지사항게시판번호';

-- 후기게시판
ALTER TABLE revw
  ADD CONSTRAINT FK_tm_TO_revw -- 팀 -> 후기게시판
    FOREIGN KEY (
      tm_id -- 평가팀
    )
    REFERENCES tm ( -- 팀
      tm_id -- 팀번호
    );

-- 후기게시판
ALTER TABLE revw
  ADD CONSTRAINT FK_tm_TO_revw2 -- 팀 -> 후기게시판2
    FOREIGN KEY (
      tm_id2 -- 피평가팀
    )
    REFERENCES tm ( -- 팀
      tm_id -- 팀번호
    );

-- 후기게시판
ALTER TABLE revw
  ADD CONSTRAINT FK_mtch_TO_revw -- 경기 -> 후기게시판
    FOREIGN KEY (
      mtch_id -- 경기번호
    )
    REFERENCES mtch ( -- 경기
      mtch_id -- 경기번호
    );

-- 자유게시판
ALTER TABLE free
  ADD CONSTRAINT FK_mbr_TO_free -- 회원 -> 자유게시판
    FOREIGN KEY (
      mbr_id -- 회원번호
    )
    REFERENCES mbr ( -- 회원
      mbr_id -- 회원번호
    );

-- 팀
ALTER TABLE tm
  ADD CONSTRAINT FK_spt_clsf_TO_tm -- 종목유형 -> 팀
    FOREIGN KEY (
      spt_clsf_id -- 종목유형번호
    )
    REFERENCES spt_clsf ( -- 종목유형
      spt_clsf_id -- 종목유형번호
    );

-- 팀
ALTER TABLE tm
  ADD CONSTRAINT FK_age_TO_tm -- 연령대 -> 팀
    FOREIGN KEY (
      age_id -- 연령대번호
    )
    REFERENCES age ( -- 연령대
      age_id -- 연령대번호
    );

-- 팀
ALTER TABLE tm
  ADD CONSTRAINT FK_tm_type_TO_tm -- 팀유형 -> 팀
    FOREIGN KEY (
      tm_type_id -- 팀유형번호
    )
    REFERENCES tm_type ( -- 팀유형
      tm_type_id -- 팀유형번호
    );

-- 팀
ALTER TABLE tm
  ADD CONSTRAINT FK_tm_lev_TO_tm -- 팀수준 -> 팀
    FOREIGN KEY (
      tm_lev_id -- 팀수준번호
    )
    REFERENCES tm_lev ( -- 팀수준
      tm_lev_id -- 팀수준번호
    );

-- 질문
ALTER TABLE qstn
  ADD CONSTRAINT FK_mbr_TO_qstn -- 회원 -> 질문
    FOREIGN KEY (
      mbr_id -- 회원번호
    )
    REFERENCES mbr ( -- 회원
      mbr_id -- 회원번호
    );

-- 팀원모집
ALTER TABLE rcrm
  ADD CONSTRAINT FK_tm_TO_rcrm -- 팀 -> 팀원모집
    FOREIGN KEY (
      tm_id -- 팀번호
    )
    REFERENCES tm ( -- 팀
      tm_id -- 팀번호
    );

-- 팀원
ALTER TABLE tm_mbr
  ADD CONSTRAINT FK_tm_TO_tm_mbr -- 팀 -> 팀원
    FOREIGN KEY (
      tm_mbr_id -- 팀번호
    )
    REFERENCES tm ( -- 팀
      tm_id -- 팀번호
    );

-- 팀원
ALTER TABLE tm_mbr
  ADD CONSTRAINT FK_mbr_TO_tm_mbr -- 회원 -> 팀원
    FOREIGN KEY (
      mbr_id -- 회원번호
    )
    REFERENCES mbr ( -- 회원
      mbr_id -- 회원번호
    );

-- 댓글
ALTER TABLE cmt
  ADD CONSTRAINT FK_mbr_TO_cmt -- 회원 -> 댓글
    FOREIGN KEY (
      mbr_id -- 회원번호
    )
    REFERENCES mbr ( -- 회원
      mbr_id -- 회원번호
    );

-- 댓글
ALTER TABLE cmt
  ADD CONSTRAINT FK_free_TO_cmt -- 자유게시판 -> 댓글
    FOREIGN KEY (
      free_id -- 자유게시판번호
    )
    REFERENCES free ( -- 자유게시판
      free_id -- 자유게시판번호
    );

-- 경기
ALTER TABLE mtch
  ADD CONSTRAINT FK_tm_TO_mtch -- 팀 -> 경기
    FOREIGN KEY (
      tm_id -- 경기개설팀번호
    )
    REFERENCES tm ( -- 팀
      tm_id -- 팀번호
    );

-- 경기
ALTER TABLE mtch
  ADD CONSTRAINT FK_tm_TO_mtch2 -- 팀 -> 경기2
    FOREIGN KEY (
      tm_id2 -- 경기참여팀번호
    )
    REFERENCES tm ( -- 팀
      tm_id -- 팀번호
    );

-- 경기
ALTER TABLE mtch
  ADD CONSTRAINT FK_spt_clsf_TO_mtch -- 종목유형 -> 경기
    FOREIGN KEY (
      spt_clsf_id -- 종목유형번호
    )
    REFERENCES spt_clsf ( -- 종목유형
      spt_clsf_id -- 종목유형번호
    );

-- 경기태그
ALTER TABLE mtch_tag
  ADD CONSTRAINT FK_mtch_TO_mtch_tag -- 경기 -> 경기태그
    FOREIGN KEY (
      mtch_id -- 경기번호
    )
    REFERENCES mtch ( -- 경기
      mtch_id -- 경기번호
    );

-- 경기태그
ALTER TABLE mtch_tag
  ADD CONSTRAINT FK_mbr_TO_mtch_tag -- 회원 -> 경기태그
    FOREIGN KEY (
      mbr_id -- 회원번호
    )
    REFERENCES mbr ( -- 회원
      mbr_id -- 회원번호
    );

-- 경기신청
ALTER TABLE mtchaply
  ADD CONSTRAINT FK_tm_TO_mtchaply -- 팀 -> 경기신청
    FOREIGN KEY (
      tm_id -- 팀번호
    )
    REFERENCES tm ( -- 팀
      tm_id -- 팀번호
    );

-- 경기신청
ALTER TABLE mtchaply
  ADD CONSTRAINT FK_mtch_TO_mtchaply -- 경기 -> 경기신청
    FOREIGN KEY (
      mtch_id -- 경기번호
    )
    REFERENCES mtch ( -- 경기
      mtch_id -- 경기번호
    );

-- 팀경고
ALTER TABLE warn
  ADD CONSTRAINT FK_tm_TO_warn -- 팀 -> 팀경고
    FOREIGN KEY (
      tm_id -- 팀번호
    )
    REFERENCES tm ( -- 팀
      tm_id -- 팀번호
    );

-- 시군구지역
ALTER TABLE midlc
  ADD CONSTRAINT FK_toplc_TO_midlc -- 시도지역 -> 시군구지역
    FOREIGN KEY (
      toplc_id -- 시도지역번호
    )
    REFERENCES toplc ( -- 시도지역
      toplc_id -- 시도지역번호
    );

-- 읍면동지역
ALTER TABLE btmlc
  ADD CONSTRAINT FK_midlc_TO_btmlc -- 시군구지역 -> 읍면동지역
    FOREIGN KEY (
      midlc_id -- 시군구지역번호
    )
    REFERENCES midlc ( -- 시군구지역
      midlc_id -- 시군구지역번호
    );

-- 답변
ALTER TABLE ans
  ADD CONSTRAINT FK_qstn_TO_ans -- 질문 -> 답변
    FOREIGN KEY (
      qstn_id -- 질문게시판번호
    )
    REFERENCES qstn ( -- 질문
      qstn_id -- 질문게시판번호
    );

-- 공지사항
ALTER TABLE anunc
  ADD CONSTRAINT FK_mbr_TO_anunc -- 회원 -> 공지사항
    FOREIGN KEY (
      mbr_id -- 회원번호
    )
    REFERENCES mbr ( -- 회원
      mbr_id -- 회원번호
    );