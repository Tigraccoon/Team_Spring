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

insert into team_user(userid, pwd, name, email, tel, user_group, class_name) 
    values ('admin',PACK_ENCRYPTION_DECRYPTION.FUNC_ENCRYPT('admin'), '관리자', 'admin@admin.com', '000', '3', '관리자');
    

insert into team_user(userid, pwd, name, email, tel, user_group, class_name) 
    values ('kim', PACK_ENCRYPTION_DECRYPTION.FUNC_ENCRYPT('1234'), '김철수', 'kim@kim.com', '000-0000-0000', '1', '정보처리기사실기');

SELECT * FROM team_user  
			WHERE userid='kim' AND pwd=PACK_ENCRYPTION_DECRYPTION.FUNC_ENCRYPT('1234');

select * from team_user;

UPDATE team_user SET lastlogin=sysdate
			WHERE userid='kim';
            
            
delete from team_user;
        
commit;

update team_user set pwd=PACK_ENCRYPTION_DECRYPTION.FUNC_ENCRYPT('1234')
    where userid='park';
