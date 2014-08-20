/* 장난감정보 */
DROP TABLE toy_info 
	CASCADE CONSTRAINTS;

/* 대여점정보 */
DROP TABLE rental_shop 
	CASCADE CONSTRAINTS;

/* 분류정보 */
DROP TABLE category_info 
	CASCADE CONSTRAINTS;

/* 구정보 */
DROP TABLE gu_info 
	CASCADE CONSTRAINTS;

/* 지유게시판 */
DROP TABLE bbs 
	CASCADE CONSTRAINTS;

/* 댓글 */
DROP TABLE reply 
	CASCADE CONSTRAINTS;

/* 장난감정보 */
CREATE TABLE toy_info (
	toy_code VARCHAR2(20) NOT NULL, /* 장난감번호 */
	rental_code INTEGER NOT NULL, /* 대여점번호 */
	category_code VARCHAR2(10), /* 분류번호 */
	toy_name VARCHAR2(100) NOT NULL, /* 장난감이름 */
	business VARCHAR2(50), /* 업체명 */
	region VARCHAR2(50), /* 제조국 */
	made_date VARCHAR2(40), /* 제조년일 */
	get_date VARCHAR2(40), /* 입수년월일 */
	use_age VARCHAR2(50), /* 이용연령 */
	rental_state VARCHAR2(20) NOT NULL, /* 대여상태 */
	toy_img VARCHAR2(100), /* 장난감이미지 */
	detail CLOB, /* 상세설명 */
	reg_date DATE DEFAULT SYSDATE NOT NULL /* 등록일 */
);

CREATE UNIQUE INDEX PK_toy_info
	ON toy_info (
		toy_code ASC,
		rental_code ASC
	);

ALTER TABLE toy_info
	ADD
		CONSTRAINT PK_toy_info
		PRIMARY KEY (
			toy_code,
			rental_code
		);

/* 대여점정보 */
CREATE TABLE rental_shop (
	rental_code INTEGER NOT NULL, /* 대여점번호 */
	gu_code INTEGER NOT NULL, /* 구일련번호 */
	rental_name VARCHAR2(70) NOT NULL, /* 대여점명 */
	addr VARCHAR2(255), /* 주소 */
	tel VARCHAR2(30), /* 전화번호 */
	use_hours VARCHAR2(100), /* 이용시간 */
	rental_term VARCHAR2(30), /* 대여기간 */
	rental_cnt VARCHAR2(30), /* 대여수량 */
	toy_cnt VARCHAR2(10), /* 장난감개수 */
	close_day VARCHAR2(50), /* 휴관일 */
	website VARCHAR2(255), /* 홈페이지 */
	latitude VARCHAR2(30), /* 위도 */
	longitude VARCHAR2(30) /* 경도 */
);

CREATE UNIQUE INDEX PK_rental_shop
	ON rental_shop (
		rental_code ASC
	);

ALTER TABLE rental_shop
	ADD
		CONSTRAINT PK_rental_shop
		PRIMARY KEY (
			rental_code
		);

/* 분류정보 */
CREATE TABLE category_info (
	category_code VARCHAR2(10) NOT NULL, /* 분류번호 */
	category_name VARCHAR2(30) NOT NULL /* 분류명 */
);

CREATE UNIQUE INDEX PK_category_info
	ON category_info (
		category_code ASC
	);

ALTER TABLE category_info
	ADD
		CONSTRAINT PK_category_info
		PRIMARY KEY (
			category_code
		);

/* 구정보 */
CREATE TABLE gu_info (
	gu_code INTEGER NOT NULL, /* 구일련번호 */
	gu_name VARCHAR2(20) NOT NULL /* 구이름 */
);

CREATE UNIQUE INDEX PK_gu_info
	ON gu_info (
		gu_code ASC
	);

ALTER TABLE gu_info
	ADD
		CONSTRAINT PK_gu_info
		PRIMARY KEY (
			gu_code
		);

/* 지유게시판 */
CREATE TABLE bbs (
	code INTEGER NOT NULL, /* 게시글번호 */
	subject VARCHAR2(255) NOT NULL, /* 제목 */
	reg_date VARCHAR2(50) NOT NULL, /* 등록일 */
	count INTEGER DEFAULT 0 NOT NULL, /* 조회수 */
	writer VARCHAR2(50) NOT NULL, /* 작성자 */
	content CLOB NOT NULL, /* 글내용 */
	attachment VARCHAR2(50), /* 첨부파일 */
	group_id INTEGER NOT NULL, /* 그룹게시글번호 */
	group_step INTEGER NOT NULL, /* 그룹출력순서 */
	group_tab INTEGER NOT NULL, /* 들여쓰기 */
	root INTEGER NOT NULL, /* 상위글번호 */
	depth INTEGER NOT NULL /* 답글개수 */
);

CREATE UNIQUE INDEX PK_bbs
	ON bbs (
		code ASC
	);

ALTER TABLE bbs
	ADD
		CONSTRAINT PK_bbs
		PRIMARY KEY (
			code
		);

/* 댓글 */
CREATE TABLE reply (
	reply_code INTEGER NOT NULL, /* 댓글번호 */
	code INTEGER NOT NULL, /* 게시글번호 */
	reply_content CLOB NOT NULL, /* 글내용 */
	reg_date VARCHAR2(50) NOT NULL, /* 등록일 */
	reply_writer VARCHAR2(50) NOT NULL /* 작성자 */
);

CREATE UNIQUE INDEX PK_reply
	ON reply (
		reply_code ASC
	);

ALTER TABLE reply
	ADD
		CONSTRAINT PK_reply
		PRIMARY KEY (
			reply_code
		);

ALTER TABLE toy_info
	ADD
		CONSTRAINT FK_rental_shop_TO_toy_info
		FOREIGN KEY (
			rental_code
		)
		REFERENCES rental_shop (
			rental_code
		);

ALTER TABLE toy_info
	ADD
		CONSTRAINT FK_category_info_TO_toy_info
		FOREIGN KEY (
			category_code
		)
		REFERENCES category_info (
			category_code
		);

ALTER TABLE rental_shop
	ADD
		CONSTRAINT FK_gu_info_TO_rental_shop
		FOREIGN KEY (
			gu_code
		)
		REFERENCES gu_info (
			gu_code
		);

ALTER TABLE reply
	ADD
		CONSTRAINT FK_bbs_TO_reply
		FOREIGN KEY (
			code
		)
		REFERENCES bbs (
			code
		);
		
commit;

-- 구 정보 insert

insert into gu_info values(1, '강남구');

insert into gu_info values((SELECT NVL(MAX(gu_code)+1, 1) FROM gu_info), '강동구');

insert into gu_info values((SELECT NVL(MAX(gu_code)+1, 1) FROM gu_info), '강북구');

insert into gu_info values((SELECT NVL(MAX(gu_code)+1, 1) FROM gu_info), '강서구');

insert into gu_info values((SELECT NVL(MAX(gu_code)+1, 1) FROM gu_info), '관악구');

insert into gu_info values((SELECT NVL(MAX(gu_code)+1, 1) FROM gu_info), '광진구');

insert into gu_info values((SELECT NVL(MAX(gu_code)+1, 1) FROM gu_info), '구로구');

insert into gu_info values((SELECT NVL(MAX(gu_code)+1, 1) FROM gu_info), '금천구');

insert into gu_info values((SELECT NVL(MAX(gu_code)+1, 1) FROM gu_info), '노원구');

insert into gu_info values((SELECT NVL(MAX(gu_code)+1, 1) FROM gu_info), '도봉구');

insert into gu_info values((SELECT NVL(MAX(gu_code)+1, 1) FROM gu_info), '동대문구');

insert into gu_info values((SELECT NVL(MAX(gu_code)+1, 1) FROM gu_info), '동작구');

insert into gu_info values((SELECT NVL(MAX(gu_code)+1, 1) FROM gu_info), '마포구');

insert into gu_info values((SELECT NVL(MAX(gu_code)+1, 1) FROM gu_info), '서대문구');

insert into gu_info values((SELECT NVL(MAX(gu_code)+1, 1) FROM gu_info), '서초구');

insert into gu_info values((SELECT NVL(MAX(gu_code)+1, 1) FROM gu_info), '성동구');

insert into gu_info values((SELECT NVL(MAX(gu_code)+1, 1) FROM gu_info), '성북구');

insert into gu_info values((SELECT NVL(MAX(gu_code)+1, 1) FROM gu_info), '송파구');

insert into gu_info values((SELECT NVL(MAX(gu_code)+1, 1) FROM gu_info), '양천구');

insert into gu_info values((SELECT NVL(MAX(gu_code)+1, 1) FROM gu_info), '영등포구');

insert into gu_info values((SELECT NVL(MAX(gu_code)+1, 1) FROM gu_info), '용산구');

insert into gu_info values((SELECT NVL(MAX(gu_code)+1, 1) FROM gu_info), '은평구');

insert into gu_info values((SELECT NVL(MAX(gu_code)+1, 1) FROM gu_info), '종로구');

insert into gu_info values((SELECT NVL(MAX(gu_code)+1, 1) FROM gu_info), '중구');

insert into gu_info values((SELECT NVL(MAX(gu_code)+1, 1) FROM gu_info), '중랑구');

commit;

-- 분류 정보 insert
insert into category_info values('000', '자동차류');

insert into category_info values('100', '역할놀이');

insert into category_info values('200', '조립류');

insert into category_info values('300', '신체놀이');

insert into category_info values('400', '퍼즐(종이류)');

insert into category_info values('500', '블럭');

insert into category_info values('600', '음률');

insert into category_info values('700', '비디오');

insert into category_info values('800', '기타');

commit;

-- 지점 정보 insert - 지점코드(rental_code), 구 코드(gu_code), 지점명(rental_name)
insert into rental_shop(rental_code, gu_code, rental_name) values(1, 1, '강남구육아종합지원센터(개포점)');

insert into rental_shop(rental_code, gu_code, rental_name) values((SELECT NVL(MAX(rental_code)+1, 1) FROM rental_shop), 1, '강남구육아종합지원센터(논현점)');

insert into rental_shop(rental_code, gu_code, rental_name) values((SELECT NVL(MAX(rental_code)+1, 1) FROM rental_shop), 1, '강남구육아종합지원센터(대치점)');

insert into rental_shop(rental_code, gu_code, rental_name) values((SELECT NVL(MAX(rental_code)+1, 1) FROM rental_shop), 1, '강남구육아종합지원센터(도곡점)');

insert into rental_shop(rental_code, gu_code, rental_name) values((SELECT NVL(MAX(rental_code)+1, 1) FROM rental_shop), 2, '동동레코텍(성내점)');

insert into rental_shop(rental_code, gu_code, rental_name) values((SELECT NVL(MAX(rental_code)+1, 1) FROM rental_shop), 2, '동동레코텍(천호점)');

insert into rental_shop(rental_code, gu_code, rental_name) values((SELECT NVL(MAX(rental_code)+1, 1) FROM rental_shop), 3, '강북구 장난감도서관');

insert into rental_shop(rental_code, gu_code, rental_name) values((SELECT NVL(MAX(rental_code)+1, 1) FROM rental_shop), 3, '장난감나라');

insert into rental_shop(rental_code, gu_code, rental_name) values((SELECT NVL(MAX(rental_code)+1, 1) FROM rental_shop), 4, '키득키득 놀잇감터');

insert into rental_shop(rental_code, gu_code, rental_name) values((SELECT NVL(MAX(rental_code)+1, 1) FROM rental_shop), 5, '꿈놀이터');

insert into rental_shop(rental_code, gu_code, rental_name) values((SELECT NVL(MAX(rental_code)+1, 1) FROM rental_shop), 6, '재미씨앗');

insert into rental_shop(rental_code, gu_code, rental_name) values((SELECT NVL(MAX(rental_code)+1, 1) FROM rental_shop), 7, '구로 꿈나무장난감나라(구로점)');

insert into rental_shop(rental_code, gu_code, rental_name) values((SELECT NVL(MAX(rental_code)+1, 1) FROM rental_shop), 7, '구로 꿈나무장난감나라(개봉점)');

insert into rental_shop(rental_code, gu_code, rental_name) values((SELECT NVL(MAX(rental_code)+1, 1) FROM rental_shop), 8, '장난감나라(시흥점)');

insert into rental_shop(rental_code, gu_code, rental_name) values((SELECT NVL(MAX(rental_code)+1, 1) FROM rental_shop), 8, '장난감나라(독산점)');

insert into rental_shop(rental_code, gu_code, rental_name) values((SELECT NVL(MAX(rental_code)+1, 1) FROM rental_shop), 9, '노원정보장난감도서관');

insert into rental_shop(rental_code, gu_code, rental_name) values((SELECT NVL(MAX(rental_code)+1, 1) FROM rental_shop), 10, '도봉구 육아종합지원센터');

insert into rental_shop(rental_code, gu_code, rental_name) values((SELECT NVL(MAX(rental_code)+1, 1) FROM rental_shop), 10, '보듬이나눔이 영유아플라자');

insert into rental_shop(rental_code, gu_code, rental_name) values((SELECT NVL(MAX(rental_code)+1, 1) FROM rental_shop), 11, '동대문구 영유아플라자(답십리점)');

insert into rental_shop(rental_code, gu_code, rental_name) values((SELECT NVL(MAX(rental_code)+1, 1) FROM rental_shop), 11, '동대문구 영유아플라자(제기점)');

insert into rental_shop(rental_code, gu_code, rental_name) values((SELECT NVL(MAX(rental_code)+1, 1) FROM rental_shop), 12, '동작구육아종합지원센터(영유아플라자)');

insert into rental_shop(rental_code, gu_code, rental_name) values((SELECT NVL(MAX(rental_code)+1, 1) FROM rental_shop), 12, '로야장난감대여점');

insert into rental_shop(rental_code, gu_code, rental_name) values((SELECT NVL(MAX(rental_code)+1, 1) FROM rental_shop), 12, '사당영유아돌보미센터');

insert into rental_shop(rental_code, gu_code, rental_name) values((SELECT NVL(MAX(rental_code)+1, 1) FROM rental_shop), 12, '신대방영유아돌보미센터');

insert into rental_shop(rental_code, gu_code, rental_name) values((SELECT NVL(MAX(rental_code)+1, 1) FROM rental_shop), 13, '도화 장난감대여점');

insert into rental_shop(rental_code, gu_code, rental_name) values((SELECT NVL(MAX(rental_code)+1, 1) FROM rental_shop), 13, '망원 장난감대여점');

insert into rental_shop(rental_code, gu_code, rental_name) values((SELECT NVL(MAX(rental_code)+1, 1) FROM rental_shop), 14, '서대문구육아종합지원센터');

insert into rental_shop(rental_code, gu_code, rental_name) values((SELECT NVL(MAX(rental_code)+1, 1) FROM rental_shop), 15, '서초구 육아종합지원센터(장난감도서관)');

insert into rental_shop(rental_code, gu_code, rental_name) values((SELECT NVL(MAX(rental_code)+1, 1) FROM rental_shop), 16, '무지개장난감세상');

insert into rental_shop(rental_code, gu_code, rental_name) values((SELECT NVL(MAX(rental_code)+1, 1) FROM rental_shop), 17, '장난감이좋아');

insert into rental_shop(rental_code, gu_code, rental_name) values((SELECT NVL(MAX(rental_code)+1, 1) FROM rental_shop), 17, 'sb장난감도서관');

insert into rental_shop(rental_code, gu_code, rental_name) values((SELECT NVL(MAX(rental_code)+1, 1) FROM rental_shop), 18, '놀이감대여실');

insert into rental_shop(rental_code, gu_code, rental_name) values((SELECT NVL(MAX(rental_code)+1, 1) FROM rental_shop), 19, '양천구 육아종합지원센터(영유아플라자)');

insert into rental_shop(rental_code, gu_code, rental_name) values((SELECT NVL(MAX(rental_code)+1, 1) FROM rental_shop), 20, '장난감 도서관 미운영');

insert into rental_shop(rental_code, gu_code, rental_name) values((SELECT NVL(MAX(rental_code)+1, 1) FROM rental_shop), 21, '용산 아이노리 장난감나라');

insert into rental_shop(rental_code, gu_code, rental_name) values((SELECT NVL(MAX(rental_code)+1, 1) FROM rental_shop), 22, '은평구육아종합지원센터 내 라온 장난감나라');

insert into rental_shop(rental_code, gu_code, rental_name) values((SELECT NVL(MAX(rental_code)+1, 1) FROM rental_shop), 23, '종로구 육아종합지원센터 장난감도서관');

insert into rental_shop(rental_code, gu_code, rental_name) values((SELECT NVL(MAX(rental_code)+1, 1) FROM rental_shop), 24, '신당장난감도서관(키즈토이)');

insert into rental_shop(rental_code, gu_code, rental_name) values((SELECT NVL(MAX(rental_code)+1, 1) FROM rental_shop), 24, '중림장난감도서관(키즈토이)');

insert into rental_shop(rental_code, gu_code, rental_name) values((SELECT NVL(MAX(rental_code)+1, 1) FROM rental_shop), 25, '장난감대여센터(중랑점)');

insert into rental_shop(rental_code, gu_code, rental_name) values((SELECT NVL(MAX(rental_code)+1, 1) FROM rental_shop), 25, '장난감대여센터(면목점)');

-- bbs insert

insert into bbs values((SELECT NVL(MAX(code)+1, 1) FROM bbs), '희망장난감신청합니다.', SYSDATE, 0, '배진솔', '솔솔1', '', (SELECT NVL(MAX(group_id)+1, 1) FROM bbs), 0, 0, 0, 0);

insert into bbs values((SELECT NVL(MAX(code)+1, 1) FROM bbs), '희망장난감신청합니다.', SYSDATE, 0, '배진솔', '솔솔2', '', (SELECT NVL(MAX(group_id)+1, 1) FROM bbs), 0, 0, 0, 0);

insert into bbs values((SELECT NVL(MAX(code)+1, 1) FROM bbs), '희망장난감신청합니다.', SYSDATE, 0, '배진솔', '솔솔3', '', (SELECT NVL(MAX(group_id)+1, 1) FROM bbs), 0, 0, 0, 0);

insert into bbs values((SELECT NVL(MAX(code)+1, 1) FROM bbs), '희망장난감신청합니다.', SYSDATE, 0, '배진솔', '솔솔4', '', (SELECT NVL(MAX(group_id)+1, 1) FROM bbs), 0, 0, 0, 0);

insert into bbs values((SELECT NVL(MAX(code)+1, 1) FROM bbs), '희망장난감신청합니다.', SYSDATE, 0, '배진솔', '솔솔5', '', (SELECT NVL(MAX(group_id)+1, 1) FROM bbs), 0, 0, 0, 0);

--reply insert
insert into reply values((SELECT NVL(MAX(reply_code)+1, 1) FROM reply), 5, '댓글입니다', SYSDATE, '진솔이댓글');

insert into reply values((SELECT NVL(MAX(reply_code)+1, 1) FROM reply), 3, '댓글입니다', SYSDATE, '진솔이댓글');

insert into reply values((SELECT NVL(MAX(reply_code)+1, 1) FROM reply), 1, '댓글입니다', SYSDATE, '진솔이댓글');

commit;
