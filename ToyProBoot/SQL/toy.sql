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

/* 자유게시판 */
DROP TABLE bbs 
	CASCADE CONSTRAINTS;

/* 댓글 */
DROP TABLE reply 
	CASCADE CONSTRAINTS;

/* 회원정보 */
DROP TABLE user_info 
	CASCADE CONSTRAINTS;

/* 예약정보 */
DROP TABLE reservation 
	CASCADE CONSTRAINTS;

/* 이미지정보 */
DROP TABLE gallery 
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

/* 자유게시판 */
CREATE TABLE bbs (
	code INTEGER NOT NULL, /* 게시글번호 */
	user_id VARCHAR2(255), /* 아이디 */
	subject VARCHAR2(255) NOT NULL, /* 제목 */
	reg_date VARCHAR2(50) NOT NULL, /* 등록일 */
	count INTEGER DEFAULT 0 NOT NULL, /* 조회수 */
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
	user_id VARCHAR2(255), /* 아이디 */
	reply_content CLOB NOT NULL, /* 글내용 */
	reg_date VARCHAR2(50) NOT NULL /* 등록일 */
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

/* 회원정보 */
CREATE TABLE user_info (
	user_id VARCHAR2(255) NOT NULL, /* 아이디 */
	user_pw VARCHAR2(255) NOT NULL, /* 비밀번호 */
	user_name VARCHAR2(50) NOT NULL, /* 이름 */
	tel VARCHAR2(30) NOT NULL, /* 전화번호 */
	email VARCHAR2(40), /* 이메일 */
	email_receive INTEGER, /* 이메일수신 */
	addr VARCHAR2(255), /* 주소 */
	reg_date DATE /* 가입일 */
);

CREATE UNIQUE INDEX PK_user_info
	ON user_info (
		user_id ASC
	);

ALTER TABLE user_info
	ADD
		CONSTRAINT PK_user_info
		PRIMARY KEY (
			user_id
		);

/* 예약정보 */
CREATE TABLE reservation (
	reservation_code INTEGER NOT NULL, /* 예약번호 */
	user_id VARCHAR2(255), /* 아이디 */
	toy_code VARCHAR2(20), /* 장난감번호 */
	rental_code INTEGER, /* 대여점번호 */
	reg_date VARCHAR2(30), /* 예약일시 */
	rental_date VARCHAR2(30), /* 대출예약일 */
	return_date VARCHAR2(30) /* 반납예정일 */
);

CREATE UNIQUE INDEX PK_reservation
	ON reservation (
		reservation_code ASC
	);

ALTER TABLE reservation
	ADD
		CONSTRAINT PK_reservation
		PRIMARY KEY (
			reservation_code
		);

/* 이미지정보 */
CREATE TABLE gallery (
	img_no INTEGER, /* 이미지번호 */
	img_name VARCHAR2(50) /* 이미지파일명 */
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

ALTER TABLE bbs
	ADD
		CONSTRAINT FK_user_info_TO_bbs
		FOREIGN KEY (
			user_id
		)
		REFERENCES user_info (
			user_id
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

ALTER TABLE reply
	ADD
		CONSTRAINT FK_user_info_TO_reply
		FOREIGN KEY (
			user_id
		)
		REFERENCES user_info (
			user_id
		);

ALTER TABLE reservation
	ADD
		CONSTRAINT FK_user_info_TO_reservation
		FOREIGN KEY (
			user_id
		)
		REFERENCES user_info (
			user_id
		);

ALTER TABLE reservation
	ADD
		CONSTRAINT FK_toy_info_TO_reservation
		FOREIGN KEY (
			toy_code,
			rental_code
		)
		REFERENCES toy_info (
			toy_code,
			rental_code
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


--user insert
INSERT INTO user_info
VALUES('user01','user01','유저01','010-1234-5678','hrjeong7@toy.com',1,'서울시 서초구 서초동 비트 504호',SYSDATE);

INSERT INTO user_info
VALUES('user02','user02','유저02','010-1234-5678','hrjeong7@toy.com',1,'서울시 서초구 서초동 비트 504호',SYSDATE);

INSERT INTO user_info
VALUES('user03','user03','유저03','010-1234-5678','hrjeong7@toy.com',1,'서울시 서초구 서초동 비트 504호',SYSDATE);

INSERT INTO user_info
VALUES('user04','user04','유저04','010-1234-5678','hrjeong7@toy.com',1,'서울시 서초구 서초동 비트 504호',SYSDATE);

INSERT INTO user_info
VALUES('user05','user05','유저05','010-1234-5678','hrjeong7@toy.com',1,'서울시 서초구 서초동 비트 504호',SYSDATE);

INSERT INTO user_info
VALUES('admin','1234','관리자','010-1234-5678','hrjeong7@toy.com',1,'서울시 서초구 서초동 비트 504호',SYSDATE);

commit;

-- bbs insert

insert into bbs values((SELECT NVL(MAX(code)+1, 1) FROM bbs), 'admin', '희망장난감신청합니다.', SYSDATE, 0, '솔솔1', '', (SELECT NVL(MAX(group_id)+1, 1) FROM bbs), 0, 0, 0, 0);

insert into bbs values((SELECT NVL(MAX(code)+1, 1) FROM bbs), 'admin', '희망장난감신청합니다.', SYSDATE, 0, '솔솔2', '', (SELECT NVL(MAX(group_id)+1, 1) FROM bbs), 0, 0, 0, 0);

insert into bbs values((SELECT NVL(MAX(code)+1, 1) FROM bbs), 'admin', '희망장난감신청합니다.', SYSDATE, 0, '솔솔3', '', (SELECT NVL(MAX(group_id)+1, 1) FROM bbs), 0, 0, 0, 0);

insert into bbs values((SELECT NVL(MAX(code)+1, 1) FROM bbs), 'admin', '희망장난감신청합니다.', SYSDATE, 0, '솔솔4', '', (SELECT NVL(MAX(group_id)+1, 1) FROM bbs), 0, 0, 0, 0);

insert into bbs values((SELECT NVL(MAX(code)+1, 1) FROM bbs), 'admin', '희망장난감신청합니다.', SYSDATE, 0, '솔솔5', '', (SELECT NVL(MAX(group_id)+1, 1) FROM bbs), 0, 0, 0, 0);


--gallery insert

insert into gallery values(1,'a.jpg');
insert into gallery values(2,'b.jpg');
insert into gallery values(3,'c.jpg');
insert into gallery values(4,'d.jpg');
insert into gallery values(5,'e.jpg');
insert into gallery values(6,'f.jpg');
insert into gallery values(7,'g.jpg');
insert into gallery values(8,'h.jpg');
insert into gallery values(9,'i.jpg');
insert into gallery values(10,'j.jpg');
insert into gallery values(11,'k.jpg');
insert into gallery values(12,'l.jpg');
insert into gallery values(13,'m.jpg');
insert into gallery values(14,'n.jpg');
insert into gallery values(15,'o.jpg');
insert into gallery values(16,'p.jpg');
insert into gallery values(17,'q.jpg');
insert into gallery values(18,'r.jpg');
insert into gallery values(19,'s.jpg');



commit;


