/* 관리자 */
DROP TABLE ADMIN 
	CASCADE CONSTRAINTS;

/* 분야 */
DROP TABLE CATEGORY 
	CASCADE CONSTRAINTS;

/* 컨텐츠구매자 */
DROP TABLE FINDERMEMBERS 
	CASCADE CONSTRAINTS;
    
/* 컨텐츠기획자 */
DROP TABLE PROMEMBERS 
	CASCADE CONSTRAINTS;
    
/* 뉴스피드 */
DROP TABLE NEWSFEED 
	CASCADE CONSTRAINTS;
    
/* 뉴스피드댓글 */
DROP TABLE NEWS_COMMENT 
	CASCADE CONSTRAINTS;
    
/* 찜하기 */
DROP TABLE FAVORITE 
	CASCADE CONSTRAINTS;
    
/* 방문자목록 */
DROP TABLE VISITED 
	CASCADE CONSTRAINTS;

/* 유·무료컨텐츠 */
DROP TABLE CONTENTS 
	CASCADE CONSTRAINTS;

/* 유료질문방 */
DROP TABLE QUESTION 
	CASCADE CONSTRAINTS;
    
/* 유료질문방답변 */
DROP TABLE QANSWER 
	CASCADE CONSTRAINTS;
    
/* 퀴즈 */
DROP TABLE QUIZ 
	CASCADE CONSTRAINTS;

/* 구매내역 */
DROP TABLE BUY 
	CASCADE CONSTRAINTS;

/* 프로멤버페이지 */
DROP TABLE PPAGE 
	CASCADE CONSTRAINTS;

/* 후기 */
DROP TABLE REVIEW 
	CASCADE CONSTRAINTS;
    
/* 자유게시판 */
DROP TABLE FBOARD 
	CASCADE CONSTRAINTS;

/* 자유게시판댓글 */
DROP TABLE FB_COMMENT 
	CASCADE CONSTRAINTS;

/* 1:1문의 */
DROP TABLE CLAIM 
	CASCADE CONSTRAINTS;

/* 자주묻는질문분류 */
DROP TABLE FAQ_CATE 
	CASCADE CONSTRAINTS;

/* 자주묻는질문 */
DROP TABLE FAQ 
	CASCADE CONSTRAINTS;

/* 좋아요 */
DROP TABLE LIKES
	CASCADE CONSTRAINTS;

/* 신고 */
DROP TABLE REPORT 
	CASCADE CONSTRAINTS;

/* 알람 */
DROP TABLE ALARM 
	CASCADE CONSTRAINTS;
    
/* 관리자 */
CREATE TABLE ADMIN (
	AD_ID VARCHAR2(100) NOT NULL, /* 아이디 */
	AD_PW VARCHAR2(100) NOT NULL, /* 비밀번호 */
	AD_NAME VARCHAR2(100) NOT NULL,/* 이름 */
    PRIMARY KEY(AD_ID)
);

/* 분야 */
CREATE TABLE CATEGORY (
	CATE_NUM NUMBER NOT NULL, /* 분야번호 */
	CATE_NAME VARCHAR2(100) NOT NULL, /* 분야이름 */
    PRIMARY KEY(CATE_NUM)
);

/* 컨텐츠구매자 */
CREATE TABLE FINDERMEMBERS (
	F_EMAIL VARCHAR2(100) NOT NULL, /* 이메일 */
	F_PW VARCHAR2(100) NOT NULL, /* 비밀번호 */
	F_NAME VARCHAR2(100) NOT NULL, /* 이름 */
	F_NICKNAME VARCHAR2(100) NOT NULL, /* 닉네임 */
	F_TEL1 VARCHAR2(100) NOT NULL, /* 연락처1 */
	F_TEL2 VARCHAR2(100) NOT NULL, /* 연락처2 */
	F_TEL3 VARCHAR2(100) NOT NULL, /* 연락처3 */
	F_ACCOUNTNUM VARCHAR2(100), /* 계좌번호 */
	F_BANK VARCHAR2(100), /* 계좌은행 */
	F_AREA VARCHAR2(100) NOT NULL, /* 거주지역 */
	F_POINT NUMBER(10) NOT NULL, /* 포인트 */
	F_PHOTO1 VARCHAR2(100), /* 프로필사진 */
	F_DROP NUMBER(1) NOT NULL, /* 탈퇴여부 */
	F_SUSPEND NUMBER(1) NOT NULL, /* 정지여부 */
	F_DATE DATE NOT NULL, /* 가입일 */
	F_MESSAGE VARCHAR2(100), /* 알림말 */
	F_PHOTO2 VARCHAR2(100), /* 추가이미지 */
    PRIMARY KEY(F_EMAIL)
);
INSERT INTO FINDERMEMBERS VALUES('f2@f2','1','파인더','finder','010','1111','1111',
    null,null,'서울',0,'NOIMG.PNG',0,0,SYSDATE,'잘부탁','NOIMG.PNG');
COMMIT;
/* 컨텐츠기획자 */
CREATE TABLE PROMEMBERS (
	P_EMAIL VARCHAR2(100) NOT NULL, /* 이메일 */
	P_PW VARCHAR2(100) NOT NULL, /* 비밀번호 */
	P_NAME VARCHAR2(100) NOT NULL, /* 이름 */
	P_NICKNAME VARCHAR2(100) NOT NULL, /* 닉네임 */
	P_TEL1 VARCHAR2(100) NOT NULL, /* 연락처1 */
	P_TEL2 VARCHAR2(100) NOT NULL, /* 연락처2 */
	P_TEL3 VARCHAR2(100) NOT NULL, /* 연락처3 */
	P_ACCOUNTNUM VARCHAR2(100), /* 계좌번호 */
	P_BANK VARCHAR2(100), /* 계좌은행 */
	P_AREA VARCHAR2(100) NOT NULL, /* 거주지역 */
	P_POINT NUMBER(10) NOT NULL, /* 포인트 */
	P_PHOTO1 VARCHAR2(100), /* 프로필사진 */
	P_DROP NUMBER(1) NOT NULL, /* 탈퇴여부 */
	P_SUSPEND NUMBER(1) NOT NULL, /* 정지여부 */
	P_DATE DATE NOT NULL, /* 가입일 */
	P_MESSAGE VARCHAR2(100), /* 알림말 */
	P_PHOTO2 VARCHAR2(100), /* 추가이미지1 */
	CATE_NUM NUMBER NOT NULL, /* 분야번호 */
    PRIMARY KEY(P_EMAIL),
    FOREIGN KEY(CATE_NUM) REFERENCES CATEGORY(CATE_NUM)
);

/* 뉴스피드 */
CREATE TABLE NEWSFEED (
	N_NUM VARCHAR2(100) NOT NULL, /* 글번호 */
	P_EMAIL VARCHAR2(100) NOT NULL, /* 이메일 */
	N_TITLE VARCHAR2(100) NOT NULL, /* 글제목 */
	N_CONTENT CLOB NOT NULL, /* 글내용 */
	N_DATE DATE NOT NULL, /* 작성일 */
	N_HIT NUMBER NOT NULL, /* 조회수 */
	N_DEL NUMBER(1) NOT NULL, /* 삭제여부 */
	N_IP VARCHAR(100) NOT NULL, /* IP */
	CATE_NUM NUMBER NOT NULL, /* 분야번호 */
    PRIMARY KEY(N_NUM),
    FOREIGN KEY(P_EMAIL) REFERENCES PROMEMBERS(P_EMAIL),
    FOREIGN KEY(CATE_NUM) REFERENCES CATEGORY(CATE_NUM)
);
/* 뉴스피드댓글 */
CREATE TABLE NEWS_COMMENT (
	NC_NUM VARCHAR2(100) NOT NULL, /* 댓글번호 */
	N_NUM VARCHAR2(100) NOT NULL, /* 글번호 */
	NC_NAME VARCHAR2(100) NOT NULL, /* 작성자 */
	NC_CONTENT CLOB NOT NULL, /* 댓글내용 */
	NC_DATE DATE NOT NULL, /* 작성일 */
	NC_DEL NUMBER(1) NOT NULL, /* 삭제여부 */
	NC_IP VARCHAR(100) NOT NULL, /* IP */
    PRIMARY KEY(NC_NUM),
    FOREIGN KEY(N_NUM) REFERENCES NEWSFEED(N_NUM)
);

/* 찜하기 */
CREATE TABLE FAVORITE (
	F_EMAIL VARCHAR2(100) NOT NULL, /* 찜한사람 */
	P_EMAIL VARCHAR2(100) NOT NULL, /* 찜당한사람 */
    FOREIGN KEY(F_EMAIL) REFERENCES FINDERMEMBERS(F_EMAIL),
    FOREIGN KEY(P_EMAIL) REFERENCES PROMEMBERS(P_EMAIL)
);

/* 방문자목록 */
CREATE TABLE VISITED (
	P_EMAIL VARCHAR2(100) NOT NULL, /* 주인 */
	V_VISITOR VARCHAR2(100) NOT NULL, /* 방문자 */
	V_DATE DATE NOT NULL, /* 방문시각 */
    FOREIGN KEY(P_EMAIL) REFERENCES PROMEMBERS(P_EMAIL)
);

/* 유·무료컨텐츠 */
CREATE TABLE CONTENTS (
	CON_NUM VARCHAR2(100) NOT NULL, /* 컨텐츠번호 */
	P_EMAIL VARCHAR2(100) NOT NULL, /* 이메일 */
	CON_TITLE VARCHAR2(300) NOT NULL, /* 컨텐츠제목 */
	CON_CONTENT CLOB NOT NULL, /* 컨텐츠내용 */
	CON_FILE1 VARCHAR2(100), /* 첨부파일1 */
	CON_FILE2 VARCHAR2(100), /* 첨부파일2 */
	CON_FILE3 VARCHAR2(100), /* 첨부파일3 */
	CON_PRICE NUMBER(10) NOT NULL, /* 가격 */
	CON_DATE DATE NOT NULL, /* 작성일 */
	CATE_NUM NUMBER NOT NULL, /* 분야번호 */
	CON_DOWNLOAD NUMBER NOT NULL, /* 다운로드수 */
	CON_DEL NUMBER(1) NOT NULL, /* 삭제여부 */
    PRIMARY KEY(CON_NUM),
    FOREIGN KEY(P_EMAIL) REFERENCES PROMEMBERS(P_EMAIL),
    FOREIGN KEY(CATE_NUM) REFERENCES CATEGORY(CATE_NUM)
);

/* 유료질문방 */
CREATE TABLE QUESTION (
	Q_NUM VARCHAR2(100) NOT NULL, /* 질문번호 */
	P_EMAIL VARCHAR2(100) NOT NULL, /* 희망답변자 */
	F_EMAIL VARCHAR2(100) NOT NULL, /* 질문자 */
    CATE_NUM NUMBER ,
    Q_TITLE VARCHAR2(300) NOT NULL,
	Q_CONTENT CLOB NOT NULL, /* 질문내용 */
	Q_DATE DATE NOT NULL, /* 작성일 */
	Q_PRICE NUMBER(10) NOT NULL, /* 설정가격 */
	Q_ACCEPT NUMBER(1) NOT NULL, /* 수락여부 */
	Q_SHOW NUMBER(1) NOT NULL, /* 공개여부 */
	Q_STAR NUMBER(1), /* 별점 */
    PRIMARY KEY(Q_NUM),
    FOREIGN KEY(P_EMAIL) REFERENCES PROMEMBERS(P_EMAIL),
    FOREIGN KEY(F_EMAIL) REFERENCES FINDERMEMBERS(F_EMAIL),
    FOREIGN KEY(CATE_NUM) REFERENCES CATEGORY(CATE_NUM)
);

/* 유료질문방답변 */
CREATE TABLE QANSWER (
	Q_NUM VARCHAR2(100) NOT NULL, /* 질문번호 */
	QA_CONTENT CLOB NOT NULL, /* 답변내용 */
	QA_DATE DATE NOT NULL, /* 답변일 */
    PRIMARY KEY(Q_NUM),
    FOREIGN KEY(Q_NUM) REFERENCES QUESTION(Q_NUM)
);

/* 퀴즈 */
CREATE TABLE QUIZ (
	QUIZ_NUM VARCHAR2(100) NOT NULL, /* 퀴즈번호 */
	P_EMAIL VARCHAR2(100) NOT NULL, /* 출제자 */
	QUIZ_GROUP VARCHAR2(100) NOT NULL, /* 퀴즈그룹 */
	QUIZ_CONTENT CLOB NOT NULL, /* 퀴즈내용 */
	QUIZ_ANSWER VARCHAR2(100) NOT NULL, /* 퀴즈정답 */
	QUIZ_IMG VARCHAR2(100), /* 첨부이미지 */
	QUIZ_SELECT1 VARCHAR2(300) NOT NULL, /* 선택지1 */
	QUIZ_SELECT2 VARCHAR2(300) NOT NULL, /* 선택지2 */
	QUIZ_SELECT3 VARCHAR2(300) NOT NULL, /* 선택지3 */
	QUIZ_SELECT4 VARCHAR2(300) NOT NULL, /* 선택지4 */
	QUIZ_PRICE NUMBER NOT NULL, /* 가격 */
    PRIMARY KEY(QUIZ_NUM),
    FOREIGN KEY(P_EMAIL) REFERENCES PROMEMBERS(P_EMAIL)
);

/* 구매내역 */
CREATE TABLE BUY (
	F_EMAIL VARCHAR2(100) NOT NULL, /* 이메일 */
	BUY_NUM VARCHAR2(100) NOT NULL, /* 구매상품번호 */
    BUY_DATE DATE NOT NULL,/*구매시간*/
    FOREIGN KEY(F_EMAIL) REFERENCES FINDERMEMBERS(F_EMAIL)
);

/* 프로멤버페이지 */
CREATE TABLE PPAGE (
	P_EMAIL VARCHAR2(100) NOT NULL, /* 이메일 */
	N_NUM VARCHAR2(100) DEFAULT NULL, /* 뉴스피드번호 */
	Q_NUM VARCHAR2(100) DEFAULT NULL, /* 질문번호 */
	CON_NUM VARCHAR2(100) DEFAULT NULL, /* 컨텐츠번호 */
    FOREIGN KEY(P_EMAIL) REFERENCES PROMEMBERS(P_EMAIL),
    FOREIGN KEY(N_NUM) REFERENCES NEWSFEED(N_NUM),
    FOREIGN KEY(Q_NUM) REFERENCES QUESTION(Q_NUM),
    FOREIGN KEY(CON_NUM) REFERENCES CONTENTS(CON_NUM)
);

/* 후기 */
CREATE TABLE REVIEW (
	RE_NUM VARCHAR2(100) NOT NULL, /* 후기번호 */
	RE_CONNUM VARCHAR2(100) NOT NULL, /* 컨텐츠번호 */
	RE_NAME VARCHAR2(100) NOT NULL, /* 작성자 */
	RE_CONTENT CLOB NOT NULL, /* 후기내용 */
	RE_DATE DATE NOT NULL, /* 작성일 */
	RE_STAR NUMBER(1), /* 평점 */
    PRIMARY KEY(RE_NUM)
);

/* 자유게시판 */
CREATE TABLE FBOARD (
	FB_NUM VARCHAR2(100) NOT NULL, /* 글번호 */
	FB_NAME VARCHAR2(100) NOT NULL, /* 작성자 */
	FB_TITLE VARCHAR2(300) NOT NULL, /* 글제목 */
	FB_CONTENT CLOB NOT NULL, /* 글내용 */
	FB_DATE DATE DEFAULT SYSDATE, /* 작성일 */
	FB_HIT NUMBER DEFAULT 0, /* 조회수 */
	FB_DEL NUMBER(1) DEFAULT 0, /* 삭제여부 */
	FB_IP VARCHAR2(100) NOT NULL, /* IP */
    PRIMARY KEY(FB_NUM)
);

/* 자유게시판댓글 */
CREATE TABLE FB_COMMENT (
	FC_NUM VARCHAR2(100) NOT NULL, /* 댓글번호 */
	FB_NUM VARCHAR2(100) NOT NULL, /* 글번호 */
	FC_NAME VARCHAR2(100) NOT NULL, /* 작성자 */
	FC_CONTENT CLOB NOT NULL, /* 댓글내용 */
	FC_GROUP VARCHAR2(100) NOT NULL, /* 댓글그룹 */
	FC_INDENT NUMBER(1) NOT NULL, /* 들여쓰기 */
	FC_REF VARCHAR2(100), /* 참조댓글 */
	FC_DATE DATE NOT NULL, /* 작성일 */
	FC_DEL NUMBER(1) NOT NULL, /* 삭제여부 */
	FC_IP VARCHAR2(100) NOT NULL, /* IP */
    PRIMARY KEY(FC_NUM),
    FOREIGN KEY(FB_NUM) REFERENCES FBOARD(FB_NUM),
    FOREIGN KEY(FC_REF) REFERENCES FB_COMMENT(FC_NUM)
);

/* 1:1문의 */
CREATE TABLE CLAIM (
	CL_NUM VARCHAR2(100) NOT NULL, /* 문의번호 */
	CL_EMAIL VARCHAR2(100) NOT NULL, /* 문의자이메일*/
    CL_NICKNAME VARCHAR2(100)NOT NULL,/*문의자닉네임*/
    CL_TITLE VARCHAR2(100)NOT NULL,/*문의제목*/
	CL_CONTENT CLOB NOT NULL, /* 문의내용 */
	CL_DATE DATE NOT NULL, /* 문의시각 */
	CL_CATE VARCHAR2(100) NOT NULL, /* 문의분류 */
	CL_STATUS NUMBER(1) NOT NULL, /* 처리상태 */
    PRIMARY KEY(CL_NUM)
);

/* 자주묻는질문분류 */
CREATE TABLE FAQ_CATE (
	FAQ_CATENUM NUMBER NOT NULL, /* FAQ분류번호 */
	FAQ_CATENAME VARCHAR2(100) NOT NULL, /* FAQ분류이름 */
    PRIMARY KEY(FAQ_CATENUM)
);

/* 자주묻는질문 */
CREATE TABLE FAQ (
	FAQ_NUM VARCHAR2(100) NOT NULL, /* FAQ번호 */
	FAQ_CATENUM NUMBER NOT NULL, /* FAQ분류번호 */
	FAQ_TITLE VARCHAR2(100) NOT NULL, /* FAQ제목 */
	FAQ_CONTENT CLOB NOT NULL, /* FAQ내용 */
    PRIMARY KEY(FAQ_NUM),
    FOREIGN KEY(FAQ_CATENUM) REFERENCES FAQ_CATE(FAQ_CATENUM)
);

/* 좋아요 */
CREATE TABLE LIKES (
	L_NUM VARCHAR2(100) NOT NULL, /* 인덱스 */
	L_LIKER VARCHAR2(100) NOT NULL /* 좋아요한사람 */
);

/* 신고 */
CREATE TABLE REPORT (
	REP_NUM VARCHAR2(100) NOT NULL, /* 인덱스 */
	REP_REPORTER VARCHAR2(100) NOT NULL, /* 신고자 */
	REP_WHY CLOB NOT NULL ,/* 신고사유 */
    REP_DONE NUMBER(1) DEFAULT 0
);

/* 알람 */
CREATE TABLE ALARM (
	AL_RECEIVER VARCHAR2(100) NOT NULL, /* 수신자 */
	AL_REFNUM VARCHAR2(100) NOT NULL, /* 수신자작성인덱스 */
	AL_CHECKNUM VARCHAR2(100) NOT NULL /* 확인할인덱스 */
);
-- 뉴스피드 시퀀스
DROP SEQUENCE NEWSFEED_SEQ;
CREATE SEQUENCE NEWSFEED_SEQ;
-- 뉴스피드댓글 시퀀스
DROP SEQUENCE NEWS_COMMENT_SEQ;
CREATE SEQUENCE NEWS_COMMENT_SEQ;
-- 1:1문의 시퀀스
DROP SEQUENCE CLAIM_SEQ;
CREATE SEQUENCE CLAIM_SEQ;
-- 유,무료 컨텐츠 시퀀스
DROP SEQUENCE CONTENTS_SEQ;
CREATE SEQUENCE CONTENTS_SEQ;
-- 자유게시판 시퀀스
DROP SEQUENCE FBOARD_SEQ;
CREATE SEQUENCE FBOARD_SEQ;
--질문 시퀀스
DROP SEQUENCE QUESTION_SEQ;
CREATE SEQUENCE QUESTION_SEQ;
-- 임시 분야 insert
INSERT INTO CATEGORY VALUES(1,'국어');
INSERT INTO CATEGORY VALUES(2,'영어');
INSERT INTO CATEGORY VALUES(3,'수학');
INSERT INTO CATEGORY VALUES(4,'과학');
INSERT INTO CATEGORY VALUES(5,'사회');
SELECT * FROM CATEGORY;
SELECT * FROM CONTENTS;
--임시 라이크등록
INSERT INTO LIKES VALUES('NEWSFEED19','aa@aa');
INSERT INTO LIKES VALUES('CONTENTS53','aa@aa');
INSERT INTO LIKES VALUES('QUESTION4','aa@aa');
COMMIT;
--프리랜스 임시등록
INSERT INTO PROMEMBERS VALUES('hope1821@naver.com','1234','문세운','매미','010','9505','2118',
    null,null,'서울',0,null,0,0,SYSDATE,NULL,NULL,2);
SELECT * FROM PROMEMBERS;
COMMIT;
-- 뉴스피드 등록 ID=newsfeedInsert
INSERT INTO NEWSFEED VALUES('NEWSFEED'||NEWSFEED_SEQ.NEXTVAL,'aa@aa','제목',
    '내용',SYSDATE,0,0,'127.0.0.1',2);
SELECT * FROM NEWSFEED;

-- 뉴스피드 메인 ID=newsfeedMain
SELECT * FROM (SELECT ROWNUM R,A.* FROM
    (SELECT N.*,P_NICKNAME FROM NEWSFEED N,PROMEMBERS P
        WHERE N.P_EMAIL=P.P_EMAIL AND N_DEL = 0 ORDER BY N_DATE DESC)A)
            WHERE R BETWEEN 1 AND 5;
-- 뉴스피드 ajax ID=newsfeedAjax
SELECT * FROM (SELECT ROWNUM R,A.* FROM
    (SELECT N.*,P_NICKNAME FROM NEWSFEED N,PROMEMBERS P
        WHERE N.P_EMAIL=P.P_EMAIL AND N_DEL = 0 ORDER BY N_DATE DESC)A)
            WHERE R=7;
-- 배너에 보일 뉴스피드 좋아요 순서 ID=likesMainBannerNewsfeed
SELECT * FROM(SELECT ROWNUM R,A.* FROM
    (SELECT L_NUM,COUNT(L_NUM) CNT FROM LIKES WHERE L_NUM LIKE 'NEWSFEED%'
        GROUP BY L_NUM ORDER BY CNT DESC)A)
            WHERE R BETWEEN 1 AND 3;
-- 배너에 보일 뉴스피드 좋아요 순서 에이작스 ID=likesMainBannerNewsfeedAjax
SELECT * FROM(SELECT ROWNUM R,A.* FROM
    (SELECT L_NUM,COUNT(L_NUM) CNT FROM LIKES WHERE L_NUM LIKE 'NEWSFEED%'
        GROUP BY L_NUM ORDER BY CNT DESC)A)
            WHERE R BETWEEN 4 AND 7;
COMMIT;
-- 배너에 보일 뉴스피드 가져오기 ID=newsfeedMainBanner
SELECT N.*,P_NICKNAME FROM NEWSFEED N,PROMEMBERS P 
    WHERE N.P_EMAIL=P.P_EMAIL AND N_NUM = 'NEWSFEED3';
--배너에 보일 컨텐츠 좋아요 순서 ID=likesMainBannerContents
SELECT * FROM(SELECT ROWNUM R,A.* FROM
    (SELECT L_NUM,COUNT(L_NUM) CNT FROM LIKES WHERE L_NUM LIKE 'CONTENTS%'
        GROUP BY L_NUM ORDER BY CNT DESC)A)
            WHERE R BETWEEN 1 AND 3;
--배너에 보일 컨텐츠 좋아요 순서 에이작스 ID=likesMainBannerContentsAjax
SELECT * FROM(SELECT ROWNUM R,A.* FROM
    (SELECT L_NUM,COUNT(L_NUM) CNT FROM LIKES WHERE L_NUM LIKE 'CONTENTS%'
        GROUP BY L_NUM ORDER BY CNT DESC)A)
            WHERE R BETWEEN 4 AND 7;
--배너에 보일 컨텐츠 가져오기 ID=contentsMainBanner
SELECT C.*,P_NICKNAME FROM CONTENTS C,PROMEMBERS P 
    WHERE C.P_EMAIL=P.P_EMAIL AND CON_NUM = 'CONTENTS51';
--배너에 보일 프로멤버 찜한 순서 ID=favoriteMainBannerPromembers
SELECT * FROM(SELECT ROWNUM R,A.* FROM
    (SELECT P_EMAIL,COUNT(P_EMAIL) CNT FROM FAVORITE
        GROUP BY P_EMAIL ORDER BY CNT DESC)A)
            WHERE R BETWEEN 1 AND 3;
--배너에 보일 프로멤버 찜한 순서 에이작스 ID=favoriteMainBannerPromembersAjax
SELECT * FROM(SELECT ROWNUM R,A.* FROM
    (SELECT P_EMAIL,COUNT(P_EMAIL) CNT FROM FAVORITE
        GROUP BY P_EMAIL ORDER BY CNT DESC)A)
            WHERE R BETWEEN 4 AND 7;
--배너에 보일 질문 좋아요 순서 id=likesMainBannerQuestion
SELECT * FROM(SELECT ROWNUM R,A.* FROM
    (SELECT L_NUM,COUNT(L_NUM) CNT FROM LIKES WHERE L_NUM LIKE 'QUESTION%'
        GROUP BY L_NUM ORDER BY CNT DESC)A)
            WHERE R BETWEEN 1 AND 3;
--배너에 보일 질문 좋아요 순서 에이작스 id=likesMainBannerQuestionAjax
SELECT * FROM(SELECT ROWNUM R,A.* FROM
    (SELECT L_NUM,COUNT(L_NUM) CNT FROM LIKES WHERE L_NUM LIKE 'QUESTION%'
        GROUP BY L_NUM ORDER BY CNT DESC)A)
            WHERE R BETWEEN 4 AND 7;
--배너에 보일 질문 가져오기 ID=questionMainBanner
SELECT Q.*,P.P_NICKNAME FROM QUESTION Q,PROMEMBERS P 
    WHERE P.P_EMAIL = Q.P_EMAIL AND Q.Q_NUM = 'QUESTION4';
DELETE LIKES WHERE L_NUM = 'QUESTION23';
SELECT * FROM PROMEMBERS WHERE p_email= 'aa@aa';
UPDATE PROMEMBERS SET P_PHOTO1 = 'NOIMG.PNG' WHERE P_EMAIL='aa@aa';
SELECT * FROM QUESTION;
INSERT INTO QUESTION VALUES('QUESTION'||QUESTION_SEQ.NEXTVAL,'aa@aa',
'f2@f2',1,'임시제목1','임시내용1',SYSDATE,1000,0,0,0);
commit;
-- 분류 셀릭트 ID=categorySelect
SELECT * FROM CATEGORY ORDER BY CATE_NUM;

-- 뉴스피드댓글 불러오기 ID=newsCommentSelect
SELECT * FROM NEWS_COMMENT 
    WHERE NC_DEL=0 AND N_NUM = 'NEWSFEED22' ORDER BY NC_DATE;
-- 뉴스피드댓글 등록 ID=newsCommentInsert
INSERT INTO NEWS_COMMENT VALUES('NEWS_COMMENT'||NEWS_COMMENT_SEQ.NEXTVAL,
    'NEWSFEED22','의적','첫댓글',SYSDATE,0,'127.0.0.1');
COMMIT;

-- 1:1문의등록 ID=claimInsert
INSERT INTO CLAIM VALUES('CLAIM'||CLAIM_SEQ.NEXTVAL,'hope1821@naver.com','매미',
    '제목1','내용1',SYSDATE,'기타',0);
COMMIT;
DESC CLAIM;
-- 1:1문의 보기위한 카운터 ID=claimListCount
SELECT count(*) FROM CLAIM WHERE CL_EMAIL='aa@aa' ORDER BY CL_DATE DESC;

--1:1문의 목록보기 페이징 ID=claimList
SELECT * FROM (SELECT ROWNUM R,A.* FROM
    (SELECT * FROM CLAIM WHERE CL_EMAIL='aa@aa' ORDER BY CL_DATE DESC)A)
        WHERE R BETWEEN 1 AND 5;
-- 1:1문의 관리자가 보기 ID=claimAdminList
SELECT * FROM CLAIM WHERE CL_STATUS=0 ORDER BY CL_DATE;
-- 1:1문의 답변하고 처리완료로 바꾸기 ID=claimAnswerComplete
UPDATE CLAIM SET CL_STATUS = 1 WHERE CL_NUM = 'CLAIM1';
-- 1:1문의 수정하기 ID=claimModify
UPDATE CLAIM SET CL_CONTENT = '수정완료' WHERE CL_NUM='CLAIM61';
-- 1:1문의 삭제하기 ID=claimDelete
DELETE CLAIM WHERE CL_NUM = 'CLAIM61';
-- 유,무료 컨텐츠 등록 ID=contentInsert
INSERT INTO CONTENTS VALUES('CONTENTS'||CONTENTS_SEQ.NEXTVAL,'aa@aa',
    '제목','내용',null,null,null,0,SYSDATE,2,0,0);
SELECT * FROM CONTENTS;
ROLLBACK;
COMMIT;
-- 유,무료 컨텐츠 목록 ID=contentsList
SELECT * FROM (SELECT ROWNUM R,A.*  FROM 
    (SELECT * FROM CONTENTS WHERE P_EMAIL = 'hope1821@naver.com' ORDER BY CON_DATE DESC)A)
        WHERE R BETWEEN 1 AND 5;
-- 프로멤버 페이지에서 유,무료 컨텐츠 목록 ID=ppageContentsList
SELECT * FROM (SELECT ROWNUM R,A.*  FROM 
    (SELECT C.*,P_NICKNAME,CATE_NAME FROM CONTENTS C,PPAGE PP ,PROMEMBERS P ,CATEGORY CA 
        WHERE C.P_EMAIL = PP.P_EMAIL AND C.CON_DEL = 0
            AND PP.P_EMAIL = P.P_EMAIL AND PP.P_EMAIL = 'hope1821@naver.com' 
                AND CA.CATE_NUM = C.CATE_NUM AND PP.CON_NUM = C.CON_NUM
                    ORDER BY CON_DATE DESC)A) WHERE R BETWEEN 1 AND 5;
-- 프로멤버 페이지에서 유,무료 컨텐츠 페이징 처리하기 위한 글갯수 가져오기 ID=ppageContentListCount
SELECT count(*) FROM (SELECT ROWNUM R,A.*  FROM 
    (SELECT C.*,P_NICKNAME,CATE_NAME FROM CONTENTS C,PPAGE PP ,PROMEMBERS P ,CATEGORY CA 
        WHERE C.P_EMAIL = PP.P_EMAIL AND C.CON_DEL = 0
            AND PP.P_EMAIL = P.P_EMAIL AND PP.P_EMAIL = 'hope1821@naver.com' 
                AND CA.CATE_NUM = C.CATE_NUM AND PP.CON_NUM = C.CON_NUM
                    ORDER BY CON_DATE DESC)A);
-- 현재 컨텐츠 시퀀스값 가져오기 Id=contentsNowNum
SELECT CON_NUM FROM (SELECT ROWNUM R,CON_NUM FROM
    (SELECT CON_NUM FROM CONTENTS ORDER BY CON_DATE DESC)A)
        WHERE R=1;
-- 프로멤버 페이지에서 유,무료 컨텐츠 에이작스 ID=ppageContentsAjax
SELECT * FROM (SELECT ROWNUM R,A.*  FROM 
    (SELECT C.*,P_NICKNAME,CATE_NAME FROM CONTENTS C,PPAGE PP ,PROMEMBERS P ,CATEGORY CA 
        WHERE C.P_EMAIL = PP.P_EMAIL
            AND PP.P_EMAIL = P.P_EMAIL AND PP.P_EMAIL = 'hope1821@naver.com'
                AND CA.CATE_NUM = C.CATE_NUM AND PP.CON_NUM = C.CON_NUM
                    ORDER BY CON_DATE DESC)A) WHERE R = 9;
-- 프로멤버 페이지 유무료 컨텐츠 등록 ID=ppageContentInsert
INSERT INTO PPAGE (P_EMAIL,CON_NUM) VALUES('hope1821@naver.com','CONTENTS58');
--프로멤버 페이지에서 뉴스피드 페이징 처리하기 위한 글갯수 가져오기 ID=ppageNewsfeedListCount
SELECT COUNT(*) FROM (SELECT ROWNUM R,A.*  FROM 
   			(SELECT N.*,P_NICKNAME,CATE_NAME FROM NEWSFEED N,PPAGE PP ,PROMEMBERS P ,CATEGORY CA 
        		WHERE N.P_EMAIL = PP.P_EMAIL AND N.N_DEL=0
            		AND PP.P_EMAIL = P.P_EMAIL AND PP.P_EMAIL = 'aa@aa' 
                		AND CA.CATE_NUM = N.CATE_NUM AND PP.N_NUM = N.N_NUM
                    		ORDER BY N_DATE DESC)A);
--프로멤버 페이지에서 뉴스피드 페이징리스트 ID=ppageNewsfeedList
SELECT * FROM (SELECT ROWNUM R,A.*  FROM 
    (SELECT N.*,P_NICKNAME,P_PHOTO1,CATE_NAME FROM NEWSFEED N,PPAGE PP ,PROMEMBERS P ,CATEGORY CA 
        WHERE N.P_EMAIL = PP.P_EMAIL AND N.N_DEL = 0
            AND PP.P_EMAIL = P.P_EMAIL AND PP.P_EMAIL = 'aa@aa' 
                AND CA.CATE_NUM = N.CATE_NUM AND PP.N_NUM = N.N_NUM
                    ORDER BY N_DATE DESC)A) WHERE R BETWEEN 1 AND 5;
--현재 뉴스피드 시퀀스값 가져오기 ID=newsfeedNowNum
SELECT N_NUM FROM (SELECT ROWNUM R,N_NUM FROM
    (SELECT N_NUM FROM NEWSFEED ORDER BY N_DATE DESC)A)
        WHERE R=1;
-- 프로멤버 페이지 뉴스피드 등록 ID=ppageContentInsert
INSERT INTO PPAGE (P_EMAIL,N_NUM) VALUES('aa@aa','NEWSFEED61');
--임시 찜하기
INSERT INTO FAVORITE VALUES('f2@f2','aa@aa');
commit;
--파인더멤버 페이지에서 뉴스피드 목록 id=fpageNewsfeedList
SELECT * FROM (SELECT ROWNUM R,A.* FROM
    (SELECT N.*,F.F_EMAIL,P.P_NICKNAME,P.P_PHOTO1,CA.CATE_NAME 
        FROM FAVORITE FV,FINDERMEMBERS F,NEWSFEED N,PROMEMBERS P,CATEGORY CA
            WHERE F.F_EMAIL = FV.F_EMAIL AND FV.P_EMAIL = N.P_EMAIL AND N.N_DEL = 0
                AND CA.CATE_NUM = N.CATE_NUM AND P.P_EMAIL=FV.P_EMAIL 
                    AND FV.F_EMAIL='f2@f2' ORDER BY N.N_DATE DESC)A)
                        WHERE R BETWEEN 1 AND 5; 
-- 파인더멤버 페이지에서 뉴스피드 에이작스 id=fpageNewsfeedAjax 
SELECT * FROM (SELECT ROWNUM R,A.* FROM
    (SELECT N.*,F.F_EMAIL,P.P_NICKNAME,P.P_PHOTO1,CA.CATE_NAME 
        FROM FAVORITE FV,FINDERMEMBERS F,NEWSFEED N,PROMEMBERS P,CATEGORY CA
            WHERE F.F_EMAIL = FV.F_EMAIL AND FV.P_EMAIL = N.P_EMAIL AND N.N_DEL = 0
                AND CA.CATE_NUM = N.CATE_NUM AND P.P_EMAIL=FV.P_EMAIL 
                    AND FV.F_EMAIL='f2@f2' ORDER BY N.N_DATE DESC)A) 
                        WHERE R=6;
--임시 구매하기
INSERT INTO BUY VALUES('f2@f2','CONTENTS45',SYSDATE);
SELECT * FROM CONTENTS;
-- 파인더멤버 페이지에서 구매컨텐츠 페이징 목록 id=fpageContentsList
SELECT * FROM (SELECT ROWNUM R,A.* FROM
    (SELECT C.*,F.F_EMAIL,P.P_NICKNAME,P.P_PHOTO1,B.BUY_DATE,CA.CATE_NAME
        FROM BUY B,FINDERMEMBERS F,CONTENTS C,PROMEMBERS P,CATEGORY CA
            WHERE B.F_EMAIL = F.F_EMAIL AND BUY_NUM = C.CON_NUM
                AND CA.CATE_NUM = C.CATE_NUM  AND CON_DEL = 0 
                    AND P.P_EMAIL = C.P_EMAIL AND F.F_EMAIL = 'f2@f2'
                        ORDER BY B.BUY_DATE)A)WHERE R BETWEEN 1 AND 5;
-- 파인더멤버 페이지에서 구매컨텐츠 페이징하기위한 총 갯수 id=fpageContentsListCount
SELECT COUNT(*) FROM FINDERMEMBERS F,BUY B,CONTENTS C
    WHERE F.F_EMAIL=B.F_EMAIL AND B.BUY_NUM = C.CON_NUM
        AND F.F_EMAIL='f2@f2';