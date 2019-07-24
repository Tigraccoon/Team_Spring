drop table team_board; 

create table team_board (
b_num number not null primary key, --게시물번호 
b_writer varchar2(100) not null references team_user(userid), --작성자
b_category varchar2(50) not null, --카테고리, references 강좌명 넣을 예정
b_subject varchar2(150) not null, --제목
b_point number not null,    --별점
b_content clob not null, --본문
b_readcount number default 0,	--조회수
b_date date default sysdate, --작성일자 
b_ip varchar2(30) not null,	--작성자 ip 
b_show char(1) default 'Y',    --게시판 출력 여부
b_secret char(1) default 'N'  --비밀글 여부
);

drop sequence seq_board;
create sequence seq_board
start with 817
increment by 1;

select * from team_board;

delete from team_board;

INSERT INTO  team_board(b_num, b_category, b_writer, b_subject, b_point, b_content, b_ip)
    VALUES (seq_board.nextval, '정보처리기사실기', 'kim001', '테스트글', 5, '테스트글본문이다!', '1.1.1.1');
    
INSERT INTO  team_board(b_num, b_category, b_writer, b_subject, b_point, b_content, b_ip) 
    VALUES (seq_board.nextval, '정보처리기사필기', 'kim003', '강의 후기 테스트글', 5, '강의 후기 테스트글 내용 내용 내용', '1.1.1.1');
    
INSERT INTO  team_board(b_num, b_category, b_writer, b_subject, b_point, b_content, b_ip) 
    VALUES (seq_board.nextval, '웹프로그래밍초급', 'lee003', '게시글 테스트~', 5, '게시글 내용~ 내용~', '1.1.1.1');
    
INSERT INTO  team_board(b_num, b_category, b_writer, b_subject, b_point, b_content, b_ip) 
    VALUES (seq_board.nextval, '웹프로그래밍고급', 'park001', '웹프로그래밍 후기', 5, '웹개발 후기 후기 후기', '1.1.1.1');

INSERT INTO  team_board(b_num, b_category, b_writer, b_subject, b_point, b_content, b_ip)
    VALUES (seq_board.nextval, '정보처리기사실기', 'kim011', '테스트글', 5, '테스트글본문이다!', '1.1.1.1');
    
INSERT INTO  team_board(b_num, b_category, b_writer, b_subject, b_point, b_content, b_ip) 
    VALUES (seq_board.nextval, '정보처리기사필기', 'kim005', '강의 후기 테스트글', 5, '강의 후기 테스트글 내용 내용 내용', '1.1.1.1');
    
INSERT INTO  team_board(b_num, b_category, b_writer, b_subject, b_point, b_content, b_ip) 
    VALUES (seq_board.nextval, '웹프로그래밍초급', 'yoo003', '게시글 테스트~', 5, '게시글 내용~ 내용~', '1.1.1.1');
    
INSERT INTO  team_board(b_num, b_category, b_writer, b_subject, b_point, b_content, b_ip) 
    VALUES (seq_board.nextval, '웹프로그래밍고급', 'park001', '웹프로그래밍 후기', 5, '웹개발 후기 후기 후기', '1.1.1.1');

select * from team_board where b_category like '%';

select * from team_board order by b_num desc;

select count(*) from team_comment where b_num=1;

SELECT seq_board.currval FROM dual;

drop table team_comment;

create table team_comment (
c_num number not null primary key, --댓글 일련번호 
b_num number not null references team_board(b_num),
c_writer varchar2(50) not null references team_user(userid),
c_content clob not null, 
c_date date default sysdate,
c_ip varchar2(30) not null,	--작성자 ip
c_show char(1) default 'Y',    --댓글 출력 여부
c_secret char(1) default 'N'
);

drop sequence seq_comment;
create sequence seq_comment
start with 1
increment by 1;

select seq_comment.nextval from dual;

delete from team_comment;

INSERT INTO team_comment(c_num, b_num, c_writer, c_content, c_ip) VALUES(seq_comment.nextval, 36, 'kim',  '테스트댓글이닷', '1.1.1.1'); 

select * from team_comment;

SELECT * FROM team_comment 
			WHERE b_num=121
            ORDER BY c_num ASC;

UPDATE team_comment 
			SET c_writer='kim', c_content='수정된댓글', c_ip='1/1/1/1', c_secret='N' 
			WHERE c_num=53;

SELECT count(*) FROM team_comment 
			WHERE b_num=47 AND c_show='Y';
            
commit;


declare --선언부
    i number := 1;
begin --실행부
    while i<=200 loop
        insert into team_board (b_num,b_subject,b_content,b_writer, b_category, b_point, b_ip)
        values
        ( (select nvl(max(b_num)+1,1) from team_board)
        ,'제목'||i, '내용'||i, 'zoo', '웹프로그래밍고급', 3, '1.1.1.1');
        i := i+1; --조건 변경
    end loop;
end;
/

