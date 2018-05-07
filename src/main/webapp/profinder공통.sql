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
    
/* ���� */
DROP TABLE QUIZ 
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
select*from admin;
INSERT INTO ADMIN VALUES('sinmk','pw','�Źΰ�');
SELECT * FROM ADMIN WHERE AD_ID='sinmk';
COMMIT;
/* �о� */
CREATE TABLE CATEGORY (
   CATE_NUM NUMBER NOT NULL, /* �о߹�ȣ */
   CATE_NAME VARCHAR2(100) NOT NULL, /* �о��̸� */
    PRIMARY KEY(CATE_NUM)
);

-- �о� INSERT��
UPDATE CATEGORY SET CATE_NAME='����' WHERE CATE_NUM=1;
UPDATE CATEGORY SET CATE_NAME='����Ͻ�' WHERE CATE_NUM=2;
UPDATE CATEGORY SET CATE_NAME='��Ȱ����' WHERE CATE_NUM=3;
UPDATE CATEGORY SET CATE_NAME='������' WHERE CATE_NUM=4;
UPDATE CATEGORY SET CATE_NAME='����' WHERE CATE_NUM=5;
INSERT INTO CATEGORY VALUES(6,'�ǰ�/�̿�');
INSERT INTO CATEGORY VALUES(7,'�̺�Ʈ');
INSERT INTO CATEGORY VALUES(8,'��Ÿ');

SELECT * FROM CATEGORY;
commit;
select*from promembers;

/*�����о�*/
CREATE TABLE SUB_CATE(
  SUB_CATENUM NUMBER NOT NULL,
  SUB_CATENAME VARCHAR2(100) NOT NULL,
  CATE_NUM NUMBER REFERENCES CATEGORY(CATE_NUM)
);

INSERT INTO SUB_CATE VALUES(1,'����',1);
INSERT INTO SUB_CATE VALUES(2,'����',1);
INSERT INTO SUB_CATE VALUES(3,'����',1);
INSERT INTO SUB_CATE VALUES(4,'��ȸ����',1);
INSERT INTO SUB_CATE VALUES(5,'�ڿ�����',1);
INSERT INTO SUB_CATE VALUES(1,'��/����',2);
INSERT INTO SUB_CATE VALUES(2,'������',2);
INSERT INTO SUB_CATE VALUES(3,'������',2);
INSERT INTO SUB_CATE VALUES(1,'�丮',3);
INSERT INTO SUB_CATE VALUES(2,'���׸���',3);
INSERT INTO SUB_CATE VALUES(3,'�м�DIY',3);
INSERT INTO SUB_CATE VALUES(4,'ȭ��ǰ/��DIY',3);
INSERT INTO SUB_CATE VALUES(5,'��������',3);
INSERT INTO SUB_CATE VALUES(1,'��/�۵�����',4);
INSERT INTO SUB_CATE VALUES(2,'�мǵ�����',4);
INSERT INTO SUB_CATE VALUES(3,'��ǰ������',4);
INSERT INTO SUB_CATE VALUES(4,'���ǵ�����',4);
INSERT INTO SUB_CATE VALUES(5,'���ӱ׷��ȵ�����',4);
INSERT INTO SUB_CATE VALUES(1,'��/�۰���',5);
INSERT INTO SUB_CATE VALUES(2,'���Ӱ���',5);
INSERT INTO SUB_CATE VALUES(3,'SW����',5);
INSERT INTO SUB_CATE VALUES(1,'���̾�Ʈ',6);
INSERT INTO SUB_CATE VALUES(2,'�ｺ/Ʈ���̴�',6);
INSERT INTO SUB_CATE VALUES(3,'��Ų�ɾ�',6);
INSERT INTO SUB_CATE VALUES(4,'����ũ��',6);
INSERT INTO SUB_CATE VALUES(1,'�Կ�/��������',7);
INSERT INTO SUB_CATE VALUES(2,'����',7);

SELECT*FROM SUB_CATE;
COMMIT;

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
    F_PHOTO1 VARCHAR2(100) DEFAULT 'NOIMG.PNG', /* �����ʻ��� */
    F_DROP NUMBER(1) DEFAULT 0, /* Ż�𿩺� */
    F_SUSPEND NUMBER(1) DEFAULT 0, /* �������� */
    F_DATE DATE DEFAULT SYSDATE, /* ������ */
    F_MESSAGE VARCHAR2(100), /* �˸��� */
    F_PHOTO2 VARCHAR2(100), /* �߰��̹��� */
    PRIMARY KEY(F_EMAIL)
);

-- ���δ���� INSERT��
INSERT INTO FINDERMEMBERS (F_EMAIL, F_PW, F_NAME, F_NICKNAME, F_TEL1, F_TEL2, F_TEL3, F_ACCOUNTNUM, F_BANK, F_AREA, F_PHOTO1,F_MESSAGE, F_PHOTO2)
    VALUES('hyun1330@naver.com', '11', '������', '������', '010', '3976', '2237', '302-0778-5449-11', '����', '����', '����1', '�޼���', '����2');
INSERT INTO FINDERMEMBERS (F_EMAIL, F_PW, F_NAME, F_NICKNAME, F_TEL1, F_TEL2, F_TEL3, F_AREA)
    VALUES('finder@naver.com', '1', 'findername1', 'findernickname1', '010', '9999', '9999', '���');
INSERT INTO FINDERMEMBERS (F_EMAIL, F_PW, F_NAME, F_NICKNAME, F_TEL1, F_TEL2, F_TEL3, F_AREA)
    VALUES('finder2@naver.com', '2', 'findername2', 'findernickname2', '010', '9998', '9999', '�λ�');
INSERT INTO FINDERMEMBERS (F_EMAIL, F_PW, F_NAME, F_NICKNAME, F_TEL1, F_TEL2, F_TEL3, F_AREA)
    VALUES('finder12@finder.com', '12', 'findername12', 'findernickname12', '010', '9998', '9999', '�λ�');
SELECT*FROM FINDERMEMBERS;
INSERT INTO FINDERMEMBERS VALUES('finder0@finder.com', 'pw', 'finder0', 'finder0', '010','1234','1234', null, null, '����', default, default, default, default, default, null, null);
SELECT*FROM FINDERMEMBERS WHERE F_EMAIL='finder1@finder.com';
UPDATE FINDERMEMBERS SET F_POINT=F_POINT+1000 WHERE F_EMAIL='finder1@finder.com';
commit;
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
    PRIMARY KEY(P_EMAIL),
    FOREIGN KEY(CATE_NUM) REFERENCES CATEGORY(CATE_NUM)
);
SELECT*FROM PROMEMBERS;
COMMIT;
UPDATE PROMEMBERS SET P_POINT=20000 WHERE P_EMAIL='sinmk89@naver.com';
SELECT*FROM FINDERMEMBERS;
-- ���θ�� INSERT��
INSERT INTO PROMEMBERS VALUES('sinmk89@naver.com','pw','�Źΰ�','���ϴ�','010','8697','6064','1002-831-431-648','�츮����','����', default, default, default, default, default, '�ȳ��ϼ���.', 'bgsample.png', 3);
INSERT INTO PROMEMBERS(P_EMAIL, P_PW, P_NAME,P_NICKNAME, P_TEL1, P_TEL2, P_TEL3, P_ACCOUNTNUM, P_BANK, P_AREA,P_PHOTO1, P_MESSAGE, P_PHOTO2, CATE_NUM)
    VALUES('hyun1330@naver.com', '22', '������', '������', '010', '3976', '2237', '302-0778-5449-11', '����', '����', '����1','�޼���','����2', 1);
INSERT INTO PROMEMBERS(P_EMAIL, P_PW, P_NAME,P_NICKNAME, P_TEL1, P_TEL2, P_TEL3, P_AREA, CATE_NUM)
    VALUES('hope1821@naver.com', '1234', '������', '�Ź�', '010', '9505', '2118','����', 2);
INSERT INTO PROMEMBERS(P_EMAIL, P_PW, P_NAME,P_NICKNAME, P_TEL1, P_TEL2, P_TEL3, P_AREA, CATE_NUM)
    VALUES('aa@aa', '1234', '����', '���̺���', '010', '9405', '2117','����', 2);
INSERT INTO PROMEMBERS(P_EMAIL, P_PW, P_NAME,P_NICKNAME, P_TEL1, P_TEL2, P_TEL3, P_AREA, CATE_NUM)
    VALUES('pro@naver.com', '1', 'proname1', 'pronickname1', '010', '1111', '1111', '��õ', 4);
INSERT INTO PROMEMBERS(P_EMAIL, P_PW, P_NAME,P_NICKNAME, P_TEL1, P_TEL2, P_TEL3, P_AREA, CATE_NUM)
    VALUES('pro2@naver.com', '1', 'proname2', 'pronickname2', '010', '1112', '1111', '����', 5);
INSERT INTO PROMEMBERS(P_EMAIL, P_PW, P_NAME,P_NICKNAME, P_TEL1, P_TEL2, P_TEL3, P_AREA, CATE_NUM)
    VALUES('pro3@pro.com', '3', 'proname3', 'pronickname3', '010', '1112', '1111', '����', 5);
INSERT INTO PROMEMBERS(P_EMAIL, P_PW, P_NAME,P_NICKNAME, P_TEL1, P_TEL2, P_TEL3, P_AREA, CATE_NUM)
    VALUES('pro3@pro.com', '11', 'proname4', 'pronickname11', '010', '1112', '1111', '����', 5);
ROLLBACK;
INSERT INTO PROMEMBERS VALUES('aa@pro.com','pw','Aplus','Aplus','010','1111','1111',null,null,'����',default, default, default, default,default, null, null, 1);
SELECT*FROM PROMEMBERS;
SELECT*FROM FINDERMEMBERS;
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

-- �����ǵ� INSERT��
INSERT INTO NEWSFEED 
    VALUES('NEWSFEED'||NEWSFEED_SEQ.NEXTVAL,'aa@aa','����','����',SYSDATE,0,0,'127.0.0.1',2);
INSERT INTO NEWSFEED 
    VALUES('NEWSFEED'||NEWSFEED_SEQ.NEXTVAL,'aa@aa','����2','����2',SYSDATE,0,0,'127.0.0.1',2);

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
CREATE SEQUENCE NEWS_COMMENT_SEQ;

-- �����ǵ��� INSERT��
INSERT INTO NEWS_COMMENT 
    VALUES('NEWS_COMMENT'||NEWS_COMMENT_SEQ.NEXTVAL,'NEWSFEED2','����','ù���',SYSDATE,0,'127.0.0.1');

/* ���ϱ� */ 
DROP TABLE FAVORITE;
CREATE TABLE FAVORITE (
    F_EMAIL VARCHAR2(100), /* ���ѻ�� */
    P_EMAIL VARCHAR2(100), /* ����ѻ�� */
    FOREIGN KEY(F_EMAIL) REFERENCES FINDERMEMBERS(F_EMAIL),
    FOREIGN KEY(P_EMAIL) REFERENCES PROMEMBERS(P_EMAIL),
    CONSTRAINT FAVORITE PRIMARY KEY(F_EMAIL, P_EMAIL)
);
SELECT*FROM FAVORITE;
SELECT*FROM PROMEMBERS;
SELECT*FROM PROMEMBERS WHERE P_EMAIL='pro8@pro.com';
SELECT*FROM FINDERMEMBERS;
INSERT INTO FAVORITE VALUES('finder0@finder.com', 'aa@aa');
DELETE FROM FAVORITE WHERE P_EMAIL='pro1@pro.com';
commit;
SELECT * FROM(SELECT ROWNUM R, A.* FROM
    		(SELECT P.P_EMAIL , COUNT(P.P_EMAIL) CNT FROM FAVORITE F, PROMEMBERS P  WHERE F.P_EMAIL=P.P_EMAIL AND CATE_NUM=1 GROUP BY P.P_EMAIL
                ORDER BY CNT DESC)A)
            		WHERE R BETWEEN 1 AND 100;
                    
CREATE OR REPLACE VIEW JJIM AS
SELECT * FROM(SELECT ROWNUM R, A.* FROM
    		(SELECT P_EMAIL , COUNT(P_EMAIL) CNT FROM FAVORITE GROUP BY P_EMAIL 
                ORDER BY CNT DESC)A)
            		WHERE R BETWEEN 1 AND 6;
SELECT J.*, P.CATE_NUM, CATE_NAME FROM JJIM J, PROMEMBERS P, CATEGORY C WHERE J.P_EMAIL=P.P_EMAIL AND P.CATE_NUM=C.CATE_NUM;
commit;
SELECT * FROM(SELECT ROWNUM R,A.* FROM
    		(SELECT L_NUM,COUNT(L_NUM) CNT FROM LIKES WHERE L_NUM LIKE 'NEWSFEED%'
        		GROUP BY L_NUM ORDER BY CNT DESC)A)
            		WHERE R BETWEEN 1 AND 3;
SELECT * FROM PROMEMBERS WHERE p_email= 'pro@naver.com';
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
SELECT * FROM(SELECT ROWNUM R, A.* FROM
    		(SELECT * FROM CONTENTS  WHERE CATE_NUM=1
                ORDER BY CON_DOWNLOAD DESC)A)
            		WHERE R BETWEEN 1 AND 6;

SELECT * FROM (
    SELECT ROWNUM R, A.* FROM (
     SELECT*FROM CONTENTS WHERE CATE_NUM=3 AND (CON_TITLE LIKE '%������%' OR CON_CONTENT LIKE '%������%') ORDER BY CON_DATE DESC)A) 
        WHERE R BETWEEN 1 AND 5;
 SELECT COUNT(*) FROM CONTENTS WHERE CON_TITLE LIKE '%������%' OR CON_CONTENT LIKE '%������%';
 SELECT * FROM (
    SELECT ROWNUM R, A.* FROM (
     SELECT*FROM CONTENTS WHERE CATE_NUM=2 AND (CON_TITLE LIKE '%Contents%' OR CON_CONTENT LIKE '%Contents%') ORDER BY CON_DATE DESC)A) 
        WHERE R BETWEEN 11 AND 15;
-- �������������� ������
DROP SEQUENCE CONTENTS_SEQ;
CREATE SEQUENCE CONTENTS_SEQ;

-- �������������� INSERT��
INSERT INTO CONTENTS 
    VALUES('CONTENTS'||CONTENTS_SEQ.NEXTVAL,'hope1821@naver.com','����','����',null,null,null,0,SYSDATE,2,0,0);
INSERT INTO CONTENTS 
    VALUES('CONTENTS'||CONTENTS_SEQ.NEXTVAL,'haenemm@naver.com','������ ���¸� �˳��� �̱׷��� �ŷ��� �ڶ��ϴ� ����. �� � ���Ϻ��� ��ŭ�ϰ� ������ ���� �ڶ��ϴ� ���Ⱑ ���� ������ �����鼭 ī�� �귣�帶�� ���⸦ �׸��� �� �Ÿ޴��� �մ����� ����ϰ� �ִ�. ',
    '���� ���� ���⸦ Ȱ���� ����Ʈ �޴��� ������ ���� �Ź� ����� ���̵� �����̴� ����Ʈ�� �Һ��ڵ��� ������� ������ �̹����� ���� ��Ư�� ����Ʈ�� ������ ȭ���� ��Ҵ�. �Ÿ޴��� ���座�� ���⼳���� ����ũ�� ���� ���־�� ���� ���� �Ѹ��� ������ ���座�� ����ũ�� ���մ�. ��õ��ڸ��� ���� ���� �ȸ� ������ �ø��� �޴��� ����ϸ� ������ �α⸦ ��� �ִ�. �ƿ﷯ �Բ� ����� ������ ���ں극��� ������ ��Ϲ��� �극�� ���� ������ ������� ��ũ�� �׸��� ���� �ҽ��� ���� ������ �ѷ��Դ� �Ű��� ��Ϻ극�� �޴���
     Ȱ���� ����Ʈ �޴��� ������ ���� �Ź� ����� ���̵� �����̴� ����Ʈ�� �Һ��ڵ��� ������� ������ �̹����� ���� ��Ư�� ����Ʈ�� ������ ȭ���� ��Ҵ�. �Ÿ޴��� ���座�� ���⼳���� ����ũ�� ���� ���־�� ���� ���� �Ѹ��� ������ ���座�� ����ũ�� ���մ�. ��õ��ڸ��� ���� ���� �ȸ� ������ �ø��� �޴��� ����ϸ� ������ �α⸦ ��� �ִ�. �ƿ﷯ �Բ� ����� ������ ���ں극��� ������ ��Ϲ��� �극�� ���� ������ ������� ��ũ�� �׸��� ���� �ҽ��� ���� ������ �ѷ��Դ� �Ű��� ��Ϻ극�� �޴���
    ���� ���� ���⸦ Ȱ���� ����Ʈ �޴��� ������ ���� �Ź� ����� ���̵� �����̴� ����Ʈ�� �Һ��ڵ��� ������� ������ �̹����� ���� ��Ư�� ����Ʈ�� ������ ȭ���� ��Ҵ�. �Ÿ޴��� ���座�� ���⼳���� ����ũ�� ���� ���־�� ���� ���� �Ѹ��� ������ ���座�� ����ũ�� ���մ�. ��õ��ڸ��� ���� ���� �ȸ� ������ �ø��� �޴��� ����ϸ� ������ �α⸦ ��� �ִ�. �ƿ﷯ �Բ� ����� ������ ���ں극��� ������ ��Ϲ��� �극�� ���� ������ ������� ��ũ�� �׸��� ���� �ҽ��� ���� ������ �ѷ��Դ� �Ű��� ��Ϻ극�� �޴���
    ���� ���� ���⸦ Ȱ���� ����Ʈ �޴��� ������ ���� �Ź� ����� ���̵� �����̴� ����Ʈ�� �Һ��ڵ��� ������� ������ �̹����� ���� ��Ư�� ����Ʈ�� ������ ȭ���� ��Ҵ�. �Ÿ޴��� ���座�� ���⼳���� ����ũ�� ���� ���־�� ���� ���� �Ѹ��� ������ ���座�� ����ũ�� ���մ�. ��õ��ڸ��� ���� ���� �ȸ� ������ �ø��� �޴��� ����ϸ� ������ �α⸦ ��� �ִ�. �ƿ﷯ �Բ� ����� ������ ���ں극��� ������ ��Ϲ��� �극�� ���� ������ ������� ��ũ�� �׸��� ���� �ҽ��� ���� ������ �ѷ��Դ� �Ű��� ��Ϻ극�� �޴���
    ',null,null,null,0,SYSDATE,2,0,0);  
    commit;
    SELECT * FROM CATEGORY ORDER BY CATE_NUM;

select * from promembers;

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
    Q_STAR NUMBER(1) DEFAULT 0, /* ���� */
    PRIMARY KEY(Q_NUM),
    FOREIGN KEY(P_EMAIL) REFERENCES PROMEMBERS(P_EMAIL),
    FOREIGN KEY(F_EMAIL) REFERENCES FINDERMEMBERS(F_EMAIL),
    FOREIGN KEY(CATE_NUM) REFERENCES CATEGORY(CATE_NUM)
);

-- ���������� ������ ����
DROP SEQUENCE QUESTION_SEQ;
CREATE SEQUENCE QUESTION_SEQ;

-- ���������� INSERT
INSERT INTO QUESTION (Q_NUM, P_EMAIL, F_EMAIL, CATE_NUM, Q_TITLE, Q_CONTENT, Q_PRICE, Q_SHOW, Q_STAR) 
    VALUES('QUESTION'||QUESTION_SEQ.NEXTVAL,'pro@naver.com', 'finder@naver.com', 4, '��������1', '��������1', 100, 1, 3.9);
INSERT INTO QUESTION (Q_NUM, P_EMAIL, F_EMAIL, CATE_NUM, Q_TITLE, Q_CONTENT, Q_PRICE) 
    VALUES('QUESTION'||QUESTION_SEQ.NEXTVAL,'pro2@naver.com', 'finder2@naver.com', 5, '��������2', '��������2', 200);

/* ����������亯 */
CREATE TABLE QANSWER (
    Q_NUM VARCHAR2(100) NOT NULL, /* ������ȣ */
    QA_CONTENT CLOB NOT NULL, /* �亯���� */
    QA_DATE DATE DEFAULT SYSDATE, /* �亯�� */
    PRIMARY KEY(Q_NUM),
    FOREIGN KEY(Q_NUM) REFERENCES QUESTION(Q_NUM)
);
select*from qanswer;
select*from question;
select*from likes;
-- ����������亯 INSERT��
INSERT INTO QANSWER(Q_NUM, QA_CONTENT) VALUES('QUESTION1', '����1_�亯1');
INSERT INTO QANSWER(Q_NUM, QA_CONTENT) VALUES('QUESTION2', '����2_�亯1');

/* ���� */
CREATE TABLE QUIZ (
	QUIZ_NUM VARCHAR2(100) NOT NULL, /* �����ȣ */
	P_EMAIL VARCHAR2(100) NOT NULL, /* ������ */
    CATE_NUM NUMBER NOT NULL, /* �о߹�ȣ */
	QUIZ_GROUP VARCHAR2(100) NOT NULL, /* ����׷� */
    QUIZ_TITLE VARCHAR2(300) NOT NULL, /* �������� */
	QUIZ_CONTENT CLOB NOT NULL, /* ����� */
	QUIZ_ANSWER VARCHAR2(100) NOT NULL, /* �������� */
	QUIZ_SELECT1 VARCHAR2(300) NOT NULL, /* ������1 */
	QUIZ_SELECT2 VARCHAR2(300) NOT NULL, /* ������2 */
	QUIZ_SELECT3 VARCHAR2(300) NOT NULL, /* ������3 */
	QUIZ_SELECT4 VARCHAR2(300) NOT NULL, /* ������4 */
	QUIZ_PRICE NUMBER NOT NULL, /* ���� */
    PRIMARY KEY(QUIZ_NUM),
    FOREIGN KEY(P_EMAIL) REFERENCES PROMEMBERS(P_EMAIL),
    FOREIGN KEY(CATE_NUM) REFERENCES CATEGORY(CATE_NUM)
);

/* ���ų��� */
CREATE TABLE BUY (
    F_EMAIL VARCHAR2(100) NOT NULL, /* �̸��� */
    BUY_NUM VARCHAR2(100) NOT NULL, /* ���Ż�ǰ��ȣ */
    BUY_DATE DATE NOT NULL,
    FOREIGN KEY(F_EMAIL) REFERENCES FINDERMEMBERS(F_EMAIL)
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
CREATE SEQUENCE FBOARD_SEQ;

-- �����Խ��� INSERT��
INSERT INTO FBOARD(FB_NUM, FB_NAME, FB_TITLE, FB_CONTENT, FB_IP)
    VALUES('FBOARD'||FBOARD_SEQ.NEXTVAL, '�̸�', '����', '����', '������');

/* �����Խ��Ǵ�� */
CREATE TABLE FB_COMMENT (
	FC_NUM VARCHAR2(100) NOT NULL, /* ��۹�ȣ */
	FB_NUM VARCHAR2(100) NOT NULL, /* �۹�ȣ */
	FC_NAME VARCHAR2(100) NOT NULL, /* �ۼ��� */
	FC_CONTENT CLOB NOT NULL, /* ��۳��� */
    FC_GROUP VARCHAR2(100) NOT NULL, /* ��۱׷� */
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
CREATE SEQUENCE FB_COMMENT_SEQ;

/* 1:1���� */
CREATE TABLE CLAIM (
	CL_NUM VARCHAR2(100) NOT NULL, /* ���ǹ�ȣ */
	CL_EMAIL VARCHAR2(100) NOT NULL, /* �������̸��� */
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

-- 1:1���� INSERT��
INSERT INTO CLAIM 
    VALUES('CLAIM'||CLAIM_SEQ.NEXTVAL,'hope1821@naver.com','�Ź�','�����϶�¹���3',SYSDATE,'��Ÿ',0);
INSERT INTO CLAIM 
    VALUES('CLAIM'||CLAIM_SEQ.NEXTVAL,'aa@aa','�����϶�¹���4',SYSDATE,'��Ÿ',0);
SELECT * FROM CLAIM;

/* ���ֹ��������з� */
CREATE TABLE FAQ_CATE (
	FAQ_CATENUM NUMBER NOT NULL, /* FAQ�з���ȣ */
	FAQ_CATENAME VARCHAR2(100) NOT NULL, /* FAQ�з��̸� */
    PRIMARY KEY(FAQ_CATENUM)
);

-- ���ֹ��������з� INSERT��
INSERT INTO FAQ_CATE VALUES(1,'ȸ������');        
INSERT INTO FAQ_CATE VALUES(2,'�Ǹ� ����');        
INSERT INTO FAQ_CATE VALUES(3,'���Ű���');     


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

/* ���ƿ� */
DROP TABLE LIKES;
CREATE TABLE LIKES (
	L_NUM VARCHAR2(100) NOT NULL, /* �ε��� */
	L_LIKER VARCHAR2(100) NOT NULL, /* ���ƿ��ѻ�� */    
    CONSTRAINT LIKES PRIMARY KEY(L_NUM, L_LIKER)
);
SELECT*FROM FINDERMEMBERS;
SELECT*FROM QUESTION;
INSERT INTO LIKES VALUES('NEWSFEED41','ABC');
SELECT*FROM LIKES;
COMMIT;

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
    
SELECT * FROM ADMIN; /* ������ */
SELECT * FROM CATEGORY; /* �о� */ 
SELECT * FROM FINDERMEMBERS; /* ���δ���� */
SELECT * FROM PROMEMBERS; /* ���θ�� */
SELECT * FROM NEWSFEED; /* �����ǵ� */
SELECT * FROM NEWS_COMMENT; /* �����ǵ��� */ 
SELECT * FROM FAVORITE; /* ���ϱ� */
SELECT * FROM VISITED; /* �湮�ڸ�� */
SELECT * FROM CONTENTS; /* �������������� */
SELECT * FROM QUESTION; /* ���������� */
SELECT * FROM QANSWER; /* ����������亯 */
SELECT * FROM QUIZ; /* ���� */
SELECT * FROM BUY; /* ���ų��� */
SELECT * FROM PPAGE; /* �������������� */
SELECT * FROM REVIEW; /* �ı� */
SELECT * FROM FBOARD; /* �����Խ��� */
SELECT fb_date FROM FBOARD;

SELECT * FROM FB_COMMENT; /* �����Խ��Ǵ�� */
SELECT * FROM CLAIM; /* 1:1���� */
SELECT * FROM FAQ_CATE; /* ���ֹ��������з� */
SELECT * FROM FAQ; /* ���ֹ������� */
SELECT * FROM LIKES; /* ���ƿ� */
SELECT * FROM REPORT; /* �Ű� */
SELECT * FROM ALARM; /* �˶� */

SELECT * FROM CLAIM WHERE CL_STATUS=0 ORDER BY CL_DATE;
SELECT * FROM (SELECT ROWNUM R,A.* FROM
    		(SELECT N.*,P_NICKNAME FROM NEWSFEED N,PROMEMBERS P
        		WHERE N.P_EMAIL=P.P_EMAIL AND N_DEL = 0 ORDER BY N_DATE DESC)A)
            		WHERE R BETWEEN 1 AND 5;
                    
                    
SELECT *
    		FROM (SELECT ROWNUM RN, A.*
            		FROM (SELECT Q.*, P.P_NICKNAME, F.F_NICKNAME FROM QUESTION Q, PROMEMBERS P, FINDERMEMBERS F WHERE Q.P_EMAIL = P.P_EMAIL AND Q.F_EMAIL = F.F_EMAIL ORDER BY Q_DATE DESC)A)
    		WHERE RN BETWEEN 1 AND 6 AND P_EMAIL = 'hope1821@naver.com';
            
            INSERT INTO QUESTION (Q_NUM, P_EMAIL, F_EMAIL, CATE_NUM, Q_TITLE, Q_CONTENT, Q_PRICE) 
   			 VALUES('QUESTION'||QUESTION_SEQ.NEXTVAL,'hope1821@naver.com', 'hyun1330@naver.com', 1, '����', '����', 100);

SELECT * FROM(SELECT ROWNUM R,A.* FROM
    		(SELECT L_NUM,COUNT(L_NUM) CNT FROM LIKES WHERE L_NUM LIKE 'NEWSFEED%'
        		GROUP BY L_NUM ORDER BY CNT DESC)A)
            		WHERE R BETWEEN 1 AND 3;
SELECT * FROM (SELECT ROWNUM R,A.* FROM
    		(SELECT N.*,P_NICKNAME FROM NEWSFEED N,PROMEMBERS P
        		WHERE N.P_EMAIL=P.P_EMAIL AND N_DEL = 0 ORDER BY N_DATE DESC)A)
            		WHERE R=1;
SELECT * FROM(SELECT ROWNUM R,A.* FROM
    		(SELECT L_NUM,COUNT(L_NUM) CNT FROM LIKES WHERE L_NUM LIKE 'NEWSFEED%'
        		GROUP BY L_NUM ORDER BY CNT DESC)A)
            		WHERE R BETWEEN 1 AND 7;
SELECT N.*,P_NICKNAME FROM NEWSFEED N,PROMEMBERS P 
    		WHERE N.P_EMAIL=P.P_EMAIL AND N_NUM = 'NEWSFEED1';

--QUESTION RANKINGS FROM ALL
SELECT * FROM(SELECT ROWNUM R,A.* FROM
    		(SELECT L_NUM,COUNT(L_NUM) CNT FROM LIKES WHERE L_NUM LIKE 'QUESTION%'
        		GROUP BY L_NUM ORDER BY CNT DESC)A)
            		WHERE R BETWEEN 1 AND 6;
--QUESTION RANKINGS FROM CATE_NUM=1
SELECT * FROM(SELECT ROWNUM R,A.* FROM
    		(SELECT L_NUM,COUNT(L_NUM) CNT FROM LIKES L, QUESTION Q WHERE L_NUM LIKE 'QUESTION%' AND L_NUM=Q_NUM AND CATE_NUM=1
        		GROUP BY L_NUM ORDER BY CNT DESC)A)
            		WHERE R BETWEEN 13 AND 24;
SELECT*FROM QUESTION WHERE CATE_NUM=1;
SELECT*FROM CONTENTS;

COMMIT;
