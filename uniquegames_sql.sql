/* version : MySQL 8.0.33
    DB, 계정 생성 및 권한 부여 쿼리문
    CREATE DATABASE uniquegames;
    CREATE USER 'unique_games'@'localhost' IDENTIFIED BY '1234';
    GRANT ALL PRIVILEGES ON uniquegames.* TO 'unique_games'@'localhost';
    FLUSH PRIVILEGES;
*/

DROP TABLE IF EXISTS `MEMBER`;
CREATE TABLE MEMBER (
	-- ID(PK), 회원 아이디(PK), 비밀번호, 이름, 이메일, 주소, 통신사, 전화번호
                        MEMBER_ID VARCHAR(15) NOT NULL PRIMARY KEY,
                        PASSWORD VARCHAR(15) NOT NULL,
                        NAME VARCHAR(15) NOT NULL,
                        EMAIL VARCHAR(30) NOT NULL,
						ADDR VARCHAR(100),
						TEL VARCHAR(20) NOT NULL,
                        PHONE_NUM VARCHAR(20) NOT NULL,
                        
                        INDEX idx_member_id (MEMBER_ID)
);
DROP TABLE IF EXISTS `GAME`;
CREATE TABLE GAME (
                      ID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
                      NAME VARCHAR(20) NOT NULL,
                      IMAGE_PATH VARCHAR(200) NOT NULL,
                      GAME_GENRE VARCHAR(50) NOT NULL,
                      DONATION_STATUS INT(3) NOT NULL DEFAULT 0,
                      DESCRIPTION VARCHAR(200),
                      LIKELIST VARCHAR(200)
);
DROP TABLE IF EXISTS `COMPANY` ;
CREATE TABLE COMPANY (
	-- ID(PK), 회사 아이디(PK), 비밀번호, 회사명, 이메일, 주소, 통신사, 전화번호, G_ID(FK)
						COMPANY_ID VARCHAR(15) NOT NULL PRIMARY KEY,
						PASSWORD VARCHAR(15) NOT NULL,
						NAME VARCHAR(15) NOT NULL,
						EMAIL VARCHAR(30) NOT NULL,
						ADDR VARCHAR(100),
						TEL VARCHAR(10) NOT NULL,
						PHONE_NUM VARCHAR(20) NOT NULL,
						G_ID INT UNSIGNED,
                        
						CONSTRAINT FK_COMPANY_GAME FOREIGN KEY (G_ID) REFERENCES GAME (ID)  ON UPDATE CASCADE ON DELETE CASCADE,
                        
						INDEX idx_company_id(COMPANY_ID),
						INDEX idx_company_game(G_ID),
						INDEX idx_company_intro(NAME)
);


DROP TABLE IF EXISTS `NOTICE` ;
CREATE TABLE NOTICE (
	-- POST_ID(PK), COMPANY_ID(FK), 제목, 내용, 조회수, 게시날짜
						POST_ID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
                        COMPANY_ID VARCHAR(15) NOT NULL,
                        TITLE VARCHAR(50),
                        CONTENT VARCHAR(300),
                        NOTICE_HITS INT,
                        NOTICE_DATE DATETIME DEFAULT CURRENT_TIMESTAMP,

                        CONSTRAINT FK_NOTICE_COMPANY FOREIGN KEY (COMPANY_ID) REFERENCES COMPANY (COMPANY_ID) ON DELETE CASCADE
);

DROP TABLE IF EXISTS `COMMENT`;
CREATE TABLE COMMENT (
	-- COMMENT_ID(PK), POST_ID(FK), MEMBER_ID(FK), 댓글 내용, 댓글 날짜
						COMMENT_ID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
						POST_ID INT UNSIGNED NOT NULL ,
						MEMBER_ID VARCHAR(15) NOT NULL,
						COMMENT_CONTENT VARCHAR(50),
						COMMENT_DATE DATETIME DEFAULT CURRENT_TIMESTAMP,

						CONSTRAINT FK_COMMENT_NOTICE FOREIGN KEY (POST_ID) REFERENCES NOTICE (POST_ID) ON DELETE CASCADE,
						CONSTRAINT FK_COMMENT_MEMBER FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER (MEMBER_ID) ON DELETE CASCADE
);

DROP TABLE IF EXISTS `NOTICE_IMAGE`;
CREATE TABLE NOTICE_IMAGE (
	-- IMAGE_ID(PK), POST_ID(FK), 업로드 파일, 업로드 날짜
						IMAGE_ID VARCHAR(100) NOT NULL PRIMARY KEY,
                        POST_ID INT UNSIGNED,
                        UPLOAD_FILE VARCHAR(100),
                        UPLOAD_DATE DATETIME DEFAULT CURRENT_TIMESTAMP,

                        CONSTRAINT FK_NOTICEIMG_NOTICE FOREIGN KEY (POST_ID) REFERENCES NOTICE (POST_ID) ON DELETE CASCADE
);

DROP TABLE IF EXISTS `ORDERS`;
CREATE TABLE ORDERS (
	-- ID(PK), M_ID(FK), C_ID(FK), G_ID(FK), 결제 날짜, 결제 금액, 결제 방식, 결제 상태, 게임 타이틀, 게임 이미지
    -- 결제 상태 : 결제 안됨 NOT, 결제 완료 COMPLETE, 환불 신청 REFUND_REQUEST, 환불 완료 REFUND_COMPLETE
    -- 결제 방식 : 카드 CARD, 가상 계좌 VBANK, 무통장 입금 TRANS, 휴대폰 소액결제 PHONE, 카카오페이 KAKAO
						ID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
                        M_ID VARCHAR(15) NOT NULL,
                        C_ID VARCHAR(15) NOT NULL,
                        G_ID INT UNSIGNED NOT NULL,
                        ORDER_DATE DATETIME DEFAULT CURRENT_TIMESTAMP,
                        AMOUNT INT NOT NULL,
                        METHOD VARCHAR(20),
                        PAYMENT_STATUS VARCHAR(30) DEFAULT 'NOT' NOT NULL,
                        GAMETITLE VARCHAR(50) NOT NULL,
                        GAME_IMG VARCHAR(100) NOT NULL,

                        CONSTRAINT FK_ORDERS_MEMBER FOREIGN KEY (M_ID) REFERENCES MEMBER (MEMBER_ID),
						CONSTRAINT FK_ORDERS_COMPANY FOREIGN KEY (C_ID) REFERENCES COMPANY (COMPANY_ID),
						CONSTRAINT FK_ORDERS_GAME FOREIGN KEY (G_ID) REFERENCES GAME (ID),
						CONSTRAINT AMOUNT_CHECK CHECK (`AMOUNT` >= 10000)
);



DROP TABLE IF EXISTS `INTRO`;
CREATE TABLE INTRO (
						ID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
						C_ID VARCHAR(15),
						NAME VARCHAR(15),
						TITLE VARCHAR(100) NOT NULL,
						CONTENT VARCHAR(500) NOT NULL,
						UPLOAD VARCHAR(100),

                        CONSTRAINT FK_INTRO_COMPANY FOREIGN KEY (C_ID) REFERENCES COMPANY (COMPANY_ID) ON DELETE CASCADE ON UPDATE CASCADE ,
                        CONSTRAINT FK_INTRO_COMPANY2 FOREIGN KEY (NAME) REFERENCES COMPANY (NAME) ON DELETE CASCADE ON UPDATE CASCADE
);


