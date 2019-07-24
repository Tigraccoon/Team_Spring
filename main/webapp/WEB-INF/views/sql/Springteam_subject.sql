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
('����ó������ʱ�','<p>����ó����� ������ �ѹ��� �հ��غ�����.</p><p>
- �����ͺ��̽�</p><p><span style="font-size: 1rem;">- ���ڰ��ⱸ��</span><br></p><p>
- �ý��ۺм�����</p><p>- �ü��</p><p>- ������Ű���</p><p>������ �հݷ� 90%�̻�!!</p>','�̵���',170000,22,'7��20��-9��15��','gisa1.jpg');

insert into subject values
('����ó�����Ǳ�','<p>����ó����� �հݻ����� ������ �Ǳ��ڷ� ������ȸ!!</p><p>- �����ͺ��̽�</p><p>- �˰���</p><p>- �������μ���</p><p>- IT �ű��</p><p>- ���꿵��</p><p>���������� Ȯ���� �˷��帳�ϴ�!</p>','�迬��',220000,20,'8��27��-10��05��','gisa2.jpg');

insert into subject values
('�����α׷����ʱ�','<p>�����α׷����� �⺻�� �����帳�ϴ�.</p><p>�⺻ ���α׷��� ����� JAVA �� ��������</p><p>HTML, Oracle, SQL, HTML, SpringFramework �� �� ���߿� �ʿ��� ������ ���ʺ��� !</p>','���α�',150000,30,'6��29��-8��15��','class1.jpg');

insert into subject values
('�����α׷��ְ��','<p>�����α׷��� ����ǽ����� ��ޱ���� ���ϴ�.</p><p>�ʱ޹ݿ��� ��� �⺻���� ������ �������� ���� �� �������� �����</p><p>�ǹ��� ������ �����Ҽ� �ִ� �⺻���� �ǹ� ����� ���� �˷��帳�ϴ�!</p>','���α�',200000,15,'7��10��-9��15��','class1.jpg');

select * from subject;

delete from subject;

commit;

-- ������û ����
delete from cart;

create table cart (
subject_name varchar2(50) not null, --�����̸�
cart_id number not null primary key,
userid varchar2(50) not null
);

create sequence cart_seq
start with 1
increment by 1;

select * from cart;

select count(*) 
from cart
where subject_name='����ó�����'
and userid='kim';

select c.subject_name , sum(s.price)
		from subject s , cart c
		where s.subject_name=c.subject_name 
        group by c.subject_name
		order by subject_name;
        
        commit;