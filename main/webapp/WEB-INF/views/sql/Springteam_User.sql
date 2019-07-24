CREATE OR REPLACE PACKAGE PACK_ENCRYPTION_DECRYPTION
IS
FUNCTION FUNC_ENCRYPT -- 암호화를 위한 함수
(V_INPUT_STRING IN VARCHAR2, KEY_DATA IN VARCHAR2:='java1234$!')
RETURN RAW;
FUNCTION FUNC_DECRYPT -- 복호화를 위한 함수
(V_INPUT_STRING IN VARCHAR2, KEY_DATA IN VARCHAR2:='java1234$!')
RETURN VARCHAR2;
END PACK_ENCRYPTION_DECRYPTION;
/

--3. 패키지 구현
CREATE OR REPLACE PACKAGE BODY PACK_ENCRYPTION_DECRYPTION
IS
FUNCTION FUNC_ENCRYPT
( V_INPUT_STRING IN VARCHAR2,
KEY_DATA IN VARCHAR2 := 'java1234$!'
) RETURN RAW
IS
V_ORIGINAL_RAW RAW(64);
V_KEY_DATA_RAW RAW(64);
ENCRYTED_RAW RAW(64);
BEGIN
-- INPUT값을 RAW 타입으로 변경
V_ORIGINAL_RAW := UTL_I18N.STRING_TO_RAW(V_INPUT_STRING,
'AL32UTF8');
--키 또한 RAW 타입으로 변경.
V_KEY_DATA_RAW := UTL_I18N.STRING_TO_RAW(KEY_DATA, 'AL32UTF8');
ENCRYTED_RAW := DBMS_CRYPTO.ENCRYPT(
SRC => V_ORIGINAL_RAW,
TYP => DBMS_CRYPTO.DES_CBC_PKCS5,
KEY => V_KEY_DATA_RAW,
IV => NULL);
RETURN ENCRYTED_RAW;
END FUNC_ENCRYPT;
FUNCTION FUNC_DECRYPT
( V_INPUT_STRING IN VARCHAR2,
KEY_DATA IN VARCHAR2 := 'java1234$!'
) RETURN VARCHAR2
IS
V_KEY_DATA_RAW RAW(64);
DECRYPTED_RAW RAW(64);
CONVERTED_STRING VARCHAR2(64);
BEGIN
V_KEY_DATA_RAW := UTL_I18N.STRING_TO_RAW(KEY_DATA, 'AL32UTF8');
DECRYPTED_RAW := DBMS_CRYPTO.DECRYPT(
SRC => V_INPUT_STRING,
TYP => DBMS_CRYPTO.DES_CBC_PKCS5,
KEY => V_KEY_DATA_RAW,
IV => NULL);
CONVERTED_STRING := UTL_I18N.RAW_TO_CHAR(DECRYPTED_RAW,
'AL32UTF8');
RETURN CONVERTED_STRING;
END FUNC_DECRYPT;
END PACK_ENCRYPTION_DECRYPTION;
/

drop table team_user;

create table team_user (
userid varchar2(100) not null primary key,
pwd varchar(64) not null, 
name varchar2(50) not null,
email varchar2(150) not null unique,
tel varchar2(50) not null,
zipcode varchar2(10),
address1 varchar2(500),
address2 varchar2(500),
joindate date default sysdate,
lastlogin date default sysdate,
user_group varchar2(2) default '1',
class_name varchar2(100) default '-'
);

-- 관리자 계정 생성
insert into team_user(userid, pwd, name, email, tel, user_group, class_name) 
    values ('admin',PACK_ENCRYPTION_DECRYPTION.FUNC_ENCRYPT('admin'), '관리자', 'admin@admin.com', '000', '3', '관리자');
    
-- 일반회원 계정 생성
insert into team_user(userid, pwd, name, email, tel, zipcode, address1, address2, user_group) 
    values ('kim001', PACK_ENCRYPTION_DECRYPTION.FUNC_ENCRYPT('1234'), '김동수', 'kim001@mail.com', '010-1111-2222', '42353', '서울시 강동구 천호대로', '202', '1');

insert into team_user(userid, pwd, name, email, tel, zipcode, address1, address2, user_group) 
    values ('kim002', PACK_ENCRYPTION_DECRYPTION.FUNC_ENCRYPT('1234'), '김철수', 'kim002@mail.com', '010-1112-2223', '35525', '서울시 강동구 천호대로 1', '203', '1');
    
insert into team_user(userid, pwd, name, email, tel, zipcode, address1, address2, user_group) 
    values ('kim003', PACK_ENCRYPTION_DECRYPTION.FUNC_ENCRYPT('1234'), '김민수', 'kim003@mail.com', '010-1112-2234', '35485', '서울시 강동구 천호대로 15', '253', '1');

insert into team_user(userid, pwd, name, email, tel, zipcode, address1, address2, user_group) 
    values ('kim004', PACK_ENCRYPTION_DECRYPTION.FUNC_ENCRYPT('1234'), '김정수', 'kim004@mail.com', '010-1112-5323', '75825', '서울시 강동구 천호대로 1342', '222', '1');
    
insert into team_user(userid, pwd, name, email, tel, zipcode, address1, address2, user_group) 
    values ('kim005', PACK_ENCRYPTION_DECRYPTION.FUNC_ENCRYPT('1234'), '김성수', 'kim005@mail.com', '010-1123-2223', '21425', '서울시 강동구 천호대로 432', '401', '1');

insert into team_user(userid, pwd, name, email, tel, zipcode, address1, address2, user_group) 
    values ('kim006', PACK_ENCRYPTION_DECRYPTION.FUNC_ENCRYPT('1234'), '김영수', 'kim006@mail.com', '010-1732-2258', '11525', '서울시 강동구 천호대로 523', '313', '1');

insert into team_user(userid, pwd, name, email, tel, zipcode, address1, address2, user_group) 
    values ('kim007', PACK_ENCRYPTION_DECRYPTION.FUNC_ENCRYPT('1234'), '김의성', 'kim007@mail.com', '010-1155-2277', '30025', '서울시 강동구 천호대로 1002', '211', '1');

insert into team_user(userid, pwd, name, email, tel, zipcode, address1, address2, user_group) 
    values ('kim008', PACK_ENCRYPTION_DECRYPTION.FUNC_ENCRYPT('1234'), '김명민', 'kim008@mail.com', '010-1342-2823', '27425', '서울시 강동구 천호대로 421', '108', '1');

insert into team_user(userid, pwd, name, email, tel, zipcode, address1, address2, user_group) 
    values ('kim009', PACK_ENCRYPTION_DECRYPTION.FUNC_ENCRYPT('1234'), '김재민', 'kim009@mail.com', '010-5112-6623', '38225', '서울시 강동구 천호대로 2143', '403', '1');

insert into team_user(userid, pwd, name, email, tel, zipcode, address1, address2, user_group) 
    values ('kim010', PACK_ENCRYPTION_DECRYPTION.FUNC_ENCRYPT('1234'), '김성훈', 'kim010@mail.com', '010-1282-2973', '35575', '서울시 강동구 천호대로 1223', '303', '1');

insert into team_user(userid, pwd, name, email, tel, zipcode, address1, address2, user_group) 
    values ('kim011', PACK_ENCRYPTION_DECRYPTION.FUNC_ENCRYPT('1234'), '김지연', 'kim011@mail.com', '010-3512-5523', '11111', '서울시 강동구 천호대로 132', '503', '1');

insert into team_user(userid, pwd, name, email, tel, zipcode, address1, address2, user_group) 
    values ('park001', PACK_ENCRYPTION_DECRYPTION.FUNC_ENCRYPT('1234'), '박세현', 'park001@mail.com', '010-1732-2258', '11525', '서울시 강동구 천호대로 523', '313', '1');

insert into team_user(userid, pwd, name, email, tel, zipcode, address1, address2, user_group) 
    values ('song001', PACK_ENCRYPTION_DECRYPTION.FUNC_ENCRYPT('1234'), '송명섭', 'song001@mail.com', '010-1155-2277', '30025', '서울시 강동구 천호대로 1002', '211', '1');

insert into team_user(userid, pwd, name, email, tel, zipcode, address1, address2, user_group) 
    values ('shin001', PACK_ENCRYPTION_DECRYPTION.FUNC_ENCRYPT('1234'), '신현주', 'shin001@mail.com', '010-1342-2823', '27425', '서울시 강동구 천호대로 421', '108', '1');

insert into team_user(userid, pwd, name, email, tel, zipcode, address1, address2, user_group) 
    values ('jung001', PACK_ENCRYPTION_DECRYPTION.FUNC_ENCRYPT('1234'), '정진우', 'jung001@mail.com', '010-5112-6623', '38225', '서울시 강동구 천호대로 2143', '403', '1');

insert into team_user(userid, pwd, name, email, tel, zipcode, address1, address2, user_group) 
    values ('park002', PACK_ENCRYPTION_DECRYPTION.FUNC_ENCRYPT('1234'), '박찬호', 'park002@mail.com', '010-1282-2973', '35575', '서울시 강동구 천호대로 1223', '303', '1');

insert into team_user(userid, pwd, name, email, tel, zipcode, address1, address2, user_group) 
    values ('lee003', PACK_ENCRYPTION_DECRYPTION.FUNC_ENCRYPT('1234'), '이지은', 'lee003@mail.com', '010-3512-5523', '11111', '서울시 강동구 천호대로 132', '503', '1');
    
insert into team_user(userid, pwd, name, email, tel, zipcode, address1, address2, user_group) 
    values ('yeo003', PACK_ENCRYPTION_DECRYPTION.FUNC_ENCRYPT('1234'), '여진구', 'yeo@mail.com', '010-3535-2433', '11111', '서울시 강동구 천호대로 172', '303', '1');

insert into team_user(userid, pwd, name, email, tel, zipcode, address1, address2, user_group) 
    values ('yoo002', PACK_ENCRYPTION_DECRYPTION.FUNC_ENCRYPT('1234'), '유재석', 'yoo002@mail.com', '010-3531-5773', '11321', '서울시 강동구 천호대로 152', '303', '1');
    
insert into team_user(userid, pwd, name, email, tel, zipcode, address1, address2, user_group) 
    values ('song003', PACK_ENCRYPTION_DECRYPTION.FUNC_ENCRYPT('1234'), '송지효', 'song@mail.com', '010-1135-2433', '14211', '서울시 강동구 천호대로 13', '313', '1');

-- 강사 계정 생성
insert into team_user(userid, pwd, name, email, tel, zipcode, address1, address2, user_group) 
    values ('lee', PACK_ENCRYPTION_DECRYPTION.FUNC_ENCRYPT('1234'), '이동휘', 'lee@mail.com', '010-7777-5555', '12511', '서울시 송파구 송파대로 142', '203', '2');
    
insert into team_user(userid, pwd, name, email, tel, zipcode, address1, address2, user_group) 
    values ('kim', PACK_ENCRYPTION_DECRYPTION.FUNC_ENCRYPT('1234'), '김연아', 'kim@mail.com', '010-3333-7575', '23851', '서울시 송파구 송파대로 355', '503', '2');
    
insert into team_user(userid, pwd, name, email, tel, zipcode, address1, address2, user_group) 
    values ('seo', PACK_ENCRYPTION_DECRYPTION.FUNC_ENCRYPT('1234'), '서인국', 'seo@mail.com', '010-3636-7272', '32511', '서울시 송파구 송파대로 272', '210', '2');



SELECT * FROM team_user
			WHERE userid='kim' AND pwd=PACK_ENCRYPTION_DECRYPTION.FUNC_ENCRYPT('1234');

select * from team_user;

UPDATE team_user SET lastlogin=sysdate
			WHERE userid='kim';

delete from team_user where userid='lee';
            
delete from team_user;
        
commit;

update team_user set pwd=PACK_ENCRYPTION_DECRYPTION.FUNC_ENCRYPT('1234')
    where userid='park';



declare --선언부
    i number := 1;
begin --실행부
    while i<=200 loop
        insert into team_user (userid, pwd, name, email, tel, zipcode, address1, address2, user_group, class_name)
        values
        ('kim'||i ,'1234', '김길동'||i, 'kim@kim.com'||i, '010-1111-222'||i, '123'||i, '서울시','천호동','1','웹프로그래밍초급');
        i := i+1; --조건 변경
    end loop;
end;
/

declare --선언부
    i number := 1;
begin --실행부
    while i<=200 loop
        insert into team_user (userid, pwd, name, email, tel, zipcode, address1, address2, user_group, class_name)
        values
        ('park'||i ,'1234', '박길동'||i, 'park@park.com'||i, '010-1111-222'||i, '123'||i, '서울시','천호동','1','웹프로그래밍고급');
        i := i+1; --조건 변경
    end loop;
end;
/

declare --선언부
    i number := 1;
begin --실행부
    while i<=200 loop
        insert into team_user (userid, pwd, name, email, tel, zipcode, address1, address2, user_group, class_name)
        values
        ('jang'||i ,'1234', '장길동'||i, 'jang@jang.com'||i, '010-1111-222'||i, '123'||i, '서울시','천호동','1','정보처리기사실기');
        i := i+1; --조건 변경
    end loop;
end;
/

declare --선언부
    i number := 1;
begin --실행부
    while i<=200 loop
        insert into team_user (userid, pwd, name, email, tel, zipcode, address1, address2, user_group, class_name)
        values
        ('goo'||i ,'1234', ' 구길동'||i, 'goo@goo.com'||i, '010-1111-222'||i, '123'||i, '서울시','천호동','1','정보처리기사필기');
        i := i+1; --조건 변경
    end loop;
end;
/

delete from team_user where class_name='정보처리기사실기' and user_group='1';

commit;