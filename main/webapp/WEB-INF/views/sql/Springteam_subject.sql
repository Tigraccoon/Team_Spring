-- ���� ���

create table subject(
-- subject_id number, --���� �ڵ�
subject_name varchar2(50) not null, --�����̸�
description clob, -- ���� ����
prof_name varchar2(50) not null, --�����̸�
price number not null, --���� �ݾ�
p_num number default 0, --(�ο���)
subject_date varchar(200) not null, -- ���� �Ⱓ
img_url clob --�̹��� (������)
-- primary key(list_id)
);

--������ ���� (����)
create sequence seq_subject
start with 1
increment by 1;

-- insert into class_list values
-- (seq_product.nextval,'����ó����� �Ǳ�','����','��ö��',100000,10,'1��20��-3��15��','class1.jpg');

insert into subject values
('����ó����� �Ǳ�','����','��ö��',100000,10,'1��20��-3��15��','class1.jpg');

select * from subject;

commit;

-- ������û ����
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
where subject_name='����ó�����'
and userid='kim';
