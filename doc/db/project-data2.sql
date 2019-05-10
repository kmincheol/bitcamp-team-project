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
insert into boardtype(boardtype_id, boardtype_name)
values(6, '개인정보');
insert into boardtype(boardtype_id, boardtype_name)
values(7, '나의팀정보');
insert into boardtype(boardtype_id, boardtype_name)
values(8, '질문게시판');

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

-- 태그데이터
insert into tag(tag_id,post_id,tag_name)
values(1,1,'test');
insert into tag(tag_id,post_id,tag_name)
values(2,1,'test2');
insert into tag(tag_id,post_id,tag_name)
values(3,1,'test3');

-- 첨부파일데이터
insert into atch_file(atch_file_id,post_id,phot,video)
values(1,1,'pathroot',1);
insert into atch_file(atch_file_id,post_id,phot,video)
values(2,1,'pathroot',1);
insert into atch_file(atch_file_id,post_id,phot,video)
values(3,1,'pathroot',1);