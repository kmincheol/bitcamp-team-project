-- 회원데이터
insert into mbr(mbr_id,user_id,pwd,name,bth_dt,gndr,tel,email,post,bas_addr,det_addr,login_type, mgr)
values(1,'testId',password('1111'),'김민철','1995-5-5','남','010-1111-1111','babo@haha.com',11111,'비트캠프','강남','face', 1);
insert into mbr(mbr_id,user_id,pwd,name,bth_dt,gndr,tel,email,post,bas_addr,det_addr,login_type)
values(2,'test2',password('1111'),'홍길동','1991-01-01','남','010-1234-5678','test2@bot.com',11112,'서울','강남','kakao');
insert into mbr(mbr_id,user_id,pwd,name,bth_dt,gndr,tel,email,post,bas_addr,det_addr,login_type)
values(3,'test3',password('1111'),'유관순','1981-01-01','여','010-3334-5555','test3@bot.com',44441,'부산','해운대','google');
insert into mbr(mbr_id,user_id,pwd,name,bth_dt,gndr,tel,email,post,bas_addr,det_addr,login_type)
values(4,'test4',password('1111'),'임꺽정','1992-5-5','남','010-1111-1221','test4@bot.com',11113,'서울시 서초구','강남','face');
insert into mbr(mbr_id,user_id,pwd,name,bth_dt,gndr,tel,email,post,bas_addr,det_addr,login_type)
values(5,'test5',password('1111'),'김구','1981-01-01','남','010-2234-5678','test5@bot.com',22221,'경기','고양','homepage');
insert into mbr(mbr_id,user_id,pwd,name,bth_dt,gndr,tel,email,post,bas_addr,det_addr,login_type)
values(6,'test6',password('1111'),'원빈','1967-01-01','여','010-5334-5555','test6@bot.com',33331,'인천','연수동','google');
insert into mbr(mbr_id,user_id,pwd,name,bth_dt,gndr,tel,email,post,bas_addr,det_addr,login_type)
values(7,'test7',password('1111'),'현빈','1967-01-01','여','010-5334-5255','test7@bot.com',33332,'인천','연수동','google');
insert into mbr(mbr_id,user_id,pwd,name,bth_dt,gndr,tel,email,post,bas_addr,det_addr,login_type)
values(8,'kiwon',password('1111'),'김태희','1967-01-01','여','010-1334-5255','test8@bot.com',33333,'인천','연수동','google');
insert into mbr(mbr_id,user_id,pwd,name,bth_dt,gndr,tel,email,post,bas_addr,det_addr,login_type)
values(9,'hoho',password('1111'),'이나영','1967-01-01','여','010-1322-5255','test9@gmail.com',33333,'인천','연수동','google');
insert into mbr(mbr_id,user_id,pwd,name,bth_dt,gndr,tel,email,post,bas_addr,det_addr,login_type)
values(10,'kmc',password('1111'),'김우빈','1967-01-01','여','010-1322-5253','kmc@gmail.com',33333,'인천','연수동','google');

insert into mbr(mbr_id,user_id,pwd,name,bth_dt,gndr,tel,email,post,bas_addr,det_addr,login_type)
values(11,'match1',password('1111'),'매치1','1967-01-01','남','010-1334-5255','test1@match.com',33333,'인천','연수동','google');
insert into mbr(mbr_id,user_id,pwd,name,bth_dt,gndr,tel,email,post,bas_addr,det_addr,login_type)
values(12,'match2',password('1111'),'매치2','1977-01-01','남','010-4512-5255','test2@match.com',33333,'인천','연수동','facebook');
insert into mbr(mbr_id,user_id,pwd,name,bth_dt,gndr,tel,email,post,bas_addr,det_addr,login_type)
values(13,'match3',password('1111'),'매치3','1987-01-01','남','010-1334-4741','test3@match.com',33333,'인천','연수동','kakao');
insert into mbr(mbr_id,user_id,pwd,name,bth_dt,gndr,tel,email,post,bas_addr,det_addr,login_type)
values(14,'match4',password('1111'),'매치4','1997-01-01','남','010-4523-5255','test4@match.com',33333,'인천','연수동','naver');
insert into mbr(mbr_id,user_id,pwd,name,bth_dt,gndr,tel,email,post,bas_addr,det_addr,login_type)
values(15,'match5',password('1111'),'매치5','1957-01-01','남','010-1334-7891','test5@match.com',33333,'인천','연수동','homepage');
insert into mbr(mbr_id,user_id,pwd,name,bth_dt,gndr,tel,email,post,bas_addr,det_addr,login_type)
values(16,'match6',password('1111'),'매치6','1955-01-01','여','010-7851-5255','test6@match.com',33333,'인천','연수동','google');
insert into mbr(mbr_id,user_id,pwd,name,bth_dt,gndr,tel,email,post,bas_addr,det_addr,login_type)
values(17,'match7',password('1111'),'매치7','1965-01-01','여','010-1334-5671','test7@match.com',33333,'인천','연수동','facebook');
insert into mbr(mbr_id,user_id,pwd,name,bth_dt,gndr,tel,email,post,bas_addr,det_addr,login_type)
values(18,'match8',password('1111'),'매치8','1979-01-01','여','010-5412-5255','test8@match.com',33333,'인천','연수동','kakao');
insert into mbr(mbr_id,user_id,pwd,name,bth_dt,gndr,tel,email,post,bas_addr,det_addr,login_type)
values(19,'match9',password('1111'),'매치9','1989-01-01','여','010-1334-4511','test9@match.com',33333,'인천','연수동','naver');
insert into mbr(mbr_id,user_id,pwd,name,bth_dt,gndr,tel,email,post,bas_addr,det_addr,login_type)
values(20,'match10',password('1111'),'매치10','1999-01-01','여','010-7744-5255','test10@match.com',33333,'인천','연수동','homepage');

insert into mbr(user_id,pwd,name,bth_dt,gndr,tel,email,post,bas_addr,det_addr,login_type)
values('1',password('1111'),'김기원','1990-01-01','남','010-1322-5253','kiki@gmail.com',33333,'인천','연수동','homepage');
insert into mbr(user_id,pwd,name,bth_dt,gndr,tel,email,post,bas_addr,det_addr,login_type)
values('2',password('1111'),'전상오','1992-01-01','남','010-1322-5253','jeonsangoh@gmail.com',33333,'인천','연수동','homepage');
insert into mbr(user_id,pwd,name,bth_dt,gndr,tel,email,post,bas_addr,det_addr,login_type)
values('3',password('1111'),'엄진영','1967-01-01','남','010-1322-5253','eom@gmail.com',33333,'인천','연수동','google');
insert into mbr(user_id,pwd,name,bth_dt,gndr,tel,email,post,bas_addr,det_addr,login_type)
values('4',password('1111'),'박재중','1994-01-01','남','010-1333-5233','park@gmail.com',33333,'인천','연수동','homepage');
insert into mbr(user_id,pwd,name,bth_dt,gndr,tel,email,post,bas_addr,det_addr,login_type)
values('5',password('1111'),'송광호','1990-01-01','남','010-1322-5253','song@gmail.com',33333,'인천','연수동','homepage');
insert into mbr(user_id,pwd,name,bth_dt,gndr,tel,email,post,bas_addr,det_addr,login_type)
values('6',password('1111'),'오승빈','1992-01-01','남','010-1322-5253','oh@gmail.com',33333,'인천','연수동','hompage');
insert into mbr(user_id,pwd,name,bth_dt,gndr,tel,email,post,bas_addr,det_addr,login_type)
values('7',password('1111'),'최익현','1967-01-01','남','010-1233-5333','choi@gmail.com',33333,'인천','연수동','homepage');
insert into mbr(user_id,pwd,name,bth_dt,gndr,tel,email,post,bas_addr,det_addr,login_type)
values('8',password('1111'),'우승완','1990-01-01','여','010-1322-5253','woo@gmail.com',33333,'인천','연수동','google');
insert into mbr(user_id,pwd,name,bth_dt,gndr,tel,email,post,bas_addr,det_addr,login_type)
values('9',password('1111'),'이대구','1960-01-01','여','010-1322-5253','kmc2@gmail.com',33333,'인천','연수동','homepage');
insert into mbr(user_id,pwd,name,bth_dt,gndr,tel,email,post,bas_addr,det_addr,login_type)
values('10',password('1111'),'김시진','1994-01-01','남','010-1322-5253','kimsi@gmail.com',33333,'인천','연수동','google');
insert into mbr(user_id,pwd,name,bth_dt,gndr,tel,email,post,bas_addr,det_addr,login_type)
values('11',password('1111'),'한성우','1967-01-01','남','010-1322-5253','han@gmail.com',33333,'인천','연수동','google');
insert into mbr(user_id,pwd,name,bth_dt,gndr,tel,email,post,bas_addr,det_addr,login_type)
values('12',password('1111'),'마동석','1967-01-01','여','010-1322-5253','ma@gmail.com',33333,'인천','연수동','google');
insert into mbr(user_id,pwd,name,bth_dt,gndr,tel,email,post,bas_addr,det_addr,login_type)
values('13',password('1111'),'엄티처','1967-01-01','남','010-1322-5253','eomcs@gmail.com',33333,'인천','연수동','google');
insert into mbr(user_id,pwd,name,bth_dt,gndr,tel,email,post,bas_addr,det_addr,login_type)
values('14',password('1111'),'설리','1994-01-01','여','010-1322-5253','seol@gmail.com',33333,'인천','연수동','google');
insert into mbr(user_id,pwd,name,bth_dt,gndr,tel,email,post,bas_addr,det_addr,login_type)
values('15',password('1111'),'가인','1988-01-01','여','010-1322-5253','gain@gmail.com',33333,'인천','연수동','google');
insert into mbr(user_id,pwd,name,bth_dt,gndr,tel,email,post,bas_addr,det_addr,login_type)
values('16',password('1111'),'이승엽','1970-01-01','남','010-1322-5253','pro@gmail.com',33333,'인천','연수동','google');
insert into mbr(user_id,pwd,name,bth_dt,gndr,tel,email,post,bas_addr,det_addr,login_type)
values('17',password('1111'),'류현진','1985-01-01','남','010-1322-5253','la@gmail.com',33333,'인천','연수동','google');
insert into mbr(user_id,pwd,name,bth_dt,gndr,tel,email,post,bas_addr,det_addr,login_type)
values('18',password('1111'),'손흥민','1992-01-01','남','010-1322-5253','son@gmail.com',33333,'인천','연수동','google');
insert into mbr(user_id,pwd,name,bth_dt,gndr,tel,email,post,bas_addr,det_addr,login_type)
values('19',password('1111'),'김메시','1988-01-01','남','010-1322-5253','messi@gmail.com',33333,'인천','연수동','google');
insert into mbr(user_id,pwd,name,bth_dt,gndr,tel,email,post,bas_addr,det_addr,login_type)
values('20',password('1111'),'손날두','1992-01-01','남','010-1322-5253','sons@gmail.com',33333,'인천','연수동','google');
insert into mbr(mbr_id,user_id,pwd,name,bth_dt,gndr,tel,email,post,bas_addr,det_addr,login_type)

values('21',password('1111'),'손민두','1992-01-01','남','010-1322-5353','so2ns22@gmail.com',33333,'인천','연수동','google','data:image/jpeg;base64,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');
insert into mbr(mbr_id,user_id,pwd,name,bth_dt,gndr,tel,email,post,bas_addr,det_addr,login_type,prof_phot)

-- 연령대데이터
insert into age(age_id, ages)
values(1,'under');
insert into age(age_id, ages)
values(10,'10대');
insert into age(age_id, ages)
values(20,'20대');
insert into age(age_id, ages)
values(30,'30대');
insert into age(age_id, ages)
values(40,'40대');
insert into age(age_id, ages)
values(50,'50대');
insert into age(age_id, ages)
values(60,'60대');
insert into age(age_id, ages)
values(70,'70세이상');

-- 팀유형데이터
insert into tm_type(tm_type_id,types)
values(1,'동호회');
insert into tm_type(tm_type_id,types)
values(2,'동아리');
insert into tm_type(tm_type_id,types)
values(3,'회사소모임');

-- 팀수준데이터
insert into tm_lev(tm_lev_id,levs)
values(1,'상');
insert into tm_lev(tm_lev_id,levs)
values(2,'중');
insert into tm_lev(tm_lev_id,levs)
values(3,'하');

-- 종목유형데이터
insert into spt_clsf(spt_clsf_id,spt_clsf_name)
values(1,'축구');
insert into spt_clsf(spt_clsf_id,spt_clsf_name)
values(2,'야구');
insert into spt_clsf(spt_clsf_id,spt_clsf_name)
values(3,'농구');
insert into spt_clsf(spt_clsf_id,spt_clsf_name)
values(4,'탁구');

-- 팀데이터
insert into tm(tm_id,name,area,age_id,tm_type_id,tm_lev_id,spt_clsf_id)
values(1,'비트캠프사커','0101','20','1','1','1');
insert into tm(tm_id,name,area,age_id,tm_type_id,tm_lev_id,spt_clsf_id)
values(2,'고양드래곤즈','0201','30','2','2','2');
insert into tm(tm_id,name,area,age_id,tm_type_id,tm_lev_id,spt_clsf_id)
values(3,'인천배스킷볼','0301','40','3','3','3');
insert into tm(tm_id,name,area,age_id,tm_type_id,tm_lev_id,spt_clsf_id)
values(4,'강남풋볼','0101','20','1','1','1');
insert into tm(tm_id,name,area,age_id,tm_type_id,tm_lev_id,spt_clsf_id)
values(5,'고양베어스','0201','30','2','2','2');
insert into tm(tm_id,name,area,age_id,tm_type_id,tm_lev_id,spt_clsf_id)
values(6,'연수농구단','0301','40','3','3','3');
insert into tm(tm_id,name,area,age_id,tm_type_id,tm_lev_id,spt_clsf_id)
values(7,'비트농구단','0301','40','3','3','3');
insert into tm(tm_id,name,area,age_id,tm_type_id,tm_lev_id,spt_clsf_id)
values(8,'롤게임','0301','40','3','3','3');
insert into tm(tm_id,name,tm_intd,area,age_id,tm_type_id,tm_lev_id,spt_clsf_id,cdt)
values(9,'테스트팀','우리팀은 테스트하는 팀입니다','010','30','3','3','3','2014-05-02');

insert into tm(tm_id,name,area,age_id,tm_type_id,tm_lev_id,spt_clsf_id)
values(10,'매치고고1','0101','10','1','1','1');
insert into tm(tm_id,name,area,age_id,tm_type_id,tm_lev_id,spt_clsf_id)
values(11,'매치고고2','0201','20','2','2','1');
insert into tm(tm_id,name,area,age_id,tm_type_id,tm_lev_id,spt_clsf_id)
values(12,'매치고고3','0301','30','3','3','1');
insert into tm(tm_id,name,area,age_id,tm_type_id,tm_lev_id,spt_clsf_id)
values(13,'매치고고4','0401','40','1','2','1');
insert into tm(tm_id,name,area,age_id,tm_type_id,tm_lev_id,spt_clsf_id)
values(14,'매치고고5','0501','50','2','1','1');
insert into tm(tm_id,name,area,age_id,tm_type_id,tm_lev_id,spt_clsf_id)
values(15,'매치고고6','0101','10','3','3','1');
insert into tm(tm_id,name,area,age_id,tm_type_id,tm_lev_id,spt_clsf_id)
values(16,'매치고고7','0201','20','1','3','1');
insert into tm(tm_id,name,area,age_id,tm_type_id,tm_lev_id,spt_clsf_id)
values(17,'매치고고8','0301','30','2','2','1');
insert into tm(tm_id,name,area,age_id,tm_type_id,tm_lev_id,spt_clsf_id)
values(18,'매치고고9','0401','40','3','1','1');
insert into tm(tm_id,name,area,age_id,tm_type_id,tm_lev_id,spt_clsf_id)
values(19,'매치고고10','0501','50','1','2','1');

-- 팀원데이터
insert into tm_mbr(tm_mbr_id,mbr_id,tlead_wth,pstn)
values(1,1,1,'포워드');
insert into tm_mbr(tm_mbr_id,mbr_id,tlead_wth,pstn)
values(2,2,1,'외야수');
insert into tm_mbr(tm_mbr_id,mbr_id,tlead_wth,pstn)
values(3,3,1,'가드');
insert into tm_mbr(tm_mbr_id,mbr_id,tlead_wth,pstn)
values(4,4,1,'포워드');
insert into tm_mbr(tm_mbr_id,mbr_id,tlead_wth,pstn)
values(5,5,1,'내야수');
insert into tm_mbr(tm_mbr_id,mbr_id,tlead_wth,pstn)
values(6,6,1,'센터');
insert into tm_mbr(tm_mbr_id,mbr_id,tlead_wth,pstn)
values(7,7,1,'센터');
insert into tm_mbr(tm_mbr_id,mbr_id,tlead_wth,pstn)
values(6,7,1,'포워');
insert into tm_mbr(tm_mbr_id,mbr_id,tlead_wth,pstn)
values(1,7,0,'격수');
insert into tm_mbr(tm_mbr_id,mbr_id,tlead_wth,pstn)
values(2,7,0,'유격수');
insert into tm_mbr(tm_mbr_id,mbr_id,tlead_wth,pstn)
values(4,10,0,'공격수');
-- 8번팀 팀원
insert into tm_mbr(tm_mbr_id,mbr_id,tlead_wth,pstn)
values(8,1,0,'테스트');
insert into tm_mbr(tm_mbr_id,mbr_id,tlead_wth,pstn)
values(8,2,0,'호랑이');
insert into tm_mbr(tm_mbr_id,mbr_id,tlead_wth,pstn)
values(8,3,0,'포워드');
insert into tm_mbr(tm_mbr_id,mbr_id,tlead_wth,pstn)
values(8,4,1,'프로게이머');
insert into tm_mbr(tm_mbr_id,mbr_id,tlead_wth,pstn)
values(8,5,1,'프로게이머');
insert into tm_mbr(tm_mbr_id,mbr_id,tlead_wth,pstn)
values(8,6,0,'공격수');
insert into tm_mbr(tm_mbr_id,mbr_id,tlead_wth,pstn)
values(8,7,0,'공격수');
insert into tm_mbr(tm_mbr_id,mbr_id,tlead_wth,pstn)
values(8,8,0,'공격수');
insert into tm_mbr(tm_mbr_id,mbr_id,tlead_wth,pstn)
values(8,9,0,'공격수');
insert into tm_mbr(tm_mbr_id,mbr_id,tlead_wth,pstn)
values(8,10,0,'공격수');

insert into tm_mbr(tm_mbr_id,mbr_id,tlead_wth,pstn)
values(9,9,1,'포워드');

insert into tm_mbr(tm_mbr_id,mbr_id,tlead_wth,pstn)
values(10,11,1,'포워드');
insert into tm_mbr(tm_mbr_id,mbr_id,tlead_wth,pstn)
values(11,12,1,'골키퍼');
insert into tm_mbr(tm_mbr_id,mbr_id,tlead_wth,pstn)
values(12,13,1,'수비수');
insert into tm_mbr(tm_mbr_id,mbr_id,tlead_wth,pstn)
values(13,14,1,'미드필더');
insert into tm_mbr(tm_mbr_id,mbr_id,tlead_wth,pstn)
values(14,15,1,'수비수');
insert into tm_mbr(tm_mbr_id,mbr_id,tlead_wth,pstn)
values(15,16,1,'미드필더');
insert into tm_mbr(tm_mbr_id,mbr_id,tlead_wth,pstn)
values(16,17,1,'포워드');
insert into tm_mbr(tm_mbr_id,mbr_id,tlead_wth,pstn)
values(17,18,1,'골키퍼');
insert into tm_mbr(tm_mbr_id,mbr_id,tlead_wth,pstn)
values(18,19,1,'미드필더');
insert into tm_mbr(tm_mbr_id,mbr_id,tlead_wth,pstn)
values(19,20,1,'포워드');



-- 대표팀등록
update mbr set main_tm_id = 1 where mbr_id =1;
update mbr set main_tm_id = 2 where mbr_id =2;
update mbr set main_tm_id = 3 where mbr_id =3;
update mbr set main_tm_id = 4 where mbr_id =4;
update mbr set main_tm_id = 5 where mbr_id =5;
update mbr set main_tm_id = 6 where mbr_id =6;
update mbr set main_tm_id = 7 where mbr_id =7;
update mbr set main_tm_id = 8 where mbr_id =8;
update mbr set main_tm_id = 8 where mbr_id =9;
update mbr set main_tm_id = 4 where mbr_id =10;

update mbr set main_tm_id = 10 where mbr_id =11;
update mbr set main_tm_id = 11 where mbr_id =12;
update mbr set main_tm_id = 12 where mbr_id =13;
update mbr set main_tm_id = 13 where mbr_id =14;
update mbr set main_tm_id = 14 where mbr_id =15;
update mbr set main_tm_id = 15 where mbr_id =16;
update mbr set main_tm_id = 16 where mbr_id =17;
update mbr set main_tm_id = 17 where mbr_id =18;
update mbr set main_tm_id = 18 where mbr_id =19;
update mbr set main_tm_id = 19 where mbr_id =20;

-- 팀경고데이터
insert into warn(warn_id,warn_res,tm_id)
values(1,'불참',1);
insert into warn(warn_id,warn_res,tm_id)
values(2,'욕설',2);
insert into warn(warn_id,warn_res,tm_id)
values(3,'불법광고',3);

-- 팀원모집
insert into rcrm(rcrm_id,tm_id,titl,cont,rcrm_stat,rcrm_prsn)
values(1,1,'축구팀원모집합니다.','서울사시는분오세요.',0,5);
insert into rcrm(rcrm_id,tm_id,titl,cont,rcrm_stat,rcrm_prsn)
values(2,2,'야구팀원모집합니다.','고양사시는분오세요.',0,4);
insert into rcrm(rcrm_id,tm_id,titl,cont,rcrm_stat,rcrm_prsn)
values(3,3,'농구팀원모집합니다.','인천사시는분오세요.',0,3);
insert into rcrm(rcrm_id,tm_id,titl,cont,rcrm_stat,rcrm_prsn)
values(6,5,'농구팀원모집합니다.','인천사시는분오세요.',0,3);
insert into rcrm(rcrm_id,tm_id,titl,cont,rcrm_stat,rcrm_prsn)
values(4,6,'농구팀원모집합니다.','인천사시는분오세요.',1,3);

-- 경기데이터
insert into mtch(mtch_id,tm_id,tm_id2,spt_clsf_id,titl,cont,game_dt,area,stdm_psti,stdm_lat,stdm_long,tel,cost)
values(1,1,4,1,'축구한판','축구합시다.','2019-09-09','0101','서초경기장','ss010101','as202020','010-5698-5456',10000);
insert into mtch(mtch_id,tm_id,tm_id2,spt_clsf_id,titl,cont,game_dt,area,stdm_psti,stdm_lat,stdm_long,tel,cost)
values(2,2,5,2,'야구한판','야구합시다.','2019-09-07','0201','고양경기장','ks010101','ks202020','010-4598-5456',5000);
insert into mtch(mtch_id,tm_id,tm_id2,spt_clsf_id,titl,cont,game_dt,area,stdm_psti,stdm_lat,stdm_long,tel,cost)
values(3,3,6,3,'농구한판','농구합시다.','2019-09-03','0301','인천경기장','ss010101','ss202020','010-5645-5456',20000);
insert into mtch(mtch_id,tm_id,tm_id2,spt_clsf_id,titl,cont,game_dt,area,stdm_psti,stdm_lat,stdm_long,tel,cost)
values(10,8,6,3,'농구한판','농구합시다.','2019-09-03','0301','인천경기장','ss010101','ss202020','010-5645-5456',20000);

insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(11,10,1,'매치해요1','고고고1','2019-07-01','0101','010-5621-4521');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(12,10,1,'매치해요2','고고고2','2019-07-06','0201','010-4212-4521');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(13,10,1,'매치해요3','고고고3','2019-07-11','0301','010-9631-4521');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(14,10,1,'매치해요4','고고고4','2019-07-16','0401','010-5412-4521');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(15,10,1,'매치해요5','고고고5','2019-07-21','0501','010-5621-4554');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(16,10,1,'매치해요6','고고고6','2019-07-26','0101','010-1212-4521');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(17,10,1,'매치해요7','고고고7','2019-07-31','0201','010-4212-6223');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(18,10,1,'매치해요8','고고고8','2019-08-01','0301','010-4112-4521');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(19,10,1,'매치해요9','고고고9','2019-09-03','0401','010-5412-2222');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(20,10,1,'매치해요10','고고고10','2019-09-21','0501','010-5641-4554');

insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(21,11,1,'한판뜹시다1','고고고1','2019-07-01','0101','010-5212-4521');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(22,11,1,'한판뜹시다2','고고고2','2019-07-06','0201','010-4212-4112');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(23,11,1,'한판뜹시다3','고고고3','2019-07-11','0301','010-6522-4521');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(24,11,1,'한판뜹시다4','고고고4','2019-07-16','0401','010-5412-4441');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(25,11,1,'한판뜹시다5','고고고5','2019-07-21','0501','010-5821-4554');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(26,11,1,'한판뜹시다6','고고고6','2019-07-26','0101','010-2121-4521');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(27,11,1,'한판뜹시다7','고고고7','2019-07-31','0201','010-2343-6223');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(28,11,1,'한판뜹시다8','고고고8','2019-08-01','0301','010-1224-4521');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(29,11,1,'한판뜹시다9','고고고9','2019-09-03','0401','010-5412-2465');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(30,11,1,'한판뜹시다10','고고고10','2019-09-21','0501','010-2643-4554');

insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(31,12,1,'아침반1','고고고1','2019-07-01','0101','010-5212-4445');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(32,12,1,'아침반2','고고고2','2019-07-06','0201','010-1221-4112');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(33,12,1,'아침반3','고고고3','2019-07-11','0301','010-9969-4521');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(34,12,1,'아침반4','고고고4','2019-07-16','0401','010-5412-8994');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(35,12,1,'아침반5','고고고5','2019-07-21','0501','010-2210-4554');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(36,12,1,'아침반6','고고고6','2019-07-26','0101','010-2121-9557');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(37,12,1,'아침반7','고고고7','2019-07-31','0201','010-5633-6223');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(38,12,1,'아침반8','고고고8','2019-08-01','0301','010-9871-4521');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(39,12,1,'아침반9','고고고9','2019-09-03','0401','010-5622-2465');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(40,12,1,'아침반10','고고고10','2019-09-21','0501','010-2643-6855');

insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(41,13,1,'저녁반1','고고고1','2019-07-01','0101','010-8745-4445');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(42,13,1,'저녁반2','고고고2','2019-07-06','0201','010-1221-8941');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(43,13,1,'저녁반3','고고고3','2019-07-11','0301','010-6422-4521');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(44,13,1,'저녁반4','고고고4','2019-07-16','0401','010-5412-5941');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(45,13,1,'저녁반5','고고고5','2019-07-21','0501','010-5421-4554');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(46,13,1,'저녁반6','고고고6','2019-07-26','0101','010-2121-8745');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(47,13,1,'저녁반7','고고고7','2019-07-31','0201','010-7541-6223');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(48,13,1,'저녁반8','고고고8','2019-08-01','0301','010-9871-8521');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(49,13,1,'저녁반9','고고고9','2019-09-03','0401','010-4454-2465');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(50,13,1,'저녁반10','고고고10','2019-09-21','0501','010-2643-9845');

insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(51,14,1,'점심반1','고고고1','2019-07-01','0101','010-9856-4445');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(52,14,1,'점심반2','고고고2','2019-07-06','0201','010-1221-7541');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(53,14,1,'점심반3','고고고3','2019-07-11','0301','010-9521-4521');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(54,14,1,'점심반4','고고고4','2019-07-16','0401','010-5412-5411');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(55,14,1,'점심반5','고고고5','2019-07-21','0501','010-9562-4554');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(56,14,1,'점심반6','고고고6','2019-07-26','0101','010-2121-4511');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(57,14,1,'점심반7','고고고7','2019-07-31','0201','010-7541-6532');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(58,14,1,'점심반8','고고고8','2019-08-01','0301','010-8451-8521');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(59,14,1,'점심반9','고고고9','2019-09-03','0401','010-6532-2465');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(60,14,1,'점심반10','고고고10','2019-09-21','0501','010-5652-9845');

insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(61,15,1,'새벽반1','고고고1','2019-07-01','0101','010-1211-4445');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(62,15,1,'새벽반2','고고고2','2019-07-06','0201','010-1221-5242');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(63,15,1,'새벽반3','고고고3','2019-07-11','0301','010-3824-4521');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(64,15,1,'새벽반4','고고고4','2019-07-16','0401','010-3223-5411');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(65,15,1,'새벽반5','고고고5','2019-07-21','0501','010-9562-6522');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(66,15,1,'새벽반6','고고고6','2019-07-26','0101','010-3222-4511');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(67,15,1,'새벽반7','고고고7','2019-07-31','0201','010-7541-7445');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(68,15,1,'새벽반8','고고고8','2019-08-01','0301','010-6521-8521');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(69,15,1,'새벽반9','고고고9','2019-09-03','0401','010-1221-2465');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(70,15,1,'새벽반10','고고고10','2019-09-21','0501','010-5652-6532');

insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(71,16,1,'주말반1','고고고1','2019-07-01','0101','010-5623-4445');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(72,16,1,'주말반2','고고고2','2019-07-06','0201','010-1221-7454');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(73,16,1,'주말반3','고고고3','2019-07-11','0301','010-7454-4521');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(74,16,1,'주말반4','고고고4','2019-07-16','0401','010-3128-5411');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(75,16,1,'주말반5','고고고5','2019-07-21','0501','010-8945-6522');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(76,16,1,'주말반6','고고고6','2019-07-26','0101','010-9764-4511');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(77,16,1,'주말반7','고고고7','2019-07-31','0201','010-7541-6734');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(78,16,1,'주말반8','고고고8','2019-08-01','0301','010-9865-8521');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(79,16,1,'주말반9','고고고9','2019-09-03','0401','010-1221-7844');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(80,16,1,'주말반10','고고고10','2019-09-21','0501','010-4544-6532');

insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(81,17,1,'평일반1','고고고1','2019-07-01','0101','010-5623-9865');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(82,17,1,'평일반2','고고고2','2019-07-06','0201','010-4212-7454');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(83,17,1,'평일반3','고고고3','2019-07-11','0301','010-6532-4521');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(84,17,1,'평일반4','고고고4','2019-07-16','0401','010-3128-9562');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(85,17,1,'평일반5','고고고5','2019-07-21','0501','010-4512-6522');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(86,17,1,'평일반6','고고고6','2019-07-26','0101','010-9764-5623');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(87,17,1,'평일반7','고고고7','2019-07-31','0201','010-9856-6734');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(88,17,1,'평일반8','고고고8','2019-08-01','0301','010-4212-8521');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(89,17,1,'평일반9','고고고9','2019-09-03','0401','010-2725-7844');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(90,17,1,'평일반10','고고고10','2019-09-21','0501','010-4544-5561');

insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(91,18,1,'조축해요1','고고고1','2019-07-01','0101','010-5652-9865');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(92,18,1,'조축해요2','고고고2','2019-07-06','0201','010-7454-7454');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(93,18,1,'조축해요3','고고고3','2019-07-11','0301','010-6532-7451');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(94,18,1,'조축해요4','고고고4','2019-07-16','0401','010-5812-9562');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(95,18,1,'조축해요5','고고고5','2019-07-21','0501','010-4512-5969');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(96,18,1,'조축해요6','고고고6','2019-07-26','0101','010-5418-5623');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(97,18,1,'조축해요7','고고고7','2019-07-31','0201','010-9856-8753');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(98,18,1,'조축해요8','고고고8','2019-08-01','0301','010-9514-8521');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(99,18,1,'조축해요9','고고고9','2019-09-03','0401','010-2725-6541');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(100,18,1,'조축해요10','고고고10','2019-09-21','0501','010-5785-5561');

insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(101,19,1,'밤에축구하실팀?1','고고고1','2019-07-01','0101','010-2121-9865');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(102,19,1,'밤에축구하실팀?2','고고고2','2019-07-06','0201','010-7454-5653');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(103,19,1,'밤에축구하실팀?3','고고고3','2019-07-11','0301','010-9856-7451');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(104,19,1,'밤에축구하실팀?4','고고고4','2019-07-16','0401','010-4512-9562');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(105,19,1,'밤에축구하실팀?5','고고고5','2019-07-21','0501','010-3652-5969');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(106,19,1,'밤에축구하실팀?6','고고고6','2019-07-26','0101','010-5418-6223');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(107,19,1,'밤에축구하실팀?7','고고고7','2019-07-31','0201','010-3223-8753');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(108,19,1,'밤에축구하실팀?8','고고고8','2019-08-01','0301','010-3452-8521');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(109,19,1,'밤에축구하실팀?9','고고고9','2019-09-03','0401','010-9982-6541');
insert into mtch(mtch_id,tm_id,spt_clsf_id,titl,cont,game_dt,area,tel)
values(110,19,1,'밤에축구하실팀?10','고고고10','2019-09-21','0501','010-5785-3521');

-- 경기태그데이터
insert into mtch_tag(mtch_tag_id,mtch_id,mbr_id,tag_name)
values(1,1,1,'축구');
insert into mtch_tag(mtch_tag_id,mtch_id,mbr_id,tag_name)
values(2,2,2,'야구');
insert into mtch_tag(mtch_tag_id,mtch_id,mbr_id,tag_name)
values(3,3,3,'농구');

insert into join_tm(join_id,rcrm_id)
values(2,6);


-- 경기신청데이터
insert into mtchaply(tm_id,mtch_id,aply_dt,aply_stat)
values(4,1,'2019-06-08','수락');
insert into mtchaply(tm_id,mtch_id,aply_dt,aply_stat)
values(5,2,'2019-06-09','수락');
insert into mtchaply(tm_id,mtch_id,aply_dt,aply_stat)
values(6,3,'2019-06-11','수락');

-- 후기게시판데이터
insert into revw(tm_id,tm_id2,mtch_id,cont,gpa)
values(1,4,1,'재밌었어요',5);
insert into revw(tm_id,tm_id2,mtch_id,cont,gpa)
values(2,5,2,'즐거웠어요',4);
insert into revw(tm_id,tm_id2,mtch_id,cont,gpa)
values(3,6,3,'매너없네요',2);


-- 시도지역데이터
insert into toplc(toplc_no,toplc_name)
values('01','서울');
insert into toplc(toplc_no,toplc_name)
values('02','경기');
insert into toplc(toplc_no,toplc_name)
values('03','인천');
insert into toplc(toplc_no,toplc_name)
values('04','강원');
insert into toplc(toplc_no,toplc_name)
values('05','충북');
insert into toplc(toplc_no,toplc_name)
values('06','세종');
insert into toplc(toplc_no,toplc_name)
values('07','충남');
insert into toplc(toplc_no,toplc_name)
values('08','대전');
insert into toplc(toplc_no,toplc_name)
values('09','경북');
insert into toplc(toplc_no,toplc_name)
values('10','대구');
insert into toplc(toplc_no,toplc_name)
values('11','울산');
insert into toplc(toplc_no,toplc_name)
values('12','부산');
insert into toplc(toplc_no,toplc_name)
values('13','경남');
insert into toplc(toplc_no,toplc_name)
values('14','전북');
insert into toplc(toplc_no,toplc_name)
values('15','전남');
insert into toplc(toplc_no,toplc_name)
values('16','광주');
insert into toplc(toplc_no,toplc_name)
values('17','제주');

-- 시군구지역데이터
insert into midlc(midlc_no,midlc_name,toplc_id)
values('01','강북구',1);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('02','도봉구',1);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('03','노원구',1);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('04','중랑구',1);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('05','동대문구',1);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('06','성북구',1);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('07','종로구',1);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('08','은평구',1);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('09','서대문구',1);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('10','마포구',1);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('11','용산구',1);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('12','중구',1);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('13','성동구',1);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('14','광진구',1);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('15','강동구',1);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('16','송파구',1);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('17','강남구',1);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('18','서초구',1);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('19','동작구',1);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('20','영등포구',1);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('21','강서구',1);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('22','양천구',1);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('23','구로구',1);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('24','금천구',1);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('25','관악구',1);

insert into midlc(midlc_no,midlc_name,toplc_id)
values('01','김포시',2);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('02','고양시',2);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('03','파주시',2);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('04','연천군',2);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('05','포천시',2);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('06','동두천시',2);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('07','양주시',2);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('08','의정부시',2);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('09','구리시',2);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('10','남양주시',2);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('11','가평군',2);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('12','양평군',2);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('13','여주시',2);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('14','광주시',2);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('15','하남시',2);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('16','성남시',2);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('17','과천시',2);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('18','안양시',2);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('19','광명시',2);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('20','부천시',2);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('21','시흥시',2);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('22','안산시',2);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('23','군포시',2);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('24','의왕시',2);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('25','수원시',2);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('26','용인시',2);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('27','이천시',2);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('28','안성시',2);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('29','평택시',2);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('30','오산시',2);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('31','화성시',2);

insert into midlc(midlc_no,midlc_name,toplc_id)
values('01','계양구',3);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('02','부평구',3);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('03','남동구',3);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('04','연수구',3);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('05','미추홀구',3);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('06','중구',3);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('07','동구',3);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('08','서구',3);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('09','강화군',3);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('10','옹진군',3);

insert into midlc(midlc_no,midlc_name,toplc_id)
values('01','철원군',4);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('02','화천군',4);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('03','춘천시',4);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('04','양구군',4);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('05','인제군',4);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('06','고성군',4);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('07','속초시',4);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('08','양양군',4);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('09','홍천군',4);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('10','횡성군',4);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('11','평창군',4);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('12','강릉시',4);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('13','동해시',4);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('14','삼척시',4);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('15','태백시',4);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('16','정선군',4);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('17','영월군',4);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('18','원주시',4);

insert into midlc(midlc_no,midlc_name,toplc_id)
values('01','단양군',5);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('02','제천시',5);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('03','충주시',5);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('04','음성군',5);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('05','진천군',5);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('06','증평군',5);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('07','괴산군',5);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('08','청주시',5);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('09','보은군',5);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('10','옥천군',5);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('11','영동군',5);

insert into midlc(midlc_no,midlc_name,toplc_id)
values('01','세종시',6);

insert into midlc(midlc_no,midlc_name,toplc_id)
values('01','천안시',7);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('02','아산시',7);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('03','당진시',7);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('04','서산시',7);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('05','태안군',7);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('06','홍성군',7);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('07','예산군',7);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('08','공주시',7);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('09','금산군',7);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('10','계룡시',7);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('11','논산시',7);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('12','부여군',7);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('13','청양군',7);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('14','보령시',7);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('15','서천군',7);

insert into midlc(midlc_no,midlc_name,toplc_id)
values('01','유성구',8);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('02','대덕구',8);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('03','동구',8);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('04','중구',8);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('05','서구',8);

insert into midlc(midlc_no,midlc_name,toplc_id)
values('01','영주시',9);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('02','봉화군',9);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('03','울진군',9);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('04','영덕군',9);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('05','영양군',9);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('06','안동시',9);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('07','예천군',9);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('08','문경시',9);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('09','상주시',9);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('10','의성군',9);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('11','청송군',9);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('12','포항시',9);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('13','경주시',9);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('14','청도군',9);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('15','경산시',9);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('16','영천시',9);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('17','군위군',9);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('18','구미시',9);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('19','김천시',9);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('20','칠곡군',9);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('21','성주군',9);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('22','고령군',9);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('23','울릉군',9);

insert into midlc(midlc_no,midlc_name,toplc_id)
values('01','동구',10);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('02','북구',10);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('03','서구',10);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('04','중구',10);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('05','수성구',10);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('06','남구',10);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('07','달서구',10);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('08','달성군',10);

insert into midlc(midlc_no,midlc_name,toplc_id)
values('01','동구',11);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('02','북구',11);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('03','중구',11);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('04','남구',11);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('05','울주군',11);

insert into midlc(midlc_no,midlc_name,toplc_id)
values('01','기장군',12);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('02','금정구',12);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('03','북구',12);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('04','강서구',12);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('05','사상구',12);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('06','부산진구',12);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('07','연제구',12);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('08','동래구',12);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('09','해운대구',12);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('10','수영구',12);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('11','남구',12);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('12','동구',12);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('13','중구',12);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('14','영도구',12);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('15','서구',12);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('16','사하구',12);

insert into midlc(midlc_no,midlc_name,toplc_id)
values('01','함양군',13);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('02','거창군',13);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('03','합천군',13);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('04','창녕군',13);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('05','밀양시',13);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('06','양산시',13);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('07','김해시',13);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('08','창원시',13);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('09','함안군',13);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('10','의령군',13);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('11','산청군',13);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('12','하동군',13);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('13','남해군',13);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('14','사천시',13);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('15','진주시',13);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('16','고성군',13);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('17','통영시',13);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('18','거제시',13);

insert into midlc(midlc_no,midlc_name,toplc_id)
values('01','군산시',14);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('02','김제시',14);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('03','익산시',14);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('04','전주시',14);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('05','완주군',14);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('06','진안군',14);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('07','무주군',14);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('08','장수군',14);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('09','남원시',14);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('10','임실군',14);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('11','순창군',14);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('12','정읍시',14);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('13','부안군',14);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('14','고창군',14);

insert into midlc(midlc_no,midlc_name,toplc_id)
values('01','영광군',15);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('02','함평군',15);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('03','장성군',15);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('04','담양군',15);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('05','곡성군',15);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('06','구례군',15);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('07','광양시',15);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('08','순천시',15);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('09','화순군',15);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('10','나주시',15);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('11','영암군',15);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('12','무안군',15);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('13','목포시',15);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('14','신안군',15);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('15','진도군',15);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('16','해남군',15);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('17','완도군',15);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('18','강진군',15);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('19','장흥군',15);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('20','보성군',15);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('21','고흥군',15);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('22','여수시',15);

insert into midlc(midlc_no,midlc_name,toplc_id)
values('01','북구',16);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('02','동구',16);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('03','남구',16);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('04','서구',16);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('05','광산구',16);

insert into midlc(midlc_no,midlc_name,toplc_id)
values('01','제주시',17);
insert into midlc(midlc_no,midlc_name,toplc_id)
values('02','서귀포시',17);

-- 자유게시판데이터
insert into free(free_id,mbr_id,titl,cont)
values(1,1,'하이','반갑습니다.');
insert into free(free_id,mbr_id,titl,cont)
values(2,2,'오호라','재밌군요.');
insert into free(free_id,mbr_id,titl,cont)
values(3,3,'바이','잘놀다갑니다.');

-- 댓글데이터
insert into cmt(cmt_id,free_id,mbr_id,pcd,lev,cont)
values(1,1,1,1,1,'모두 반가워요');
insert into cmt(cmt_id,free_id,mbr_id,pcd,lev,cont)
values(2,1,2,2,1,'하요');
insert into cmt(cmt_id,free_id,mbr_id,pcd,lev,cont)
values(3,1,3,3,1,'오하요');
insert into cmt(cmt_id,free_id,mbr_id,pcd,lev,cont)
values(4,1,3,1,2,'호호');
insert into cmt(cmt_id,free_id,mbr_id,pcd,lev,cont)
values(5,1,2,2,2,'반갑습니다.');
insert into cmt(cmt_id,free_id,mbr_id,pcd,lev,cont)
values(6,1,1,3,2,'후후');
insert into cmt(cmt_id,free_id,mbr_id,pcd,lev,cont)
values(7,2,2,1,1,'히히');
insert into cmt(cmt_id,free_id,mbr_id,pcd,lev,cont)
values(8,2,3,2,1,'하하하');
insert into cmt(cmt_id,free_id,mbr_id,pcd,lev,cont)
values(9,2,1,3,1,'크크크');
insert into cmt(cmt_id,free_id,mbr_id,pcd,lev,cont)
values(10,2,2,1,2,'케케케');
insert into cmt(cmt_id,free_id,mbr_id,pcd,lev,cont)
values(11,2,1,2,2,'헤헤헤');
insert into cmt(cmt_id,free_id,mbr_id,pcd,lev,cont)
values(12,2,3,3,2,'흐흐흐');
insert into cmt(cmt_id,free_id,mbr_id,pcd,lev,cont)
values(13,2,3,1,1,'바이');
insert into cmt(cmt_id,free_id,mbr_id,pcd,lev,cont)
values(14,2,1,2,1,'씨유어게인');
insert into cmt(cmt_id,free_id,mbr_id,pcd,lev,cont)
values(15,2,2,3,1,'담에봐요');
insert into cmt(cmt_id,free_id,mbr_id,pcd,lev,cont)
values(16,2,2,1,2,'바바');
insert into cmt(cmt_id,free_id,mbr_id,pcd,lev,cont)
values(17,2,3,2,2,'잘가요');
insert into cmt(cmt_id,free_id,mbr_id,pcd,lev,cont)
values(18,2,1,3,2,'빠이');

-- 질문데이터
insert into qstn(qstn_id,mbr_id,titl,cont)
values(1,1,'비밀번호변경','비밀번호가 안 바뀌네요.');
insert into qstn(qstn_id,mbr_id,titl,cont)
values(2,2,'상대팀이 안오네요','징계 좀 먹여줘요.');
insert into qstn(qstn_id,mbr_id,titl,cont)
values(3,3,'사이트가 느려요.','크롬에서 너무 느리네요.');
insert into qstn(qstn_id,ans_stat,mbr_id,titl,cont)
values(4,true,4,'사이트가 느려요.','크롬에서 너무 느리네요.');
insert into qstn(qstn_id,ans_stat,mbr_id,titl,cont,pwd)
values(6,true,4,'사이트가 느려요.','크롬에서 너무 느리네요.',false);
insert into qstn(qstn_id,ans_stat,mbr_id,titl,cont,pwd)
values(7,true,2,'사이트가 느려요.','크롬에서 너무 느리네요.',false);
insert into qstn(qstn_id,ans_stat,mbr_id,titl,cont,pwd)
values(8,true,2,'사이트가 느려요.','크롬에서 너무 느리네요.',true);
insert into qstn(qstn_id,ans_stat,mbr_id,titl,cont,pwd)
values(9,true,4,'사이트가 느려요.','크롬에서 너무 느리네요.',true);

-- 공지사항게시판데이터
insert into anunc(anunc_id, mbr_id, titl, cont)
values(1,1,'공지사항글테스트입니다.1','헬로헬로헬로');
insert into anunc(anunc_id, mbr_id, titl, cont)
values(2,1,'공지사항글테스트입니다.22','헬로헬로헬로');
insert into anunc(anunc_id, mbr_id, titl, cont)
values(3,1,'공지사항글테스트입니다.333','헬로헬로헬로');

-- 인증키데이터
insert into atk(atk_id,atk_email,atk_cont,atk_type)
values(1,'testgogo@gmail.com',201020,1);
insert into atk(atk_id,atk_email,atk_cont,atk_type)
values(2,'testhaha@naver.com',874654,2);
insert into atk(atk_id,atk_email,atk_cont,atk_type)
values(3,'testhuhu@hanmail.net',456826,3);

-- 약관선택데이터
insert into terms_optn(terms_optn_id, mbr_id, terms_req, mkt)
values (1, 1, 1, 1);
insert into terms_optn(terms_optn_id, mbr_id, terms_req, mkt)
values (2, 2, 1, 1);
insert into terms_optn(terms_optn_id, mbr_id, terms_req, mkt)
values (3, 3, 1, 1);

-- 문자인증데이터
insert into sms(sms_id,sms_tel,sms_cont,sms_type)
values(1, '010-0000-0000', 232121, 1);
insert into sms(sms_id,sms_tel,sms_cont,sms_type)
values(2, '010-1000-0000', 124121, 2);
insert into sms(sms_id,sms_tel,sms_cont,sms_type)
values(3, '010-2000-0000', 563232, 3);

--포지션
insert into position (spt_clsf_id, position_no, position_name)
values(1,1,'공격수');
insert into position (spt_clsf_id, position_no, position_name)
values(1,2,'미드필더');
insert into position (spt_clsf_id, position_no, position_name)
values(1,3,'수비수');
insert into position (spt_clsf_id, position_no, position_name)
values(1,4,'골키퍼');
insert into position (spt_clsf_id, position_no, position_name)
values(2,1,'타자');
insert into position (spt_clsf_id, position_no, position_name)
values(2,2,'투수');
insert into position (spt_clsf_id, position_no, position_name)
values(2,3,'포수');
insert into position (spt_clsf_id, position_no, position_name)
values(2,4,'내야수');
insert into position (spt_clsf_id, position_no, position_name)
values(2,5,'외야수');
insert into position (spt_clsf_id, position_no, position_name)
values(3,1,'센터');
insert into position (spt_clsf_id, position_no, position_name)
values(3,2,'포워드');
insert into position (spt_clsf_id, position_no, position_name)
values(4,1,'단식');
insert into position (spt_clsf_id, position_no, position_name)
values(4,1,'복식');