-- 2022.08.01 15:53 =====================
-- https://www.erdcloud.com/d/SyfLTdxARyRtFTffQ 참고하여 테이블 최초작성
-- 테이블, pk, fk 그리고 시퀀스 생성문 및 삭제문 추가

--===== 순서 =====
-- 시퀀스 삭제 
-- fk제약조건 삭제 
-- 테이블 삭제 

-- 테이블 생성 
-- pk제약조건 부여 
-- fk 제약조건 부여
-- 시퀀스 생성

-- 2022.08.01 17:19 =====================
--seq_users_no 를 seq_user_no로 수정

-- 2022.08.01 22:27 =====================
--food_2nd_category_menu_1st_cate_no 를 food_2nd_category_1st_cate_no로 수정

-- 2022.08.03 14:20 =====================
--groups 테이블에 user_group_order number(20) not null 칼럼생성

-- 2022.08.04 13:36 =====================
--  1. admin 테이블 삭제

--  2. users 테이블 변경사항
-- 		2-1. user_birth 연도만 받아서 값 저장으로 변경  
-- 		2-2. user_grade 문자형으로 값 저장 분류 시 '0'일시 비회원, '1'일시 회원, '2'일시 관리자로 구분한다.

--  3. reply_inquiry 테이블 변경사항
-- 		3-1. admin테이블 삭제로 admin_no 칼럼삭제
  
--  4. faq 테이블 변경사항
-- 		4-1. admin테이블 삭제로 admin_no를 users테이블의 user_no 를 부모로 하여 fk를 사용한다.
  
--  5. group_member 테이블 변경사항
-- 		5-1. member_name, member_sex, member_age 칼럼 삭제 (users 테이블에서 끌어옴)
  
--  6. blacklist 테이블 변경사항
-- 		6-1. reg_date 칼럼 추가
  
--  7. store 테이블 변경사항
-- 		7-1. store_visit_count 칼럼삭제
  
--  8. rating_bujang 테이블 삭제 (자사별점은 review테이블의 user_score칼럼으로 관리)

--  9. visited 테이블 변경사항
-- 		9-1. menu_no, visited_store_name, visited_ate_menu 칼럼삭제
-- 		9-2. sql문에서 visted 테이블 생성문 리뷰테이블아래로 위치 이동

--  10. menu 테이블 변경사항
-- 		10-1. menu_etc 칼럼추가

--  11. vote 테이블 변경사항 
-- 		11-1. group_no 칼럼추가 (groups 테이블에서 fk 가져옴)
-- 		11-2. vote_results 칼럼추가
 
--  12. vote_members 테이블 변경사항
-- 		12-1. vote_group 에서 vote_members 로 테이블 명 변경
-- 		12-2. vote_group_no 칼럼 vote_member_no 로 칼럼명 변경
-- 		12-3. group_member_no 칼럼 추가
-- 		12-4. user_no, boss_check, member_name, voted_check 칼럼 삭제

--  13. vote_members 테이블 변경사항
-- 		13-1. vote_group 에서 vote_members 로 테이블 명 변경
-- 		13-2. vote_group_no 칼럼 vote_member_no 로 칼럼명 변경
-- 		13-3. group_member_no 칼럼 추가
-- 		13-4. user_no, boss_check, member_name, voted_check 칼럼 삭제

--  14. noti_group, noti_cs 테이블 삭제 

--  15. notification 테이블 변경사항
-- 		15-1. group_no, reply_no, alert_comment 칼럼 추가

--  16. review 테이블 변경사항
-- 		16-1. menu_no 칼럼 삭제


-- 2022.08.04 13:57 =====================
-- seq_store_no, seq_menu_2nd_cate_no, seq_menu_1st_cate_no
-- 각각 46, 11, 4023 에서 시작으로 변경

-- 2022.08.04 18:07 =====================
-- group_member 테이블에 group_order 칼럼 추가

-- 2022.08.05 11:01 =====================
-- faq_status는 'quest' 면 자주 묻는 질문, 
-- 'help'이면 문의 유형별 도움말에 표시될 것이다.

-- 2022.08.05 12:19 =====================
-- faq 테이블의 reply_no 칼럼 삭제로 인한 관련 fk삭제
