/*유료질문방답변*/

-- 유료질문방답변 INSERT문
SELECT * FROM QANSWER;
SELECT * FROM QUESTION;
--INSERT INTO QANSWER(Q_NUM, QA_CONTENT) VALUES('QUESTION1', '질문1_답변1');
--INSERT INTO QANSWER(Q_NUM, QA_CONTENT) VALUES('QUESTION2', '질문2_답변1');
INSERT INTO QANSWER(Q_NUM, QA_CONTENT) VALUES('QUESTION4', '질문2_답변2');
INSERT INTO QUESTION VALUES('QUESTION'||QUESTION_SEQ.NEXTVAL, 'aa@aa','hyun1330@naver.com',5,'질문제목3', '질문내용3', SYSDATE, 300, 0, 0, null);

-- 유료질문방답변 SELECT문
SELECT * FROM QANSWER WHERE Q_NUM='QUESTION1';

-- 유료질문방답변 UPDATE문
UPDATE QANSWER SET QA_CONTENT='질문222답변' WHERE Q_NUM='QUESTION2';

-- 유료질문방답변 DELETE문
DELETE FROM QANSWER WHERE Q_NUM='QUESTION1';

ROLLBACK;
COMMIT;
