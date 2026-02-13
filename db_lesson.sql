-- Q1
create table departments (
 department_id int unsigned auto_increment not null primary key comment 'auto_increment',
 name varchar(20) not null,
 created_at timestamp default current_timestamp comment 'DEFAULT_GENERATED',
 updated_at timestamp default current_timestamp on update CURRENT_TIMESTAMP comment 'DEFAULT_GENERATED on update CURRENT_TIMESTAMP'
 );

-- Q2
ALTER TABLE
 people
add COLUMN
 department_id
 INT unsigned
 default null
 comment 'emailの後ろに追加する'
after
 email;


-- Q3
insert into
 departments (name)
values
 ('営業'),
 ('開発'),
 ('経理'),
 ('人事'),
 ('情報システム');


-- Q4
update people
set
 department_id = 1
where
 department_id is null;


-- Q5
select
 name,
 age
from
 people
where
 gender = 1
order by
 age desc;


-- Q6
SELECT -- DBから取得を行う
  `name`, `email`, `age` -- 取得対象のカラムはこれらです
FROM -- 対象のテーブルは
  `people` -- peopleテーブル
WHERE -- 対象のレコードを判定する条件は
  `department_id` = 1 -- department_idの値が「1」であること
ORDER BY -- レコードの並び順は
  `created_at`; -- レコードの初回登録日の昇順です。

-- 【まとめ】
-- peopleテーブルから以下のカラムを取得します。
-- `name`, `email`, `age`
-- 対象となるレコードの条件はdepartment_idの値が「1」であること
-- 並び順はレコードの初回登録日の昇順にしてください。


-- Q7
select
 name
from
 people
where (
  gender = 2
 AND
  age like '2%'
) or (
  gender = 1
 AND
  age like '4%'
);


-- Q8
select
 p.*
from
 people as p
inner join
 departments as d
where
 d.name = '営業';


-- Q9
select
 avg(age)
from
 people as p
inner join
 departments as d
where
 d.name = '開発';


-- Q10
select
 r.content,
 p.name as username,
 d.name as department
from
 people as p
inner join
 reports as r
on
 p.person_id = r.person_id
inner join departments as d
on
 p.department_id = d.department_id
where
 r.content is not null;


-- Q11
select distinct
 p.name
from
 people as p
left join
 reports as r
on
 p.person_id = r.person_id
where
 r.content is null;


