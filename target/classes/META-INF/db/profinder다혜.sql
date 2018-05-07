/* ���������� ���̺� �ʵ� �߰��� ���۾� */

-- 1) �о� CATEGORY
SELECT * FROM CATEGORY;

-- 2) ���θ�� INSERT
SELECT * FROM PROMEMBERS;
--INSERT INTO PROMEMBERS(P_EMAIL, P_PW, P_NAME,P_NICKNAME, P_TEL1, P_TEL2, P_TEL3, P_AREA, CATE_NUM)
--    VALUES('pro@naver.com', '1', 'proname1', 'pronickname1', '010', '1111', '1111', '��õ', 4);
--INSERT INTO PROMEMBERS(P_EMAIL, P_PW, P_NAME,P_NICKNAME, P_TEL1, P_TEL2, P_TEL3, P_AREA, CATE_NUM)
--    VALUES('pro2@naver.com', '1', 'proname2', 'pronickname2', '010', '1112', '1111', '����', 5);

-- 3) ���δ���� INSERT
SELECT * FROM FINDERMEMBERS;
--INSERT INTO FINDERMEMBERS (F_EMAIL, F_PW, F_NAME, F_NICKNAME, F_TEL1, F_TEL2, F_TEL3, F_AREA)
--    VALUES('finder@naver.com', '1', 'findername1', 'findernickname1', '010', '9999', '9999', '���');
--INSERT INTO FINDERMEMBERS (F_EMAIL, F_PW, F_NAME, F_NICKNAME, F_TEL1, F_TEL2, F_TEL3, F_AREA)
--    VALUES('finder2@naver.com', '2', 'findername2', 'findernickname2', '010', '9998', '9999', '�λ�');
COMMIT;

/* ���������� �۾�*/
DROP SEQUENCE QUESTION_SEQ;
CREATE SEQUENCE QUESTION_SEQ;

-- ���������� INSERT
SELECT * FROM QUESTION;
--INSERT INTO QUESTION (Q_NUM, P_EMAIL, F_EMAIL, CATE_NUM, Q_TITLE, Q_CONTENT, Q_PRICE) 
--    VALUES('QUESTION'||QUESTION_SEQ.NEXTVAL,'pro@naver.com', 'finder@naver.com', 4, '��������1', '��������1', 100);
--INSERT INTO QUESTION (Q_NUM, P_EMAIL, F_EMAIL, CATE_NUM, Q_TITLE, Q_CONTENT, Q_PRICE) 
--    VALUES('QUESTION'||QUESTION_SEQ.NEXTVAL,'pro2@naver.com', 'finder2@naver.com', 5, '��������2', '��������2', 200);
INSERT INTO QUESTION (Q_NUM, P_EMAIL, F_EMAIL, CATE_NUM, Q_TITLE, Q_CONTENT, Q_PRICE) 
    VALUES('QUESTION'||QUESTION_SEQ.NEXTVAL,'pro2@naver.com', 'finder2@naver.com', 5, '��������3', '��������3', 300);
COMMIT;

-- ���������� LIST : ���δ������ �������� ���� ����LIST + ����¡ 
SELECT *
    FROM (SELECT ROWNUM RN, A.*
            FROM (SELECT Q.*, P.P_NICKNAME, F.F_NICKNAME FROM QUESTION Q, PROMEMBERS P, FINDERMEMBERS F WHERE Q.P_EMAIL = P.P_EMAIL AND Q.F_EMAIL = F.F_EMAIL ORDER BY Q_DATE DESC)A)
    WHERE RN BETWEEN 1 AND 10 AND F_EMAIL = 'finder@naver.com';

SELECT COUNT(*) FROM QUESTION WHERE F_EMAIL = 'finder@naver.com';

-- ���������� LIST : ���θ���� �������� ���� ����LIST + ����¡
SELECT *
    FROM (SELECT ROWNUM RN, A.*
            FROM (SELECT Q.*, P.P_NICKNAME, F.F_NICKNAME FROM QUESTION Q, PROMEMBERS P, FINDERMEMBERS F WHERE Q.P_EMAIL = P.P_EMAIL AND Q.F_EMAIL = F.F_EMAIL ORDER BY Q_DATE DESC)A)
    WHERE RN BETWEEN 1 AND 10 AND P_EMAIL = 'pro@naver.com';    

SELECT COUNT(*) FROM QUESTION WHERE P_EMAIL='pro@naver.com';

-- ���������� LIST :  �оߺ� ����LIST + ����¡
SELECT *
    FROM (SELECT ROWNUM RN, A.*
            FROM (SELECT Q.*, P.P_NICKNAME, F.F_NICKNAME FROM QUESTION Q, PROMEMBERS P, FINDERMEMBERS F WHERE Q.P_EMAIL = P.P_EMAIL AND Q.F_EMAIL = F.F_EMAIL ORDER BY Q_DATE DESC)A)
    WHERE RN BETWEEN 1 AND 10 AND CATE_NUM=4;

SELECT COUNT(*) FROM QUESTION WHERE CATE_NUM=4;

-- ���������� TOTAL
SELECT COUNT(*) FROM QUESTION;

-- ���������� UPDATE��
UPDATE QUESTION SET Q_TITLE='��������_1', Q_CONTENT='��������_1', Q_PRICE=110 WHERE Q_NUM='QUESTION1';

-- ���������� DELETE��
DELETE FROM QUESTION WHERE Q_NUM='QUESTION3';
SELECT * FROM QUESTION ORDER
BY Q_DATE DESC;
ROLLBACK;
COMMIT;

-- 20180222
-- question.xml ���������� INSERT�ÿ� ����ߵ�
SELECT Q_NUM
    FROM (SELECT ROWNUM R, Q_NUM     
            FROM(SELECT Q_NUM FROM QUESTION ORDER BY Q_DATE DESC)A)
    WHERE R=1;

-- ppage.xml ���������� INSERT�ÿ� ����ߵ�(PPAGE���� ����ϱ� ����)
INSERT INTO PPAGE (P_EMAIL, Q_NUM) VALUES ('pro@naver.com', 'QUESTION1');
SELECT * FROM FINDERMEMBERS;
UPDATE FINDERMEMBERS SET F_PHOTO1='NOIMG.PNG' WHERE F_EMAIL='hyun1330@naver.com';
COMMIT;


-- ppage.xml ppageQuestionList
SELECT * 
    FROM(SELECT ROWNUM R, A.* FROM (SELECT Q.*, F_NICKNAME, F_PHOTO1, CATE_NAME 
            FROM QUESTION Q, PPAGE PP, PROMEMBERS P, FINDERMEMBERS F, CATEGORY CA
            WHERE Q.Q_NUM = PP.Q_NUM 
                AND Q.P_EMAIL = PP.P_EMAIL AND PP.P_EMAIL=P.P_EMAIL AND PP.P_EMAIL = 'pro@naver.com'
                AND Q.F_EMAIL = F.F_EMAIL
                AND Q.CATE_NUM = CA.CATE_NUM
                AND Q.Q_SHOW=0
            ORDER BY Q_DATE DESC)A)
    WHERE R BETWEEN 1 AND 5;

-- ppage.xml ppageQuestionListCount
SELECT COUNT(*) 
    FROM(SELECT ROWNUM R, A.* FROM (SELECT Q.*, F_NICKNAME, F_PHOTO1, CATE_NAME 
            FROM QUESTION Q, PPAGE PP, PROMEMBERS P, FINDERMEMBERS F, CATEGORY CA
            WHERE Q.Q_NUM = PP.Q_NUM 
                AND Q.P_EMAIL = PP.P_EMAIL AND PP.P_EMAIL=P.P_EMAIL AND PP.P_EMAIL = 'pro@naver.com'
                AND Q.F_EMAIL = F.F_EMAIL
                AND Q.CATE_NUM = CA.CATE_NUM
                AND Q.Q_SHOW=0
            ORDER BY Q_DATE DESC)A);

-- Question questionAccept
UPDATE QUESTION SET Q_ACCEPT=1 WHERE Q_NUM='QUESTION83';
SELECT * FROM QUESTION;           
COMMIT;

-- Question questionReject
UPDATE QUESTION SET Q_ACCEPT=2 WHERE Q_NUM='QUESTION82';
SELECT * FROM QUESTION ORDER BY Q_DATE DESC;

COMMIT;

-- 2018/02/27
-- Fpage.xml fpageQuestionList
SELECT * 
    FROM(SELECT ROWNUM R, A.* 
            FROM (SELECT Q.*, P_NICKNAME, F_NICKNAME, F_PHOTO1, CATE_NAME
                    FROM QUESTION Q, PROMEMBERS P, FINDERMEMBERS F, CATEGORY C
                    WHERE Q.P_EMAIL = P.P_EMAIL 
                        AND Q.F_EMAIL = F.F_EMAIL 
                        AND Q.CATE_NUM = C.CATE_NUM
                        AND Q.F_EMAIL = 'finder@naver.com'
                        AND Q.Q_SHOW = 0
                    ORDER BY Q_DATE DESC)A)
    WHERE R BETWEEN 1 AND 5;

-- Fpgae.xml fpageQuestionListCount    
SELECT COUNT(*)
    FROM QUESTION Q, PROMEMBERS P, FINDERMEMBERS F, CATEGORY C
    WHERE Q.P_EMAIL = P.P_EMAIL 
        AND Q.F_EMAIL = F.F_EMAIL 
        AND Q.CATE_NUM = C.CATE_NUM
        AND Q.F_EMAIL = 'finder@naver.com'
        AND Q.Q_SHOW = 0;
        
    

    

	
    
