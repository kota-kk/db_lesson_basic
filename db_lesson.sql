-- Q1
CREATE TABLE departments (
 department_id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY COMMENT 'auto_increment',
 name VARCHAR(20) NOT NULL,
 created_at TIMESTAMP DEFAULT current_timestamp COMMENT 'DEFAULT_GENERATED',
 updated_at TIMESTAMP DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP COMMENT 'DEFAULT_GENERATED on update CURRENT_TIMESTAMP'
 );

-- Q2
ALTER TABLE
 people
ADD COLUMN
 department_id
 INT UNSIGNED
 DEFAULT NULL
 COMMENT 'emailの後ろに追加する'
AFTER
 email;


-- Q3
INSERT INTO
 departments (name)
VALUES
 ('営業'),
 ('開発'),
 ('経理'),
 ('人事'),
 ('情報システム');


-- Q4
UPDATE
 people
SET
 department_id = 1
WHERE
 department_id IS NULL;


-- Q5
SELECT
 name,
 age
FROM
 people
WHERE
 gender = 1
ORDER BY
 age DESC;


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
SELECT
 name
FROM
 people
WHERE (
  gender = 2
 AND
  age BETWEEN '20' AND '29'
) OR (
  gender = 1
 AND
  age BETWEEN '40' AND '49'
);


-- Q8
SELECT
 p.*
FROM
 people AS p
INNER JOIN
 departments AS d
WHERE
 d.name = '営業';


-- Q9
SELECT
 avg(age)
FROM
 people AS p
INNER JOIN
 departments AS d
WHERE
 d.name = '開発';


-- Q10
SELECT
 r.content,
 p.name AS username,
 d.name AS department
FROM
 people AS p
INNER JOIN
 reports AS r
ON
 p.person_id = r.person_id
INNER JOIN departments AS d
ON
 p.department_id = d.department_id
WHERE
 r.content IS NOT NULL;


-- Q11
SELECT DISTINCT
 p.name
FROM
 people AS p
LEFT JOIN
 reports AS r
ON
 p.person_id = r.person_id
WHERE
 r.content IS NULL;

