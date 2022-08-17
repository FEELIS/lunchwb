--음식별 조회
select f1.menu_1st_cate_name,
        count(v.visited_no) counts
from food_1st_category f1,visited v, menu m, food_2nd_category f2
where f1.menu_1st_cate_no = f2.menu_1st_cate_no
and f2.menu_2nd_cate_no = m.menu_2nd_cate_no
and v.menu_no = m.menu_no 
and to_char(v.visited_date,'YYMM')=to_char(to_date(2208,'YYMM'),'YYMM') 
group by f1.menu_1st_cate_name;


-- 월별 조회
select f1.menu_1st_cate_name,
        to_char(v.visited_date,'mm')월,
        count(v.visited_no) counts
from food_1st_category f1,visited v, menu m, food_2nd_category f2
where f1.menu_1st_cate_no = f2.menu_1st_cate_no
and f2.menu_2nd_cate_no = m.menu_2nd_cate_no
and v.menu_no = m.menu_no 
and to_char(v.visited_date,'YYMM')<to_char(to_date(2208,'YYMM'),'YYMM') 
and to_char(v.visited_date,'YYMM')>=to_char(to_date(2202,'YYMM'),'YYMM') 
and f1.menu_1st_cate_name like '%한식%'
group by (f1.menu_1st_cate_name,to_char(v.visited_date,'mm'));

--연령대별 미완성
select count(*) count
from users
where to_char(sysdate,'YYYY')-to_char(to_date(user_birth_year,'YYYY'),'YYYY')>10;

select f1.menu_1st_cate_name,
        count(v.visited_no)
from users u, visited v, menu m, food_2nd_category f2, food_1st_category f1
where u.user_no=v.user_no
and v.menu_no=m.menu_no
and m.menu_2nd_cate_no=f2.menu_2nd_cate_no
and f2.menu_1st_cate_no=f1.menu_1st_cate_no
and to_char(sysdate,'YYYY')-to_char(to_date(user_birth_year,'YYYY'),'YYYY')>10
and f1.menu_1st_cate_name like '%한식%'
group by f1.menu_1st_cate_name;







