-- 후기게시판
DROP TABLE IF EXISTS revw RESTRICT;

-- 종목유형
DROP TABLE IF EXISTS spt_clsf RESTRICT;

-- 첨부파일
DROP TABLE IF EXISTS atch_file RESTRICT;

-- 게시글
DROP TABLE IF EXISTS post RESTRICT;

-- 팀
DROP TABLE IF EXISTS tm RESTRICT;

-- 질문게시판
DROP TABLE IF EXISTS qstn RESTRICT;

-- 팀원모집
DROP TABLE IF EXISTS rcrm RESTRICT;

-- 회원
DROP TABLE IF EXISTS mbr RESTRICT;

-- 팀원
DROP TABLE IF EXISTS tm_mbr RESTRICT;

-- 댓글작성
DROP TABLE IF EXISTS ripple RESTRICT;

-- 경기
DROP TABLE IF EXISTS mtch RESTRICT;

-- 태그
DROP TABLE IF EXISTS tag RESTRICT;

-- 경기신청
DROP TABLE IF EXISTS mtchapply RESTRICT;

-- 팀경고
DROP TABLE IF EXISTS warning RESTRICT;

-- 시도지역
DROP TABLE IF EXISTS toplocation RESTRICT;

-- 시군구지역
DROP TABLE IF EXISTS midlocation RESTRICT;

-- 읍면동지역
DROP TABLE IF EXISTS btmlocation RESTRICT;

-- 연령대
DROP TABLE IF EXISTS age RESTRICT;

-- 팀유형
DROP TABLE IF EXISTS tmtype RESTRICT;

-- 팀수준
DROP TABLE IF EXISTS tmlevel RESTRICT;

-- 게시판유형
DROP TABLE IF EXISTS boardtype RESTRICT;

-- 답변게시글
DROP TABLE IF EXISTS answer RESTRICT;

-- 후기게시판
CREATE TABLE revw (
post_id INTEGER(30) NOT NULL COMMENT '경기번호', -- 경기번호
tm_id   INTEGER(30) NOT NULL COMMENT '평가팀', -- 평가팀
tm_id2  INTEGER(30) NOT NULL COMMENT '피평가팀', -- 피평가팀
cont    TEXT        NULL     COMMENT '내용', -- 내용
gpa     INTEGER     NOT NULL COMMENT '별점수' -- 별점수
)
COMMENT '후기게시판';

-- 후기게시판
ALTER TABLE revw
ADD CONSTRAINT PK_revw -- 후기게시판 기본키
PRIMARY KEY (
post_id, -- 경기번호
tm_id,   -- 평가팀
tm_id2   -- 피평가팀
);

-- 종목유형
CREATE TABLE spt_clsf (
spt_clsf_id INTEGER(30)  NOT NULL COMMENT '종목유형번호', -- 종목유형번호
spt_clsf    VARCHAR(255) NULL     COMMENT '종목' -- 종목
)
COMMENT '종목유형';

-- 종목유형
ALTER TABLE spt_clsf
ADD CONSTRAINT PK_spt_clsf -- 종목유형 기본키
PRIMARY KEY (
spt_clsf_id -- 종목유형번호
);

-- 첨부파일
CREATE TABLE atch_file (
atch_file_id INTEGER(30)  NOT NULL COMMENT '첨부파일번호', -- 첨부파일번호
post_id      INTEGER(30)  NOT NULL COMMENT '게시글번호', -- 게시글번호
phot         VARCHAR(255) NULL     COMMENT '파일경로', -- 파일경로
video        INTEGER      NULL     COMMENT '파일유형' -- 파일유형
)
COMMENT '첨부파일';

-- 첨부파일
ALTER TABLE atch_file
ADD CONSTRAINT PK_atch_file -- 첨부파일 기본키
PRIMARY KEY (
atch_file_id -- 첨부파일번호
);

-- 게시글
CREATE TABLE post (
post_id      INTEGER(30)  NOT NULL COMMENT '게시글번호', -- 게시글번호
mbr_id       INTEGER(30)  NOT NULL COMMENT '회원번호', -- 회원번호
boardtype_id INTEGER(30)  NULL     COMMENT '게시판유형번호', -- 게시판유형번호
titl         VARCHAR(50)  NOT NULL COMMENT '제목', -- 제목
cont         TEXT         NOT NULL COMMENT '내용', -- 내용
vw_cnt       INTEGER      NOT NULL COMMENT '조회수', -- 조회수
cdt          DATETIME     NOT NULL COMMENT '작성일', -- 작성일
mdt          DATETIME     NOT NULL COMMENT '최근수정일', -- 최근수정일
stat         VARCHAR(20)  NOT NULL COMMENT '게시글처리상태', -- 게시글처리상태
del_res      VARCHAR(255) NULL     COMMENT '차단이유', -- 차단이유
tpost_id     INTEGER(30)  NULL     COMMENT '상위게시글번호' -- 상위게시글번호
)
COMMENT '게시글';

-- 게시글
ALTER TABLE post
ADD CONSTRAINT PK_post -- 게시글 기본키
PRIMARY KEY (
post_id -- 게시글번호
);

-- 팀
CREATE TABLE tm (
tm_id        INTEGER(30)  NOT NULL COMMENT '팀번호', -- 팀번호
name         VARCHAR(50)  NOT NULL COMMENT '팀명', -- 팀명
tm_intd      VARCHAR(255) NULL     COMMENT '팀소개', -- 팀소개
area         VARCHAR(100) NOT NULL COMMENT '지역', -- 지역
age_id       INTEGER(30)  NOT NULL COMMENT '연령대번호', -- 연령대번호
tmtype_id    INTEGER(30)  NOT NULL COMMENT '팀유형번호', -- 팀유형번호
tmlevel_id   INTEGER(30)  NOT NULL COMMENT '팀수준번호', -- 팀수준번호
spt_clsf_id  INTEGER(30)  NOT NULL COMMENT '종목유형번호', -- 종목유형번호
tm_ambl_phot VARCHAR(255) NOT NULL COMMENT '팀앰블럼사진경로', -- 팀앰블럼사진경로
tm_unf_wth   BOOLEAN      NOT NULL COMMENT '팀유니폼여부', -- 팀유니폼여부
tm_unf_phot  VARCHAR(50)  NULL     COMMENT '팀유니폼사진', -- 팀유니폼사진
cdt          DATETIME     NOT NULL COMMENT '팀개설일자', -- 팀개설일자
ddt          DATETIME     NOT NULL COMMENT '팀폐쇄일자', -- 팀폐쇄일자
del_res      VARCHAR(255) NULL     COMMENT '팀폐쇄이유', -- 팀폐쇄이유
mdt          DATETIME     NOT NULL COMMENT '팀정보수정일자' -- 팀정보수정일자
)
COMMENT '팀';

-- 팀
ALTER TABLE tm
ADD CONSTRAINT PK_tm -- 팀 기본키
PRIMARY KEY (
tm_id -- 팀번호
);

-- 질문게시판
CREATE TABLE qstn (
qstn_id   INTEGER(30)  NOT NULL COMMENT '질문게시판번호', -- 질문게시판번호
qstn_type VARCHAR(255) NOT NULL COMMENT '문의유형', -- 문의유형
ansr_stat VARCHAR(20)  NOT NULL COMMENT '답변상태' -- 답변상태
)
COMMENT '질문게시판';

-- 질문게시판
ALTER TABLE qstn
ADD CONSTRAINT PK_qstn -- 질문게시판 기본키
PRIMARY KEY (
qstn_id -- 질문게시판번호
);

-- 팀원모집
CREATE TABLE rcrm (
post_id   INTEGER(30) NOT NULL COMMENT '게시글번호', -- 게시글번호
tm_id     INTEGER(30) NULL     COMMENT '팀번호', -- 팀번호
rcrm_stat VARCHAR(20) NOT NULL COMMENT '모집상태', -- 모집상태
rcrm_prsn INTEGER     NULL     COMMENT '모집인원' -- 모집인원
)
COMMENT '팀원모집';

-- 팀원모집
ALTER TABLE rcrm
ADD CONSTRAINT PK_rcrm -- 팀원모집 기본키
PRIMARY KEY (
post_id -- 게시글번호
);

-- 회원
CREATE TABLE mbr (
mbr_id     INTEGER(30)  NOT NULL COMMENT '회원번호', -- 회원번호
user_id    VARCHAR(16)  NOT NULL COMMENT '유저아이디',
pwd        VARCHAR(20)  NOT NULL COMMENT '비밀번호', -- 비밀번호
name       VARCHAR(50)  NOT NULL COMMENT '이름', -- 이름
bth_dt     DATETIME     NOT NULL COMMENT '생년월일', -- 생년월일
gndr       CHAR(2)      NOT NULL COMMENT '성별', -- 성별
tel        VARCHAR(30)  NOT NULL COMMENT '휴대폰번호', -- 휴대폰번호
email      VARCHAR(40)  NULL     COMMENT '이메일', -- 이메일
bas_addr   VARCHAR(255) NULL     COMMENT '기본주소', -- 기본주소
det_addr   VARCHAR(255) NULL     COMMENT '상세주소', -- 상세주소
prof_phot  VARCHAR(255) NULL     COMMENT '프로필사진', -- 프로필사진
s_intd     VARCHAR(255) NULL     COMMENT '자기소개', -- 자기소개
pid_scop   VARCHAR(255) NOT NULL COMMENT '개인정보공개범위', -- 개인정보공개범위
login_type VARCHAR(255) NOT NULL COMMENT '로그인유형', -- 로그인유형
stat       VARCHAR(255) NOT NULL COMMENT '상태', -- 상태
cdt        DATETIME     NOT NULL COMMENT '가입일', -- 가입일
lcd        DATETIME     NOT NULL COMMENT '최근접속일', -- 최근접속일
wthd_wth   BOOLEAN      NOT NULL COMMENT '탈퇴여부', -- 탈퇴여부
wthd_res   VARCHAR(255) NULL     COMMENT '탈퇴이유', -- 탈퇴이유
wthd_dt    DATETIME     NOT NULL COMMENT '탈퇴날짜', -- 탈퇴날짜
mgr        BOOLEAN      NULL     COMMENT '관리자여부' -- 관리자여부
)
COMMENT '회원';

-- 회원
ALTER TABLE mbr
ADD CONSTRAINT PK_mbr -- 회원 기본키
PRIMARY KEY (
mbr_id -- 회원번호
);

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

-- 댓글작성
CREATE TABLE ripple (
ripple_id  INTEGER(30)  NOT NULL COMMENT '댓글번호', -- 댓글번호
post_id    INTEGER(30)  NOT NULL COMMENT '게시글번호', -- 게시글번호
pcd  VARCHAR(30)  NOT NULL COMMENT '순서', -- 순서
level      VARCHAR(30)  NOT NULL COMMENT '단계', -- 단계
cmt_cont   VARCHAR(255) NOT NULL COMMENT '댓글내용', -- 댓글내용
write_time DATETIME     NOT NULL COMMENT '작성일시' -- 작성일시
)
COMMENT '댓글작성';

-- 댓글작성
ALTER TABLE ripple
ADD CONSTRAINT PK_ripple -- 댓글작성 기본키
PRIMARY KEY (
ripple_id -- 댓글번호
);

-- 경기
CREATE TABLE mtch (
post_id   INTEGER(30)  NOT NULL COMMENT '경기번호', -- 경기번호
tm_id     INTEGER(30)  NOT NULL COMMENT '경기개설팀번호', -- 경기개설팀번호
tm_id2    INTEGER(30)  NULL     COMMENT '경기참여팀번호', -- 경기참여팀번호
game_dt   DATETIME     NOT NULL COMMENT '경기날짜', -- 경기날짜
area      VARCHAR(100) NOT NULL COMMENT '지역', -- 지역
stdm_psti VARCHAR(255) NULL     COMMENT '경기장이름', -- 경기장이름
stdm_lat  VARCHAR(100) NULL     COMMENT '경기장위치위도', -- 경기장위치위도
stdm_long VARCHAR(100) NULL     COMMENT '경기장위치경도', -- 경기장위치경도
tel       VARCHAR(30)  NOT NULL COMMENT '연락처', -- 연락처
cost      INTEGER      NULL     COMMENT '비용' -- 비용
)
COMMENT '경기';

-- 경기
ALTER TABLE mtch
ADD CONSTRAINT PK_mtch -- 경기 기본키
PRIMARY KEY (
post_id -- 경기번호
);

-- 태그
CREATE TABLE tag (
tag_id   INTEGER(30) NOT NULL COMMENT '태그번호', -- 태그번호
post_id  INTEGER(30)  NOT NULL COMMENT '게시글번호', -- 게시글번호
tag_name VARCHAR(50)  NULL     COMMENT '태그이름' -- 태그이름
)
COMMENT '태그';

-- 태그
ALTER TABLE tag
ADD CONSTRAINT PK_tag -- 태그 기본키
PRIMARY KEY (
tag_id -- 태그번호
);

-- 경기신청
CREATE TABLE mtchapply (
tm_id      INTEGER(30) NOT NULL COMMENT '팀번호', -- 팀번호
post_id    INTEGER(30) NOT NULL COMMENT '경기번호', -- 경기번호
apply_date DATETIME    NOT NULL COMMENT '신청일', -- 신청일
apply_stat VARCHAR(20) NOT NULL COMMENT '신청상태' -- 신청상태
)
COMMENT '경기신청';

-- 경기신청
ALTER TABLE mtchapply
ADD CONSTRAINT PK_mtchapply -- 경기신청 기본키
PRIMARY KEY (
tm_id,   -- 팀번호
post_id  -- 경기번호
);

-- 팀경고
CREATE TABLE warning (
warning_id     INTEGER(30) NOT NULL COMMENT '팀경고번호', -- 팀경고번호
warning_reason TEXT        NOT NULL COMMENT '경고사유', -- 경고사유
warning_date   DATETIME    NOT NULL COMMENT '경고일', -- 경고일
tm_id          INTEGER(30) NULL     COMMENT '팀번호' -- 팀번호
)
COMMENT '팀경고';

-- 팀경고
ALTER TABLE warning
ADD CONSTRAINT PK_warning -- 팀경고 기본키
PRIMARY KEY (
warning_id -- 팀경고번호
);

-- 시도지역
CREATE TABLE toplocation (
toplocation_id INTEGER(30) NOT NULL COMMENT '시도지역번호', -- 시도지역번호
name           VARCHAR(50) NOT NULL COMMENT '이름' -- 이름
)
COMMENT '시도지역';

-- 시도지역
ALTER TABLE toplocation
ADD CONSTRAINT PK_toplocation -- 시도지역 기본키
PRIMARY KEY (
toplocation_id -- 시도지역번호
);

-- 시군구지역
CREATE TABLE midlocation (
midlocation_id INTEGER(30) NOT NULL COMMENT '시군구지역번호', -- 시군구지역번호
name           VARCHAR(50) NULL     COMMENT '이름', -- 이름
toplocation_id INTEGER(30) NULL     COMMENT '시도지역번호' -- 시도지역번호
)
COMMENT '시군구지역';

-- 시군구지역
ALTER TABLE midlocation
ADD CONSTRAINT PK_midlocation -- 시군구지역 기본키
PRIMARY KEY (
midlocation_id -- 시군구지역번호
);

-- 읍면동지역
CREATE TABLE btmlocation (
btmlocation_id INTEGER(30) NOT NULL COMMENT '읍면동지역번호', -- 읍면동지역번호
name           VARCHAR(50) NULL     COMMENT '이름', -- 이름
midlocation_id INTEGER(30) NULL     COMMENT '시군구지역번호' -- 시군구지역번호
)
COMMENT '읍면동지역';

-- 읍면동지역
ALTER TABLE btmlocation
ADD CONSTRAINT PK_btmlocation -- 읍면동지역 기본키
PRIMARY KEY (
btmlocation_id -- 읍면동지역번호
);

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
CREATE TABLE tmtype (
tmtype_id INTEGER(30) NOT NULL COMMENT '팀유형번호', -- 팀유형번호
team_type VARCHAR(50) NULL     COMMENT '팀유형명' -- 팀유형명
)
COMMENT '팀유형';

-- 팀유형
ALTER TABLE tmtype
ADD CONSTRAINT PK_tmtype -- 팀유형 기본키
PRIMARY KEY (
tmtype_id -- 팀유형번호
);

-- 팀수준
CREATE TABLE tmlevel (
tmlevel_id INTEGER(30) NOT NULL COMMENT '팀수준번호', -- 팀수준번호
team_level VARCHAR(50) NULL     COMMENT '팀수준명' -- 팀수준명
)
COMMENT '팀수준';

-- 팀수준
ALTER TABLE tmlevel
ADD CONSTRAINT PK_tmlevel -- 팀수준 기본키
PRIMARY KEY (
tmlevel_id -- 팀수준번호
);

-- 게시판유형
CREATE TABLE boardtype (
boardtype_id   INTEGER(30) NOT NULL COMMENT '게시판유형번호', -- 게시판유형번호
boardtype_name VARCHAR(50) NOT NULL COMMENT '게시판유형명' -- 게시판유형명
)
COMMENT '게시판유형';

-- 게시판유형
ALTER TABLE boardtype
ADD CONSTRAINT PK_boardtype -- 게시판유형 기본키
PRIMARY KEY (
boardtype_id -- 게시판유형번호
);

-- 답변게시글
CREATE TABLE answer (
post_id      INTEGER(30) NOT NULL COMMENT '게시글번호', -- 게시글번호
answers      TEXT        NOT NULL COMMENT '답변', -- 답변
answers_date DATETIME    NOT NULL COMMENT '답변일' -- 답변일
)
COMMENT '답변게시글';

-- 답변게시글
ALTER TABLE answer
ADD CONSTRAINT PK_answer -- 답변게시글 기본키
PRIMARY KEY (
post_id -- 게시글번호
);

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
post_id -- 경기번호
)
REFERENCES mtch ( -- 경기
post_id -- 경기번호
);

-- 첨부파일
ALTER TABLE atch_file
ADD CONSTRAINT FK_post_TO_atch_file -- 게시글 -> 첨부파일
FOREIGN KEY (
post_id -- 게시글번호
)
REFERENCES post ( -- 게시글
post_id -- 게시글번호
);

-- 게시글
ALTER TABLE post
ADD CONSTRAINT FK_mbr_TO_post -- 회원 -> 게시글
FOREIGN KEY (
mbr_id -- 회원번호
)
REFERENCES mbr ( -- 회원
mbr_id -- 회원번호
);

-- 게시글
ALTER TABLE post
ADD CONSTRAINT FK_boardtype_TO_post -- 게시판유형 -> 게시글
FOREIGN KEY (
boardtype_id -- 게시판유형번호
)
REFERENCES boardtype ( -- 게시판유형
boardtype_id -- 게시판유형번호
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
ADD CONSTRAINT FK_tmtype_TO_tm -- 팀유형 -> 팀
FOREIGN KEY (
tmtype_id -- 팀유형번호
)
REFERENCES tmtype ( -- 팀유형
tmtype_id -- 팀유형번호
);

-- 팀
ALTER TABLE tm
ADD CONSTRAINT FK_tmlevel_TO_tm -- 팀수준 -> 팀
FOREIGN KEY (
tmlevel_id -- 팀수준번호
)
REFERENCES tmlevel ( -- 팀수준
tmlevel_id -- 팀수준번호
);

-- 팀원모집
ALTER TABLE rcrm
ADD CONSTRAINT FK_post_TO_rcrm -- 게시글 -> 팀원모집
FOREIGN KEY (
post_id -- 게시글번호
)
REFERENCES post ( -- 게시글
post_id -- 게시글번호
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

-- 댓글작성
ALTER TABLE ripple
ADD CONSTRAINT FK_post_TO_ripple -- 게시글 -> 댓글작성
FOREIGN KEY (
post_id -- 게시글번호
)
REFERENCES post ( -- 게시글
post_id -- 게시글번호
);

-- 경기
ALTER TABLE mtch
ADD CONSTRAINT FK_post_TO_mtch -- 게시글 -> 경기
FOREIGN KEY (
post_id -- 경기번호
)
REFERENCES post ( -- 게시글
post_id -- 게시글번호
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

-- 태그
ALTER TABLE tag
ADD CONSTRAINT FK_post_TO_tag -- 게시글 -> 태그
FOREIGN KEY (
post_id -- 게시글번호
)
REFERENCES post ( -- 게시글
post_id -- 게시글번호
);

-- 경기신청
ALTER TABLE mtchapply
ADD CONSTRAINT FK_tm_TO_mtchapply -- 팀 -> 경기신청
FOREIGN KEY (
tm_id -- 팀번호
)
REFERENCES tm ( -- 팀
tm_id -- 팀번호
);

-- 경기신청
ALTER TABLE mtchapply
ADD CONSTRAINT FK_mtch_TO_mtchapply -- 경기 -> 경기신청
FOREIGN KEY (
post_id -- 경기번호
)
REFERENCES mtch ( -- 경기
post_id -- 경기번호
);

-- 팀경고
ALTER TABLE warning
ADD CONSTRAINT FK_tm_TO_warning -- 팀 -> 팀경고
FOREIGN KEY (
tm_id -- 팀번호
)
REFERENCES tm ( -- 팀
tm_id -- 팀번호
);

-- 시군구지역
ALTER TABLE midlocation
ADD CONSTRAINT FK_toplocation_TO_midlocation -- 시도지역 -> 시군구지역
FOREIGN KEY (
toplocation_id -- 시도지역번호
)
REFERENCES toplocation ( -- 시도지역
toplocation_id -- 시도지역번호
);

-- 읍면동지역
ALTER TABLE btmlocation
ADD CONSTRAINT FK_midlocation_TO_btmlocation -- 시군구지역 -> 읍면동지역
FOREIGN KEY (
midlocation_id -- 시군구지역번호
)
REFERENCES midlocation ( -- 시군구지역
midlocation_id -- 시군구지역번호
);

-- 답변게시글
ALTER TABLE answer
ADD CONSTRAINT FK_post_TO_answer -- 게시글 -> 답변게시글
FOREIGN KEY (
post_id -- 게시글번호
)
REFERENCES post ( -- 게시글
post_id -- 게시글번호
);