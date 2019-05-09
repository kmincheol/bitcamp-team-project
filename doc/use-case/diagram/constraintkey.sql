-- 제약조건 삭제
ALTER TABLE mbr
    DROP CONSTRAINT gndr;
    
ALTER TABLE mbr
    DROP CONSTRAINT login_type;

ALTER TABLE mbr
    DROP CONSTRAINT stat;
    
ALTER TABLE rcrm
    DROP CONSTRAINT rcrm_prsn;
    
ALTER TABLE tmlevel
    DROP CONSTRAINT team_level;
    
ALTER TABLE tmtype
    DROP CONSTRAINT team_type;
    
ALTER TABLE age
    DROP CONSTRAINT ages;
    
ALTER TABLE spt_clsf
    DROP CONSTRAINT spt_clsf_name;
    
ALTER TABLE revw
    DROP CONSTRAINT gpa;
    
ALTER TABLE qstn
    DROP CONSTRAINT qstn_type;


-- 제약조건추가

-- 성별
ALTER TABLE mbr 
ADD CONSTRAINT gndr 
CHECK (gndr IN('남','여'));

-- 로그인유형
ALTER TABLE mbr 
ADD CONSTRAINT login_type 
CHECK (login_type IN('homepage','facebook','google','kakao'));

-- 회원상태
ALTER TABLE mbr 
ADD CONSTRAINT stat 
CHECK (stat IN('정상','1차경고','2차경고'));

-- 팀원모집 모집인원
ALTER TABLE rcrm
ADD CONSTRAINT rcrm_prsn
CHECK (rcrm_prsn > 0);

-- 팀수준명
ALTER TABLE tmlevel 
ADD CONSTRAINT team_level 
CHECK (team_level IN('상','중','하'));

-- 팀유형명
ALTER TABLE tmtype 
ADD CONSTRAINT team_type 
CHECK (team_type IN('동호회','동아리','스포츠모임'));

-- 연령
ALTER TABLE age 
ADD CONSTRAINT ages 
CHECK (ages IN('10세미만','10대','20대','30대','40대','50대','60대','70세이상'));

-- 종목
ALTER TABLE spt_clsf 
ADD CONSTRAINT spt_clsf_name 
CHECK (spt_clsf_name IN('축구','야구','농구','배구'));

-- 후기게시판 별점수
ALTER TABLE revw 
ADD CONSTRAINT gpa 
CHECK (gpa IN(0,1,2,3,4,5));

-- 문의유형
ALTER TABLE qstn 
ADD CONSTRAINT qstn_type 
CHECK (qstn_type IN('회원정보','경기','팀정보','기타'));









