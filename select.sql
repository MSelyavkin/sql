/*
1. ������� ��� ������ � ����� �����. ��������� �������������
�� �������� ���� � ������������������ �������.
*/
SELECT *
FROM Type
ORDER BY name;

/*
2. ������� ���� �������� ����������� ��� ����������
*/
SELECT DISTINCT TO_CHAR(birthdate, 'yyyy') AS unique_birthdays
FROM Employee
WHERE birthdate IS NOT NULL;

/*
3. ������� ���� � ������ ���������� ����������� � ��������� ��� ����������. ��������� ������ 
������� ���������. ��������� ������������� � ������� �������� ���� � � ������� ����������� ������
*/
SELECT DISTINCT 
    TO_CHAR(start_date, 'mm') AS month, 
    TO_CHAR(start_date, 'yyyy') AS year
FROM Job_contract
WHERE finish_date IS NULL
ORDER BY year DESC, month ASC;

/*
4. ������� id, ������� � �������� ����������� � ����� �������. 
��������� ������������� �� id � ������� �����������
*/
SELECT id || ' ' || surname || ' ' || SUBSTR(name, 1, 1) || '. ' || 
    CASE
        WHEN Patronymic IS NOT NULL
        THEN SUBSTR(patronymic, 1, 1) || '.'
    END AS combined_info
FROM Employee
ORDER BY id;

/*
5. ������� ��������, ������� �������� � �������� ��������,
� �������� ������� ���� ����� ��� �����, ���������� ����� �����
*/
SELECT 
    title, 
    short_title AS short_title, 
    description
FROM Project
WHERE REGEXP_LIKE (description, '[[:alpha:],[:digit:]]{1}-{1}[[:alpha:],[:digit:]]{1}');

/*
6. ������� ��� ������ � ��������, ���������� ����� 2 ��� �����.
*/
SELECT *
FROM Project
WHERE start_date < ADD_MONTHS(SYSDATE, -24);

/*
7. ������� ��� ������ �������, ���������� ������� ����
��������� ����� ���������������� ����� �� 3-10 ����. ���������
������������� �� id ������� � ������� �����������, �� ���� ������ � ������� ��������,
�� �������� � ������� �������� �������������������
*/
SELECT *
FROM Task
WHERE actual_finish_date - plan_finish_date BETWEEN 3 AND 10
ORDER BY title DESC;

/*
8. ������� ������� � �������� �����������, ��� ������� �������
���� �������� � id ����� 2, 3, 5, 7, 8, 11.
��������� ������������� ��������� �������: � ������ ������� ����������
������ 35 ���, ����� ���������� ������ 25
*/
WITH Fio_ord AS
(
    SELECT 
        surname || ' ' || SUBSTR(name, 1, 1) || '. ' ||
            CASE
                WHEN Patronymic IS NOT NULL
                THEN SUBSTR(patronymic, 1, 1) || '.'
            END AS fio,
        CASE
            WHEN birthdate <= ADD_MONTHS(SYSDATE, -12 * 35)
            THEN 0
            WHEN birthdate >= ADD_MONTHS(SYSDATE, -12 * 25)
            THEN 1
            ELSE -1
        END AS ord
    FROM Employee
    WHERE birthdate IS NOT NULL AND id IN(2, 3, 5, 7, 8, 11)
)
SELECT fio
FROM Fio_ord
WHERE ord >= 0
ORDER BY ord;
       
SELECT 
    surname || ' ' || SUBSTR(name, 1, 1) || '. ' || 
            CASE
                WHEN Patronymic IS NOT NULL
                THEN SUBSTR(patronymic, 1, 1) || '.'
            END AS fio
FROM Employee
WHERE birthdate IS NOT NULL AND id IN(2, 3, 5, 7, 8, 11) 
    AND birthdate <= ADD_MONTHS(SYSDATE, -12 * 35) 
    OR birthdate >= ADD_MONTHS(SYSDATE, -12 * 25)
ORDER BY
    CASE
        WHEN birthdate <= ADD_MONTHS(SYSDATE, -12 * 35)
        THEN 0
        WHEN birthdate >= ADD_MONTHS(SYSDATE, -12 * 25)
        THEN 1
    END;
    
    
/*
9. ������� �������� ��������, ������� � ������� � ������� �����, � �������� ������� ���� �����.
*/
SELECT 
    title, 
    description
FROM Project
WHERE TO_CHAR(start_date, 'yyyy') >= TO_CHAR(SYSDATE, 'yyyy') - 1 AND REGEXP_LIKE(description, '\d');

/*
10. ������� �������� � ���� ������ ���������� ��������, � �������� ������� ���� ���� �� 3 �����
� ��� �������� !, ?, %, _.
*/
SELECT 
    title, 
    start_date, 
    description
FROM project
WHERE LENGTH(description) - LENGTH(REPLACE(description, ' ', '')) + 1 >= 3 AND NOT REGEXP_LIKE(description, '[(!|?|%|_)]');

/*
11. ������� ��� ������ � �������. � ��������� ������� �������������� ������� ������� ���������
"������ ��������� ��������", ���� ����������� ���� ���������� ������ ����������� ���� ����������, 
"������ �� ���������", ���� �� ������� ���� ������������ ����������,
"������ ��������� � ����������", ���� ����������� ���� ���������� ������ ����������� ���� ����������.
*/
SELECT 
    task.*,
    CASE
        WHEN actual_finish_date IS NULL
        THEN '������ �� ���������'
        WHEN actual_finish_date < plan_finish_date
        THEN '������ ��������� ��������'
        WHEN actual_finish_date > plan_finish_date
        THEN '������ ��������� � ����������'
        ELSE '������ ��������� ����� � ��������� ����'
    END AS progress
FROM task;

/*
12. ������� ����� ���������� ��������.
*/
SELECT COUNT(*) AS cnt_projects
FROM project;


SELECT DISTINCT COUNT(*) OVER()
FROM project;

SELECT *
FROM EMPLOYEE;


/*
13. ������� ���������� ��������� ���� �����������
*/
SELECT COUNT(DISTINCT name) AS cnt_unique_names
FROM Employee;

/*
14. ������� ���� ������ ���������� ������� � ���������� ��������.
*/
SELECT MIN(start_date) AS first_project_start, MAX(start_date) AS last_project_start
FROM Project;

/*
15. ������� ������� ����������������� ����������� ���������� ����� �������� � id 2, 3, 6, 7 ,8.
*/
SELECT COALESCE(AVG(actual_finish_date - start_date), 0)
FROM Task
WHERE id_project IN(2, 3, 6, 7, 8);

SELECT id_project, COALESCE(AVG(actual_finish_date - start_date), 0)
FROM Task
WHERE id_project IN(2, 3, 6, 7 ,8)
GROUP BY id_project;


/*
16. ������� ��������, ��������, ���� ������, ����������� � ����������� ���� ���������� �����
������� � ������� ��������� ��� BOOK
*/
SELECT 
    t.title, 
    t.description, 
    t.start_date, 
    t.plan_finish_date, 
    t.actual_finish_date
FROM Task t JOIN Project p ON t.id_project = p.id
WHERE p.short_title = '��� BOOK';

/*
17. ������� ������� �������� �������, ������� � �������� ������������ �������, ��������, ��������, ���� ������ � �����������
���� ���������� �����, �������� ���� ������, ������� � �������� ����������, �������������� �� ���������� ������, �������, 
��� � �������� �����������, ���������� ������������� ������. ��������� ������������� �� ������� ������������� �������� 
� ������������������ �������, �� �������� �������� ������� � �������, �������� �������������������, 
�� �������� ���� ����� � ���������� ������� � �� �������� ����� ���� � ������������������ �������.
*/
SELECT
    P.TITLE AS ��������,
    COALESCE(P.SHORT_TITLE, CAST('-' AS NVARCHAR2(1))) AS �������_��������,
    CASE
        WHEN E_PM.ID IS NOT NULL
        THEN
            E_PM.SURNAME || ' ' || SUBSTR(E_PM.NAME, 1, 1) || '. ' ||
            CASE
                WHEN E_PM.PATRONYMIC IS NOT NULL
                THEN SUBSTR(E_PM.PATRONYMIC, 1, 1) || '.'
            END
        ELSE CAST('-' AS NVARCHAR2(1))
    END AS ���_������������_�������,
    TSK.TITLE AS ��������_������,
    TSK.DESCRIPTION AS ��������_������,
    TSK.START_DATE AS ����_������_������,
    TSK.PLAN_FINISH_DATE AS �����������_����_����������_������,
    TP.NAME AS ���_������,
    CASE
        WHEN LE.ID IS NOT NULL
        THEN
            LE.SURNAME || ' ' || SUBSTR(LE.NAME, 1, 1) || '. ' ||
            CASE
                WHEN LE.PATRONYMIC IS NOT NULL
                THEN SUBSTR(LE.PATRONYMIC, 1, 1) || '.'
            END
        ELSE CAST('-' AS NVARCHAR2(1))
    END AS ���_������������_������,
    CASE
        WHEN E.ID IS NOT NULL
        THEN
            E.SURNAME || ' ' || SUBSTR(E.NAME, 1, 1) || '. ' ||
            CASE
                WHEN E.PATRONYMIC IS NOT NULL
                THEN SUBSTR(E.PATRONYMIC, 1, 1) || '.'
            END
        ELSE CAST('-' AS NVARCHAR2(1))
    END AS ���_���������
FROM PROJECT P
    LEFT JOIN PROJECT_MANAGER PM on P.ID = PM.ID_PROJECT AND PM.FINISH_DATE IS NULL
    LEFT JOIN EMPLOYEE E_PM on PM.ID_MANAGER = E_PM.ID
    LEFT JOIN TASK TSK on P.ID = TSK.ID_PROJECT
    LEFT JOIN TYPE TP on TSK.ID_TYPE = TP.ID
    LEFT JOIN TASK_EMPLOYEE LTE on TSK.ID = LTE.ID_TASK AND LTE.IS_LEADER = 'Y'
    LEFT JOIN TASK_EMPLOYEE TE on TSK.ID = TE.ID_TASK AND TE.IS_LEADER = 'N'
    LEFT JOIN EMPLOYEE LE on LE.ID = LTE.ID_EMPLOYEE
    LEFT JOIN EMPLOYEE E on E.ID = TE.ID_EMPLOYEE
ORDER BY
    E_PM.SURNAME,
    P.SHORT_TITLE DESC,
    TP.NAME,
    TSK.TITLE;

/*
18. ������� �������, ��� � �������� �����������, ������� �������� ��� �������������� �������� ������� ��� BOOK.
��������� ������������� �� �������, ����� � �������� � ������������������ �������.
*/

SELECT e.surname, e.name, e.patronymic
FROM
    EMPLOYEE e
    JOIN TASK_EMPLOYEE te ON e.ID = te.ID_EMPLOYEE
    JOIN TASK t ON te.ID_TASK = t.ID
    JOIN PROJECT p ON t.ID_PROJECT = p.ID
WHERE p.SHORT_TITLE = '��� BOOK' AND t.ACTUAL_FINISH_DATE IS NULL
ORDER BY surname, name, patronymic;

WITH tasks_unfinished AS (
    SELECT t.id
    FROM TASK t
    WHERE t.ID_PROJECT = (
        select p.id
        from PROJECT p
        where p.SHORT_TITLE = '��� BOOK'
        ) AND t.ACTUAL_FINISH_DATE is null
)
SELECT e.surname, e.name, e.patronymic
FROM EMPLOYEE e
WHERE EXISTS (
    SELECT 1
    FROM tasks_unfinished tu JOIN TASK_EMPLOYEE te ON tu.ID = te.ID_TASK
    WHERE e.ID = te.ID_EMPLOYEE
)
ORDER BY surname, name, patronymic;
    

/*
19. ������� ��� � ���������� ��������, ������� � ���� ����. ��������� �������������
�� ���� � ��������� �������
*/
SELECT TO_CHAR(START_DATE, 'yyyy') AS Year, COUNT(ID) AS cnt_projects
FROM PROJECT
GROUP BY TO_CHAR(START_DATE, 'yyyy')
ORDER BY Year DESC;


/*
20. ������� �������� ����� ����� � ������� ����������������� ����� ��� �������� ����� ��������������� ����.
��������� ������������� �� �������� � ������������������ �������.
*/
SELECT tp.NAME, AVG(tk.ACTUAL_FINISH_DATE - tk.START_DATE) AS avg_duration
FROM TYPE tp JOIN TASK tk ON tp.ID = tk.ID_TYPE
GROUP BY tp.ID, tp.NAME
ORDER BY tp.NAME;

/*
21. ������� �������� �������, ������� �������� �������, ������� � �������� ������������ ������� � ����������
������������� �� ������ ������ ����� �� �������.
*/
SELECT
    P.TITLE,
    P.SHORT_TITLE,
    E.SURNAME || ' ' || SUBSTR(E.NAME, 1, 1) || '. ' ||
        CASE
            WHEN E.PATRONYMIC IS NOT NULL
            THEN SUBSTR(E.PATRONYMIC, 1, 1) || '.'
        END AS pm_fio,
    COUNT(T.ID) AS unfinished_tasks_count
FROM
    PROJECT P
    LEFT JOIN PROJECT_MANAGER PM on P.ID = PM.ID_PROJECT AND PM.FINISH_DATE IS NULL
    JOIN EMPLOYEE E on PM.ID_MANAGER = E.ID
    LEFT JOIN TASK T on P.ID = T.ID_PROJECT AND T.ACTUAL_FINISH_DATE IS NULL
GROUP BY
        E.SURNAME || ' ' || SUBSTR(E.NAME, 1, 1) || '. ' ||
        CASE
            WHEN E.PATRONYMIC IS NOT NULL
            THEN SUBSTR(E.PATRONYMIC, 1, 1) || '.'
        END,
        P.SHORT_TITLE,
        P.TITLE;

SELECT
    P.TITLE,
    P.SHORT_TITLE,
    E.SURNAME || ' ' || SUBSTR(E.NAME, 1, 1) || '. ' ||
        CASE
            WHEN E.PATRONYMIC IS NOT NULL
            THEN SUBSTR(E.PATRONYMIC, 1, 1) || '.'
        END AS pm_fio,
    COUNT(T.ID) AS unfinished_tasks_count
FROM
    PROJECT P
    LEFT JOIN PROJECT_MANAGER PM on P.ID = PM.ID_PROJECT
    JOIN EMPLOYEE E on PM.ID_MANAGER = E.ID
    LEFT JOIN TASK T on P.ID = T.ID_PROJECT
WHERE PM.FINISH_DATE IS NULL AND T.ACTUAL_FINISH_DATE IS NULL
GROUP BY
        E.SURNAME || ' ' || SUBSTR(E.NAME, 1, 1) || '. ' ||
        CASE
            WHEN E.PATRONYMIC IS NOT NULL
            THEN SUBSTR(E.PATRONYMIC, 1, 1) || '.'
        END,
        P.SHORT_TITLE,
        P.TITLE;


/*
22. ������� ������� � �������� ��� ������������� ��������, ������� ��������� ����������� ���������.
��������� ������������� �� ������� � ������������������ �������
*/
SELECT DISTINCT E.SURNAME || ' ' || SUBSTR(E.NAME, 1, 1) || '. ' ||
        CASE
            WHEN E.PATRONYMIC IS NOT NULL
            THEN SUBSTR(E.PATRONYMIC, 1, 1) || '.'
        END AS pm_fio
FROM PROJECT_MANAGER PM1
    JOIN PROJECT_MANAGER PM2 USING(ID_MANAGER)
    JOIN EMPLOYEE E on ID_MANAGER = E.ID
WHERE PM1.FINISH_DATE IS NULL AND PM2.FINISH_DATE IS NULL AND PM1.ID_PROJECT < PM2.ID_PROJECT;

SELECT E.SURNAME || ' ' || SUBSTR(E.NAME, 1, 1) || '. ' ||
        CASE
            WHEN E.PATRONYMIC IS NOT NULL
            THEN SUBSTR(E.PATRONYMIC, 1, 1) || '.'
        END AS pm_fio
FROM PROJECT_MANAGER PM JOIN EMPLOYEE E ON PM.ID_MANAGER = E.ID
WHERE PM.FINISH_DATE IS NULL
GROUP BY E.ID, E.SURNAME || ' ' || SUBSTR(E.NAME, 1, 1) || '. ' ||
        CASE
            WHEN E.PATRONYMIC IS NOT NULL
            THEN SUBSTR(E.PATRONYMIC, 1, 1) || '.'
        END
HAVING COUNT(*) > 1;



/*
23. ������� �������� ��������� � ���������� �����������, ���������� � ��������� � ������� ����.
��������� ������������� �� ���������� � ������� ��������
*/
SELECT P.NAME, COUNT(JC.ID) AS amount
FROM JOB_CONTRACT JC
    RIGHT JOIN POSITION P
        ON P.ID = JC.ID_POSITION AND EXTRACT(year FROM JC.START_DATE) = EXTRACT(year FROM SYSDATE)
GROUP BY P.NAME
ORDER BY amount DESC;


SELECT P.NAME, COUNT(JC.ID) AS amount
FROM JOB_CONTRACT JC
    RIGHT JOIN POSITION P
        ON P.ID = JC.ID_POSITION
WHERE EXTRACT(year FROM JC.START_DATE) = EXTRACT(year FROM SYSDATE)
GROUP BY P.NAME
ORDER BY amount DESC;


/*
24. ������� ��� ������ �������, �������� �������, ������� �������� �������,
���������� ������������� �����, ���������� ����������� � ���� �����, ���������� �����,
�������� � ����������
*/
SELECT
    TO_CHAR(P.START_DATE, 'yyyy'),
    P.TITLE,
    P.SHORT_TITLE,
    (
        SELECT COUNT(*)
        FROM TASK T
        WHERE T.ID_PROJECT = P.ID AND T.ACTUAL_FINISH_DATE IS NULL
    ) AS unsolved,
    (
        SELECT COUNT(*)
        FROM TASK T
        WHERE T.ID_PROJECT = P.ID AND T.ACTUAL_FINISH_DATE IS NOT NULL AND T.ACTUAL_FINISH_DATE <= T.PLAN_FINISH_DATE
    ) AS solved_on_time,
    (
        SELECT COUNT(*)
        FROM TASK T
        WHERE T.ID_PROJECT = P.ID AND T.ACTUAL_FINISH_DATE IS NOT NULL AND T.ACTUAL_FINISH_DATE > T.PLAN_FINISH_DATE
    ) AS solved_too_late
FROM PROJECT P
ORDER BY P.ID;

SELECT
    EXTRACT(year FROM P.START_DATE),
    P.TITLE,
    P.SHORT_TITLE,
    SUM (
        CASE
            WHEN T.ID IS NOT NULL AND T.ACTUAL_FINISH_DATE IS NULL
            THEN 1
            ELSE 0
        END
    ) AS unsolved,
    SUM (
        CASE
            WHEN T.ID IS NOT NULL AND T.ACTUAL_FINISH_DATE <= T.PLAN_FINISH_DATE
            THEN 1
            ELSE 0
        END
    ) AS solved_on_time,
    SUM (
        CASE
            WHEN T.ID IS NOT NULL AND T.ACTUAL_FINISH_DATE > T.PLAN_FINISH_DATE
            THEN 1
            ELSE 0
        END
    ) AS solved_too_late
FROM PROJECT P LEFT JOIN TASK T ON P.ID = T.ID_PROJECT
GROUP BY P.ID, P.TITLE, EXTRACT(year FROM P.START_DATE), P.SHORT_TITLE
ORDER BY P.ID;

/*
25. ������� �������, ������� ����� ���� �����, � ������� ������ 3 ������������� �����.
*/
SELECT P.ID, P.TITLE, P.DESCRIPTION, P.START_DATE, P.SHORT_TITLE
FROM PROJECT P JOIN TASK T ON P.ID = T.ID_PROJECT
WHERE T.START_DATE < ADD_MONTHS(SYSDATE, -12) AND T.ACTUAL_FINISH_DATE IS NULL
GROUP BY P.ID, P.TITLE, P.DESCRIPTION, P.START_DATE, P.SHORT_TITLE
HAVING (COUNT(T.ID) > 3);

SELECT *
FROM PROJECT P
WHERE START_DATE < ADD_MONTHS(SYSDATE, -12) AND (
    SELECT COUNT(ID)
    FROM TASK T
    WHERE ACTUAL_FINISH_DATE IS NULL AND P.ID = T.ID_PROJECT
    ) > 3;


/*
26. ������� �������� ����� �����, ������� ����� ���� �������������
����� �� ������ �������. ������ �������� � �������������� �������
������ ����������� ���� ���.
��������� ������������� �� �������� � ������������������ �������
*/
SELECT DISTINCT TYPE.NAME
FROM TYPE JOIN TASK ON TYPE.ID = TASK.ID_TYPE
WHERE ACTUAL_FINISH_DATE IS NULL
GROUP BY TASK.ID_PROJECT, TYPE.NAME
HAVING(COUNT(*)) > 3
ORDER BY TYPE.NAME;

/*
27. ������� ��� ������ �� ��������, ��� �������� ��������
����� 5 ����������� ������ 25 ���
*/
WITH Project_employee AS (
    SELECT ID_PROJECT, ID_MANAGER
    FROM PROJECT_MANAGER PM JOIN EMPLOYEE E on E.ID = PM.ID_MANAGER
    WHERE ADD_MONTHS(SYSDATE, -12 * 25) < BIRTHDATE
    UNION
    SELECT ID_PROJECT, ID_EMPLOYEE
    FROM TASK_EMPLOYEE TE JOIN TASK T ON T.ID = TE.ID_TASK
        JOIN PROJECT P ON T.ID_PROJECT = P.ID
        JOIN EMPLOYEE E ON TE.ID_EMPLOYEE = E.ID
    WHERE ADD_MONTHS(SYSDATE, -12 * 25) < BIRTHDATE
)
SELECT P.*
FROM PROJECT P JOIN Project_employee PE ON P.ID = PE.ID_PROJECT
GROUP BY P.ID, P.TITLE, P.DESCRIPTION, P.START_DATE, P.SHORT_TITLE
HAVING (COUNT(*) > 5);


WITH Project_employee AS (
    SELECT ID_PROJECT, ID_MANAGER
    FROM PROJECT_MANAGER PM JOIN EMPLOYEE E on E.ID = PM.ID_MANAGER
    WHERE ADD_MONTHS(SYSDATE, -12 * 25) < BIRTHDATE
    UNION
    SELECT ID_PROJECT, ID_EMPLOYEE
    FROM TASK_EMPLOYEE TE JOIN TASK T ON T.ID = TE.ID_TASK
        JOIN PROJECT P ON T.ID_PROJECT = P.ID
        JOIN EMPLOYEE E ON TE.ID_EMPLOYEE = E.ID
    WHERE ADD_MONTHS(SYSDATE, -12 * 25) < BIRTHDATE
)
SELECT P.*
FROM PROJECT P
WHERE P.ID IN (
    SELECT ID_PROJECT
    FROM Project_employee
    GROUP BY ID_PROJECT
    HAVING(COUNT(*)) > 5
);


/*
28. ������� �������, ���, �������� ���� �����������, � ���� ���������
�������� ������������� �������, �� �������� �������. ��������� �������������
�� �������, �����, �������� � ������� �������� �������������������.
*/
SELECT
    E.SURNAME,
    E.NAME,
    E.PATRONYMIC,
    COALESCE(P.TITLE, CAST('-' AS NVARCHAR2(1))) AS project_name
FROM EMPLOYEE E
    LEFT JOIN PROJECT_MANAGER PM on E.ID = PM.ID_MANAGER AND PM.FINISH_DATE IS NULL
    LEFT JOIN PROJECT P on PM.ID_PROJECT = P.ID
ORDER BY E.SURNAME DESC, E.NAME DESC, E.PATRONYMIC DESC;

/*
29. ������� �������� ���� ����� ����� � ���� ���� ������������� ������
����� ����, �� id_������ � ������� �������� �������.
*/
WITH Unfinished_tasks_info AS (
    SELECT T.ID,T.ID_TYPE, P.SHORT_TITLE, P.TITLE
    FROM PROJECT P JOIN TASK T on P.ID = T.ID_PROJECT
    WHERE T.ACTUAL_FINISH_DATE IS NULL
)
SELECT T.NAME, Uti.ID, Uti.Title, Uti.SHORT_TITLE
FROM TYPE T LEFT JOIN Unfinished_tasks_info Uti ON Uti.ID_TYPE = T.ID;

/*
30. ������� �������� ���� ����������, � ���� ���� ����������,
���������� �� ������ ������ � ��������������� ���������, �� �� ����������.
*/
SELECT P.NAME, COUNT(JC.ID_EMPLOYEE)
FROM POSITION P
    LEFT JOIN JOB_CONTRACT JC on P.ID = JC.ID_POSITION --AND JC.FINISH_DATE IS NULL
WHERE JC.FINISH_DATE IS NULL
GROUP BY P.NAME;

SELECT P.NAME, COUNT(JC.ID_EMPLOYEE)
FROM POSITION P
    LEFT JOIN JOB_CONTRACT JC on P.ID = JC.ID_POSITION AND JC.FINISH_DATE IS NULL
GROUP BY P.NAME;

/*
31. ��� ������� �������� ������� ������� �������� ���� ����� �����.
*/
SELECT P.TITLE, T.NAME
FROM PROJECT P, TYPE T;

/*
32. ��� ������� �������� ������� ������� �������� ���� ����� �����, � ���� ����
� ������� ���������������� ���� ������, �� �� ����������
*/
--��� 0, � ������, ���� 0 ����� ������ ����
SELECT P.TITLE, TP.NAME, COUNT(TSK.ID_TYPE) AS Task_count
FROM PROJECT P
    CROSS JOIN TYPE TP
    LEFT JOIN TASK TSK on P.ID = TSK.ID_PROJECT AND TP.ID = TSK.ID_TYPE
GROUP BY P.TITLE, TP.NAME
ORDER BY P.TITLE;

--��� null, � ������, ���� 0 ����� ������ ���� (������ �������� ��� ������������)
SELECT P.TITLE, TP.NAME,
    CASE COUNT(TSK.ID_TYPE)
        WHEN 0
        THEN NULL
        ELSE COUNT(TSK.ID_TYPE)
    END AS Task_count
FROM PROJECT P
    CROSS JOIN TYPE TP
    LEFT JOIN TASK TSK on P.ID = TSK.ID_PROJECT AND TP.ID = TSK.ID_TYPE
GROUP BY P.TITLE, TP.NAME
ORDER BY P.TITLE;

/*
33. ������� ���� ����� � ���������� ���������, �� �� ������ ��������
*/
SELECT T1.TITLE AS TITLE, T1.ID_PROJECT AS PROJECT1, T2.ID_PROJECT AS PROJECT2
FROM TASK T1 JOIN TASK T2 ON T1.TITLE = T2.TITLE
WHERE T1.ID_PROJECT < T2.ID_PROJECT;

/*
34. ������� ������ �����������, ������� �������� � ����� � ��� �� ���������.
*/
WITH Employee_Job AS (
    SELECT E.*, JC.ID_POSITION
    FROM EMPLOYEE E JOIN JOB_CONTRACT JC on E.ID = JC.ID_EMPLOYEE
)
SELECT
    EJ1.NAME || ' ' || EJ1.SURNAME || ' ' || EJ1.PATRONYMIC,
    EJ2.NAME || ' ' || EJ2.SURNAME || ' ' || EJ2.PATRONYMIC,
    EJ3.NAME || ' ' || EJ3.SURNAME || ' ' || EJ3.PATRONYMIC
FROM Employee_Job EJ1
    JOIN Employee_Job EJ2 USING(ID_POSITION)
    JOIN Employee_Job EJ3 USING(ID_POSITION)
WHERE EJ1.ID < EJ2.ID AND EJ2.ID < EJ3.ID;



/*
35. ������� ���������� ����� ������������� ����� �����������
*/
-- ������� 1: ������� � ���������� ����� � ����� ��������, ���� �� ���������
SELECT E.SURNAME, COUNT(E.SURNAME)
FROM EMPLOYEE E
GROUP BY E.SURNAME
HAVING COUNT(E.SURNAME) > 1;

-- ������� 2: ���������� ����� � ����������� ���������,
-- ���� ������� ������ 1(!������, !������, !������, ��������, !������, !������ - ������ 5)
WITH Surname_Count AS (
    SELECT E.SURNAME, COUNT(E.SURNAME) AS CNT
    FROM EMPLOYEE E
    GROUP BY E.SURNAME
    HAVING COUNT(E.SURNAME) > 1
)
SELECT SUM(CNT)
FROM Surname_count;

/*
36. ������� ������� �������� � �������� ������ ������� �������
*/
SELECT P.TITLE, P.SHORT_TITLE, P.DESCRIPTION
FROM PROJECT P
WHERE P.START_DATE = (
    SELECT MIN(P1.START_DATE)
    FROM PROJECT P1
    );


/*
37. ������� �������, ���, �������� ������ �������� � ������ �������� �� �����������.
*/
SELECT SURNAME, NAME, PATRONYMIC, BIRTHDATE
FROM EMPLOYEE
WHERE BIRTHDATE = (
    SELECT MIN(BIRTHDATE)
    FROM EMPLOYEE
    ) OR BIRTHDATE = (
        SELECT MAX(BIRTHDATE)
        FROM EMPLOYEE
    );

SELECT SURNAME, NAME, PATRONYMIC, BIRTHDATE
FROM EMPLOYEE
WHERE BIRTHDATE = (
        SELECT DISTINCT FIRST_VALUE(BIRTHDATE) over (ORDER BY BIRTHDATE)
        FROM EMPLOYEE
    )
    OR
    BIRTHDATE = (
        SELECT DISTINCT FIRST_VALUE(BIRTHDATE) over (ORDER BY BIRTHDATE DESC)
        FROM EMPLOYEE
    );

SELECT SURNAME, NAME, PATRONYMIC, BIRTHDATE
FROM EMPLOYEE
WHERE BIRTHDATE <= ALL (
    SELECT BIRTHDATE
    FROM EMPLOYEE
    )
    OR BIRTHDATE >= ALL (
        SELECT BIRTHDATE
        FROM EMPLOYEE
    );


/*
38. ������� �������, ���, �������� ����������� � �������� ���������, ���������� �� ������ ������.
��������� ������������� �� ��������, �����, �������� � ����������������� �������.
*/
-- ���� ���������� ��� ����������
SELECT E.SURNAME, E.NAME, E.PATRONYMIC, P.NAME
FROM EMPLOYEE E
    LEFT JOIN JOB_CONTRACT JC on E.ID = JC.ID_EMPLOYEE AND JC.FINISH_DATE IS NULL
    LEFT JOIN POSITION P on JC.ID_POSITION = P.ID
ORDER BY 1, 2, 3;

--���� �� ��������� ����������� ��� ���������
SELECT E.SURNAME, E.NAME, E.PATRONYMIC, P.NAME
FROM EMPLOYEE E
    JOIN JOB_CONTRACT JC on E.ID = JC.ID_EMPLOYEE
    JOIN POSITION P on JC.ID_POSITION = P.ID
WHERE JC.FINISH_DATE IS NULL
ORDER BY 1, 2, 3;


/*
39. ������� �������� ��������� � ������� � �������� ����������, ��������� �� ��� ��������� ���������
*/
SELECT
    P.NAME,
    CASE
        WHEN E.ID IS NOT NULL
        THEN
            E.SURNAME || ' ' || SUBSTR(E.NAME, 1, 1) || '. ' ||
            CASE
                WHEN E.PATRONYMIC IS NOT NULL
                THEN SUBSTR(E.PATRONYMIC, 1, 1) || '.'
            END
        ELSE CAST('-' AS NVARCHAR2(1))
    END AS ���_���������,
    JC.START_DATE
FROM POSITION P
    LEFT JOIN JOB_CONTRACT JC on P.ID = JC.ID_POSITION
    LEFT JOIN EMPLOYEE E on JC.ID_EMPLOYEE = E.ID
WHERE JC.START_DATE = (
    SELECT MAX(START_DATE)
    FROM JOB_CONTRACT JC2
    WHERE JC2.ID_POSITION = P.ID
    );



/*
40. ������� �������� ��������, � ������� ���������� �������������
��������� ������� ���������� �������������, ���������� ��� ��������.
*/
WITH PROJECT_EMPCOUNT AS (
    SELECT P.ID, P.TITLE, COUNT(DISTINCT TE.ID_EMPLOYEE) AS EMP_COUNT
    FROM PROJECT P
        LEFT JOIN TASK T on P.ID = T.ID_PROJECT
        LEFT JOIN TASK_EMPLOYEE TE on T.ID = TE.ID_TASK
    GROUP BY P.ID, P.TITLE
)
SELECT PE.TITLE
FROM PROJECT_EMPCOUNT PE
WHERE EMP_COUNT > (
    SELECT AVG(EMP_COUNT)
    FROM PROJECT_EMPCOUNT
    );

/*
41. ������� id, �������� � �������� �����, ��� ������� ��� �� ��������� �����������.
*/
SELECT T.ID, T.TITLE, T.DESCRIPTION
FROM TASK T
WHERE NOT EXISTS (
    SELECT 1
    FROM TASK_EMPLOYEE TE
    WHERE TE.ID_TASK = T.ID
    );

/*
42. ������� ����������, ������� ������� �� ��������� ������ � ����.
*/
SELECT E.*
FROM EMPLOYEE E
WHERE NOT EXISTS (
    SELECT 1
    FROM TASK T
        JOIN TASK_EMPLOYEE TE on T.ID = TE.ID_TASK
    WHERE TE.ID_EMPLOYEE = E.ID AND T.ACTUAL_FINISH_DATE <= T.PLAN_FINISH_DATE
    );

/*
43. ������� �������� ��������� ����������, �. �. �������� ����������, � ������� ����� �� �������� �� ������ ������.
��������� ������������� � ������������������ �������.
*/
SELECT P.NAME
FROM POSITION P
WHERE NOT EXISTS (
    SELECT 1
    FROM JOB_CONTRACT JC
    WHERE JC.ID_POSITION = P.ID AND JC.FINISH_DATE IS NULL
    );

/*
44. ������� ��� ������ � �����������, ������� �������� �� ���� ��������.
*/
WITH Project_employee AS (
    SELECT ID_PROJECT, E.*
    FROM PROJECT_MANAGER PM JOIN EMPLOYEE E on E.ID = PM.ID_MANAGER
    UNION
    SELECT ID_PROJECT, E.*
    FROM TASK_EMPLOYEE TE JOIN TASK T ON T.ID = TE.ID_TASK
        JOIN PROJECT P ON T.ID_PROJECT = P.ID
        JOIN EMPLOYEE E ON TE.ID_EMPLOYEE = E.ID
)
SELECT PE.ID, PE.SURNAME, PE.NAME, PE.PATRONYMIC, PE.BIRTHDATE
FROM Project_employee PE
GROUP BY PE.ID, PE.SURNAME, PE.NAME, PE.PATRONYMIC, PE.BIRTHDATE
HAVING COUNT(DISTINCT PE.ID_PROJECT) = (
    SELECT COUNT(P.ID)
    FROM PROJECT P
    );

/*
45. ������� �������� ������� � ���������� ����������� ������������� �����.
*/
WITH Project_UnfinishedCount AS (
    SELECT P.Title AS title, COUNT(T.ID) AS cnt
    FROM PROJECT P LEFT JOIN TASK T on P.ID = T.ID_PROJECT AND T.ACTUAL_FINISH_DATE IS NULL 
    GROUP BY P.ID, P.TITLE                                                                  
)
SELECT Title
FROM Project_UnfinishedCount
WHERE cnt = (
    SELECT MAX(cnt)
    FROM Project_UnfinishedCount
    );

WITH Project_UnfinishedCount(title, cnt) AS (
    SELECT P.Title, COUNT(T.ID) OVER (PARTITION BY P.ID)
    FROM PROJECT P LEFT JOIN TASK T ON P.ID = T.ID_PROJECT AND T.ACTUAL_FINISH_DATE IS NULL
)
SELECT DISTINCT FIRST_VALUE(title) OVER (ORDER BY cnt DESC)
FROM Project_UnfinishedCount;


/*
46. ������� ������� � �������� ����������, ������������ ������� ���������� ���������� ����� �� ������� ��� BOOK
*/
WITH Emp_Count AS (
    SELECT
        E.SURNAME || ' ' || SUBSTR(E.NAME, 1, 1) || '. ' ||
        CASE
            WHEN E.PATRONYMIC IS NOT NULL
            THEN SUBSTR(E.PATRONYMIC, 1, 1) || '.'
        END AS fio,
        COUNT(T.ID) cnt
    FROM
        EMPLOYEE E
        JOIN TASK_EMPLOYEE on E.ID = TASK_EMPLOYEE.ID_EMPLOYEE
        JOIN TASK T on TASK_EMPLOYEE.ID_TASK = T.ID
        JOIN PROJECT P on T.ID_PROJECT = P.ID
    WHERE P.SHORT_TITLE = '��� BOOK' AND T.ACTUAL_FINISH_DATE IS NOT NULL AND T.ACTUAL_FINISH_DATE <= T.PLAN_FINISH_DATE
    GROUP BY E.ID, E.SURNAME || ' ' || SUBSTR(E.NAME, 1, 1) || '. ' ||
        CASE
            WHEN E.PATRONYMIC IS NOT NULL
            THEN SUBSTR(E.PATRONYMIC, 1, 1) || '.'
        END
)
SELECT fio
FROM Emp_Count
WHERE cnt = (
    SELECT MAX(cnt)
    FROM Emp_Count
    );


/*
47. ������� ��� ����, ������� ���� � ���� ������. ��������� ������������� � ��������� �������.
*/

SELECT START_DATE Dt
FROM PROJECT P
UNION ALL
SELECT START_DATE
FROM PROJECT_MANAGER
UNION ALL
SELECT FINISH_DATE
FROM PROJECT_MANAGER
WHERE FINISH_DATE IS NOT NULL
UNION ALL
SELECT START_DATE
FROM TASK
UNION ALL
SELECT PLAN_FINISH_DATE
FROM TASK
UNION ALL
SELECT ACTUAL_FINISH_DATE
FROM TASK
WHERE ACTUAL_FINISH_DATE IS NOT NULL
UNION ALL
SELECT START_DATE
FROM TASK_STATUS
UNION ALL
SELECT FINISH_DATE
FROM TASK_STATUS
WHERE FINISH_DATE IS NOT NULL
UNION ALL
SELECT START_DATE
FROM JOB_CONTRACT
UNION ALL
SELECT FINISH_DATE
FROM JOB_CONTRACT
WHERE FINISH_DATE IS NOT NULL
ORDER BY 1 DESC;

/*
48. ������� ���� �����������, ������� �������� ���� �� ��� ����� ������ ���������.
*/
WITH Project_employee AS (
    SELECT ID_PROJECT, E.*
    FROM PROJECT_MANAGER PM JOIN EMPLOYEE E on E.ID = PM.ID_MANAGER
    UNION
    SELECT ID_PROJECT, E.*
    FROM TASK_EMPLOYEE TE JOIN TASK T ON T.ID = TE.ID_TASK
        JOIN PROJECT P ON T.ID_PROJECT = P.ID
        JOIN EMPLOYEE E ON TE.ID_EMPLOYEE = E.ID
)
SELECT PE1.NAME, PE1.SURNAME, PE2.NAME, PE2.SURNAME
FROM Project_employee PE1 JOIN Project_employee PE2 ON PE1.ID_PROJECT = PE2.ID_PROJECT
WHERE PE1.ID < PE2.ID
GROUP BY PE1.ID, PE2.ID, PE1.NAME, PE1.SURNAME, PE2.NAME, PE2.SURNAME
HAVING COUNT (*) >= 2;

/*
49. ������� ����, ������� ���� ������ ����������� � ���� ������
*/
WITH DATE_COUNT AS (
    SELECT Dt, COUNT(*) cnt
    FROM (
        SELECT START_DATE Dt
        FROM PROJECT P
        UNION ALL
        SELECT START_DATE
        FROM PROJECT_MANAGER
        UNION ALL
        SELECT FINISH_DATE
        FROM PROJECT_MANAGER
        WHERE FINISH_DATE IS NOT NULL
        UNION ALL
        SELECT START_DATE
        FROM TASK
        UNION ALL
        SELECT PLAN_FINISH_DATE
        FROM TASK
        UNION ALL
        SELECT ACTUAL_FINISH_DATE
        FROM TASK
        WHERE ACTUAL_FINISH_DATE IS NOT NULL
        UNION ALL
        SELECT START_DATE
        FROM TASK_STATUS
        UNION ALL
        SELECT FINISH_DATE
        FROM TASK_STATUS
        WHERE FINISH_DATE IS NOT NULL
        UNION ALL
        SELECT START_DATE
        FROM JOB_CONTRACT
        UNION ALL
        SELECT FINISH_DATE
        FROM JOB_CONTRACT
        WHERE FINISH_DATE IS NOT NULL
    )
    GROUP BY Dt
)
SELECT Dt
FROM DATE_COUNT
WHERE cnt = (
    SELECT MAX(cnt)
    FROM DATE_COUNT
    );

/*
50. ������� ��� ������ � ������������� �������, ��� �������� �������� ����������, ��������� ������� �� ������� ����
� 1/3 �� ���� ��������
*/
WITH employee_third AS (
    SELECT ID
    FROM (
        SELECT ID_PROJECT, E.*
        FROM PROJECT_MANAGER PM
            JOIN EMPLOYEE E on E.ID = PM.ID_MANAGER
        UNION ALL
        SELECT ID_PROJECT, E.*
        FROM TASK_EMPLOYEE TE JOIN TASK T ON T.ID = TE.ID_TASK
            JOIN PROJECT P ON T.ID_PROJECT = P.ID
            JOIN EMPLOYEE E ON TE.ID_EMPLOYEE = E.ID
    ) pe
    GROUP BY ID, SURNAME, NAME, PATRONYMIC, BIRTHDATE
    HAVING COUNT(DISTINCT ID_PROJECT) >= (1. / 3) * (SELECT COUNT(*) FROM PROJECT)
)
SELECT DISTINCT T.*
FROM TASK T JOIN TASK_EMPLOYEE TE on T.ID = TE.ID_TASK
WHERE T.ACTUAL_FINISH_DATE IS NULL AND EXISTS (
    SELECT 1
    FROM employee_third et
    WHERE TE.ID_EMPLOYEE = et.ID
    );

/*
51. ������� ��� ��������� ������� ����� �������� �����.
*/
WITH status_changes AS (
    SELECT TS1.ID AS cur, TS2.ID AS next, TS1.ID_TASK AS id_task, TS1.ID_STATUS AS id_status
    FROM TASK_STATUS TS1
        LEFT JOIN TASK_STATUS TS2 ON TS1.ID_TASK = TS2.ID_TASK AND TS1.FINISH_DATE = TS2.START_DATE
)
SELECT LEVEL, LPAD(' ', 2 * (LEVEL - 1)) || sc.ID_TASK AS ID_TASK, S.NAME AS status, T.TITLE AS task
FROM status_changes sc
    JOIN TASK T ON sc.id_task = T.ID
    JOIN STATUS S ON sc.id_status = S.ID
CONNECT BY sc.next = PRIOR sc.cur
START WITH sc.next IS NULL;

/*
52. ������� ����� ������� ������� ����� �������� �����.
*/
WITH status_changes AS (
    SELECT TS1.ID AS cur, TS2.ID AS next, TS1.ID_TASK AS id_task, TS1.ID_STATUS AS id_status
    FROM TASK_STATUS TS1
        LEFT JOIN TASK_STATUS TS2 ON TS1.ID_TASK = TS2.ID_TASK AND TS1.FINISH_DATE = TS2.START_DATE
),
hierarchy AS (
    SELECT LEVEL AS lvl, sc.ID_TASK AS ID_TASK, S.NAME AS status, T.TITLE AS task
    FROM status_changes sc
        JOIN TASK T ON sc.id_task = T.ID
        JOIN STATUS S ON sc.id_status = S.ID
    CONNECT BY sc.next = PRIOR sc.cur
    START WITH sc.next IS NULL
)
SELECT h.lvl, LPAD(' ', 2 * (h.lvl - 1)) || h.ID_TASK AS ID_TASK, h.status AS status, h.task AS task
FROM hierarchy h
WHERE EXISTS (
    SELECT 1
    FROM hierarchy h2
    WHERE h.ID_TASK = h2.ID_TASK
        AND h2.lvl = (SELECT MAX(h3.lvl) FROM hierarchy h3)
    );


WITH longest AS (
    SELECT TS.ID_TASK
    FROM TASK_STATUS TS
    GROUP BY TS.ID_TASK
    HAVING COUNT(*) = (
        SELECT MAX(COUNT(*))
        FROM TASK_STATUS TS1
        GROUP BY TS1.ID_TASK
        )
),
status_changes AS (
    SELECT TS1.ID AS cur, TS2.ID AS next, TS1.ID_TASK AS id_task, TS1.ID_STATUS AS id_status
    FROM TASK_STATUS TS1
        LEFT JOIN TASK_STATUS TS2 ON TS1.ID_TASK = TS2.ID_TASK AND TS1.FINISH_DATE = TS2.START_DATE
    WHERE TS1.ID_TASK IN (
        SELECT ID_TASK
        FROM longest
        )
),
hierarchy AS (
    SELECT LEVEL AS lvl, sc.ID_TASK AS ID_TASK, S.NAME AS status, T.TITLE AS task
    FROM status_changes sc
        JOIN TASK T ON sc.id_task = T.ID
        JOIN STATUS S ON sc.id_status = S.ID
    CONNECT BY sc.next = PRIOR sc.cur
    START WITH sc.next IS NULL
)
SELECT h.lvl, LPAD(' ', 2 * (h.lvl - 1)) || h.ID_TASK AS ID_TASK, h.status AS status, h.task AS task
FROM hierarchy h
WHERE EXISTS (
    SELECT 1
    FROM hierarchy h2
    WHERE h.ID_TASK = h2.ID_TASK
        AND h2.lvl = (SELECT MAX(h3.lvl) FROM hierarchy h3)
    );


/*
53. ������� ������, ���������� �������� �����, ���������� ���������
�������� ����� � ������ ���������� �����.
*/
SELECT DISTINCT
    P.*,
    COUNT(T.ACTUAL_FINISH_DATE) OVER(PARTITION BY P.ID) AS cnt_solved,
    CASE
        WHEN COUNT(T.PLAN_FINISH_DATE) OVER (PARTITION BY P.ID) = 0
        THEN -1
        ELSE COUNT(T.ACTUAL_FINISH_DATE) OVER (PARTITION BY P.ID) * 1.0 / COUNT(T.PLAN_FINISH_DATE) OVER (PARTITION BY P.ID) * 100
    END prcnt
FROM PROJECT P LEFT JOIN TASK T on P.ID = T.ID_PROJECT
ORDER BY P.ID;

SELECT
    P.*,
    COUNT(T.ACTUAL_FINISH_DATE) AS cnt_solved,
    CASE
        WHEN COUNT(T.PLAN_FINISH_DATE) = 0
        THEN -1
        ELSE COUNT(T.ACTUAL_FINISH_DATE) * 1.0 / COUNT(T.PLAN_FINISH_DATE) * 100
    END prcnt
FROM PROJECT P LEFT JOIN TASK T on P.ID = T.ID_PROJECT
GROUP BY P.ID, P.TITLE, P.SHORT_TITLE, P.DESCRIPTION, P.START_DATE
ORDER BY P.ID;


