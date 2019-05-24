-- 회원데이터
insert into mbr(mbr_id,user_id,pwd,name,bth_dt,gndr,tel,email,post,bas_addr,det_addr,login_type, mgr)
values(1,'testId',password('1111'),'김민철','1995-5-5','남','010-1111-1111','babo@haha.com',11111,'비트캠프','강남','face', 1);
insert into mbr(mbr_id,user_id,pwd,name,bth_dt,gndr,tel,email,post,bas_addr,det_addr,login_type)
values(2,'test2',password('1111'),'test2','1991-01-01','남','010-1234-5678','test2@bot.com',11112,'서울','강남','kakao');
insert into mbr(mbr_id,user_id,pwd,name,bth_dt,gndr,tel,email,post,bas_addr,det_addr,login_type)
values(3,'test3',password('1111'),'test3','1981-01-01','여','010-3334-5555','test3@bot.com',44441,'부산','해운대','google');
insert into mbr(mbr_id,user_id,pwd,name,bth_dt,gndr,tel,email,post,bas_addr,det_addr,login_type)
values(4,'test4',password('1111'),'test4','1992-5-5','남','010-1111-1221','test4@bot.com',11113,'서울시 서초구','강남','face');
insert into mbr(mbr_id,user_id,pwd,name,bth_dt,gndr,tel,email,post,bas_addr,det_addr,login_type)
values(5,'test5',password('1111'),'test5','1981-01-01','남','010-2234-5678','test5@bot.com',22221,'경기','고양','homepage');
insert into mbr(mbr_id,user_id,pwd,name,bth_dt,gndr,tel,email,post,bas_addr,det_addr,login_type)
values(6,'test6',password('1111'),'test6','1967-01-01','여','010-5334-5555','test6@bot.com',33331,'인천','연수동','google');
insert into mbr(mbr_id,user_id,pwd,name,bth_dt,gndr,tel,email,post,bas_addr,det_addr,login_type)
values(7,'test7',password('1111'),'test7','1967-01-01','여','010-5334-5255','test7@bot.com',33332,'인천','연수동','google');
insert into mbr(mbr_id,user_id,pwd,name,bth_dt,gndr,tel,email,post,bas_addr,det_addr,login_type)
values(8,'kiwon',password('1111'),'test7','1967-01-01','여','010-1334-5255','test8@bot.com',33333,'인천','연수동','google');
insert into mbr(mbr_id,user_id,pwd,name,bth_dt,gndr,tel,email,post,bas_addr,det_addr,login_type)
values(9,'hoho',password('1111'),'test8','1967-01-01','여','010-1322-5255','test9@gmail.com',33333,'인천','연수동','google');

-- 연령대데이터
insert into age(age_id, ages)
values(1,'10세미만');
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
values(1,7,1,'격수');
insert into tm_mbr(tm_mbr_id,mbr_id,tlead_wth,pstn)
values(2,7,1,'유격수');
insert into tm_mbr(tm_mbr_id,mbr_id,tlead_wth,pstn)
values(8,8,1,'프로게이머');
insert into tm_mbr(tm_mbr_id,mbr_id,tlead_wth,pstn)
values(4,8,1,'프로게이머');


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
insert into toplc(toplc_id,toplc_no,name)
values(1,'01','서울특별시');
insert into toplc(toplc_id,toplc_no,name)
values(2,'02','경기도');
insert into toplc(toplc_id,toplc_no,name)
values(3,'03','인천광역시');

-- 시군구지역데이터
insert into midlc(midlc_id,midlc_no,name,toplc_id)
values(1,'01','강남구',1);
insert into midlc(midlc_id,midlc_no,name,toplc_id)
values(2,'02','서초구',1);
insert into midlc(midlc_id,midlc_no,name,toplc_id)
values(3,'03','송파구',1);
insert into midlc(midlc_id,midlc_no,name,toplc_id)
values(4,'01','고양시',2);
insert into midlc(midlc_id,midlc_no,name,toplc_id)
values(5,'02','구리시',2);
insert into midlc(midlc_id,midlc_no,name,toplc_id)
values(6,'03','광명시',2);
insert into midlc(midlc_id,midlc_no,name,toplc_id)
values(7,'01','미추홀구',3);
insert into midlc(midlc_id,midlc_no,name,toplc_id)
values(8,'02','동구',3);
insert into midlc(midlc_id,midlc_no,name,toplc_id)
values(9,'03','연수구',3);

-- 읍면동지역데이터
insert into btmlc(btmlc_id,btmlc_no,name,midlc_id)
values(1,'01','역삼동',1);
insert into btmlc(btmlc_id,btmlc_no,name,midlc_id)
values(2,'02','개포동',1);
insert into btmlc(btmlc_id,btmlc_no,name,midlc_id)
values(3,'03','삼성동',1);
insert into btmlc(btmlc_id,btmlc_no,name,midlc_id)
values(4,'01','방배동',2);
insert into btmlc(btmlc_id,btmlc_no,name,midlc_id)
values(5,'02','양재동',2);
insert into btmlc(btmlc_id,btmlc_no,name,midlc_id)
values(6,'03','우면동',2);
insert into btmlc(btmlc_id,btmlc_no,name,midlc_id)
values(7,'01','잠실동',3);
insert into btmlc(btmlc_id,btmlc_no,name,midlc_id)
values(8,'02','신천동',3);
insert into btmlc(btmlc_id,btmlc_no,name,midlc_id)
values(9,'03','송파동',3);
insert into btmlc(btmlc_id,btmlc_no,name,midlc_id)
values(10,'01','덕양구',4);
insert into btmlc(btmlc_id,btmlc_no,name,midlc_id)
values(11,'02','일산동구',4);
insert into btmlc(btmlc_id,btmlc_no,name,midlc_id)
values(12,'03','일산서구',4);
insert into btmlc(btmlc_id,btmlc_no,name,midlc_id)
values(13,'01','갈매동',5);
insert into btmlc(btmlc_id,btmlc_no,name,midlc_id)
values(14,'02','사노동',5);
insert into btmlc(btmlc_id,btmlc_no,name,midlc_id)
values(15,'03','인창동',5);
insert into btmlc(btmlc_id,btmlc_no,name,midlc_id)
values(16,'01','광명동',6);
insert into btmlc(btmlc_id,btmlc_no,name,midlc_id)
values(17,'02','철산동',6);
insert into btmlc(btmlc_id,btmlc_no,name,midlc_id)
values(18,'03','하안동',6);
insert into btmlc(btmlc_id,btmlc_no,name,midlc_id)
values(19,'01','숭의동',7);
insert into btmlc(btmlc_id,btmlc_no,name,midlc_id)
values(20,'02','용현동',7);
insert into btmlc(btmlc_id,btmlc_no,name,midlc_id)
values(21,'03','학익동',7);
insert into btmlc(btmlc_id,btmlc_no,name,midlc_id)
values(22,'01','만석동',8);
insert into btmlc(btmlc_id,btmlc_no,name,midlc_id)
values(23,'02','화수동',8);
insert into btmlc(btmlc_id,btmlc_no,name,midlc_id)
values(24,'03','송현동',8);
insert into btmlc(btmlc_id,btmlc_no,name,midlc_id)
values(25,'01','옥련동',9);
insert into btmlc(btmlc_id,btmlc_no,name,midlc_id)
values(26,'02','선학동',9);
insert into btmlc(btmlc_id,btmlc_no,name,midlc_id)
values(27,'03','연수동',9);

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
insert into qstn(qstn_id,mbr_id,titl,cont,qstn_type)
values(1,1,'비밀번호변경','비밀번호가 안 바뀌네요.','회원정보');
insert into qstn(qstn_id,mbr_id,titl,cont,qstn_type)
values(2,2,'상대팀이 안오네요','징계 좀 먹여줘요.','경기');
insert into qstn(qstn_id,mbr_id,titl,cont,qstn_type)
values(3,3,'사이트가 느려요.','크롬에서 너무 느리네요.','기타');
insert into qstn(qstn_id,ans_stat,mbr_id,titl,cont,qstn_type)
values(4,true,4,'사이트가 느려요.','크롬에서 너무 느리네요.','기타');

-- 답변데이터
insert into ans(ans_id,qstn_id,titl,cont)
values(1,1,'비밀번호변경문의','비밀번호변경에서 바꿀 수 있습니다.');
insert into ans(ans_id,qstn_id,titl,cont)
values(2,2,'경기불참문의','경고가 주어집니다.');
insert into ans(ans_id,qstn_id,titl,cont)
values(3,3,'사이트접속지연문의','인터넷을 바꾸면 빨라집니다.');


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

