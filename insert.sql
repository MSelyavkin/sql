INSERT INTO Position (id, name) 
VALUES (POSITION_SEQ.NEXTVAL, 'Java-�����������');
INSERT INTO Position (id, name) 
VALUES (POSITION_SEQ.NEXTVAL, 'C#-�����������');
INSERT INTO Position (id, name) 
VALUES (POSITION_SEQ.NEXTVAL, '�������������');
INSERT INTO Position (id, name) 
VALUES (POSITION_SEQ.NEXTVAL, '��������');
INSERT INTO Position (id, name) 
VALUES (POSITION_SEQ.NEXTVAL, '��������');
INSERT INTO Position (id, name)
VALUES (POSITION_SEQ.NEXTVAL, '�����������');

INSERT INTO Priority (id, name)
VALUES (PRIORITY_SEQ.NEXTVAL, '������');
INSERT INTO Priority (id, name)
VALUES (PRIORITY_SEQ.NEXTVAL, '�������');
INSERT INTO Priority (id, name)
VALUES (PRIORITY_SEQ.NEXTVAL, '�������');


INSERT INTO Status (id, name)
VALUES (STATUS_SEQ.NEXTVAL, '�������');
INSERT INTO Status (id, name)
VALUES (STATUS_SEQ.NEXTVAL, '������');
INSERT INTO Status (id, name)
VALUES (STATUS_SEQ.NEXTVAL, '����������');
INSERT INTO Status (id, name)
VALUES (STATUS_SEQ.NEXTVAL, '������������');
INSERT INTO Status (id, name)
VALUES (STATUS_SEQ.NEXTVAL, '�������');


INSERT INTO Type (id, name)
VALUES (TYPE_SEQ.NEXTVAL, '����������������');
INSERT INTO Type (id, name)
VALUES (TYPE_SEQ.NEXTVAL, '������������');
INSERT INTO Type (id, name)
VALUES (TYPE_SEQ.NEXTVAL, 'Code review');
INSERT INTO Type (id, name)
VALUES (TYPE_SEQ.NEXTVAL, '������ � ��');
INSERT INTO Type (id, name)
VALUES (TYPE_SEQ.NEXTVAL, '���������� �������');


INSERT INTO Employee(id, surname, name, patronymic, birthdate)
VALUES (EMPLOYEE_SEQ.NEXTVAL, '������', '����', '����������', TO_DATE('01.01.1995', 'dd.mm.yyyy'));
INSERT INTO Employee(id, surname, name, patronymic, birthdate)
VALUES (EMPLOYEE_SEQ.NEXTVAL, '������', '�������', '���������', TO_DATE('01.01.1998', 'dd.mm.yyyy'));
INSERT INTO Employee(id, surname, name, patronymic, birthdate)
VALUES (EMPLOYEE_SEQ.NEXTVAL, '������', '�������', '���������', TO_DATE('01.01.2000', 'dd.mm.yyyy'));
INSERT INTO Employee(id, surname, name, patronymic, birthdate)
VALUES (EMPLOYEE_SEQ.NEXTVAL, '������', '����', '��������', TO_DATE('01.01.1990', 'dd.mm.yyyy'));
INSERT INTO Employee(id, surname, name, patronymic, birthdate)
VALUES (EMPLOYEE_SEQ.NEXTVAL, '��������', '�������', '����������', TO_DATE('01.01.1995', 'dd.mm.yyyy'));
INSERT INTO Employee(id, surname, name, patronymic, birthdate)
VALUES (EMPLOYEE_SEQ.NEXTVAL, '������', '����', '��������', TO_DATE('01.01.1980', 'dd.mm.yyyy'));
INSERT INTO Employee(id, surname, name, patronymic, birthdate)
VALUES (EMPLOYEE_SEQ.NEXTVAL, '�����', '����', NULL, NULL);
INSERT INTO Employee(id, surname, name, patronymic, birthdate)
VALUES (EMPLOYEE_SEQ.NEXTVAL, '��', '�����', NULL, TO_DATE('01.01.2000', 'dd.mm.yyyy'));
INSERT INTO Employee(id, surname, name, patronymic, birthdate)
VALUES (EMPLOYEE_SEQ.NEXTVAL, '�������', '��������', '��������', TO_DATE('01.01.2001', 'dd.mm.yyyy'));
INSERT INTO Employee(id, surname, name, patronymic, birthdate)
VALUES (EMPLOYEE_SEQ.NEXTVAL, '������', '�����', '����������', TO_DATE('01.01.2001', 'dd.mm.yyyy'));
INSERT INTO Employee(id, surname, name, patronymic, birthdate)
VALUES (EMPLOYEE_SEQ.NEXTVAL, '�������', '������', '���������', TO_DATE('01.01.2001', 'dd.mm.yyyy'));
INSERT INTO Employee(id, surname, name, patronymic, birthdate)
VALUES (EMPLOYEE_SEQ.NEXTVAL, '������', '����', '��������', TO_DATE('01.01.2001', 'dd.mm.yyyy'));
INSERT INTO Employee(id, surname, name, patronymic, birthdate)
VALUES (EMPLOYEE_SEQ.NEXTVAL, '������', '��������', '����������', TO_DATE('01.01.2001', 'dd.mm.yyyy'));


INSERT INTO Project(id, title, description, start_date, short_title)
VALUES (PROJECT_SEQ.NEXTVAL, '� ����� ������� ��� ����� � ������������', '��� ����� �� ���� ���� �������', TO_DATE('01.01.2021', 'dd.mm.yyyy'), NULL);
INSERT INTO Project(id, title, description, start_date, short_title)
VALUES (PROJECT_SEQ.NEXTVAL, '�������������� ��������� ������� ����', '� ���� �������� ������ 3 ����', TO_DATE('01.01.2021', 'dd.mm.yyyy'), '��� BOOK');
INSERT INTO Project(id, title, description, start_date, short_title)
VALUES (PROJECT_SEQ.NEXTVAL, '����� ������ ���������� ��� �����', '� ����-�������� ������ 3 ����, �� ����!', TO_DATE('01.12.2020', 'dd.mm.yyyy'), '�������');
INSERT INTO Project(id, title, description, start_date, short_title)
VALUES (PROJECT_SEQ.NEXTVAL, '���������� ��� �������� ���� � ��������', '��� ���� 3 �����.', TO_DATE('01.02.2021', 'dd.mm.yyyy'), '������� ����');
INSERT INTO Project(id, title, description, start_date, short_title)
VALUES (PROJECT_SEQ.NEXTVAL, 'X', '��� ��������� ������', TO_DATE('01.01.2014', 'dd.mm.yyyy'), NULL);
INSERT INTO Project(id, title, description, start_date, short_title)
VALUES (PROJECT_SEQ.NEXTVAL, '���������� ��� ���� ����������', '!!!!!!!!', TO_DATE('12.1.2021', 'dd.mm.yyyy'), '��������');


INSERT INTO Job_contract(id, id_employee, id_position, start_date, finish_date)
VALUES (JOB_CONTRACT_SEQ.NEXTVAL,
        (
            SELECT id
            FROM Employee
            WHERE Surname = '�������' AND Name = '��������' AND Patronymic = '��������'
        ),
        (
            SELECT id
            FROM Position
            WHERE name = 'Java-�����������'
        ),
        TO_DATE('01.01.2021', 'dd.mm.yyyy'),
        NULL
);
INSERT INTO Job_contract(id, id_employee, id_position, start_date, finish_date)
VALUES (JOB_CONTRACT_SEQ.NEXTVAL,
        (
            SELECT id
            FROM Employee
            WHERE Surname = '������' AND Name = '�����' AND Patronymic = '����������'
        ),
        (
            SELECT id
            FROM Position
            WHERE name = 'Java-�����������'
        ),
        TO_DATE('01.01.2021', 'dd.mm.yyyy'),
        NULL
);
INSERT INTO Job_contract(id, id_employee, id_position, start_date, finish_date)
VALUES (JOB_CONTRACT_SEQ.NEXTVAL,
        (
            SELECT id
            FROM Employee
            WHERE Surname = '�������' AND Name = '������' AND Patronymic = '���������'
        ),
        (
            SELECT id
            FROM Position
            WHERE name = 'Java-�����������'
        ),
        TO_DATE('01.01.2021', 'dd.mm.yyyy'),
        NULL
);
INSERT INTO Job_contract(id, id_employee, id_position, start_date, finish_date)
VALUES (JOB_CONTRACT_SEQ.NEXTVAL,
        (
            SELECT id
            FROM Employee
            WHERE Surname = '������' AND Name = '����' AND Patronymic = '��������'
        ),
        (
            SELECT id
            FROM Position
            WHERE name = 'C#-�����������'
        ),
        TO_DATE('01.01.2021', 'dd.mm.yyyy'),
        NULL
);
INSERT INTO Job_contract(id, id_employee, id_position, start_date, finish_date)
VALUES (JOB_CONTRACT_SEQ.NEXTVAL,
        (
            SELECT id
            FROM Employee
            WHERE Surname = '������' AND Name = '��������' AND Patronymic = '����������'
        ),
        (
            SELECT id
            FROM Position
            WHERE name = 'C#-�����������'
        ),
        TO_DATE('01.01.2021', 'dd.mm.yyyy'),
        NULL
);
INSERT INTO Job_contract(id, id_employee, id_position, start_date, finish_date)
VALUES (JOB_CONTRACT_SEQ.NEXTVAL, 
        (
            SELECT id
            FROM Employee
            WHERE Surname = '������' AND Name = '����' AND Patronymic = '��������'
        ),
        (
            SELECT id
            FROM Position
            WHERE name = 'Java-�����������'
        ),
        TO_DATE('01.01.2004', 'dd.mm.yyyy'),
        TO_DATE('01.01.2009', 'dd.mm.yyyy')
);
INSERT INTO Job_contract(id, id_employee, id_position, start_date, finish_date)
VALUES (JOB_CONTRACT_SEQ.NEXTVAL, 
        (
            SELECT id
            FROM Employee
            WHERE Surname = '������' AND Name = '����' AND Patronymic = '��������'
        ),
        (
            SELECT id
            FROM Position
            WHERE name = '��������'
        ),
        TO_DATE('01.01.2009', 'dd.mm.yyyy'),
        NULL
);
INSERT INTO Job_contract(id, id_employee, id_position, start_date, finish_date)
VALUES (JOB_CONTRACT_SEQ.NEXTVAL, 
        (
            SELECT id
            FROM Employee
            WHERE Surname = '��������' AND Name = '�������' AND Patronymic = '����������'
        ),
        (
            SELECT id
            FROM Position
            WHERE name = 'C#-�����������'
        ),
        TO_DATE('01.01.2015', 'dd.mm.yyyy'),
        NULL
);
INSERT INTO Job_contract(id, id_employee, id_position, start_date, finish_date)
VALUES (JOB_CONTRACT_SEQ.NEXTVAL, 
        (
            SELECT id
            FROM Employee
            WHERE Surname = '������' AND Name = '����' AND Patronymic = '��������'
        ),
        (
            SELECT id
            FROM Position
            WHERE name = '�������������'
        ),
        TO_DATE('01.01.2019', 'dd.mm.yyyy'),
        NULL
);
INSERT INTO Job_contract(id, id_employee, id_position, start_date, finish_date)
VALUES (JOB_CONTRACT_SEQ.NEXTVAL, 
        (
            SELECT id
            FROM Employee
            WHERE Surname = '�����' AND Name = '����' AND Patronymic IS NULL
        ),
        (
            SELECT id
            FROM Position
            WHERE name = 'C#-�����������'
        ),
        TO_DATE('01.01.2003', 'dd.mm.yyyy'),
        TO_DATE('01.01.2010', 'dd.mm.yyyy')
);
INSERT INTO Job_contract(id, id_employee, id_position, start_date, finish_date)
VALUES (JOB_CONTRACT_SEQ.NEXTVAL, 
        (
            SELECT id
            FROM Employee
            WHERE Surname = '�����' AND Name = '����' AND Patronymic IS NULL
        ),
        (
            SELECT id
            FROM Position
            WHERE name = '��������'
        ),
        TO_DATE('01.01.2010', 'dd.mm.yyyy'),
        NULL
);
INSERT INTO Job_contract(id, id_employee, id_position, start_date, finish_date)
VALUES (JOB_CONTRACT_SEQ.NEXTVAL, 
        (
            SELECT id
            FROM Employee
            WHERE Surname = '��' AND Name = '�����' AND Patronymic IS NULL
        ),
        (
            SELECT id
            FROM Position
            WHERE name = '��������'
        ),
        TO_DATE('01.01.2019', 'dd.mm.yyyy'),
        NULL
);


INSERT INTO PROJECT_MANAGER(id, id_manager, id_project, start_date, finish_date)
VALUES (PROJECT_MANAGER_SEQ.NEXTVAL, 
        (
            SELECT id
            FROM Employee
            WHERE Surname = '�����' AND Name = '����' AND Patronymic IS NULL
        ),
        (
            SELECT id
            FROM Project
            WHERE title = '�������������� ��������� ������� ����'
        ),
        TO_DATE('01.01.2015', 'dd.mm.yyyy'),
        NULL
);
INSERT INTO PROJECT_MANAGER(id, id_manager, id_project, start_date, finish_date)
VALUES (PROJECT_MANAGER_SEQ.NEXTVAL, 
        (
            SELECT id
            FROM Employee
            WHERE Surname = '�����' AND Name = '����' AND Patronymic IS NULL
        ),
        (
            SELECT id
            FROM Project
            WHERE title = '����� ������ ���������� ��� �����'
        ),
        TO_DATE('01.01.2013', 'dd.mm.yyyy'),
        TO_DATE('01.01.2015', 'dd.mm.yyyy')
);
INSERT INTO PROJECT_MANAGER(id, id_manager, id_project, start_date, finish_date)
VALUES (PROJECT_MANAGER_SEQ.NEXTVAL, 
        (
            SELECT id
            FROM Employee
            WHERE Surname = '������' AND Name = '����' AND Patronymic = '��������'
        ),
        (
            SELECT id
            FROM Project
            WHERE title = '����� ������ ���������� ��� �����'
        ),
        TO_DATE('01.01.2015', 'dd.mm.yyyy'),
        NULL
);
INSERT INTO PROJECT_MANAGER(id, id_manager, id_project, start_date, finish_date)
VALUES (PROJECT_MANAGER_SEQ.NEXTVAL, 
        (
            SELECT id
            FROM Employee
            WHERE Surname = '��������' AND Name = '�������' AND Patronymic = '����������'
        ),
        (
            SELECT id
            FROM Project
            WHERE title = '���������� ��� �������� ���� � ��������'
        ),
        TO_DATE('01.01.2019', 'dd.mm.yyyy'),
        NULL
);
INSERT INTO PROJECT_MANAGER(id, id_manager, id_project, start_date, finish_date)
VALUES (PROJECT_MANAGER_SEQ.NEXTVAL, 
        (
            SELECT id
            FROM Employee
            WHERE Surname = '��������' AND Name = '�������' AND Patronymic = '����������'
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
            WHERE Surname = '��' AND Name = '�����' AND Patronymic IS NULL
        ),
        (
            SELECT id
            FROM Project
            WHERE title = '���������� ��� ���� ����������'
        ),
        TO_DATE('01.01.2021', 'dd.mm.yyyy'),
        NULL
);




INSERT INTO TASK(id, id_project, id_type, id_priority, title, description, start_date, plan_finish_date, actual_finish_date)
VALUES (TASK_SEQ.NEXTVAL,
        (
            SELECT ID
            FROM PROJECT
            WHERE title = '�������������� ��������� ������� ����'
        ),
        (
            SELECT id
            FROM TYPE
            WHERE name = '����������������'
        ),
        (
            SELECT id
            FROM PRIORITY
            WHERE name = '�������'
        ),
        '������������� ������� 1',
        '��� ��� �� �������!',
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
            WHERE name = '����������������'
        ),
        (
            SELECT id
            FROM PRIORITY
            WHERE name = '�������'
        ),
        '������������� ������� 1',
        '��� ��� �� �������!',
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
            WHERE name = '����������������'
        ),
        (
            SELECT id
            FROM PRIORITY
            WHERE name = '������'
        ),
        '������������� ������� 2',
        '��� ��� �� ������� 2!',
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
            WHERE name = '����������������'
        ),
        (
            SELECT id
            FROM PRIORITY
            WHERE name = '�������'
        ),
        '������������� ������� 3',
        '��� ��� �� ������� 3!',
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
            WHERE name = '����������������'
        ),
        (
            SELECT id
            FROM PRIORITY
            WHERE name = '�������'
        ),
        '������������� ������� 4',
        '��� ��� �� ������� 4!',
        TO_DATE('01.02.2014', 'dd.mm.yyyy'),
        TO_DATE('01.03.2014', 'dd.mm.yyyy'),
        NULL
);
INSERT INTO Task(id, id_project, id_type, id_priority, title, description, start_date, plan_finish_date, actual_finish_date)
VALUES (TASK_SEQ.NEXTVAL, 
        (
            SELECT id
            FROM Project 
            WHERE title = '�������������� ��������� ������� ����'
        ),
        (
            SELECT id
            FROM Type
            WHERE name = '����������������'
        ),
        (
            SELECT id
            FROM Priority
            WHERE name = '�������'
        ),
        '������� ��� 11 ������� ����� � ����',
        '������� ���-������ ����� � ����',
        TO_DATE('01.01.2019', 'dd.mm.yyyy'),
        TO_DATE('01.05.2019', 'dd.mm.yyyy'),
        TO_DATE('01.05.2019', 'dd.mm.yyyy')
);
INSERT INTO Task(id, id_project, id_type, id_priority, title, description, start_date, plan_finish_date, actual_finish_date)
VALUES (TASK_SEQ.NEXTVAL, 
        (
            SELECT id
            FROM Project 
            WHERE title = '�������������� ��������� ������� ����'
        ),
        (
            SELECT id
            FROM Type
            WHERE name = '����������������'
        ),
        (
            SELECT id
            FROM Priority
            WHERE name = '�������'
        ),
        '������� ��� 11 �������',
        '������� ���-������',
        TO_DATE('01.01.2019', 'dd.mm.yyyy'),
        TO_DATE('01.05.2019', 'dd.mm.yyyy'),
        TO_DATE('01.02.2019', 'dd.mm.yyyy')
);
INSERT INTO Task(id, id_project, id_type, id_priority, title, description, start_date, plan_finish_date, actual_finish_date)
VALUES (TASK_SEQ.NEXTVAL, 
        (
            SELECT id
            FROM Project 
            WHERE title = '�������������� ��������� ������� ����'
        ),
        (
            SELECT id
            FROM Type
            WHERE name = '����������������'
        ),
        (
            SELECT id
            FROM Priority
            WHERE name = '�������'
        ),
        '������ ��� �����',
        '����������������� ����� ����� �� ��������� �� ��',
        TO_DATE('01.01.2019', 'dd.mm.yyyy'),
        TO_DATE('01.02.2019', 'dd.mm.yyyy'),
        TO_DATE('05.02.2019', 'dd.mm.yyyy')
);
INSERT INTO Task(id, id_project, id_type, id_priority, title, description, start_date, plan_finish_date, actual_finish_date)
VALUES (TASK_SEQ.NEXTVAL, 
        (
            SELECT id
            FROM Project 
            WHERE title = '�������������� ��������� ������� ����'
        ),
        (
            SELECT id
            FROM Type
            WHERE name = '������������'
        ),
        (
            SELECT id
            FROM Priority
            WHERE name = '������'
        ),
        '������ ��� ������������ ����',
        '�������������� �������, ����� ��� �������� ������',
        TO_DATE('01.05.2019', 'dd.mm.yyyy'),
        TO_DATE('01.10.2019', 'dd.mm.yyyy'),
        NULL
);
INSERT INTO Task(id, id_project, id_type, id_priority, title, description, start_date, plan_finish_date, actual_finish_date)
VALUES (TASK_SEQ.NEXTVAL, 
        (
            SELECT id
            FROM Project 
            WHERE title = '����� ������ ���������� ��� �����'
        ),
        (
            SELECT id
            FROM Type
            WHERE name = '������ � ��'
        ),
        (
            SELECT id
            FROM Priority
            WHERE name = '�������'
        ),
        '�� � ����',
        '�������������� ���� ������ � ��������� ��������� �������',
        TO_DATE('01.01.2021', 'dd.mm.yyyy'),
        TO_DATE('01.03.2021', 'dd.mm.yyyy'),
        TO_DATE('01.03.2021', 'dd.mm.yyyy')
);
INSERT INTO Task(id, id_project, id_type, id_priority, title, description, start_date, plan_finish_date, actual_finish_date)
VALUES (TASK_SEQ.NEXTVAL, 
        (
            SELECT id
            FROM Project 
            WHERE title = '���������� ��� �������� ���� � ��������'
        ),
        (
            SELECT id
            FROM Type
            WHERE name = '������������'
        ),
        (
            SELECT id
            FROM Priority
            WHERE name = '�������'
        ),
        '���� ��������',
        '�������������� ������ ���������� � ������� ��������, ����� ������ ��������',
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
            WHERE name = '������'
        ),
        '������',
        '��� ��� ����� ����� ������� �� ���������',
        TO_DATE('01.03.2003', 'dd.mm.yyyy'),
        TO_DATE('01.04.2003', 'dd.mm.yyyy'),
        TO_DATE('01.05.2003', 'dd.mm.yyyy')
);
INSERT INTO Task(id, id_project, id_type, id_priority, title, description, start_date, plan_finish_date, actual_finish_date)
VALUES (TASK_SEQ.NEXTVAL, 
        (
            SELECT id
            FROM Project 
            WHERE title = '���������� ��� ���� ����������'
        ),
        (
            SELECT id
            FROM Type
            WHERE name = '���������� �������'
        ),
        (
            SELECT id
            FROM Priority
            WHERE name = '�������'
        ),
        '�������� ������',
        '����� ������� ����, � ���� ��������',
        TO_DATE('01.03.2021', 'dd.mm.yyyy'),
        TO_DATE('01.06.2021', 'dd.mm.yyyy'),
        TO_DATE('01.05.2021', 'dd.mm.yyyy')
);


INSERT INTO TASK_ORDER(id, id_parent_task, id_child_task)
VALUES (TASK_ORDER_SEQ.NEXTVAL,
        (
            SELECT id
            FROM task
            WHERE title = '������ ��� �����'
        ),
        (
            SELECT id
            FROM task
            WHERE title = '������ ��� ������������ ����'
        )
);


INSERT INTO TASK_EMPLOYEE(id, id_employee, id_task, is_leader, impact_percent)
VALUES (TASK_EMPLOYEE_SEQ.NEXTVAL,
        (
            SELECT id
            FROM employee
            WHERE Surname = '������' AND Name = '��������' AND Patronymic = '����������'
        ),
        (
            SELECT id
            FROM Task
            WHERE title = '������ ��� �����'
        ),
        'N',
        10
);
INSERT INTO TASK_EMPLOYEE(id, id_employee, id_task, is_leader, impact_percent)
VALUES (TASK_EMPLOYEE_SEQ.NEXTVAL,
        (
            SELECT id
            FROM employee
            WHERE Surname = '������' AND Name = '�����' AND Patronymic = '����������'
        ),
        (
            SELECT id
            FROM Task
            WHERE title = '������ ��� �����'
        ),
        'N',
        10
);
INSERT INTO TASK_EMPLOYEE(id, id_employee, id_task, is_leader, impact_percent)
VALUES (TASK_EMPLOYEE_SEQ.NEXTVAL,
        (
            SELECT id
            FROM employee
            WHERE Surname = '������' AND Name = '����' AND Patronymic = '��������'
        ),
        (
            SELECT id
            FROM Task
            WHERE title = '������ ��� �����'
        ),
        'N',
        10
);
INSERT INTO TASK_EMPLOYEE(id, id_employee, id_task, is_leader, impact_percent)
VALUES (TASK_EMPLOYEE_SEQ.NEXTVAL,
        (
            SELECT id
            FROM employee
            WHERE Surname = '�������' AND Name = '������' AND Patronymic = '���������'
        ),
        (
            SELECT id
            FROM Task
            WHERE title = '������ ��� �����'
        ),
        'N',
        10
);
INSERT INTO TASK_EMPLOYEE(id, id_employee, id_task, is_leader, impact_percent)
VALUES (TASK_EMPLOYEE_SEQ.NEXTVAL,
        (
            SELECT id
            FROM employee
            WHERE Surname = '�����' AND Name = '����' AND Patronymic IS NULL
        ),
        (
            SELECT id
            FROM Task
            WHERE title = '������ ��� �����'
        ),
        'Y',
        80
);
INSERT INTO TASK_EMPLOYEE(id, id_employee, id_task, is_leader, impact_percent)
VALUES (TASK_EMPLOYEE_SEQ.NEXTVAL,
        (
            SELECT id
            FROM employee
            WHERE Surname = '������' AND Name = '����' AND Patronymic = '��������'
        ),
        (
            SELECT id
            FROM Task
            WHERE title = '������ ��� �����'
        ),
        'N',
        20
);
INSERT INTO TASK_EMPLOYEE(id, id_employee, id_task, is_leader, impact_percent)
VALUES (TASK_EMPLOYEE_SEQ.NEXTVAL,
        (
            SELECT id
            FROM employee
            WHERE Surname = '�����' AND Name = '����' AND Patronymic IS NULL
        ),
        (
            SELECT id
            FROM Task
            WHERE title = '������ ��� ������������ ����'
        ),
        'Y',
        100
);
INSERT INTO TASK_EMPLOYEE(id, id_employee, id_task, is_leader, impact_percent)
VALUES (TASK_EMPLOYEE_SEQ.NEXTVAL,
        (
            SELECT id
            FROM employee
            WHERE Surname = '������' AND Name = '����' AND Patronymic = '��������'
        ),
        (
            SELECT id
            FROM Task
            WHERE title = '�� � ����'
        ),
        'Y',
        30
);
INSERT INTO TASK_EMPLOYEE(id, id_employee, id_task, is_leader, impact_percent)
VALUES (TASK_EMPLOYEE_SEQ.NEXTVAL,
        (
            SELECT id
            FROM employee
            WHERE Surname = '������' AND Name = '����' AND Patronymic = '��������'
        ),
        (
            SELECT id
            FROM Task
            WHERE title = '�� � ����'
        ),
        'N',
        70
);
INSERT INTO TASK_EMPLOYEE(id, id_employee, id_task, is_leader, impact_percent)
VALUES (TASK_EMPLOYEE_SEQ.NEXTVAL,
        (
            SELECT id
            FROM employee
            WHERE Surname = '��������' AND Name = '�������' AND Patronymic = '����������'
        ),
        (
            SELECT id
            FROM Task
            WHERE title = '���� ��������'
        ),
        'Y',
        100
);
INSERT INTO TASK_EMPLOYEE(id, id_employee, id_task, is_leader, impact_percent)
VALUES (TASK_EMPLOYEE_SEQ.NEXTVAL,
        (
            SELECT id
            FROM employee
            WHERE Surname = '�����' AND Name = '����' AND Patronymic IS NULL
        ),
        (
            SELECT id
            FROM Task
            WHERE title = '������'
        ),
        'Y',
        100
);
INSERT INTO TASK_EMPLOYEE(id, id_employee, id_task, is_leader, impact_percent)
VALUES (TASK_EMPLOYEE_SEQ.NEXTVAL,
        (
            SELECT id
            FROM employee
            WHERE Surname = '��' AND Name = '�����' AND Patronymic IS NULL
        ),
        (
            SELECT id
            FROM Task
            WHERE title = '�������� ������'
        ),
        'Y',
        100
);


INSERT INTO TASK_STATUS(id, id_task, id_status, start_date, finish_date)
VALUES (TASK_STATUS_SEQ.NEXTVAL,
        (
            SELECT id
            FROM Task
            WHERE title = '������ ��� �����'
        ),
        (
            SELECT id
            FROM Status
            WHERE name = '�������'
        ),
        TO_DATE('01.01.2008', 'dd.mm.yyyy'),
        TO_DATE('01.01.2009', 'dd.mm.yyyy')
);
INSERT INTO TASK_STATUS(id, id_task, id_status, start_date, finish_date)
VALUES (TASK_STATUS_SEQ.NEXTVAL,
        (
            SELECT id
            FROM Task
            WHERE title = '������ ��� �����'
        ),
        (
            SELECT id
            FROM Status
            WHERE name = '������'
        ),
        TO_DATE('01.01.2009', 'dd.mm.yyyy'),
        TO_DATE('01.01.2010', 'dd.mm.yyyy')
);
INSERT INTO TASK_STATUS(id, id_task, id_status, start_date, finish_date)
VALUES (TASK_STATUS_SEQ.NEXTVAL,
        (
            SELECT id
            FROM Task
            WHERE title = '������ ��� �����'
        ),
        (
            SELECT id
            FROM Status
            WHERE name = '����������'
        ),
        TO_DATE('01.01.2010', 'dd.mm.yyyy'),
        NULL
);
INSERT INTO TASK_STATUS(id, id_task, id_status, start_date, finish_date)
VALUES (TASK_STATUS_SEQ.NEXTVAL,
        (
            SELECT id
            FROM Task
            WHERE title = '������ ��� ������������ ����'
        ),
        (
            SELECT id
            FROM Status
            WHERE name = '�������'
        ),
        TO_DATE('01.01.2010', 'dd.mm.yyyy'),
        TO_DATE('01.01.2011', 'dd.mm.yyyy')
);
INSERT INTO TASK_STATUS(id, id_task, id_status, start_date, finish_date)
VALUES (TASK_STATUS_SEQ.NEXTVAL,
        (
            SELECT id
            FROM Task
            WHERE title = '������ ��� ������������ ����'
        ),
        (
            SELECT id
            FROM Status
            WHERE name = '������'
        ),
        TO_DATE('01.01.2011', 'dd.mm.yyyy'),
        TO_DATE('01.01.2012', 'dd.mm.yyyy')
);
INSERT INTO TASK_STATUS(id, id_task, id_status, start_date, finish_date)
VALUES (TASK_STATUS_SEQ.NEXTVAL,
        (
            SELECT id
            FROM Task
            WHERE title = '������ ��� ������������ ����'
        ),
        (
            SELECT id
            FROM Status
            WHERE name = '����������'
        ),
        TO_DATE('01.01.2012', 'dd.mm.yyyy'),
        TO_DATE('01.01.2013', 'dd.mm.yyyy')
);
INSERT INTO TASK_STATUS(id, id_task, id_status, start_date, finish_date)
VALUES (TASK_STATUS_SEQ.NEXTVAL,
        (
            SELECT id
            FROM Task
            WHERE title = '������ ��� ������������ ����'
        ),
        (
            SELECT id
            FROM Status
            WHERE name = '������������'
        ),
        TO_DATE('01.01.2013', 'dd.mm.yyyy'),
        NULL
);
INSERT INTO TASK_STATUS(id, id_task, id_status, start_date, finish_date)
VALUES (TASK_STATUS_SEQ.NEXTVAL,
        (
            SELECT id
            FROM Task
            WHERE title = '�� � ����'
        ),
        (
            SELECT id
            FROM Status
            WHERE name = '�������'
        ),
        TO_DATE('01.01.2013', 'dd.mm.yyyy'),
        TO_DATE('01.01.2014', 'dd.mm.yyyy')
);
INSERT INTO TASK_STATUS(id, id_task, id_status, start_date, finish_date)
VALUES (TASK_STATUS_SEQ.NEXTVAL,
        (
            SELECT id
            FROM Task
            WHERE title = '�� � ����'
        ),
        (
            SELECT id
            FROM Status
            WHERE name = '������'
        ),
        TO_DATE('01.01.2014', 'dd.mm.yyyy'),
        TO_DATE('01.01.2015', 'dd.mm.yyyy')
);
INSERT INTO TASK_STATUS(id, id_task, id_status, start_date, finish_date)
VALUES (TASK_STATUS_SEQ.NEXTVAL,
        (
            SELECT id
            FROM Task
            WHERE title = '�� � ����'
        ),
        (
            SELECT id
            FROM Status
            WHERE name = '����������'
        ),
        TO_DATE('01.01.2015', 'dd.mm.yyyy'),
        TO_DATE('01.01.2016', 'dd.mm.yyyy')
);
INSERT INTO TASK_STATUS(id, id_task, id_status, start_date, finish_date)
VALUES (TASK_STATUS_SEQ.NEXTVAL,
        (
            SELECT id
            FROM Task
            WHERE title = '�� � ����'
        ),
        (
            SELECT id
            FROM Status
            WHERE name = '������������'
        ),
        TO_DATE('01.01.2016', 'dd.mm.yyyy'),
        TO_DATE('01.01.2017', 'dd.mm.yyyy')
);
INSERT INTO TASK_STATUS(id, id_task, id_status, start_date, finish_date)
VALUES (TASK_STATUS_SEQ.NEXTVAL,
        (
            SELECT id
            FROM Task
            WHERE title = '�� � ����'
        ),
        (
            SELECT id
            FROM Status
            WHERE name = '�������'
        ),
        TO_DATE('01.01.2017', 'dd.mm.yyyy'),
        NULL
);
INSERT INTO TASK_STATUS(id, id_task, id_status, start_date, finish_date)
VALUES (TASK_STATUS_SEQ.NEXTVAL,
        (
            SELECT id
            FROM Task
            WHERE title = '���� ��������'
        ),
        (
            SELECT id
            FROM Status
            WHERE name = '�������'
        ),
        TO_DATE('01.01.2018', 'dd.mm.yyyy'),
        NULL
);
INSERT INTO TASK_STATUS(id, id_task, id_status, start_date, finish_date)
VALUES (TASK_STATUS_SEQ.NEXTVAL,
        (
            SELECT id
            FROM Task
            WHERE title = '������'
        ),
        (
            SELECT id
            FROM Status
            WHERE name = '�������'
        ),
        TO_DATE('01.01.2019', 'dd.mm.yyyy'),
        NULL
);
INSERT INTO TASK_STATUS(id, id_task, id_status, start_date, finish_date)
VALUES (TASK_STATUS_SEQ.NEXTVAL,
        (
            SELECT id
            FROM Task
            WHERE title = '�������� ������'
        ),
        (
            SELECT id
            FROM Status
            WHERE name = '�������'
        ),
        TO_DATE('01.01.2020', 'dd.mm.yyyy'),
        NULL
);
