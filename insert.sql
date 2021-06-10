INSERT INTO Position (id, name) 
VALUES (POSITION_SEQ.NEXTVAL, 'Java-программист');
INSERT INTO Position (id, name) 
VALUES (POSITION_SEQ.NEXTVAL, 'C#-программист');
INSERT INTO Position (id, name) 
VALUES (POSITION_SEQ.NEXTVAL, 'Администратор');
INSERT INTO Position (id, name) 
VALUES (POSITION_SEQ.NEXTVAL, 'Аналитик');
INSERT INTO Position (id, name) 
VALUES (POSITION_SEQ.NEXTVAL, 'Дизайнер');
INSERT INTO Position (id, name)
VALUES (POSITION_SEQ.NEXTVAL, 'Тестировщик');

INSERT INTO Priority (id, name)
VALUES (PRIORITY_SEQ.NEXTVAL, 'Низкий');
INSERT INTO Priority (id, name)
VALUES (PRIORITY_SEQ.NEXTVAL, 'Средний');
INSERT INTO Priority (id, name)
VALUES (PRIORITY_SEQ.NEXTVAL, 'Высокий');


INSERT INTO Status (id, name)
VALUES (STATUS_SEQ.NEXTVAL, 'Открыта');
INSERT INTO Status (id, name)
VALUES (STATUS_SEQ.NEXTVAL, 'Анализ');
INSERT INTO Status (id, name)
VALUES (STATUS_SEQ.NEXTVAL, 'Разработка');
INSERT INTO Status (id, name)
VALUES (STATUS_SEQ.NEXTVAL, 'Тестирование');
INSERT INTO Status (id, name)
VALUES (STATUS_SEQ.NEXTVAL, 'Закрыта');


INSERT INTO Type (id, name)
VALUES (TYPE_SEQ.NEXTVAL, 'Программирование');
INSERT INTO Type (id, name)
VALUES (TYPE_SEQ.NEXTVAL, 'Тестирование');
INSERT INTO Type (id, name)
VALUES (TYPE_SEQ.NEXTVAL, 'Code review');
INSERT INTO Type (id, name)
VALUES (TYPE_SEQ.NEXTVAL, 'Работа с БД');
INSERT INTO Type (id, name)
VALUES (TYPE_SEQ.NEXTVAL, 'Разработка дизайна');


INSERT INTO Employee(id, surname, name, patronymic, birthdate)
VALUES (EMPLOYEE_SEQ.NEXTVAL, 'Петров', 'Иван', 'Васильевич', TO_DATE('01.01.1995', 'dd.mm.yyyy'));
INSERT INTO Employee(id, surname, name, patronymic, birthdate)
VALUES (EMPLOYEE_SEQ.NEXTVAL, 'Иванов', 'Николай', 'Исаакович', TO_DATE('01.01.1998', 'dd.mm.yyyy'));
INSERT INTO Employee(id, surname, name, patronymic, birthdate)
VALUES (EMPLOYEE_SEQ.NEXTVAL, 'Иванов', 'Дмитрий', 'Иосифович', TO_DATE('01.01.2000', 'dd.mm.yyyy'));
INSERT INTO Employee(id, surname, name, patronymic, birthdate)
VALUES (EMPLOYEE_SEQ.NEXTVAL, 'Иванов', 'Иван', 'Иванович', TO_DATE('01.01.1990', 'dd.mm.yyyy'));
INSERT INTO Employee(id, surname, name, patronymic, birthdate)
VALUES (EMPLOYEE_SEQ.NEXTVAL, 'Николаев', 'Николай', 'Николаевич', TO_DATE('01.01.1995', 'dd.mm.yyyy'));
INSERT INTO Employee(id, surname, name, patronymic, birthdate)
VALUES (EMPLOYEE_SEQ.NEXTVAL, 'Петров', 'Петр', 'Петрович', TO_DATE('01.01.1980', 'dd.mm.yyyy'));
INSERT INTO Employee(id, surname, name, patronymic, birthdate)
VALUES (EMPLOYEE_SEQ.NEXTVAL, 'Джобс', 'Стив', NULL, NULL);
INSERT INTO Employee(id, surname, name, patronymic, birthdate)
VALUES (EMPLOYEE_SEQ.NEXTVAL, 'Ли', 'Алиса', NULL, TO_DATE('01.01.2000', 'dd.mm.yyyy'));
INSERT INTO Employee(id, surname, name, patronymic, birthdate)
VALUES (EMPLOYEE_SEQ.NEXTVAL, 'Крысина', 'Кристина', 'Петровна', TO_DATE('01.01.2001', 'dd.mm.yyyy'));
INSERT INTO Employee(id, surname, name, patronymic, birthdate)
VALUES (EMPLOYEE_SEQ.NEXTVAL, 'Котова', 'Мария', 'Николаевна', TO_DATE('01.01.2001', 'dd.mm.yyyy'));
INSERT INTO Employee(id, surname, name, patronymic, birthdate)
VALUES (EMPLOYEE_SEQ.NEXTVAL, 'Собакин', 'Никита', 'Сергеевич', TO_DATE('01.01.2001', 'dd.mm.yyyy'));
INSERT INTO Employee(id, surname, name, patronymic, birthdate)
VALUES (EMPLOYEE_SEQ.NEXTVAL, 'Шавкин', 'Егор', 'Егорович', TO_DATE('01.01.2001', 'dd.mm.yyyy'));
INSERT INTO Employee(id, surname, name, patronymic, birthdate)
VALUES (EMPLOYEE_SEQ.NEXTVAL, 'Птицын', 'Валентин', 'Николаевич', TO_DATE('01.01.2001', 'dd.mm.yyyy'));


INSERT INTO Project(id, title, description, start_date, short_title)
VALUES (PROJECT_SEQ.NEXTVAL, 'У этого проекта нет задач и руководителя', 'Тут могла бы быть ваша реклама', TO_DATE('01.01.2021', 'dd.mm.yyyy'), NULL);
INSERT INTO Project(id, title, description, start_date, short_title)
VALUES (PROJECT_SEQ.NEXTVAL, 'Индустриальная поисковая система книг', 'В этом описании больше 3 слов', TO_DATE('01.01.2021', 'dd.mm.yyyy'), 'ИПС BOOK');
INSERT INTO Project(id, title, description, start_date, short_title)
VALUES (PROJECT_SEQ.NEXTVAL, 'Очень важное приложение для детей', 'В этом-описании больше 3 слов, но есть!', TO_DATE('01.12.2020', 'dd.mm.yyyy'), 'Детское');
INSERT INTO Project(id, title, description, start_date, short_title)
VALUES (PROJECT_SEQ.NEXTVAL, 'Приложение для подсчета слов в описании', 'Тут есть 3 слова.', TO_DATE('01.02.2021', 'dd.mm.yyyy'), 'Подсчет слов');
INSERT INTO Project(id, title, description, start_date, short_title)
VALUES (PROJECT_SEQ.NEXTVAL, 'X', 'Это секретный проект', TO_DATE('01.01.2014', 'dd.mm.yyyy'), NULL);
INSERT INTO Project(id, title, description, start_date, short_title)
VALUES (PROJECT_SEQ.NEXTVAL, 'Приложение для сети ресторанов', '!!!!!!!!', TO_DATE('12.1.2021', 'dd.mm.yyyy'), 'Ресторан');


INSERT INTO Job_contract(id, id_employee, id_position, start_date, finish_date)
VALUES (JOB_CONTRACT_SEQ.NEXTVAL,
        (
            SELECT id
            FROM Employee
            WHERE Surname = 'Крысина' AND Name = 'Кристина' AND Patronymic = 'Петровна'
        ),
        (
            SELECT id
            FROM Position
            WHERE name = 'Java-программист'
        ),
        TO_DATE('01.01.2021', 'dd.mm.yyyy'),
        NULL
);
INSERT INTO Job_contract(id, id_employee, id_position, start_date, finish_date)
VALUES (JOB_CONTRACT_SEQ.NEXTVAL,
        (
            SELECT id
            FROM Employee
            WHERE Surname = 'Котова' AND Name = 'Мария' AND Patronymic = 'Николаевна'
        ),
        (
            SELECT id
            FROM Position
            WHERE name = 'Java-программист'
        ),
        TO_DATE('01.01.2021', 'dd.mm.yyyy'),
        NULL
);
INSERT INTO Job_contract(id, id_employee, id_position, start_date, finish_date)
VALUES (JOB_CONTRACT_SEQ.NEXTVAL,
        (
            SELECT id
            FROM Employee
            WHERE Surname = 'Собакин' AND Name = 'Никита' AND Patronymic = 'Сергеевич'
        ),
        (
            SELECT id
            FROM Position
            WHERE name = 'Java-программист'
        ),
        TO_DATE('01.01.2021', 'dd.mm.yyyy'),
        NULL
);
INSERT INTO Job_contract(id, id_employee, id_position, start_date, finish_date)
VALUES (JOB_CONTRACT_SEQ.NEXTVAL,
        (
            SELECT id
            FROM Employee
            WHERE Surname = 'Шавкин' AND Name = 'Егор' AND Patronymic = 'Егорович'
        ),
        (
            SELECT id
            FROM Position
            WHERE name = 'C#-программист'
        ),
        TO_DATE('01.01.2021', 'dd.mm.yyyy'),
        NULL
);
INSERT INTO Job_contract(id, id_employee, id_position, start_date, finish_date)
VALUES (JOB_CONTRACT_SEQ.NEXTVAL,
        (
            SELECT id
            FROM Employee
            WHERE Surname = 'Птицын' AND Name = 'Валентин' AND Patronymic = 'Николаевич'
        ),
        (
            SELECT id
            FROM Position
            WHERE name = 'C#-программист'
        ),
        TO_DATE('01.01.2021', 'dd.mm.yyyy'),
        NULL
);
INSERT INTO Job_contract(id, id_employee, id_position, start_date, finish_date)
VALUES (JOB_CONTRACT_SEQ.NEXTVAL, 
        (
            SELECT id
            FROM Employee
            WHERE Surname = 'Иванов' AND Name = 'Иван' AND Patronymic = 'Иванович'
        ),
        (
            SELECT id
            FROM Position
            WHERE name = 'Java-программист'
        ),
        TO_DATE('01.01.2004', 'dd.mm.yyyy'),
        TO_DATE('01.01.2009', 'dd.mm.yyyy')
);
INSERT INTO Job_contract(id, id_employee, id_position, start_date, finish_date)
VALUES (JOB_CONTRACT_SEQ.NEXTVAL, 
        (
            SELECT id
            FROM Employee
            WHERE Surname = 'Иванов' AND Name = 'Иван' AND Patronymic = 'Иванович'
        ),
        (
            SELECT id
            FROM Position
            WHERE name = 'Аналитик'
        ),
        TO_DATE('01.01.2009', 'dd.mm.yyyy'),
        NULL
);
INSERT INTO Job_contract(id, id_employee, id_position, start_date, finish_date)
VALUES (JOB_CONTRACT_SEQ.NEXTVAL, 
        (
            SELECT id
            FROM Employee
            WHERE Surname = 'Николаев' AND Name = 'Николай' AND Patronymic = 'Николаевич'
        ),
        (
            SELECT id
            FROM Position
            WHERE name = 'C#-программист'
        ),
        TO_DATE('01.01.2015', 'dd.mm.yyyy'),
        NULL
);
INSERT INTO Job_contract(id, id_employee, id_position, start_date, finish_date)
VALUES (JOB_CONTRACT_SEQ.NEXTVAL, 
        (
            SELECT id
            FROM Employee
            WHERE Surname = 'Петров' AND Name = 'Петр' AND Patronymic = 'Петрович'
        ),
        (
            SELECT id
            FROM Position
            WHERE name = 'Администратор'
        ),
        TO_DATE('01.01.2019', 'dd.mm.yyyy'),
        NULL
);
INSERT INTO Job_contract(id, id_employee, id_position, start_date, finish_date)
VALUES (JOB_CONTRACT_SEQ.NEXTVAL, 
        (
            SELECT id
            FROM Employee
            WHERE Surname = 'Джобс' AND Name = 'Стив' AND Patronymic IS NULL
        ),
        (
            SELECT id
            FROM Position
            WHERE name = 'C#-программист'
        ),
        TO_DATE('01.01.2003', 'dd.mm.yyyy'),
        TO_DATE('01.01.2010', 'dd.mm.yyyy')
);
INSERT INTO Job_contract(id, id_employee, id_position, start_date, finish_date)
VALUES (JOB_CONTRACT_SEQ.NEXTVAL, 
        (
            SELECT id
            FROM Employee
            WHERE Surname = 'Джобс' AND Name = 'Стив' AND Patronymic IS NULL
        ),
        (
            SELECT id
            FROM Position
            WHERE name = 'Аналитик'
        ),
        TO_DATE('01.01.2010', 'dd.mm.yyyy'),
        NULL
);
INSERT INTO Job_contract(id, id_employee, id_position, start_date, finish_date)
VALUES (JOB_CONTRACT_SEQ.NEXTVAL, 
        (
            SELECT id
            FROM Employee
            WHERE Surname = 'Ли' AND Name = 'Алиса' AND Patronymic IS NULL
        ),
        (
            SELECT id
            FROM Position
            WHERE name = 'Дизайнер'
        ),
        TO_DATE('01.01.2019', 'dd.mm.yyyy'),
        NULL
);


INSERT INTO PROJECT_MANAGER(id, id_manager, id_project, start_date, finish_date)
VALUES (PROJECT_MANAGER_SEQ.NEXTVAL, 
        (
            SELECT id
            FROM Employee
            WHERE Surname = 'Джобс' AND Name = 'Стив' AND Patronymic IS NULL
        ),
        (
            SELECT id
            FROM Project
            WHERE title = 'Индустриальная поисковая система книг'
        ),
        TO_DATE('01.01.2015', 'dd.mm.yyyy'),
        NULL
);
INSERT INTO PROJECT_MANAGER(id, id_manager, id_project, start_date, finish_date)
VALUES (PROJECT_MANAGER_SEQ.NEXTVAL, 
        (
            SELECT id
            FROM Employee
            WHERE Surname = 'Джобс' AND Name = 'Стив' AND Patronymic IS NULL
        ),
        (
            SELECT id
            FROM Project
            WHERE title = 'Очень важное приложение для детей'
        ),
        TO_DATE('01.01.2013', 'dd.mm.yyyy'),
        TO_DATE('01.01.2015', 'dd.mm.yyyy')
);
INSERT INTO PROJECT_MANAGER(id, id_manager, id_project, start_date, finish_date)
VALUES (PROJECT_MANAGER_SEQ.NEXTVAL, 
        (
            SELECT id
            FROM Employee
            WHERE Surname = 'Иванов' AND Name = 'Иван' AND Patronymic = 'Иванович'
        ),
        (
            SELECT id
            FROM Project
            WHERE title = 'Очень важное приложение для детей'
        ),
        TO_DATE('01.01.2015', 'dd.mm.yyyy'),
        NULL
);
INSERT INTO PROJECT_MANAGER(id, id_manager, id_project, start_date, finish_date)
VALUES (PROJECT_MANAGER_SEQ.NEXTVAL, 
        (
            SELECT id
            FROM Employee
            WHERE Surname = 'Николаев' AND Name = 'Николай' AND Patronymic = 'Николаевич'
        ),
        (
            SELECT id
            FROM Project
            WHERE title = 'Приложение для подсчета слов в описании'
        ),
        TO_DATE('01.01.2019', 'dd.mm.yyyy'),
        NULL
);
INSERT INTO PROJECT_MANAGER(id, id_manager, id_project, start_date, finish_date)
VALUES (PROJECT_MANAGER_SEQ.NEXTVAL, 
        (
            SELECT id
            FROM Employee
            WHERE Surname = 'Николаев' AND Name = 'Николай' AND Patronymic = 'Николаевич'
        ),
        (
            SELECT id
            FROM Project
            WHERE title = 'X'
        ),
        TO_DATE('01.12.2020', 'dd.mm.yyyy'),
        NULL
);
INSERT INTO PROJECT_MANAGER(id, id_manager, id_project, start_date, finish_date)
VALUES (PROJECT_MANAGER_SEQ.NEXTVAL, 
        (
            SELECT id
            FROM Employee
            WHERE Surname = 'Ли' AND Name = 'Алиса' AND Patronymic IS NULL
        ),
        (
            SELECT id
            FROM Project
            WHERE title = 'Приложение для сети ресторанов'
        ),
        TO_DATE('01.01.2021', 'dd.mm.yyyy'),
        NULL
);




INSERT INTO TASK(id, id_project, id_type, id_priority, title, description, start_date, plan_finish_date, actual_finish_date)
VALUES (TASK_SEQ.NEXTVAL,
        (
            SELECT ID
            FROM PROJECT
            WHERE title = 'Индустриальная поисковая система книг'
        ),
        (
            SELECT id
            FROM TYPE
            WHERE name = 'Программирование'
        ),
        (
            SELECT id
            FROM PRIORITY
            WHERE name = 'Высокий'
        ),
        'Незавершенное задание 1',
        'его еще не сделали!',
        TO_DATE('01.02.2013', 'dd.mm.yyyy'),
        TO_DATE('01.03.2017', 'dd.mm.yyyy'),
        NULL
);
INSERT INTO TASK(id, id_project, id_type, id_priority, title, description, start_date, plan_finish_date, actual_finish_date)
VALUES (TASK_SEQ.NEXTVAL,
        (
            SELECT ID
            FROM PROJECT
            WHERE title = 'X'
        ),
        (
            SELECT id
            FROM TYPE
            WHERE name = 'Программирование'
        ),
        (
            SELECT id
            FROM PRIORITY
            WHERE name = 'Средний'
        ),
        'Незавершенное задание 1',
        'его еще не сделали!',
        TO_DATE('01.02.2014', 'dd.mm.yyyy'),
        TO_DATE('01.03.2014', 'dd.mm.yyyy'),
        NULL
);
INSERT INTO TASK(id, id_project, id_type, id_priority, title, description, start_date, plan_finish_date, actual_finish_date)
VALUES (TASK_SEQ.NEXTVAL,
        (
            SELECT ID
            FROM PROJECT
            WHERE title = 'X'
        ),
        (
            SELECT id
            FROM TYPE
            WHERE name = 'Программирование'
        ),
        (
            SELECT id
            FROM PRIORITY
            WHERE name = 'Низкий'
        ),
        'Незавершенное задание 2',
        'его еще не сделали 2!',
        TO_DATE('01.02.2014', 'dd.mm.yyyy'),
        TO_DATE('01.03.2014', 'dd.mm.yyyy'),
        NULL
);
INSERT INTO TASK(id, id_project, id_type, id_priority, title, description, start_date, plan_finish_date, actual_finish_date)
VALUES (TASK_SEQ.NEXTVAL,
        (
            SELECT ID
            FROM PROJECT
            WHERE title = 'X'
        ),
        (
            SELECT id
            FROM TYPE
            WHERE name = 'Программирование'
        ),
        (
            SELECT id
            FROM PRIORITY
            WHERE name = 'Средний'
        ),
        'Незавершенное задание 3',
        'его еще не сделали 3!',
        TO_DATE('01.02.2014', 'dd.mm.yyyy'),
        TO_DATE('01.03.2014', 'dd.mm.yyyy'),
        NULL
);
INSERT INTO TASK(id, id_project, id_type, id_priority, title, description, start_date, plan_finish_date, actual_finish_date)
VALUES (TASK_SEQ.NEXTVAL,
        (
            SELECT ID
            FROM PROJECT
            WHERE title = 'X'
        ),
        (
            SELECT id
            FROM TYPE
            WHERE name = 'Программирование'
        ),
        (
            SELECT id
            FROM PRIORITY
            WHERE name = 'Высокий'
        ),
        'Незавершенное задание 4',
        'его еще не сделали 4!',
        TO_DATE('01.02.2014', 'dd.mm.yyyy'),
        TO_DATE('01.03.2014', 'dd.mm.yyyy'),
        NULL
);
INSERT INTO Task(id, id_project, id_type, id_priority, title, description, start_date, plan_finish_date, actual_finish_date)
VALUES (TASK_SEQ.NEXTVAL, 
        (
            SELECT id
            FROM Project 
            WHERE title = 'Индустриальная поисковая система книг'
        ),
        (
            SELECT id
            FROM Type
            WHERE name = 'Программирование'
        ),
        (
            SELECT id
            FROM Priority
            WHERE name = 'Средний'
        ),
        'Задание для 11 запроса ровно в срок',
        'Сделать что-нибудь ровно в срок',
        TO_DATE('01.01.2019', 'dd.mm.yyyy'),
        TO_DATE('01.05.2019', 'dd.mm.yyyy'),
        TO_DATE('01.05.2019', 'dd.mm.yyyy')
);
INSERT INTO Task(id, id_project, id_type, id_priority, title, description, start_date, plan_finish_date, actual_finish_date)
VALUES (TASK_SEQ.NEXTVAL, 
        (
            SELECT id
            FROM Project 
            WHERE title = 'Индустриальная поисковая система книг'
        ),
        (
            SELECT id
            FROM Type
            WHERE name = 'Программирование'
        ),
        (
            SELECT id
            FROM Priority
            WHERE name = 'Средний'
        ),
        'Задание для 11 запроса',
        'Сделать что-нибудь',
        TO_DATE('01.01.2019', 'dd.mm.yyyy'),
        TO_DATE('01.05.2019', 'dd.mm.yyyy'),
        TO_DATE('01.02.2019', 'dd.mm.yyyy')
);
INSERT INTO Task(id, id_project, id_type, id_priority, title, description, start_date, plan_finish_date, actual_finish_date)
VALUES (TASK_SEQ.NEXTVAL, 
        (
            SELECT id
            FROM Project 
            WHERE title = 'Индустриальная поисковая система книг'
        ),
        (
            SELECT id
            FROM Type
            WHERE name = 'Программирование'
        ),
        (
            SELECT id
            FROM Priority
            WHERE name = 'Высокий'
        ),
        'Задача про книги',
        'Запрограммировать класс книги по указаниям из ТЗ',
        TO_DATE('01.01.2019', 'dd.mm.yyyy'),
        TO_DATE('01.02.2019', 'dd.mm.yyyy'),
        TO_DATE('05.02.2019', 'dd.mm.yyyy')
);
INSERT INTO Task(id, id_project, id_type, id_priority, title, description, start_date, plan_finish_date, actual_finish_date)
VALUES (TASK_SEQ.NEXTVAL, 
        (
            SELECT id
            FROM Project 
            WHERE title = 'Индустриальная поисковая система книг'
        ),
        (
            SELECT id
            FROM Type
            WHERE name = 'Тестирование'
        ),
        (
            SELECT id
            FROM Priority
            WHERE name = 'Низкий'
        ),
        'Задача про тестирование книг',
        'Протестировать систему, чтобы все работало хорошо',
        TO_DATE('01.05.2019', 'dd.mm.yyyy'),
        TO_DATE('01.10.2019', 'dd.mm.yyyy'),
        NULL
);
INSERT INTO Task(id, id_project, id_type, id_priority, title, description, start_date, plan_finish_date, actual_finish_date)
VALUES (TASK_SEQ.NEXTVAL, 
        (
            SELECT id
            FROM Project 
            WHERE title = 'Очень важное приложение для детей'
        ),
        (
            SELECT id
            FROM Type
            WHERE name = 'Работа с БД'
        ),
        (
            SELECT id
            FROM Priority
            WHERE name = 'Средний'
        ),
        'БД и дети',
        'Спроектировать базу данных и заполнить тестовыми данными',
        TO_DATE('01.01.2021', 'dd.mm.yyyy'),
        TO_DATE('01.03.2021', 'dd.mm.yyyy'),
        TO_DATE('01.03.2021', 'dd.mm.yyyy')
);
INSERT INTO Task(id, id_project, id_type, id_priority, title, description, start_date, plan_finish_date, actual_finish_date)
VALUES (TASK_SEQ.NEXTVAL, 
        (
            SELECT id
            FROM Project 
            WHERE title = 'Приложение для подсчета слов в описании'
        ),
        (
            SELECT id
            FROM Type
            WHERE name = 'Тестирование'
        ),
        (
            SELECT id
            FROM Priority
            WHERE name = 'Высокий'
        ),
        'Тест подсчета',
        'Протестировать работу приложения с разными строками, чтобы всегда работало',
        TO_DATE('01.03.2021', 'dd.mm.yyyy'),
        TO_DATE('01.04.2021', 'dd.mm.yyyy'),
        TO_DATE('01.04.2021', 'dd.mm.yyyy')
);
INSERT INTO Task(id, id_project, id_type, id_priority, title, description, start_date, plan_finish_date, actual_finish_date)
VALUES (TASK_SEQ.NEXTVAL, 
        (
            SELECT id
            FROM Project 
            WHERE title = 'X'
        ),
        (
            SELECT id
            FROM Type
            WHERE name = 'Code review'
        ),
        (
            SELECT id
            FROM Priority
            WHERE name = 'Низкий'
        ),
        'Секрет',
        'Это все равно никто никогда не прочитает',
        TO_DATE('01.03.2003', 'dd.mm.yyyy'),
        TO_DATE('01.04.2003', 'dd.mm.yyyy'),
        TO_DATE('01.05.2003', 'dd.mm.yyyy')
);
INSERT INTO Task(id, id_project, id_type, id_priority, title, description, start_date, plan_finish_date, actual_finish_date)
VALUES (TASK_SEQ.NEXTVAL, 
        (
            SELECT id
            FROM Project 
            WHERE title = 'Приложение для сети ресторанов'
        ),
        (
            SELECT id
            FROM Type
            WHERE name = 'Разработка дизайна'
        ),
        (
            SELECT id
            FROM Priority
            WHERE name = 'Средний'
        ),
        'Красивый дизайн',
        'Чтобы красиво было, и есть хотелось',
        TO_DATE('01.03.2021', 'dd.mm.yyyy'),
        TO_DATE('01.06.2021', 'dd.mm.yyyy'),
        TO_DATE('01.05.2021', 'dd.mm.yyyy')
);


INSERT INTO TASK_ORDER(id, id_parent_task, id_child_task)
VALUES (TASK_ORDER_SEQ.NEXTVAL,
        (
            SELECT id
            FROM task
            WHERE title = 'Задача про книги'
        ),
        (
            SELECT id
            FROM task
            WHERE title = 'Задача про тестирование книг'
        )
);


INSERT INTO TASK_EMPLOYEE(id, id_employee, id_task, is_leader, impact_percent)
VALUES (TASK_EMPLOYEE_SEQ.NEXTVAL,
        (
            SELECT id
            FROM employee
            WHERE Surname = 'Птицын' AND Name = 'Валентин' AND Patronymic = 'Николаевич'
        ),
        (
            SELECT id
            FROM Task
            WHERE title = 'Задача про книги'
        ),
        'N',
        10
);
INSERT INTO TASK_EMPLOYEE(id, id_employee, id_task, is_leader, impact_percent)
VALUES (TASK_EMPLOYEE_SEQ.NEXTVAL,
        (
            SELECT id
            FROM employee
            WHERE Surname = 'Котова' AND Name = 'Мария' AND Patronymic = 'Николаевна'
        ),
        (
            SELECT id
            FROM Task
            WHERE title = 'Задача про книги'
        ),
        'N',
        10
);
INSERT INTO TASK_EMPLOYEE(id, id_employee, id_task, is_leader, impact_percent)
VALUES (TASK_EMPLOYEE_SEQ.NEXTVAL,
        (
            SELECT id
            FROM employee
            WHERE Surname = 'Шавкин' AND Name = 'Егор' AND Patronymic = 'Егорович'
        ),
        (
            SELECT id
            FROM Task
            WHERE title = 'Задача про книги'
        ),
        'N',
        10
);
INSERT INTO TASK_EMPLOYEE(id, id_employee, id_task, is_leader, impact_percent)
VALUES (TASK_EMPLOYEE_SEQ.NEXTVAL,
        (
            SELECT id
            FROM employee
            WHERE Surname = 'Собакин' AND Name = 'Никита' AND Patronymic = 'Сергеевич'
        ),
        (
            SELECT id
            FROM Task
            WHERE title = 'Задача про книги'
        ),
        'N',
        10
);
INSERT INTO TASK_EMPLOYEE(id, id_employee, id_task, is_leader, impact_percent)
VALUES (TASK_EMPLOYEE_SEQ.NEXTVAL,
        (
            SELECT id
            FROM employee
            WHERE Surname = 'Джобс' AND Name = 'Стив' AND Patronymic IS NULL
        ),
        (
            SELECT id
            FROM Task
            WHERE title = 'Задача про книги'
        ),
        'Y',
        80
);
INSERT INTO TASK_EMPLOYEE(id, id_employee, id_task, is_leader, impact_percent)
VALUES (TASK_EMPLOYEE_SEQ.NEXTVAL,
        (
            SELECT id
            FROM employee
            WHERE Surname = 'Иванов' AND Name = 'Иван' AND Patronymic = 'Иванович'
        ),
        (
            SELECT id
            FROM Task
            WHERE title = 'Задача про книги'
        ),
        'N',
        20
);
INSERT INTO TASK_EMPLOYEE(id, id_employee, id_task, is_leader, impact_percent)
VALUES (TASK_EMPLOYEE_SEQ.NEXTVAL,
        (
            SELECT id
            FROM employee
            WHERE Surname = 'Джобс' AND Name = 'Стив' AND Patronymic IS NULL
        ),
        (
            SELECT id
            FROM Task
            WHERE title = 'Задача про тестирование книг'
        ),
        'Y',
        100
);
INSERT INTO TASK_EMPLOYEE(id, id_employee, id_task, is_leader, impact_percent)
VALUES (TASK_EMPLOYEE_SEQ.NEXTVAL,
        (
            SELECT id
            FROM employee
            WHERE Surname = 'Иванов' AND Name = 'Иван' AND Patronymic = 'Иванович'
        ),
        (
            SELECT id
            FROM Task
            WHERE title = 'БД и дети'
        ),
        'Y',
        30
);
INSERT INTO TASK_EMPLOYEE(id, id_employee, id_task, is_leader, impact_percent)
VALUES (TASK_EMPLOYEE_SEQ.NEXTVAL,
        (
            SELECT id
            FROM employee
            WHERE Surname = 'Петров' AND Name = 'Петр' AND Patronymic = 'Петрович'
        ),
        (
            SELECT id
            FROM Task
            WHERE title = 'БД и дети'
        ),
        'N',
        70
);
INSERT INTO TASK_EMPLOYEE(id, id_employee, id_task, is_leader, impact_percent)
VALUES (TASK_EMPLOYEE_SEQ.NEXTVAL,
        (
            SELECT id
            FROM employee
            WHERE Surname = 'Николаев' AND Name = 'Николай' AND Patronymic = 'Николаевич'
        ),
        (
            SELECT id
            FROM Task
            WHERE title = 'Тест подсчета'
        ),
        'Y',
        100
);
INSERT INTO TASK_EMPLOYEE(id, id_employee, id_task, is_leader, impact_percent)
VALUES (TASK_EMPLOYEE_SEQ.NEXTVAL,
        (
            SELECT id
            FROM employee
            WHERE Surname = 'Джобс' AND Name = 'Стив' AND Patronymic IS NULL
        ),
        (
            SELECT id
            FROM Task
            WHERE title = 'Секрет'
        ),
        'Y',
        100
);
INSERT INTO TASK_EMPLOYEE(id, id_employee, id_task, is_leader, impact_percent)
VALUES (TASK_EMPLOYEE_SEQ.NEXTVAL,
        (
            SELECT id
            FROM employee
            WHERE Surname = 'Ли' AND Name = 'Алиса' AND Patronymic IS NULL
        ),
        (
            SELECT id
            FROM Task
            WHERE title = 'Красивый дизайн'
        ),
        'Y',
        100
);


INSERT INTO TASK_STATUS(id, id_task, id_status, start_date, finish_date)
VALUES (TASK_STATUS_SEQ.NEXTVAL,
        (
            SELECT id
            FROM Task
            WHERE title = 'Задача про книги'
        ),
        (
            SELECT id
            FROM Status
            WHERE name = 'Открыта'
        ),
        TO_DATE('01.01.2008', 'dd.mm.yyyy'),
        TO_DATE('01.01.2009', 'dd.mm.yyyy')
);
INSERT INTO TASK_STATUS(id, id_task, id_status, start_date, finish_date)
VALUES (TASK_STATUS_SEQ.NEXTVAL,
        (
            SELECT id
            FROM Task
            WHERE title = 'Задача про книги'
        ),
        (
            SELECT id
            FROM Status
            WHERE name = 'Анализ'
        ),
        TO_DATE('01.01.2009', 'dd.mm.yyyy'),
        TO_DATE('01.01.2010', 'dd.mm.yyyy')
);
INSERT INTO TASK_STATUS(id, id_task, id_status, start_date, finish_date)
VALUES (TASK_STATUS_SEQ.NEXTVAL,
        (
            SELECT id
            FROM Task
            WHERE title = 'Задача про книги'
        ),
        (
            SELECT id
            FROM Status
            WHERE name = 'Разработка'
        ),
        TO_DATE('01.01.2010', 'dd.mm.yyyy'),
        NULL
);
INSERT INTO TASK_STATUS(id, id_task, id_status, start_date, finish_date)
VALUES (TASK_STATUS_SEQ.NEXTVAL,
        (
            SELECT id
            FROM Task
            WHERE title = 'Задача про тестирование книг'
        ),
        (
            SELECT id
            FROM Status
            WHERE name = 'Открыта'
        ),
        TO_DATE('01.01.2010', 'dd.mm.yyyy'),
        TO_DATE('01.01.2011', 'dd.mm.yyyy')
);
INSERT INTO TASK_STATUS(id, id_task, id_status, start_date, finish_date)
VALUES (TASK_STATUS_SEQ.NEXTVAL,
        (
            SELECT id
            FROM Task
            WHERE title = 'Задача про тестирование книг'
        ),
        (
            SELECT id
            FROM Status
            WHERE name = 'Анализ'
        ),
        TO_DATE('01.01.2011', 'dd.mm.yyyy'),
        TO_DATE('01.01.2012', 'dd.mm.yyyy')
);
INSERT INTO TASK_STATUS(id, id_task, id_status, start_date, finish_date)
VALUES (TASK_STATUS_SEQ.NEXTVAL,
        (
            SELECT id
            FROM Task
            WHERE title = 'Задача про тестирование книг'
        ),
        (
            SELECT id
            FROM Status
            WHERE name = 'Разработка'
        ),
        TO_DATE('01.01.2012', 'dd.mm.yyyy'),
        TO_DATE('01.01.2013', 'dd.mm.yyyy')
);
INSERT INTO TASK_STATUS(id, id_task, id_status, start_date, finish_date)
VALUES (TASK_STATUS_SEQ.NEXTVAL,
        (
            SELECT id
            FROM Task
            WHERE title = 'Задача про тестирование книг'
        ),
        (
            SELECT id
            FROM Status
            WHERE name = 'Тестирование'
        ),
        TO_DATE('01.01.2013', 'dd.mm.yyyy'),
        NULL
);
INSERT INTO TASK_STATUS(id, id_task, id_status, start_date, finish_date)
VALUES (TASK_STATUS_SEQ.NEXTVAL,
        (
            SELECT id
            FROM Task
            WHERE title = 'БД и дети'
        ),
        (
            SELECT id
            FROM Status
            WHERE name = 'Открыта'
        ),
        TO_DATE('01.01.2013', 'dd.mm.yyyy'),
        TO_DATE('01.01.2014', 'dd.mm.yyyy')
);
INSERT INTO TASK_STATUS(id, id_task, id_status, start_date, finish_date)
VALUES (TASK_STATUS_SEQ.NEXTVAL,
        (
            SELECT id
            FROM Task
            WHERE title = 'БД и дети'
        ),
        (
            SELECT id
            FROM Status
            WHERE name = 'Анализ'
        ),
        TO_DATE('01.01.2014', 'dd.mm.yyyy'),
        TO_DATE('01.01.2015', 'dd.mm.yyyy')
);
INSERT INTO TASK_STATUS(id, id_task, id_status, start_date, finish_date)
VALUES (TASK_STATUS_SEQ.NEXTVAL,
        (
            SELECT id
            FROM Task
            WHERE title = 'БД и дети'
        ),
        (
            SELECT id
            FROM Status
            WHERE name = 'Разработка'
        ),
        TO_DATE('01.01.2015', 'dd.mm.yyyy'),
        TO_DATE('01.01.2016', 'dd.mm.yyyy')
);
INSERT INTO TASK_STATUS(id, id_task, id_status, start_date, finish_date)
VALUES (TASK_STATUS_SEQ.NEXTVAL,
        (
            SELECT id
            FROM Task
            WHERE title = 'БД и дети'
        ),
        (
            SELECT id
            FROM Status
            WHERE name = 'Тестирование'
        ),
        TO_DATE('01.01.2016', 'dd.mm.yyyy'),
        TO_DATE('01.01.2017', 'dd.mm.yyyy')
);
INSERT INTO TASK_STATUS(id, id_task, id_status, start_date, finish_date)
VALUES (TASK_STATUS_SEQ.NEXTVAL,
        (
            SELECT id
            FROM Task
            WHERE title = 'БД и дети'
        ),
        (
            SELECT id
            FROM Status
            WHERE name = 'Закрыта'
        ),
        TO_DATE('01.01.2017', 'dd.mm.yyyy'),
        NULL
);
INSERT INTO TASK_STATUS(id, id_task, id_status, start_date, finish_date)
VALUES (TASK_STATUS_SEQ.NEXTVAL,
        (
            SELECT id
            FROM Task
            WHERE title = 'Тест подсчета'
        ),
        (
            SELECT id
            FROM Status
            WHERE name = 'Открыта'
        ),
        TO_DATE('01.01.2018', 'dd.mm.yyyy'),
        NULL
);
INSERT INTO TASK_STATUS(id, id_task, id_status, start_date, finish_date)
VALUES (TASK_STATUS_SEQ.NEXTVAL,
        (
            SELECT id
            FROM Task
            WHERE title = 'Секрет'
        ),
        (
            SELECT id
            FROM Status
            WHERE name = 'Открыта'
        ),
        TO_DATE('01.01.2019', 'dd.mm.yyyy'),
        NULL
);
INSERT INTO TASK_STATUS(id, id_task, id_status, start_date, finish_date)
VALUES (TASK_STATUS_SEQ.NEXTVAL,
        (
            SELECT id
            FROM Task
            WHERE title = 'Красивый дизайн'
        ),
        (
            SELECT id
            FROM Status
            WHERE name = 'Открыта'
        ),
        TO_DATE('01.01.2020', 'dd.mm.yyyy'),
        NULL
);
