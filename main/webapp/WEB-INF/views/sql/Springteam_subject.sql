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
('정보처리기사필기','<p>정보처리기사 족보로 한번에 합격해보세요.</p><p>
- 데이터베이스</p><p><span style="font-size: 1rem;">- 전자계산기구조</span><br></p><p>
- 시스템분석설계</p><p>- 운영체제</p><p>- 정보통신개론</p><p>수강생 합격률 90%이상!!</p>','이동휘',170000,22,'7월20일-9월15일','gisa1.jpg');

insert into subject values
('정보처리기사실기','<p>정보처리기사 합격생들이 극찬한 실기자료 독점기회!!</p><p>- 데이터베이스</p><p>- 알고리즘</p><p>- 업무프로세스</p><p>- IT 신기술</p><p>- 전산영어</p><p>수강생에게 확실히 알려드립니다!</p>','김연아',220000,20,'8월27일-10월05일','gisa2.jpg');

insert into subject values
('웹프로그래밍초급','<p>웹프로그래밍의 기본을 다져드립니다.</p><p>기본 프로그래밍 언어인 JAVA 를 시작으로</p><p>HTML, Oracle, SQL, HTML, SpringFramework 등 웹 개발에 필요한 내용을 기초부터 !</p>','서인국',150000,30,'6월29일-8월15일','class1.jpg');

insert into subject values
('웹프로그래밍고급','<p>웹프로그래밍 응용실습으로 고급기술을 배웁니다.</p><p>초급반에서 배운 기본적인 내용을 바탕으로 직접 웹 페이지를 만들어</p><p>실무에 빠르게 적응할수 있는 기본적인 실무 기술에 대해 알려드립니다!</p>','서인국',200000,15,'7월10일-9월15일','class1.jpg');

select * from subject;

delete from subject;

commit;

-- 수강신청 내역
delete from cart;

create table cart (
subject_name varchar2(50) not null, --강의이름
cart_id number not null primary key,
userid varchar2(50) not null
);

create sequence cart_seq
start with 1
increment by 1;

select * from cart;

select count(*) 
from cart
where subject_name='정보처리기사'
and userid='kim';

select c.subject_name , sum(s.price)
		from subject s , cart c
		where s.subject_name=c.subject_name 
        group by c.subject_name
		order by subject_name;
        
        commit;