/* ������ */
DROP TABLE ADMIN 
   CASCADE CONSTRAINTS;
    
/* �о� */
DROP TABLE CATEGORY 
   CASCADE CONSTRAINTS;

/* ���δ���� */
DROP TABLE FINDERMEMBERS 
   CASCADE CONSTRAINTS;
    
/* ���θ�� */
DROP TABLE PROMEMBERS 
   CASCADE CONSTRAINTS;
    
/* �����ǵ� */
DROP TABLE NEWSFEED 
   CASCADE CONSTRAINTS;
    
/* �����ǵ��� */
DROP TABLE NEWS_COMMENT 
   CASCADE CONSTRAINTS;
    
/* ���ϱ� */
DROP TABLE FAVORITE 
   CASCADE CONSTRAINTS;
    
/* �湮�ڸ�� */
DROP TABLE VISITED 
   CASCADE CONSTRAINTS;

/* �������������� */
DROP TABLE CONTENTS 
   CASCADE CONSTRAINTS;

/* ���������� */
DROP TABLE QUESTION 
   CASCADE CONSTRAINTS;
    
/* ����������亯 */
DROP TABLE QANSWER 
   CASCADE CONSTRAINTS;

/* ���ų��� */
DROP TABLE BUY 
   CASCADE CONSTRAINTS;

/* ���θ�� ������ */
DROP TABLE PPAGE 
   CASCADE CONSTRAINTS;

/* �ı� */
DROP TABLE REVIEW 
   CASCADE CONSTRAINTS;
    
/* �����Խ��� */
DROP TABLE FBOARD 
   CASCADE CONSTRAINTS;

/* �����Խ��Ǵ�� */
DROP TABLE FB_COMMENT 
   CASCADE CONSTRAINTS;

/* 1:1���� */
DROP TABLE CLAIM 
   CASCADE CONSTRAINTS;

/* ���ֹ��������з� */
DROP TABLE FAQ_CATE 
   CASCADE CONSTRAINTS;

/* ���ֹ������� */
DROP TABLE FAQ 
   CASCADE CONSTRAINTS;

/* ���ƿ� */
DROP TABLE LIKES
   CASCADE CONSTRAINTS;

/* �Ű� */
DROP TABLE REPORT 
   CASCADE CONSTRAINTS;

/* �˶� */
DROP TABLE ALARM 
   CASCADE CONSTRAINTS;
    
/* ������ */
CREATE TABLE ADMIN (
   AD_ID VARCHAR2(100) NOT NULL, /* ���̵� */
   AD_PW VARCHAR2(100) NOT NULL, /* ��й�ȣ */
   AD_NAME VARCHAR2(100) NOT NULL,/* �̸� */
    PRIMARY KEY(AD_ID)
);

/* �о� */
CREATE TABLE CATEGORY (
   CATE_NUM NUMBER NOT NULL, /* �о߹�ȣ */
   CATE_NAME VARCHAR2(100) NOT NULL, /* �о��̸� */
    PRIMARY KEY(CATE_NUM)
);

/* ���δ���� */
CREATE TABLE FINDERMEMBERS (
    F_EMAIL VARCHAR2(100) NOT NULL, /* �̸��� */
    F_PW VARCHAR2(100) NOT NULL, /* ��й�ȣ */
    F_NAME VARCHAR2(100) NOT NULL, /* �̸� */
    F_NICKNAME VARCHAR2(100) NOT NULL, /* �г��� */
    F_TEL1 VARCHAR2(100) NOT NULL, /* ����ó1 */
    F_TEL2 VARCHAR2(100) NOT NULL, /* ����ó2 */
    F_TEL3 VARCHAR2(100) NOT NULL, /* ����ó3 */
    F_ACCOUNTNUM VARCHAR2(100), /* ���¹�ȣ */
    F_BANK VARCHAR2(100), /* �������� */
    F_AREA VARCHAR2(100) NOT NULL, /* �������� */
    F_POINT NUMBER(10) DEFAULT 0, /* ����Ʈ */
    F_PHOTO1 VARCHAR2(100) DEFAULT 'noimg_finder.png', /* �����ʻ��� */
    F_DROP NUMBER(1) DEFAULT 0, /* Ż�𿩺� */
    F_SUSPEND NUMBER(1) DEFAULT 0, /* �������� */
    F_DATE DATE DEFAULT SYSDATE, /* ������ */
    F_MESSAGE VARCHAR2(100), /* �˸��� */
    F_PHOTO2 VARCHAR2(100), /* �߰��̹��� */
    PRIMARY KEY(F_EMAIL)
);

/* ���θ�� */
CREATE TABLE PROMEMBERS (
    P_EMAIL VARCHAR2(100) NOT NULL, /* �̸��� */
    P_PW VARCHAR2(100) NOT NULL, /* ��й�ȣ */
    P_NAME VARCHAR2(100) NOT NULL, /* �̸� */
    P_NICKNAME VARCHAR2(100) NOT NULL, /* �г��� */
    P_TEL1 VARCHAR2(100) NOT NULL, /* ����ó1 */
    P_TEL2 VARCHAR2(100) NOT NULL, /* ����ó2 */
    P_TEL3 VARCHAR2(100) NOT NULL, /* ����ó3 */
    P_ACCOUNTNUM VARCHAR2(100), /* ���¹�ȣ */
    P_BANK VARCHAR2(100), /* �������� */
    P_AREA VARCHAR2(100) NOT NULL, /* �������� */
    P_POINT NUMBER(10) DEFAULT 0, /* ����Ʈ */
    P_PHOTO1 VARCHAR2(100) DEFAULT 'noimg.png', /* �����ʻ��� */
    P_DROP NUMBER(1) DEFAULT 0, /* Ż�𿩺� */
    P_SUSPEND NUMBER(1) DEFAULT 0, /* �������� */
    P_DATE DATE DEFAULT SYSDATE, /* ������ */
    P_MESSAGE VARCHAR2(100), /* �˸��� */
    P_PHOTO2 VARCHAR2(100), /* �߰��̹���1 */
    CATE_NUM NUMBER NOT NULL, /* �о߹�ȣ */
    P_SPEC CLOB, /* ���� */
    PRIMARY KEY(P_EMAIL),
    FOREIGN KEY(CATE_NUM) REFERENCES CATEGORY(CATE_NUM)
);
    
/* �����ǵ� */
CREATE TABLE NEWSFEED (
	N_NUM VARCHAR2(100) NOT NULL, /* �۹�ȣ */
	P_EMAIL VARCHAR2(100) NOT NULL, /* �̸��� */
	N_TITLE VARCHAR2(100) NOT NULL, /* ������ */
	N_CONTENT CLOB NOT NULL, /* �۳��� */
	N_DATE DATE NOT NULL, /* �ۼ��� */
	N_HIT NUMBER NOT NULL, /* ��ȸ�� */
	N_DEL NUMBER(1) NOT NULL, /* �������� */
	N_IP VARCHAR(100) NOT NULL, /* IP */
	CATE_NUM NUMBER NOT NULL, /* �о߹�ȣ */
    PRIMARY KEY(N_NUM),
    FOREIGN KEY(P_EMAIL) REFERENCES PROMEMBERS(P_EMAIL),
    FOREIGN KEY(CATE_NUM) REFERENCES CATEGORY(CATE_NUM)
);

-- �����ǵ� ������ 
DROP SEQUENCE NEWSFEED_SEQ;
CREATE SEQUENCE NEWSFEED_SEQ;

/* �����ǵ��� */
CREATE TABLE NEWS_COMMENT (
    NC_NUM VARCHAR2(100) NOT NULL, /* ��۹�ȣ */
    N_NUM VARCHAR2(100) NOT NULL, /* �۹�ȣ */
    NC_NAME VARCHAR2(100) NOT NULL, /* �ۼ��� */
    NC_CONTENT CLOB NOT NULL, /* ��۳��� */
    NC_DATE DATE DEFAULT SYSDATE, /* �ۼ��� */
    NC_DEL NUMBER(1) DEFAULT 0, /* �������� */
    NC_IP VARCHAR(100) NOT NULL, /* IP */
    PRIMARY KEY(NC_NUM),
    FOREIGN KEY(N_NUM) REFERENCES NEWSFEED(N_NUM)
);

-- �����ǵ��� ������
DROP SEQUENCE NEWS_COMMENT_SEQ;
CREATE SEQUENCE NEWS_COMMENT_SEQ
    START WITH 10;


/* ���ϱ� */ 
CREATE TABLE FAVORITE (
    F_EMAIL VARCHAR2(100), /* ���ѻ�� */
    P_EMAIL VARCHAR2(100), /* ����ѻ�� */
    FOREIGN KEY(F_EMAIL) REFERENCES FINDERMEMBERS(F_EMAIL),
    FOREIGN KEY(P_EMAIL) REFERENCES PROMEMBERS(P_EMAIL),
    CONSTRAINT FAVORITE PRIMARY KEY(F_EMAIL, P_EMAIL)
);

/* �湮�ڸ�� */
CREATE TABLE VISITED (
    P_EMAIL VARCHAR2(100) NOT NULL, /* ���� */
    V_VISITOR VARCHAR2(100) NOT NULL, /* �湮�� */
    V_DATE DATE DEFAULT SYSDATE, /* �湮�ð� */
    FOREIGN KEY(P_EMAIL) REFERENCES PROMEMBERS(P_EMAIL)
);

/* �������������� */
CREATE TABLE CONTENTS (
    CON_NUM VARCHAR2(100) NOT NULL, /* ��������ȣ */
    P_EMAIL VARCHAR2(100) NOT NULL, /* �̸��� */
    CON_TITLE VARCHAR2(300) NOT NULL, /* ���������� */
    CON_CONTENT CLOB NOT NULL, /* ���������� */
    CON_FILE1 VARCHAR2(100), /* ÷������1 */
    CON_FILE2 VARCHAR2(100), /* ÷������2 */
    CON_FILE3 VARCHAR2(100), /* ÷������3 */
    CON_PRICE NUMBER(10) NOT NULL, /* ���� */
    CON_DATE DATE DEFAULT SYSDATE, /* �ۼ��� */
    CATE_NUM NUMBER NOT NULL, /* �о߹�ȣ */
    CON_DOWNLOAD NUMBER NOT NULL, /* �ٿ�ε�� */
    CON_DEL NUMBER(1) DEFAULT 0, /* �������� */
    PRIMARY KEY(CON_NUM),
    FOREIGN KEY(P_EMAIL) REFERENCES PROMEMBERS(P_EMAIL),
    FOREIGN KEY(CATE_NUM) REFERENCES CATEGORY(CATE_NUM)
);

-- �������������� ������
DROP SEQUENCE CONTENTS_SEQ;
CREATE SEQUENCE CONTENTS_SEQ;


/* ���������� */
CREATE TABLE QUESTION (
    Q_NUM VARCHAR2(100) NOT NULL, /* ������ȣ */
    P_EMAIL VARCHAR2(100) NOT NULL, /* ����亯�� */
    F_EMAIL VARCHAR2(100) NOT NULL, /* ������ */
    CATE_NUM NUMBER NOT NULL, /* �о߹�ȣ */
    Q_TITLE VARCHAR2(300) NOT NULL, /* �������� */
    Q_CONTENT CLOB NOT NULL, /* �������� */
    Q_DATE DATE DEFAULT SYSDATE, /* �ۼ��� */
    Q_PRICE NUMBER(10) NOT NULL, /* �������� */
    Q_ACCEPT NUMBER(1) DEFAULT 0, /* �������� */
    Q_SHOW NUMBER(1) DEFAULT 0, /* �������� */
    Q_STAR NUMBER(2,1) DEFAULT 0, /* ���� */
    PRIMARY KEY(Q_NUM),
    FOREIGN KEY(P_EMAIL) REFERENCES PROMEMBERS(P_EMAIL),
    FOREIGN KEY(F_EMAIL) REFERENCES FINDERMEMBERS(F_EMAIL),
    FOREIGN KEY(CATE_NUM) REFERENCES CATEGORY(CATE_NUM)
);

-- ���������� ������ ����
DROP SEQUENCE QUESTION_SEQ;
CREATE SEQUENCE QUESTION_SEQ;

/* ����������亯 */
CREATE TABLE QANSWER (
    Q_NUM VARCHAR2(100) NOT NULL, /* ������ȣ */
    QA_CONTENT CLOB NOT NULL, /* �亯���� */
    QA_DATE DATE DEFAULT SYSDATE, /* �亯�� */
    PRIMARY KEY(Q_NUM),
    FOREIGN KEY(Q_NUM) REFERENCES QUESTION(Q_NUM)
);


/* ���ų��� */
CREATE TABLE BUY (
    F_EMAIL VARCHAR2(100), /* �̸��� */
    BUY_NUM VARCHAR2(100), /* ���Ż�ǰ��ȣ */
    BUY_DATE DATE NOT NULL, /* ���Žð� */
    FOREIGN KEY(F_EMAIL) REFERENCES FINDERMEMBERS(F_EMAIL),
    CONSTRAINT BUY PRIMARY KEY(F_EMAIL, BUY_NUM)
);

/* ���θ�������� */
CREATE TABLE PPAGE (
    P_EMAIL VARCHAR2(100) NOT NULL, /* �̸��� */
    N_NUM VARCHAR2(100), /* �����ǵ��ȣ */
    Q_NUM VARCHAR2(100), /* ������ȣ */
    CON_NUM VARCHAR2(100), /* ��������ȣ */
    FOREIGN KEY(P_EMAIL) REFERENCES PROMEMBERS(P_EMAIL),
    FOREIGN KEY(N_NUM) REFERENCES NEWSFEED(N_NUM),
    FOREIGN KEY(Q_NUM) REFERENCES QUESTION(Q_NUM),
    FOREIGN KEY(CON_NUM) REFERENCES CONTENTS(CON_NUM)
);

/* �ı� */
CREATE TABLE REVIEW (
    RE_NUM VARCHAR2(100) NOT NULL, /* �ı��ȣ */
    RE_CONNUM VARCHAR2(100) NOT NULL, /* ��������ȣ */
    RE_NAME VARCHAR2(100) NOT NULL, /* �ۼ��� */
    RE_CONTENT CLOB NOT NULL, /* �ı⳻�� */
    RE_DATE DATE DEFAULT SYSDATE, /* �ۼ��� */
    RE_STAR NUMBER(1), /* ���� */
    PRIMARY KEY(RE_NUM)
);

/* �����Խ��� */
CREATE TABLE FBOARD (
	FB_NUM VARCHAR2(100) NOT NULL, /* �۹�ȣ */
	FB_NAME VARCHAR2(100) NOT NULL, /* �ۼ��� */
    FB_PHOTO VARCHAR2(100) NOT NULL, /* �ۼ��������� */
	FB_TITLE VARCHAR2(300) NOT NULL, /* ������ */
	FB_CONTENT CLOB NOT NULL, /* �۳��� */
	FB_DATE DATE DEFAULT SYSDATE, /* �ۼ��� */
	FB_HIT NUMBER DEFAULT 0, /* ��ȸ�� */
	FB_DEL NUMBER(1) DEFAULT 0, /* �������� */
	FB_IP VARCHAR2(100) NOT NULL, /* IP */
    PRIMARY KEY(FB_NUM)
);

-- �����Խ��� ������
DROP SEQUENCE FBOARD_SEQ;
CREATE SEQUENCE FBOARD_SEQ
    START WITH 10;


/* �����Խ��Ǵ�� */
CREATE TABLE FB_COMMENT (
	FC_NUM VARCHAR2(100) NOT NULL, /* ��۹�ȣ */
	FB_NUM VARCHAR2(100) NOT NULL, /* �۹�ȣ */
	FC_NAME VARCHAR2(100) NOT NULL, /* �ۼ��� */
    FC_PHOTO VARCHAR2(100) NOT NULL, /* �ۼ��������� */
	FC_CONTENT CLOB NOT NULL, /* ��۳��� */
    FC_GROUP VARCHAR2(100) NOT NULL, /* ��۱׷� */
    FC_GROUP2 VARCHAR2(100) NOT NULL, /* ��۱׷�2 */
	FC_INDENT NUMBER(1) DEFAULT 0, /* �鿩���� */
	FC_REF VARCHAR2(100), /* ������� */
	FC_DATE DATE DEFAULT SYSDATE, /* �ۼ��� */
	FC_DEL NUMBER(1) DEFAULT 0, /* �������� */
	FC_IP VARCHAR2(100) NOT NULL, /* IP */
    PRIMARY KEY(FC_NUM),
    FOREIGN KEY(FB_NUM) REFERENCES FBOARD(FB_NUM),
    FOREIGN KEY(FC_REF) REFERENCES FB_COMMENT(FC_NUM)
);

-- �����Խ��Ǵ�� ������
DROP SEQUENCE FB_COMMENT_SEQ;
CREATE SEQUENCE FB_COMMENT_SEQ
    START WITH 10;

/* 1:1���� */
CREATE TABLE CLAIM (
	CL_NUM VARCHAR2(100) NOT NULL, /* ���ǹ�ȣ */
	CL_EMAIL VARCHAR2(100) NOT NULL, /* �������̸��� */
    CL_TITLE VARCHAR2(300) NOT NULL, /* ���� ���� */
    CL_NICKNAME VARCHAR2(100)NOT NULL,/*�����ڴг���*/
	CL_CONTENT CLOB NOT NULL, /* ���ǳ��� */
	CL_DATE DATE DEFAULT SYSDATE, /* ���ǽð� */
	CL_CATE VARCHAR2(100) NOT NULL, /* ���Ǻз� */
	CL_STATUS NUMBER(1) DEFAULT 0, /* ó������ */
    PRIMARY KEY(CL_NUM)
);

-- 1:1���� ������
DROP SEQUENCE CLAIM_SEQ;
CREATE SEQUENCE CLAIM_SEQ;


/* ���ֹ��������з� */
CREATE TABLE FAQ_CATE (
	FAQ_CATENUM NUMBER NOT NULL, /* FAQ�з���ȣ */
	FAQ_CATENAME VARCHAR2(100) NOT NULL, /* FAQ�з��̸� */
    PRIMARY KEY(FAQ_CATENUM)
);


/* ���ֹ������� */
CREATE TABLE FAQ (
	FAQ_NUM VARCHAR2(100) NOT NULL, /* FAQ��ȣ */
	FAQ_CATENUM NUMBER NOT NULL, /* FAQ�з���ȣ */
	FAQ_TITLE VARCHAR2(100) NOT NULL, /* FAQ���� */
	FAQ_CONTENT CLOB NOT NULL, /* FAQ���� */
    PRIMARY KEY(FAQ_NUM),
    FOREIGN KEY(FAQ_CATENUM) REFERENCES FAQ_CATE(FAQ_CATENUM)
);

-- FAQ ������
DROP SEQUENCE FAQ_SEQ;
CREATE SEQUENCE FAQ_SEQ;

/* ���ƿ� */
CREATE TABLE LIKES (
	L_NUM VARCHAR2(100), /* �ε��� */
	L_LIKER VARCHAR2(100), /* ���ƿ��ѻ�� */
    CONSTRAINT LIKES PRIMARY KEY(L_NUM, L_LIKER)
);

/* �Ű� */
CREATE TABLE REPORT (
	REP_NUM VARCHAR2(100) NOT NULL, /* �ε��� */
	REP_REPORTER VARCHAR2(100) NOT NULL, /* �Ű��� */
	REP_WHY CLOB NOT NULL, /* �Ű���� */
    REP_DONE NUMBER(1) DEFAULT 0
);

/* �˶� */
CREATE TABLE ALARM (
	AL_RECEIVER VARCHAR2(100) NOT NULL, /* ������ */
	AL_REFNUM VARCHAR2(100) NOT NULL, /* �������ۼ��ε��� */
	AL_CHECKNUM VARCHAR2(100) NOT NULL /* Ȯ�����ε��� */
);



-- �о� INSERT��
INSERT INTO CATEGORY VALUES(1,'����');
INSERT INTO CATEGORY VALUES(2,'����Ͻ�');
INSERT INTO CATEGORY VALUES(3,'��Ȱ����');
INSERT INTO CATEGORY VALUES(4,'������');
INSERT INTO CATEGORY VALUES(5,'����');
INSERT INTO CATEGORY VALUES(6,'�ǰ�/�̿�');
INSERT INTO CATEGORY VALUES(7,'�̺�Ʈ');
INSERT INTO CATEGORY VALUES(8,'��Ÿ');

-- ���ֹ��������з� INSERT��
INSERT INTO FAQ_CATE VALUES(1,'ȸ������');        
INSERT INTO FAQ_CATE VALUES(2,'�Ǹ� ����');        
INSERT INTO FAQ_CATE VALUES(3,'���Ű���');     

-- FAQ INSERT��
INSERT INTO FAQ VALUES('FAQ'||FAQ_SEQ.NEXTVAL,1,'ȸ������','ȸ������ ��ư�� ã�� ���ҽ� Login��ư�� ����������');
INSERT INTO FAQ VALUES('FAQ'||FAQ_SEQ.NEXTVAL,1,' ��й�ȣ ã��',' ��й�ȣ(Forgot Password?) ã�� ��ư�� �����ּ���');
INSERT INTO FAQ VALUES('FAQ'||FAQ_SEQ.NEXTVAL,1,' ȸ������ ����','ȸ������ ���� ��ư�� ������ ���� �ϼ��� ');
INSERT INTO FAQ VALUES('FAQ'||FAQ_SEQ.NEXTVAL,1,' profinder�� ���� ����','���� ����Ʈ�� pro ����� finder ������� ���� �ǻ�����ϴ� �κ����� Ŀ�´����̼� �Դϴ�. ������ ����� ���� �ϸ� 
Pro Member�� �ڽ��� �ɷ��� ���ϴ� �������� �ŷ� �ϸ鼭 �ڽ��� �̸��� �˸����ִ�ϴ�.
Finder Member�� �ڽ��� ���ϴ� �о��� �������� �Ҿװ����� ���ؼ� ������ �����ϸ� �ʿ��� �κи� ���� �������� ������ �����մϴ�.
');
INSERT INTO FAQ VALUES('FAQ'||FAQ_SEQ.NEXTVAL,1,'�Ű� �ȳ�','�� ����Ʈ���� �������� �������� �߽߰� �Ű� ��ư�� ���� �Ű� ��Ź�帳�ϴ�. �̿��ڵ��� ������ �̿��� ���� ������ ��Ź�帳�ϴ�.');

INSERT INTO FAQ VALUES('FAQ'||FAQ_SEQ.NEXTVAL,2,'���¹�ȣ ����','���¹�ȣ�� ������ ���������� ��� ���ż� ���¹�ȣ ������ �Ͻø�˴ϴ�. ');
INSERT INTO FAQ VALUES('FAQ'||FAQ_SEQ.NEXTVAL,2,'������ �ȳ� ',' PROFINDER�� �Ǹ� �����Ḧ 10%�Դϴ�. 10%�� ����� ���� ���� �� ���ڹ߼� ���� ����������� ��� �˴ϴ�. ');
INSERT INTO FAQ VALUES('FAQ'||FAQ_SEQ.NEXTVAL,2,'�Ǹ� �ȳ�',' �������� �ǸŴ� ProMember�� �����ϼž� �̿��� �����ϸ� �ʼ����� ������ �ƴմϴ�.
');
INSERT INTO FAQ VALUES('FAQ'||FAQ_SEQ.NEXTVAL,2,'�۱ݾȳ�','�ſ� 1�� ���� �� ���� ����� ����˴ϴ�. ������ �Ϸ� . ���� ���� �ݾ��� ���� �� ���ϱ��� ������� ���� �Ǹűݾ��� "�� ���� �ݾ�"�� �հ谡 �˴ϴ�.
���� ������ �ݾ��� �� �հ� 5������ ���� ���� ��쿡�� �����޷� ����˴ϴ�. ���� �޷� �̿��Ǵ��� ������ �޾Ҵ� �ݾ��� ������� ������, �ش� �ݾ��� �����Ͽ� ������ �̷�����ϴ�.
');
INSERT INTO FAQ VALUES('FAQ'||FAQ_SEQ.NEXTVAL,3,'���� �ȳ�','�������� ���� ������ �Ϻο� ���� �������� �̷���� ������ ���� �������� ����Ʈ �������Ŀ� �̿��� �����մϴ�.');
INSERT INTO FAQ VALUES('FAQ'||FAQ_SEQ.NEXTVAL,3,'���ŷ� �ȳ�',' PROFINDER ����Ʈ������ ���ΰ��� ���ŷ��� ������ �߻��ÿ��� �ƹ��� ������ �帱 �� �����ϴ�.');
INSERT INTO FAQ VALUES('FAQ'||FAQ_SEQ.NEXTVAL,3,'������ ȯ��','�� �������� ������ ��ǰ���� ȯ���� ������� ���� ��Ź�帳�ϴ�.');
COMMIT;
SELECT * FROM PROMEMBERS;
SELECT * FROM FBOARD;
SELECT * FROM FINDERMEMBERS;
SELECT FB.*
        FROM(SELECT * FROM
		    (SELECT ROWNUM RN, A.* FROM
                (SELECT F.*  FROM FBOARD F, 
                    (SELECT FB_NUM, COUNT(*) AS TOTAL FROM FB_COMMENT WHERE FC_DEL = 0 GROUP BY FB_NUM) FC
                        WHERE F.FB_NUM=FC.FB_NUM(+) AND FB_DEL = 0 ORDER BY FB_DATE DESC) A)
                           WHERE RN BETWEEN 1 AND 10) FB;
SELECT * FROM (SELECT ROWNUM RN,A.* FROM
   (SELECT * FROM FBOARD WHERE FB_DEL=0 ORDER BY FB_DATE DESC)A)
        WHERE RN BETWEEN 1 AND 10;
SELECT COUNT(L_NUM) LIKECNT FROM LIKES WHERE L_NUM = 'FBOAD210';
SELECT COUNT(FB_NUM) TOTAL FROM FB_COMMENT WHERE FB_NUM = 'FBOARD210';