-- �о� INSERT��(�ּ�ó���Ѻκ� profinder.sql���� �̹� ������)
SELECT * FROM CATEGORY;
--INSERT INTO CATEGORY VALUES(1,'����');
--INSERT INTO CATEGORY VALUES(2,'����');
--INSERT INTO CATEGORY VALUES(3,'����');
--INSERT INTO CATEGORY VALUES(4,'����');
--INSERT INTO CATEGORY VALUES(5,'��ȸ');

/* FINDERMEMBERS */
-- FINDERMEMBERS INSERT��(�ּ�ó���Ѻκ� PROFINDER.SQL���� �̹� ������)
--INSERT INTO FINDERMEMBERS (F_EMAIL, F_PW, F_NAME, F_NICKNAME, F_TEL1, F_TEL2, F_TEL3, F_ACCOUNTNUM, F_BANK, F_AREA, F_PHOTO1,F_MESSAGE, F_PHOTO2)
--    VALUES('hyun1330@naver.com', '11', '������', '������', '010', '3976', '2237', '302-0778-5449-11', '����', '����', '����1', '�޼���', '����2');

-- FINDERMEMBERS �̸��� �ߺ� Ȯ��  / ȸ������ MODEL�� ���� /  SELECT��
SELECT COUNT(*) FROM FINDERMEMBERS WHERE F_EMAIL='hyun1330@naver.com';
SELECT * FROM FINDERMEMBERS WHERE f_email='hyun1330@naver.com' ;

/* PROMEMBERS */
-- PROMEMBERS INSERT��(�ּ�ó���Ѻκ� PROFINDER.SQL���� �̹� ������)
--INSERT INTO PROMEMBERS(P_EMAIL, P_PW, P_NAME,P_NICKNAME, P_TEL1, P_TEL2, P_TEL3, P_ACCOUNTNUM, P_BANK, P_AREA,P_PHOTO1, P_MESSAGE, P_PHOTO2, CATE_NUM)
--    VALUES('hyun1330@naver.com', '22', '������', '������', '010', '3976', '2237', '302-0778-5449-11', '����', '����', '����1','�޼���','����2', 1);

-- PROMEMBERS �̸��� �ߺ� Ȯ��  / ȸ������ MODEL�� ���� /  SELECT��
SELECT * FROM PROMEMBERS WHERE P_EMAIL='hyun1330@naver.com';
COMMIT;


/* FAQ */
-- FAQ ������
DROP SEQUENCE FAQ_SEQ;
CREATE SEQUENCE FAQ_SEQ;

-- FAQ INSERT��(�ּ�ó���Ѻκ� PROFINDER.SQL���� �̹� ������)
--INSERT INTO FAQ VALUES('FAQ'||FAQ_SEQ.NEXTVAL,1,'ȸ������','ȸ������ ��ư�� ã�� ���ҽ� Login��ư�� ����������');
--INSERT INTO FAQ VALUES('FAQ'||FAQ_SEQ.NEXTVAL,1,' ��й�ȣ ã��',' ��й�ȣ(Forgot Password?) ã�� ��ư�� �����ּ���');
--INSERT INTO FAQ VALUES('FAQ'||FAQ_SEQ.NEXTVAL,1,' ȸ������ ����','ȸ������ ���� ��ư�� ������ ���� �ϼ��� ');
--INSERT INTO FAQ VALUES('FAQ'||FAQ_SEQ.NEXTVAL,1,' profinder�� ���� ����','���� ����Ʈ�� pro ����� finder ������� ���� �ǻ�����ϴ� �κ����� Ŀ�´����̼� �Դϴ�. ������ ����� ���� �ϸ� 
--Pro Member�� �ڽ��� �ɷ��� ���ϴ� �������� �ŷ� �ϸ鼭 �ڽ��� �̸��� �˸����ִ�ϴ�.
--Finder Member�� �ڽ��� ���ϴ� �о��� �������� �Ҿװ����� ���ؼ� ������ �����ϸ� �ʿ��� �κи� ���� �������� ������ �����մϴ�.
--');
--INSERT INTO FAQ VALUES('FAQ'||FAQ_SEQ.NEXTVAL,1,'�Ű� �ȳ�','�� ����Ʈ���� �������� �������� �߽߰� �Ű� ��ư�� ���� �Ű� ��Ź�帳�ϴ�. �̿��ڵ��� ������ �̿��� ���� ������ ��Ź�帳�ϴ�.');
--
--INSERT INTO FAQ VALUES('FAQ'||FAQ_SEQ.NEXTVAL,2,'���¹�ȣ ����','���¹�ȣ�� ������ ���������� ��� ���ż� ���¹�ȣ ������ �Ͻø�˴ϴ�. ');
--INSERT INTO FAQ VALUES('FAQ'||FAQ_SEQ.NEXTVAL,2,'������ �ȳ� ',' PROFINDER�� �Ǹ� �����Ḧ 10%�Դϴ�. 10%�� ����� ���� ���� �� ���ڹ߼� ���� ����������� ��� �˴ϴ�. ');
--INSERT INTO FAQ VALUES('FAQ'||FAQ_SEQ.NEXTVAL,2,'�Ǹ� �ȳ�',' �������� �ǸŴ� ProMember�� �����ϼž� �̿��� �����ϸ� �ʼ����� ������ �ƴմϴ�.
--');
--INSERT INTO FAQ VALUES('FAQ'||FAQ_SEQ.NEXTVAL,2,'�۱ݾȳ�','�ſ� 1�� ���� �� ���� ����� ����˴ϴ�. ������ �Ϸ� . ���� ���� �ݾ��� ���� �� ���ϱ��� ������� ���� �Ǹűݾ��� "�� ���� �ݾ�"�� �հ谡 �˴ϴ�.
--���� ������ �ݾ��� �� �հ� 5������ ���� ���� ��쿡�� �����޷� ����˴ϴ�. ���� �޷� �̿��Ǵ��� ������ �޾Ҵ� �ݾ��� ������� ������, �ش� �ݾ��� �����Ͽ� ������ �̷�����ϴ�.
--');
--INSERT INTO FAQ VALUES('FAQ'||FAQ_SEQ.NEXTVAL,3,'���� �ȳ�','�������� ���� ������ �Ϻο� ���� �������� �̷���� ������ ���� �������� ����Ʈ �������Ŀ� �̿��� �����մϴ�.');
--INSERT INTO FAQ VALUES('FAQ'||FAQ_SEQ.NEXTVAL,3,'���ŷ� �ȳ�',' PROFINDER ����Ʈ������ ���ΰ��� ���ŷ��� ������ �߻��ÿ��� �ƹ��� ������ �帱 �� �����ϴ�.');
--INSERT INTO FAQ VALUES('FAQ'||FAQ_SEQ.NEXTVAL,3,'������ ȯ��','�� �������� ������ ��ǰ���� ȯ���� ������� ���� ��Ź�帳�ϴ�.');