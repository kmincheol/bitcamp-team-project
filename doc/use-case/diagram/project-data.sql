<<<<<<< HEAD
-- 팀원 모집 게시판 데이터 테이블
insert into rcrm(rcrm_id, tm_id, titl, cont, vw_cnt, cdt, mdt, rcrm_stat, rcrm_prsn)
values(10, 1, '모집합니다.', '모집',1,'2020-2-2','2020-3-3','모집중', 3);

-- 팀 데이터 테이블
insert into tm(tm_id,name,tm_intd,area,age_id,tmtype_id,tmlevel_id,spt_clsf_id,tm_ambl_phot,tm_unf_wth,tm_unf_phot,cdt,mdt)
values(1,'testteam','test입니다','강남',1,1,1,1,'/team',true,'/hi','2016-05-12','2017-05-15');

--팀종목유형데이터 테이블
insert into spt_clsf(spt_clsf_id,spt_clsf)
values(1,'aaaa');

--팀유형 데이터 테이블
insert into tmtype(tmtype_id,team_type)
values(1,'직장인');

--팀수준 데이터 테이블
insert into tmlevel(tmlevel_id,team_level)
values(1,'상');

--연령대 데이터 테이블
insert into age(age_id,ages)
values(1,'20대');


--회원데이터
insert into mbr(mbr_id,user_id,pwd,name,bth_dt,gndr,tel,bas_addr,det_addr,login_type)
values(1,'testId','1111','김민철','1995-5-5','남','010-1111-1111','비트캠프','강남','face');
insert into mbr(mbr_id,user_id,pwd,name,bth_dt,gndr,tel,bas_addr,det_addr,login_type)
values(2,'test2','1111','test2','1991-01-01','남','010-1234-5678','서울','강남','kakao');
insert into mbr(mbr_id,user_id,pwd,name,bth_dt,gndr,tel,bas_addr,det_addr,login_type)
values(3,'test3','1111','test3','1981-01-01','여','010-3334-5555','부산','해운대','google');

--게시판데이터
insert into post(post_id,mbr_id,boardtype_id,titl,cont)
values(1,1,1,'test1','testtest1');
insert into post(post_id,mbr_id,boardtype_id,titl,cont)
values(2,1,1,'test2','testtest2');
insert into post(post_id,mbr_id,boardtype_id,titl,cont)
values(3,1,1,'test3','testtest3');


=======
--회원데이터
insert into mbr(mbr_id,user_id,pwd,name,bth_dt,gndr,tel,bas_addr,det_addr,login_type)
values(1,'testId','1111','김민철','1995-5-5','남','010-1111-1111','비트캠프','강남','face');
insert into mbr(mbr_id,user_id,pwd,name,bth_dt,gndr,tel,bas_addr,det_addr,login_type)
values(2,'test2','1111','test2','1991-01-01','남','010-1234-5678','서울','강남','kakao');
insert into mbr(mbr_id,user_id,pwd,name,bth_dt,gndr,tel,bas_addr,det_addr,login_type)
values(3,'test3','1111','test3','1981-01-01','여','010-3334-5555','부산','해운대','google');

--게시판데이터
insert into free(free_id,mbr_id,titl,cont)
values(1,1,"제목입니다1","내용입니다2");
insert into free(free_id,mbr_id,titl,cont)
values(2,1,"제목입니다1","내용입니다2");
insert into free(free_id,mbr_id,titl,cont)
values(3,1,"제목입니다1","내용입니다3");
insert into free(free_id,mbr_id,titl,cont)
values(4,1,"제목입니다4","내용입니다3");
insert into free(free_id,mbr_id,titl,cont)
values(5,1,"제목입니다5","내용입니다3");
insert into free(free_id,mbr_id,titl,cont)
values(6,1,"제목입니다6","내용입니다3");
insert into free(free_id,mbr_id,titl,cont)
values(7,1,"제목입니다7","내용입니다3");
insert into free(free_id,mbr_id,titl,cont)
values(8,1,"제목입니다8","내용입니다3");
insert into free(free_id,mbr_id,titl,cont)
values(9,1,"제목입니다9","내용입니다3");
insert into free(free_id,mbr_id,titl,cont)
values(10,1,"제목입니다10","내용입니다3");



--팀데이터
insert into tm(tm_id,name,tm_intd,area,age_id,tmtype_id,tmlevel_id,spt_clsf_id,tm_ambl_phot,
  tm_unf_wth,tm_unf_phot,cdt,ddt,del_res,mdt)
values(1,'testteam','test입니다','강남',1,1,1,1,'/team',true,'/hi','2015-02-37','2016-05-12','민철이때문','2017-05-15');

--팀종목유형데이터
insert into spt_clsf(spt_clsf_id,spt_clsf)
values(1,'aaaa');

--팀유형 데이터
insert into tmtype(tmtype_id,team_type)
values(1,'직장인');

--팀수준 데이터
insert into tmlevel(tmlevel_id,team_level)
values(1,'상');

--연령대 데이터
insert into age(age_id,ages)
values(1,'20대');




















>>>>>>> refs/heads/free
