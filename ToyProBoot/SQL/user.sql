-- 회원정보
DROP TABLE user_info;

-- 회원정보
CREATE TABLE user_info (
	user_id       VARCHAR2(20)  NOT NULL, -- 아이디
	user_pw       VARCHAR2(20)  NOT NULL, -- 비밀번호
	user_name     VARCHAR2(50)  NOT NULL, -- 이름
	tel           VARCHAR2(30)  NOT NULL, -- 전화번호
	email         VARCHAR2(40)  NULL,     -- 이메일
	email_receive INTEGER       NULL,     -- 이메일수신
	addr          VARCHAR2(255) NULL,     -- 주소
	reg_date      DATE          NULL      -- 가입일
);

-- 회원정보 기본키
CREATE UNIQUE INDEX PK_user_info
	ON user_info ( -- 회원정보
		user_id ASC -- 아이디
	);

-- 회원정보
ALTER TABLE user_info
	ADD
		CONSTRAINT PK_user_info -- 회원정보 기본키
		PRIMARY KEY (
			user_id -- 아이디
		);

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
VALUES('user06','user06','유저06','010-1234-5678','hrjeong7@toy.com',1,'서울시 서초구 서초동 비트 504호',SYSDATE);

INSERT INTO user_info
VALUES('user07','user07','유저07','010-1234-5678','hrjeong7@toy.com',1,'서울시 서초구 서초동 비트 504호',SYSDATE);

commit;

-- 7 row commit