-- 강의 목록

create table subject(
-- subject_id number, --강의 코드
subject_name varchar2(50) not null, --강의이름
description clob, -- 강의 설명
prof_name varchar2(50) not null, --교수이름
price number not null, --강의 금액
p_num number default 0, --(인원수)
subject_date varchar(200) not null, -- 강의 기간
img_url clob --이미지 (섬네일)
-- primary key(list_id)
);

--시퀀스 생성 (안함)
create sequence seq_subject
start with 1
increment by 1;

-- insert into class_list values
-- (seq_product.nextval,'정보처리기사 실기','설명','김철수',100000,10,'1월20일-3월15일','class1.jpg');

insert into subject values
('정보처리기사 실기','설명','김철수',100000,10,'1월20일-3월15일','class1.jpg');

select * from subject;

commit;

-- 수강신청 내역
drop table cart;

create table cart (
cart_id number not null primary key,
userid varchar2(50) not null,
subject_name varchar2(200)
);

create sequence cart_seq
start with 1
increment by 1;

select * from cart;

select cart_seq.nextval from dual;

select count(*) 
from cart
where subject_name='정보처리기사'
and userid='kim';
