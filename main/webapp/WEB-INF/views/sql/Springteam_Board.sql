drop table team_board; 

create table team_board (
b_num number not null primary key, --�Խù���ȣ 
b_writer varchar2(100) not null references team_user(userid), --�ۼ���
b_subject varchar2(150) not null, --����
b_content clob not null, --����
b_readcount number default 0,	--��ȸ��
b_date date default sysdate, --�ۼ����� 
b_ip varchar2(30) not null,	--�ۼ��� ip 
b_show char(1) default '0',    --�Խ��� ��� ����
b_secret char(1) default '0'  --��б� ����
);

create sequence seq_board
start with 1
increment by 1;


create table team_comment (
c_num number not null primary key, --��� �Ϸù�ȣ 
b_num number not null references team_board(num),
c_writer varchar2(50) not null references team_user(userid),
c_content clob not null, 
c_date date default sysdate,
c_ip varchar2(30) not null,	--�ۼ��� ip
c_show char(1) default '0',    --��� ��� ����
c_secret char(1) default '0'
);

create sequence seq_comment
start with 1
increment by 1;