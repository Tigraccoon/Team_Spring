drop table team_board; 

create table team_board (
b_num number not null primary key, --�Խù���ȣ 
b_writer varchar2(100) not null references team_user(userid), --�ۼ���
b_subject varchar2(150) not null, --����
b_point number not null,    --����
b_content clob not null, --����
b_readcount number default 0,	--��ȸ��
b_date date default sysdate, --�ۼ����� 
b_ip varchar2(30) not null,	--�ۼ��� ip 
b_show char(1) default 'Y',    --�Խ��� ��� ����
b_secret char(1) default 'N'  --��б� ����
);

drop sequence seq_board;
create sequence seq_board
start with 1
increment by 1;

INSERT INTO  team_board(b_num, b_writer, b_subject, b_point, b_content, b_ip) VALUES (seq_board.nextval, 'kim', '�׽�Ʈ��', 5, '�׽�Ʈ�ۺ����̴�!', '1.1.1.1');
INSERT INTO  team_board(b_num, b_writer, b_subject, b_point, b_content, b_ip) VALUES (seq_board.nextval, 'kim', 'a', 5, 'a!', '1.1.1.1');

select * from team_board;

create table team_comment (
c_num number not null primary key, --��� �Ϸù�ȣ 
b_num number not null references team_board(b_num),
c_writer varchar2(50) not null references team_user(userid),
c_content clob not null, 
c_date date default sysdate,
c_ip varchar2(30) not null,	--�ۼ��� ip
c_show char(1) default '0',    --��� ��� ����
c_secret char(1) default '0'
);

drop sequence seq_comment;
create sequence seq_comment
start with 1
increment by 1;

delete from team_comment;

INSERT INTO team_comment(c_num, b_num, c_writer, c_content, c_ip) VALUES(seq_comment.nextval, 1, 'kim',  '�׽�Ʈ����̴�', '1.1.1.1'); 

select * from team_comment;

commit;

