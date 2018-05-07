-- 분야 INSERT문(주석처리한부분 profinder.sql에서 이미 생성함)
SELECT * FROM CATEGORY;
--INSERT INTO CATEGORY VALUES(1,'국어');
--INSERT INTO CATEGORY VALUES(2,'영어');
--INSERT INTO CATEGORY VALUES(3,'수학');
--INSERT INTO CATEGORY VALUES(4,'과학');
--INSERT INTO CATEGORY VALUES(5,'사회');

/* FINDERMEMBERS */
-- FINDERMEMBERS INSERT문(주석처리한부분 PROFINDER.SQL에서 이미 생성됨)
--INSERT INTO FINDERMEMBERS (F_EMAIL, F_PW, F_NAME, F_NICKNAME, F_TEL1, F_TEL2, F_TEL3, F_ACCOUNTNUM, F_BANK, F_AREA, F_PHOTO1,F_MESSAGE, F_PHOTO2)
--    VALUES('hyun1330@naver.com', '11', '정성훈', '정성훈', '010', '3976', '2237', '302-0778-5449-11', '농협', '서울', '사진1', '메세지', '사진2');

-- FINDERMEMBERS 이메일 중복 확인  / 회원정보 MODEL에 저장 /  SELECT문
SELECT COUNT(*) FROM FINDERMEMBERS WHERE F_EMAIL='hyun1330@naver.com';
SELECT * FROM FINDERMEMBERS WHERE f_email='hyun1330@naver.com' ;

/* PROMEMBERS */
-- PROMEMBERS INSERT문(주석처리한부분 PROFINDER.SQL에서 이미 생성됨)
--INSERT INTO PROMEMBERS(P_EMAIL, P_PW, P_NAME,P_NICKNAME, P_TEL1, P_TEL2, P_TEL3, P_ACCOUNTNUM, P_BANK, P_AREA,P_PHOTO1, P_MESSAGE, P_PHOTO2, CATE_NUM)
--    VALUES('hyun1330@naver.com', '22', '정성훈', '정성훈', '010', '3976', '2237', '302-0778-5449-11', '농협', '서울', '사진1','메세지','사진2', 1);

-- PROMEMBERS 이메일 중복 확인  / 회원정보 MODEL에 저장 /  SELECT문
SELECT * FROM PROMEMBERS WHERE P_EMAIL='hyun1330@naver.com';
COMMIT;


/* FAQ */
-- FAQ 시퀀스
DROP SEQUENCE FAQ_SEQ;
CREATE SEQUENCE FAQ_SEQ;

-- FAQ INSERT문(주석처리한부분 PROFINDER.SQL에서 이미 생성됨)
--INSERT INTO FAQ VALUES('FAQ'||FAQ_SEQ.NEXTVAL,1,'회원가입','회원가입 버튼을 찾지 못할시 Login버튼을 눌러보세요');
--INSERT INTO FAQ VALUES('FAQ'||FAQ_SEQ.NEXTVAL,1,' 비밀번호 찾기',' 비밀번호(Forgot Password?) 찾기 버튼을 눌러주세요');
--INSERT INTO FAQ VALUES('FAQ'||FAQ_SEQ.NEXTVAL,1,' 회원정보 수정','회원정보 수정 버튼을 눌러서 수정 하세요 ');
--INSERT INTO FAQ VALUES('FAQ'||FAQ_SEQ.NEXTVAL,1,' profinder에 대한 설명','저희 사이트는 pro 멤버와 finder 멤버들이 서로 의사소통하는 부분유료 커뮤니케이션 입니다. 누구나 등록이 가능 하며 
--Pro Member는 자신의 능력을 원하는 가격으로 거래 하면서 자신의 이름을 알릴수있답니다.
--Finder Member는 자신의 원하는 분야의 컨텐츠를 소액결제를 통해서 구입이 가능하며 필요한 부분만 적은 가격으로 구입이 가능합니다.
--');
--INSERT INTO FAQ VALUES('FAQ'||FAQ_SEQ.NEXTVAL,1,'신고 안내','본 사이트에서 부적절한 컨텐츠를 발견시 신고 버튼을 통한 신고를 부탁드립니다. 이용자들의 쾌적한 이용을 위한 협조를 부탁드립니다.');
--
--INSERT INTO FAQ VALUES('FAQ'||FAQ_SEQ.NEXTVAL,2,'계좌번호 변경','계좌번호는 변경은 정보수정에 들어 가셔서 계좌번호 변경을 하시면됩니다. ');
--INSERT INTO FAQ VALUES('FAQ'||FAQ_SEQ.NEXTVAL,2,'수수료 안내 ',' PROFINDER는 판매 수수료를 10%입니다. 10%의 비용은 결제 대행 및 문자발송 서버 유지비용으로 사용 됩니다. ');
--INSERT INTO FAQ VALUES('FAQ'||FAQ_SEQ.NEXTVAL,2,'판매 안내',' 컨텐츠의 판매는 ProMember로 가입하셔야 이용이 가능하며 필수적인 조건은 아닙니다.
--');
--INSERT INTO FAQ VALUES('FAQ'||FAQ_SEQ.NEXTVAL,2,'송금안내','매월 1일 오전 중 정산 등록이 진행됩니다. 정산이 완료 . 정산 받을 금액은 이전 달 말일까지 정산되지 않은 판매금액의 "실 지급 금액"의 합계가 됩니다.
--정산 받으실 금액의 총 합계 5만원을 넘지 않을 경우에는 다음달로 정산됩니다. 다음 달로 이월되더라도 기존에 받았던 금액은 사라지지 않으며, 해당 금액을 포함하여 정산이 이루어집니다.
--');
--INSERT INTO FAQ VALUES('FAQ'||FAQ_SEQ.NEXTVAL,3,'구매 안내','컨텐츠는 무료 컨텐츠 일부와 유료 컨텐츠로 이루어져 있으며 유료 컨텐츠는 포인트 충전이후에 이용이 가능합니다.');
--INSERT INTO FAQ VALUES('FAQ'||FAQ_SEQ.NEXTVAL,3,'직거래 안내',' PROFINDER 사이트에서는 개인간의 직거래로 문제가 발생시에는 아무런 도움을 드릴 수 없습니다.');
--INSERT INTO FAQ VALUES('FAQ'||FAQ_SEQ.NEXTVAL,3,'컨텐츠 환불','본 컨텐츠는 디지털 제품으로 환불이 어려운점 양해 부탁드립니다.');