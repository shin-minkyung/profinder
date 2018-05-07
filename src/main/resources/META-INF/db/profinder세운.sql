-- �����ǵ� ������ (profinder.sql���� �̹� ������)
DROP SEQUENCE NEWSFEED_SEQ;
CREATE SEQUENCE NEWSFEED_SEQ;

-- �����ǵ��� ������ (profinder.sql���� �̹� ������)
DROP SEQUENCE NEWS_COMMENT_SEQ;
CREATE SEQUENCE NEWS_COMMENT_SEQ;

-- 1:1���� ������ (profinder.sql���� �̹� ������)
DROP SEQUENCE CLAIM_SEQ;
CREATE SEQUENCE CLAIM_SEQ;

-- ��,���� ������ ������ (profinder.sql���� �̹� ������)
DROP SEQUENCE CONTENTS_SEQ;
CREATE SEQUENCE CONTENTS_SEQ;

-- �о� INSERT (�ּ�ó���Ѻκ� profinder.sql���� �̹� ������)
SELECT * FROM CATEGORY;
--INSERT INTO CATEGORY VALUES(1,'����');
--INSERT INTO CATEGORY VALUES(2,'����');
--INSERT INTO CATEGORY VALUES(3,'����');
--INSERT INTO CATEGORY VALUES(4,'����');
--INSERT INTO CATEGORY VALUES(5,'��ȸ');

--���θ�� �ӽõ�� (�ּ�ó���Ѻκ� PROFINDER.SQL���� �̹� ������)
-- INSERT INTO PROMEMBERS(P_EMAIL, P_PW, P_NAME,P_NICKNAME, P_TEL1, P_TEL2, P_TEL3, P_AREA, CATE_NUM) VALUES('hope1821@naver.com', '1234', '������', '�Ź�', '010', '9505', '2118','����', 2);
SELECT * FROM PROMEMBERS;
COMMIT;

-- �����ǵ� ��� ID=newsfeedInsert (�ּ�ó���Ѻκ� PROFINDER.SQL���� �̹� ������)
--INSERT INTO NEWSFEED 
--    VALUES('NEWSFEED'||NEWSFEED_SEQ.NEXTVAL,'aa@aa','����','����',SYSDATE,0,0,'127.0.0.1',2);
--INSERT INTO NEWSFEED 
--    VALUES('NEWSFEED'||NEWSFEED_SEQ.NEXTVAL,'aa@aa','����2','����2',SYSDATE,0,0,'127.0.0.1',2);
SELECT * FROM NEWSFEED;

-- �����ǵ� ���� ID=newsfeedMain
SELECT * FROM (SELECT ROWNUM R,A.* FROM
    (SELECT N.*,P_NICKNAME FROM NEWSFEED N,PROMEMBERS P
        WHERE N.P_EMAIL=P.P_EMAIL AND N_DEL = 0 ORDER BY N_DATE DESC)A)
            WHERE R BETWEEN 1 AND 5;

-- �����ǵ� ajax ID=newsfeedAjax
SELECT * FROM (SELECT ROWNUM R,A.* FROM
    (SELECT N.*,P_NICKNAME FROM NEWSFEED N,PROMEMBERS P
        WHERE N.P_EMAIL=P.P_EMAIL AND N_DEL = 0 ORDER BY N_DATE DESC)A)
            WHERE R=2;

-- �з� ����Ʈ ID=categorySelect
SELECT * FROM CATEGORY ORDER BY CATE_NUM;

-- �����ǵ��� �ҷ����� ID=newsCommentSelect
SELECT * FROM NEWS_COMMENT 
    WHERE NC_DEL=0 AND N_NUM = 'NEWSFEED2' ORDER BY NC_DATE;

-- �����ǵ��� ��� ID=newsCommentInsert(�ּ�ó���Ѻκ� PROFINDER.SQL���� �̹� ������)
--INSERT INTO NEWS_COMMENT 
--    VALUES('NEWS_COMMENT'||NEWS_COMMENT_SEQ.NEXTVAL,'NEWSFEED2','����','ù���',SYSDATE,0,'127.0.0.1');
COMMIT;
SELECT * FROM NEWS_COMMENT;

-- 1:1���ǵ�� ID=claimInsert(�ּ�ó���Ѻκ� PROFINDER.SQL���� �̹� ������)
--INSERT INTO CLAIM 
--    VALUES('CLAIM'||CLAIM_SEQ.NEXTVAL,'hope1821@naver.com','�����϶�¹���3',SYSDATE,'��Ÿ',0);
--INSERT INTO CLAIM 
--    VALUES('CLAIM'||CLAIM_SEQ.NEXTVAL,'aa@aa','�����϶�¹���4',SYSDATE,'��Ÿ',0);
SELECT * FROM CLAIM;
COMMIT;

-- 1:1���� ���� ID=claimList
SELECT * FROM CLAIM WHERE CL_EMAIL='aa@aa' ORDER BY CL_DATE DESC;

-- 1:1���� �����ڰ� ���� ID=claimAdminList
SELECT * FROM CLAIM WHERE CL_STATUS=0 ORDER BY CL_DATE;

-- 1:1���� �亯�ϰ� ó���Ϸ�� �ٲٱ� ID=claimAnswerComplete
UPDATE CLAIM SET CL_STATUS = 1 WHERE CL_NUM = 'CLAIM1';

-- ��,���� ������ ��� ID=contentInsert (�ּ�ó���Ѻκ� PROFINDER.SQL���� �̹� ������)
--INSERT INTO CONTENTS 
--    VALUES('CONTENTS'||CONTENTS_SEQ.NEXTVAL,'hope1821@naver.com','����','����',null,null,null,0,SYSDATE,2,0,0);
SELECT * FROM CONTENTS;
COMMIT;

-- ��,���� ������ ��� ID=contentsList
SELECT * FROM CONTENTS ORDER BY CON_DATE;