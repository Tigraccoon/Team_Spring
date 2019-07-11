drop table team_board; 

create table team_board (
b_num number not null primary key, --게시물번호 
b_writer varchar2(100) not null references team_user(userid), --작성자
b_subject varchar2(150) not null, --제목
b_content clob not null, --본문
b_readcount number default 0,	--조회수
b_date date default sysdate, --작성일자 
b_ip varchar2(30) not null,	--작성자 ip 
b_show char(1) default '0',    --게시판 출력 여부
b_secret char(1) default '0'  --비밀글 여부
);

create sequence seq_board
start with 1
increment by 1;


create table team_comment (
c_num number not null primary key, --댓글 일련번호 
b_num number not null references team_board(num),
c_writer varchar2(50) not null references team_user(userid),
c_content clob not null, 
c_date date default sysdate,
c_ip varchar2(30) not null,	--작성자 ip
c_show char(1) default '0',    --댓글 출력 여부
c_secret char(1) default '0'
);

create sequence seq_comment
start with 1
increment by 1;