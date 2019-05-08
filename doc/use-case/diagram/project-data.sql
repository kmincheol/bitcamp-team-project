-- 게시판 예제 데이터
insert into boardtype(boardtype_id, boardtype_name)
values(1, '자유게시판');
insert into boardtype(boardtype_id, boardtype_name)
values(2, '모집게시판');
insert into boardtype(boardtype_id, boardtype_name)
values(3, '공지사항게시판');
insert into boardtype(boardtype_id, boardtype_name)
values(4, '매치보드게시판');
insert into boardtype(boardtype_id, boardtype_name)
values(5, '고객센터');
insert into boardtype(boardtype_id, boardtype_name)se
values(6, '개인정보');
insert into boardtype(boardtype_id, boardtype_name)
values(7, '나의팀정보');
insert into boardtype(boardtype_id, boardtype_name)
values(8, '질문게시판');

insert into mbr(
mbr_id,
user_id,
pwd,
name,
bth_dt,
gndr,
tel,
email,
bas_addr,
det_addr,
prof_phot,
s_intd,
pid_scop,
login_type,
stat,
cdt,
lcd,
wthd_wth,
wthd_res,
wthd_dt,
mgr
)
values(1,'testId','tt','김민철','1995-5-5','남','010-1111-1111','test@com','비트캠프','강남','aaaa','안녕','1','face','정상','2020-2-2','2020-2-2',false,'그냥','2020-2-2',true);

insert into post(
post_id,
mbr_id,
boardtype_id,
titl,
cont,
vw_cnt,
cdt,
mdt,
stat,
del_res
)
values(1,1,1,'test','testtest','1','2020-2-2','2020-2-2','정상','그냥');

insert into post(
post_id,
mbr_id,
boardtype_id,
titl,
cont,
vw_cnt,
cdt,
mdt,
stat,
del_res
)
values(2,1,2,'test','testtest','1','2020-2-2','2020-2-2','정상','그냥');


