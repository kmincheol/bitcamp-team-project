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
values(1,'high');
insert into tm_lev(tm_lev_id,levs)
values(2,'mid');
insert into tm_lev(tm_lev_id,levs)
values(3,'low');

-- 종목유형데이터
insert into spt_clsf(spt_clsf_id,spt_clsf_name)
values(1,'soccer');
insert into spt_clsf(spt_clsf_id,spt_clsf_name)
values(2,'baseball');
insert into spt_clsf(spt_clsf_id,spt_clsf_name)
values(3,'basketball');
insert into spt_clsf(spt_clsf_id,spt_clsf_name)
values(4,'pingpong');

-- 팀데이터
insert into tm(tm_id,name,area,age_id,tm_type_id,tm_lev_id,spt_clsf_id)
values(1,'비트캠프사커','010101','20','1','1','1');
insert into tm(tm_id,name,area,age_id,tm_type_id,tm_lev_id,spt_clsf_id)
values(2,'고양드래곤즈','020101','30','2','2','2');
insert into tm(tm_id,name,area,age_id,tm_type_id,tm_lev_id,spt_clsf_id)
values(3,'인천배스킷볼','030101','40','3','3','3');
insert into tm(tm_id,name,area,age_id,tm_type_id,tm_lev_id,spt_clsf_id)
values(4,'강남풋볼','010101','20','1','1','1');
insert into tm(tm_id,name,area,age_id,tm_type_id,tm_lev_id,spt_clsf_id)
values(5,'고양베어스','020101','30','2','2','2');
insert into tm(tm_id,name,area,age_id,tm_type_id,tm_lev_id,spt_clsf_id)
values(6,'연수농구단','030101','40','3','3','3');
insert into tm(tm_id,name,area,age_id,tm_type_id,tm_lev_id,spt_clsf_id)
values(7,'비트농구단','030101','40','3','3','3');
insert into tm(tm_id,name,area,age_id,tm_type_id,tm_lev_id,spt_clsf_id)
values(8,'롤게임','030101','40','3','3','3');
insert into tm(tm_id,name,tm_intd,area,age_id,tm_type_id,tm_lev_id,spt_clsf_id,cdt)
values(9,'테스트팀','우리팀은 테스트하는 팀입니다','010','30','3','3','3','2014-05-02');

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
values(1,1,4,1,'축구한판','축구합시다.','2019-09-09','010101','서초경기장','as010101','as202020','010-5698-5456',10000);
insert into mtch(mtch_id,tm_id,tm_id2,spt_clsf_id,titl,cont,game_dt,area,stdm_psti,stdm_lat,stdm_long,tel,cost)
values(2,2,5,2,'야구한판','야구합시다.','2019-09-07','020101','고양경기장','ks010101','ks202020','010-4598-5456',5000);
insert into mtch(mtch_id,tm_id,tm_id2,spt_clsf_id,titl,cont,game_dt,area,stdm_psti,stdm_lat,stdm_long,tel,cost)
values(3,3,6,3,'농구한판','농구합시다.','2019-09-03','030101','인천경기장','ss010101','ss202020','010-5645-5456',20000);
insert into mtch(mtch_id,tm_id,tm_id2,spt_clsf_id,titl,cont,game_dt,area,stdm_psti,stdm_lat,stdm_long,tel,cost)
values(10,8,6,3,'농구한판','농구합시다.','2019-09-03','030101','인천경기장','ss010101','ss202020','010-5645-5456',20000);

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
insert into toplc(toplc_no,name)
values('01','서울');
insert into toplc(toplc_no,name)
values('02','경기');
insert into toplc(toplc_no,name)
values('03','인천');
insert into toplc(toplc_no,name)
values('04','강원');
insert into toplc(toplc_no,name)
values('05','충북');
insert into toplc(toplc_no,name)
values('06','세종');
insert into toplc(toplc_no,name)
values('07','충남');
insert into toplc(toplc_no,name)
values('08','대전');
insert into toplc(toplc_no,name)
values('09','경북');
insert into toplc(toplc_no,name)
values('10','대구');
insert into toplc(toplc_no,name)
values('11','울산');
insert into toplc(toplc_no,name)
values('12','부산');
insert into toplc(toplc_no,name)
values('13','경남');
insert into toplc(toplc_no,name)
values('14','전북');
insert into toplc(toplc_no,name)
values('15','전남');
insert into toplc(toplc_no,name)
values('16','광주');
insert into toplc(toplc_no,name)
values('17','제주');

-- 시군구지역데이터
insert into midlc(midlc_no,name,toplc_id)
values('01','강북구',1);
insert into midlc(midlc_no,name,toplc_id)
values('02','도봉구',1);
insert into midlc(midlc_no,name,toplc_id)
values('03','노원구',1);
insert into midlc(midlc_no,name,toplc_id)
values('04','중랑구',1);
insert into midlc(midlc_no,name,toplc_id)
values('05','동대문구',1);
insert into midlc(midlc_no,name,toplc_id)
values('06','성북구',1);
insert into midlc(midlc_no,name,toplc_id)
values('07','종로구',1);
insert into midlc(midlc_no,name,toplc_id)
values('08','은평구',1);
insert into midlc(midlc_no,name,toplc_id)
values('09','서대문구',1);
insert into midlc(midlc_no,name,toplc_id)
values('10','마포구',1);
insert into midlc(midlc_no,name,toplc_id)
values('11','용산구',1);
insert into midlc(midlc_no,name,toplc_id)
values('12','중구',1);
insert into midlc(midlc_no,name,toplc_id)
values('13','성동구',1);
insert into midlc(midlc_no,name,toplc_id)
values('14','광진구',1);
insert into midlc(midlc_no,name,toplc_id)
values('15','강동구',1);
insert into midlc(midlc_no,name,toplc_id)
values('16','송파구',1);
insert into midlc(midlc_no,name,toplc_id)
values('17','강남구',1);
insert into midlc(midlc_no,name,toplc_id)
values('18','서초구',1);
insert into midlc(midlc_no,name,toplc_id)
values('19','동작구',1);
insert into midlc(midlc_no,name,toplc_id)
values('20','영등포구',1);
insert into midlc(midlc_no,name,toplc_id)
values('21','강서구',1);
insert into midlc(midlc_no,name,toplc_id)
values('22','양천구',1);
insert into midlc(midlc_no,name,toplc_id)
values('23','구로구',1);
insert into midlc(midlc_no,name,toplc_id)
values('24','금천구',1);
insert into midlc(midlc_no,name,toplc_id)
values('25','관악구',1);

insert into midlc(midlc_no,name,toplc_id)
values('01','김포시',2);
insert into midlc(midlc_no,name,toplc_id)
values('02','고양시',2);
insert into midlc(midlc_no,name,toplc_id)
values('03','파주시',2);
insert into midlc(midlc_no,name,toplc_id)
values('04','연천군',2);
insert into midlc(midlc_no,name,toplc_id)
values('05','포천시',2);
insert into midlc(midlc_no,name,toplc_id)
values('06','동두천시',2);
insert into midlc(midlc_no,name,toplc_id)
values('07','양주시',2);
insert into midlc(midlc_no,name,toplc_id)
values('08','의정부시',2);
insert into midlc(midlc_no,name,toplc_id)
values('09','구리시',2);
insert into midlc(midlc_no,name,toplc_id)
values('10','남양주시',2);
insert into midlc(midlc_no,name,toplc_id)
values('11','가평군',2);
insert into midlc(midlc_no,name,toplc_id)
values('12','양평군',2);
insert into midlc(midlc_no,name,toplc_id)
values('13','여주시',2);
insert into midlc(midlc_no,name,toplc_id)
values('14','광주시',2);
insert into midlc(midlc_no,name,toplc_id)
values('15','하남시',2);
insert into midlc(midlc_no,name,toplc_id)
values('16','성남시',2);
insert into midlc(midlc_no,name,toplc_id)
values('17','과천시',2);
insert into midlc(midlc_no,name,toplc_id)
values('18','안양시',2);
insert into midlc(midlc_no,name,toplc_id)
values('19','광명시',2);
insert into midlc(midlc_no,name,toplc_id)
values('20','부천시',2);
insert into midlc(midlc_no,name,toplc_id)
values('21','시흥시',2);
insert into midlc(midlc_no,name,toplc_id)
values('22','안산시',2);
insert into midlc(midlc_no,name,toplc_id)
values('23','군포시',2);
insert into midlc(midlc_no,name,toplc_id)
values('24','의왕시',2);
insert into midlc(midlc_no,name,toplc_id)
values('25','수원시',2);
insert into midlc(midlc_no,name,toplc_id)
values('26','용인시',2);
insert into midlc(midlc_no,name,toplc_id)
values('27','이천시',2);
insert into midlc(midlc_no,name,toplc_id)
values('28','안성시',2);
insert into midlc(midlc_no,name,toplc_id)
values('29','평택시',2);
insert into midlc(midlc_no,name,toplc_id)
values('30','오산시',2);
insert into midlc(midlc_no,name,toplc_id)
values('31','화성시',2);

insert into midlc(midlc_no,name,toplc_id)
values('01','계양구',3);
insert into midlc(midlc_no,name,toplc_id)
values('02','부평구',3);
insert into midlc(midlc_no,name,toplc_id)
values('03','남동구',3);
insert into midlc(midlc_no,name,toplc_id)
values('04','연수구',3);
insert into midlc(midlc_no,name,toplc_id)
values('05','미추홀구',3);
insert into midlc(midlc_no,name,toplc_id)
values('06','중구',3);
insert into midlc(midlc_no,name,toplc_id)
values('07','동구',3);
insert into midlc(midlc_no,name,toplc_id)
values('08','서구',3);
insert into midlc(midlc_no,name,toplc_id)
values('09','강화군',3);
insert into midlc(midlc_no,name,toplc_id)
values('10','옹진군',3);

insert into midlc(midlc_no,name,toplc_id)
values('01','철원군',4);
insert into midlc(midlc_no,name,toplc_id)
values('02','화천군',4);
insert into midlc(midlc_no,name,toplc_id)
values('03','춘천시',4);
insert into midlc(midlc_no,name,toplc_id)
values('04','양구군',4);
insert into midlc(midlc_no,name,toplc_id)
values('05','인제군',4);
insert into midlc(midlc_no,name,toplc_id)
values('06','고성군',4);
insert into midlc(midlc_no,name,toplc_id)
values('07','속초시',4);
insert into midlc(midlc_no,name,toplc_id)
values('08','양양군',4);
insert into midlc(midlc_no,name,toplc_id)
values('09','홍천군',4);
insert into midlc(midlc_no,name,toplc_id)
values('10','횡성군',4);
insert into midlc(midlc_no,name,toplc_id)
values('11','평창군',4);
insert into midlc(midlc_no,name,toplc_id)
values('12','강릉시',4);
insert into midlc(midlc_no,name,toplc_id)
values('13','동해시',4);
insert into midlc(midlc_no,name,toplc_id)
values('14','삼척시',4);
insert into midlc(midlc_no,name,toplc_id)
values('15','태백시',4);
insert into midlc(midlc_no,name,toplc_id)
values('16','정선군',4);
insert into midlc(midlc_no,name,toplc_id)
values('17','영월군',4);
insert into midlc(midlc_no,name,toplc_id)
values('18','원주시',4);

insert into midlc(midlc_no,name,toplc_id)
values('01','단양군',5);
insert into midlc(midlc_no,name,toplc_id)
values('02','제천시',5);
insert into midlc(midlc_no,name,toplc_id)
values('03','충주시',5);
insert into midlc(midlc_no,name,toplc_id)
values('04','음성군',5);
insert into midlc(midlc_no,name,toplc_id)
values('05','진천군',5);
insert into midlc(midlc_no,name,toplc_id)
values('06','증평군',5);
insert into midlc(midlc_no,name,toplc_id)
values('07','괴산군',5);
insert into midlc(midlc_no,name,toplc_id)
values('08','청주시',5);
insert into midlc(midlc_no,name,toplc_id)
values('09','보은군',5);
insert into midlc(midlc_no,name,toplc_id)
values('10','옥천군',5);
insert into midlc(midlc_no,name,toplc_id)
values('11','영동군',5);

insert into midlc(midlc_no,name,toplc_id)
values('01','세종시',6);

insert into midlc(midlc_no,name,toplc_id)
values('01','천안시',7);
insert into midlc(midlc_no,name,toplc_id)
values('02','아산시',7);
insert into midlc(midlc_no,name,toplc_id)
values('03','당진시',7);
insert into midlc(midlc_no,name,toplc_id)
values('04','서산시',7);
insert into midlc(midlc_no,name,toplc_id)
values('05','태안군',7);
insert into midlc(midlc_no,name,toplc_id)
values('06','홍성군',7);
insert into midlc(midlc_no,name,toplc_id)
values('07','예산군',7);
insert into midlc(midlc_no,name,toplc_id)
values('08','공주시',7);
insert into midlc(midlc_no,name,toplc_id)
values('09','금산군',7);
insert into midlc(midlc_no,name,toplc_id)
values('10','계룡시',7);
insert into midlc(midlc_no,name,toplc_id)
values('11','논산시',7);
insert into midlc(midlc_no,name,toplc_id)
values('12','부여군',7);
insert into midlc(midlc_no,name,toplc_id)
values('13','청양군',7);
insert into midlc(midlc_no,name,toplc_id)
values('14','보령시',7);
insert into midlc(midlc_no,name,toplc_id)
values('15','서천군',7);

insert into midlc(midlc_no,name,toplc_id)
values('01','유성구',8);
insert into midlc(midlc_no,name,toplc_id)
values('02','대덕구',8);
insert into midlc(midlc_no,name,toplc_id)
values('03','동구',8);
insert into midlc(midlc_no,name,toplc_id)
values('04','중구',8);
insert into midlc(midlc_no,name,toplc_id)
values('05','서구',8);

insert into midlc(midlc_no,name,toplc_id)
values('01','영주시',9);
insert into midlc(midlc_no,name,toplc_id)
values('02','봉화군',9);
insert into midlc(midlc_no,name,toplc_id)
values('03','울진군',9);
insert into midlc(midlc_no,name,toplc_id)
values('04','영덕군',9);
insert into midlc(midlc_no,name,toplc_id)
values('05','영양군',9);
insert into midlc(midlc_no,name,toplc_id)
values('06','안동시',9);
insert into midlc(midlc_no,name,toplc_id)
values('07','예천군',9);
insert into midlc(midlc_no,name,toplc_id)
values('08','문경시',9);
insert into midlc(midlc_no,name,toplc_id)
values('09','상주시',9);
insert into midlc(midlc_no,name,toplc_id)
values('10','의성군',9);
insert into midlc(midlc_no,name,toplc_id)
values('11','청송군',9);
insert into midlc(midlc_no,name,toplc_id)
values('12','포항시',9);
insert into midlc(midlc_no,name,toplc_id)
values('13','경주시',9);
insert into midlc(midlc_no,name,toplc_id)
values('14','청도군',9);
insert into midlc(midlc_no,name,toplc_id)
values('15','경산시',9);
insert into midlc(midlc_no,name,toplc_id)
values('16','영천시',9);
insert into midlc(midlc_no,name,toplc_id)
values('17','군위군',9);
insert into midlc(midlc_no,name,toplc_id)
values('18','구미시',9);
insert into midlc(midlc_no,name,toplc_id)
values('19','김천시',9);
insert into midlc(midlc_no,name,toplc_id)
values('20','칠곡군',9);
insert into midlc(midlc_no,name,toplc_id)
values('21','성주군',9);
insert into midlc(midlc_no,name,toplc_id)
values('22','고령군',9);
insert into midlc(midlc_no,name,toplc_id)
values('23','울릉군',9);

insert into midlc(midlc_no,name,toplc_id)
values('01','동구',10);
insert into midlc(midlc_no,name,toplc_id)
values('02','북구',10);
insert into midlc(midlc_no,name,toplc_id)
values('03','서구',10);
insert into midlc(midlc_no,name,toplc_id)
values('04','중구',10);
insert into midlc(midlc_no,name,toplc_id)
values('05','수성구',10);
insert into midlc(midlc_no,name,toplc_id)
values('06','남구',10);
insert into midlc(midlc_no,name,toplc_id)
values('07','달서구',10);
insert into midlc(midlc_no,name,toplc_id)
values('08','달성군',10);

insert into midlc(midlc_no,name,toplc_id)
values('01','동구',11);
insert into midlc(midlc_no,name,toplc_id)
values('02','북구',11);
insert into midlc(midlc_no,name,toplc_id)
values('03','중구',11);
insert into midlc(midlc_no,name,toplc_id)
values('04','남구',11);
insert into midlc(midlc_no,name,toplc_id)
values('05','울주군',11);

insert into midlc(midlc_no,name,toplc_id)
values('01','기장군',12);
insert into midlc(midlc_no,name,toplc_id)
values('02','금정구',12);
insert into midlc(midlc_no,name,toplc_id)
values('03','북구',12);
insert into midlc(midlc_no,name,toplc_id)
values('04','강서구',12);
insert into midlc(midlc_no,name,toplc_id)
values('05','사상구',12);
insert into midlc(midlc_no,name,toplc_id)
values('06','부산진구',12);
insert into midlc(midlc_no,name,toplc_id)
values('07','연제구',12);
insert into midlc(midlc_no,name,toplc_id)
values('08','동래구',12);
insert into midlc(midlc_no,name,toplc_id)
values('09','해운대구',12);
insert into midlc(midlc_no,name,toplc_id)
values('10','수영구',12);
insert into midlc(midlc_no,name,toplc_id)
values('11','남구',12);
insert into midlc(midlc_no,name,toplc_id)
values('12','동구',12);
insert into midlc(midlc_no,name,toplc_id)
values('13','중구',12);
insert into midlc(midlc_no,name,toplc_id)
values('14','영도구',12);
insert into midlc(midlc_no,name,toplc_id)
values('15','서구',12);
insert into midlc(midlc_no,name,toplc_id)
values('16','사하구',12);

insert into midlc(midlc_no,name,toplc_id)
values('01','함양군',13);
insert into midlc(midlc_no,name,toplc_id)
values('02','거창군',13);
insert into midlc(midlc_no,name,toplc_id)
values('03','합천군',13);
insert into midlc(midlc_no,name,toplc_id)
values('04','창녕군',13);
insert into midlc(midlc_no,name,toplc_id)
values('05','밀양시',13);
insert into midlc(midlc_no,name,toplc_id)
values('06','양산시',13);
insert into midlc(midlc_no,name,toplc_id)
values('07','김해시',13);
insert into midlc(midlc_no,name,toplc_id)
values('08','창원시',13);
insert into midlc(midlc_no,name,toplc_id)
values('09','함안군',13);
insert into midlc(midlc_no,name,toplc_id)
values('10','의령군',13);
insert into midlc(midlc_no,name,toplc_id)
values('11','산청군',13);
insert into midlc(midlc_no,name,toplc_id)
values('12','하동군',13);
insert into midlc(midlc_no,name,toplc_id)
values('13','남해군',13);
insert into midlc(midlc_no,name,toplc_id)
values('14','사천시',13);
insert into midlc(midlc_no,name,toplc_id)
values('15','진주시',13);
insert into midlc(midlc_no,name,toplc_id)
values('16','고성군',13);
insert into midlc(midlc_no,name,toplc_id)
values('17','통영시',13);
insert into midlc(midlc_no,name,toplc_id)
values('18','거제시',13);

insert into midlc(midlc_no,name,toplc_id)
values('01','군산시',14);
insert into midlc(midlc_no,name,toplc_id)
values('02','김제시',14);
insert into midlc(midlc_no,name,toplc_id)
values('03','익산시',14);
insert into midlc(midlc_no,name,toplc_id)
values('04','전주시',14);
insert into midlc(midlc_no,name,toplc_id)
values('05','완주군',14);
insert into midlc(midlc_no,name,toplc_id)
values('06','진안군',14);
insert into midlc(midlc_no,name,toplc_id)
values('07','무주군',14);
insert into midlc(midlc_no,name,toplc_id)
values('08','장수군',14);
insert into midlc(midlc_no,name,toplc_id)
values('09','남원시',14);
insert into midlc(midlc_no,name,toplc_id)
values('10','임실군',14);
insert into midlc(midlc_no,name,toplc_id)
values('11','순창군',14);
insert into midlc(midlc_no,name,toplc_id)
values('12','정읍시',14);
insert into midlc(midlc_no,name,toplc_id)
values('13','부안군',14);
insert into midlc(midlc_no,name,toplc_id)
values('14','고창군',14);

insert into midlc(midlc_no,name,toplc_id)
values('01','영광군',15);
insert into midlc(midlc_no,name,toplc_id)
values('02','함평군',15);
insert into midlc(midlc_no,name,toplc_id)
values('03','장성군',15);
insert into midlc(midlc_no,name,toplc_id)
values('04','담양군',15);
insert into midlc(midlc_no,name,toplc_id)
values('05','곡성군',15);
insert into midlc(midlc_no,name,toplc_id)
values('06','구례군',15);
insert into midlc(midlc_no,name,toplc_id)
values('07','광양시',15);
insert into midlc(midlc_no,name,toplc_id)
values('08','순천시',15);
insert into midlc(midlc_no,name,toplc_id)
values('09','화순군',15);
insert into midlc(midlc_no,name,toplc_id)
values('10','나주시',15);
insert into midlc(midlc_no,name,toplc_id)
values('11','영암군',15);
insert into midlc(midlc_no,name,toplc_id)
values('12','무안군',15);
insert into midlc(midlc_no,name,toplc_id)
values('13','목포시',15);
insert into midlc(midlc_no,name,toplc_id)
values('14','신안군',15);
insert into midlc(midlc_no,name,toplc_id)
values('15','진도군',15);
insert into midlc(midlc_no,name,toplc_id)
values('16','해남군',15);
insert into midlc(midlc_no,name,toplc_id)
values('17','완도군',15);
insert into midlc(midlc_no,name,toplc_id)
values('18','강진군',15);
insert into midlc(midlc_no,name,toplc_id)
values('19','장흥군',15);
insert into midlc(midlc_no,name,toplc_id)
values('20','보성군',15);
insert into midlc(midlc_no,name,toplc_id)
values('21','고흥군',15);
insert into midlc(midlc_no,name,toplc_id)
values('22','여수시',15);

insert into midlc(midlc_no,name,toplc_id)
values('01','북구',16);
insert into midlc(midlc_no,name,toplc_id)
values('02','동구',16);
insert into midlc(midlc_no,name,toplc_id)
values('03','남구',16);
insert into midlc(midlc_no,name,toplc_id)
values('04','서구',16);
insert into midlc(midlc_no,name,toplc_id)
values('05','광산구',16);

insert into midlc(midlc_no,name,toplc_id)
values('01','제주시',17);
insert into midlc(midlc_no,name,toplc_id)
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
