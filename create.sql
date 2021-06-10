DROP TABLE task_order;
DROP TABLE task_employee;
DROP TABLE task_status;
DROP TABLE task;
DROP TABLE priority;
DROP TABLE type;
DROP TABLE status;
DROP TABLE project_manager;
DROP TABLE project;
DROP TABLE job_contract;
DROP TABLE employee;
DROP TABLE position;


DROP SEQUENCE task_order_seq;
DROP SEQUENCE task_employee_seq;
DROP SEQUENCE task_status_seq;
DROP SEQUENCE task_seq;
DROP SEQUENCE priority_seq;
DROP SEQUENCE type_seq;
DROP SEQUENCE position_seq;
DROP SEQUENCE status_seq;
DROP SEQUENCE project_manager_seq;
DROP SEQUENCE project_seq;
DROP SEQUENCE employee_seq;
DROP SEQUENCE job_contract_seq;


CREATE SEQUENCE task_order_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 999999
NOCYCLE;

CREATE SEQUENCE task_employee_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 999999
NOCYCLE;

CREATE SEQUENCE task_status_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 999999
NOCYCLE;

CREATE SEQUENCE task_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 999999
NOCYCLE;

CREATE SEQUENCE priority_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 99
NOCYCLE;

CREATE SEQUENCE type_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 99
NOCYCLE;

CREATE SEQUENCE position_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 99
NOCYCLE;

CREATE SEQUENCE status_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 99
NOCYCLE;

CREATE SEQUENCE project_manager_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 999999
NOCYCLE;

CREATE SEQUENCE project_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 999999
NOCYCLE;

CREATE SEQUENCE employee_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 999999
NOCYCLE;

CREATE SEQUENCE job_contract_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 999999
NOCYCLE;


CREATE TABLE type(
    id                  NUMBER(2),
    name                NVARCHAR2(30) NOT NULL
);


CREATE TABLE priority (
    id                  NUMBER(2),
    name                NVARCHAR2(30) NOT NULL
);

CREATE TABLE status (
    id                  NUMBER(2),
    name                NVARCHAR2(30) NOT NULL
);


CREATE TABLE position (
    id                  NUMBER(2),
    name                NVARCHAR2(50) NOT NULL
);

CREATE TABLE employee (
    id                  NUMBER(6),
    surname             NVARCHAR2(30) NOT NULL,
    name                NVARCHAR2(20) NOT NULL,
    patronymic          NVARCHAR2(20),
    birthdate           DATE
);


CREATE TABLE job_contract (
    id                  NUMBER(6),
    id_employee         NUMBER(6) NOT NULL,
    id_position         NUMBER(6) NOT NULL,
    start_date          DATE DEFAULT SYSDATE NOT NULL,
    finish_date         DATE
);


CREATE TABLE project (
    id                  NUMBER(6),
    title               NVARCHAR2(70) NOT NULL,
    description         NVARCHAR2(500) NOT NULL,
    start_date          DATE DEFAULT SYSDATE NOT NULL,
    short_title         NVARCHAR2(20)
);


CREATE TABLE project_manager (
    id                  NUMBER(6),
    id_manager          NUMBER(6) NOT NULL,
    id_project          NUMBER(6) NOT NULL,
    start_date          DATE DEFAULT SYSDATE NOT NULL,
    finish_date         DATE
);


CREATE TABLE task (
    id                  NUMBER(6),
    id_project          NUMBER(6) NOT NULL,
    id_type             NUMBER(6) NOT NULL,
    id_priority         NUMBER(6) NOT NULL,
    title               NVARCHAR2(50) NOT NULL,
    description         NVARCHAR2(100) NOT NULL,
    start_date          DATE DEFAULT SYSDATE NOT NULL,
    plan_finish_date    DATE NOT NULL,
    actual_finish_date  DATE
);


CREATE TABLE task_order (
    id                  NUMBER(6),
    id_parent_task      NUMBER(6) NOT NULL,
    id_child_task       NUMBER(6) NOT NULL
);


CREATE TABLE task_employee (
    id                  NUMBER(6),
    id_employee         NUMBER(6) NOT NULL,
    id_task             NUMBER(6) NOT NULL,
    is_leader           CHAR(1) DEFAULT 'N' NOT NULL,
    impact_percent      NUMBER(3) DEFAULT 100 NOT NULL
);


CREATE TABLE task_status (
    id                  NUMBER(6),
    id_task             NUMBER(6) NOT NULL,
    id_status           NUMBER(6) NOT NULL,
    start_date          DATE DEFAULT SYSDATE NOT NULL,
    finish_date         DATE
);


ALTER TABLE type
ADD (
    CONSTRAINT type_pk PRIMARY KEY (id)
    )
ADD (
    CONSTRAINT type_ak UNIQUE (name)
    );

ALTER TABLE priority
ADD (
    CONSTRAINT priority_pk PRIMARY KEY (id)
    )
ADD (
    CONSTRAINT priority_ak UNIQUE (name)
    );

ALTER TABLE status
ADD (
    CONSTRAINT status_pk PRIMARY KEY (id)
    )
ADD (
    CONSTRAINT status_ak UNIQUE (name)
    );

ALTER TABLE position
ADD (
    CONSTRAINT position_pk PRIMARY KEY (id)
    )
ADD (
    CONSTRAINT position_ak UNIQUE (name)
    );

ALTER TABLE employee
ADD (
    CONSTRAINT employee_pk PRIMARY KEY (id)
    )
ADD (
    CONSTRAINT emp_age_above_18 CHECK(birthdate IS NULL OR birthdate <= TO_DATE('07.03.2003', 'dd.mm.yyyy'))
    )
ADD (
    CONSTRAINT emp_age_under_100 CHECK(birthdate IS NULL OR birthdate >= TO_DATE('07.03.1921', 'dd.mm.yyyy'))
    )
ADD (
    CONSTRAINT employee_ak UNIQUE (name, surname, patronymic)
    );

ALTER TABLE job_contract
ADD (
    CONSTRAINT job_contract_pk PRIMARY KEY (id)
    )
ADD (
    CONSTRAINT jc_employee_fk FOREIGN KEY (id_employee)
        REFERENCES employee(id)
    )
ADD (
    CONSTRAINT jc_position_fk FOREIGN KEY (id_position)
        REFERENCES position(id)
    )
ADD (
    CONSTRAINT jc_start_date_earlier_than_now CHECK(start_date <= TO_DATE('07.03.2021', 'dd.mm.yyyy'))
    )
ADD (
    CONSTRAINT jc_finish_date_null_or_later_than_start_date CHECK (finish_date IS NULL OR finish_date > start_date)
    )
ADD (
    CONSTRAINT job_contract_ak UNIQUE (id_employee, id_position, start_date)
    );

ALTER TABLE project
ADD (
    CONSTRAINT project_pk PRIMARY KEY (id)
    )
ADD (
    CONSTRAINT project_ak UNIQUE (title)
    )
ADD (
    CONSTRAINT prj_start_date_earlier_than_now CHECK(start_date <= TO_DATE('07.03.2021', 'dd.mm.yyyy'))
    );

ALTER TABLE project_manager
ADD (
    CONSTRAINT project_manager_pk PRIMARY KEY (id)
    )
ADD (
    CONSTRAINT pm_manager_fk FOREIGN KEY (id_manager)
        REFERENCES employee(id)
    )
ADD (
    CONSTRAINT pm_project_fk FOREIGN KEY (id_project)
        REFERENCES project(id)
    )
ADD (
    CONSTRAINT pm_start_date_earlier_than_now CHECK(start_date <= TO_DATE('07.03.2021', 'dd.mm.yyyy'))
    )
ADD (
    CONSTRAINT project_manager_ak UNIQUE (id_manager, id_project, start_date)
    );

ALTER TABLE task
ADD (
    CONSTRAINT task_pk PRIMARY KEY (id)
    )
ADD (
    CONSTRAINT tsk_project_fk FOREIGN KEY (id_project)
        REFERENCES project(id)
    )
ADD (
    CONSTRAINT tsk_type_fk FOREIGN KEY (id_type)
        REFERENCES type(id)
    )
ADD (
    CONSTRAINT tsk_priority_fk FOREIGN KEY (id_priority)
        REFERENCES priority(id)
    )
ADD (
    CONSTRAINT task_ak UNIQUE (id_project, title)
    )
ADD (
    CONSTRAINT tsk_start_date_earlier_than_now CHECK(start_date <= TO_DATE('07.03.2021', 'dd.mm.yyyy'))
    )
ADD (
    CONSTRAINT tsk_plan_date_after_start_date CHECK (start_date < plan_finish_date)
    )
ADD (
    CONSTRAINT tsk_actual_date_null_or_after_start_date CHECK (actual_finish_date IS NULL OR start_date < actual_finish_date)
    );


ALTER TABLE task_order
ADD (
    CONSTRAINT task_order_pk PRIMARY KEY (id)
    )
ADD (
    CONSTRAINT tord_parent_task_fk FOREIGN KEY (id_parent_task)
        REFERENCES task(id)
    )
ADD (
    CONSTRAINT tord_child_task_fk FOREIGN KEY (id_child_task)
        REFERENCES task(id)
    )
ADD (
    CONSTRAINT task_order_ak UNIQUE (id_parent_task, id_child_task)
    )
ADD (
    CONSTRAINT tord_child_is_not_parent CHECK(id_child_task <> id_parent_task)
    );


ALTER TABLE task_employee
ADD (
    CONSTRAINT task_employee_pk PRIMARY KEY (id)
    )
ADD (
    CONSTRAINT temp_task_fk FOREIGN KEY (id_task)
        REFERENCES task(id)
    )
ADD (
    CONSTRAINT temp_employee_fk FOREIGN KEY (id_employee)
        REFERENCES employee(id)
    )
ADD (
    CONSTRAINT task_employee_ak UNIQUE (id_employee, id_task)
    )
ADD (
    CONSTRAINT temp_is_leader_correct_char CHECK(is_leader IN ('Y', 'N'))
    )
ADD (
    CONSTRAINT temp_is_correct_percent CHECK(impact_percent BETWEEN 0 AND 100)
    );


ALTER TABLE task_status
ADD (
    CONSTRAINT task_status_pk PRIMARY KEY (id)
    )
ADD (
    CONSTRAINT tskst_task_fk FOREIGN KEY (id_task)
        REFERENCES task(id)
    )
ADD (
    CONSTRAINT tskst_status_fk FOREIGN KEY (id_status)
        REFERENCES status(id)
    )
ADD (
    CONSTRAINT tskst_start_date_earlier_than_now CHECK(start_date <= TO_DATE('07.03.2021', 'dd.mm.yyyy'))
    )
ADD (
    CONSTRAINT tskst_finish_date_null_or_later_than_start CHECK(finish_date IS NULL OR finish_date > start_date)
    )
ADD (
    CONSTRAINT task_status_ak UNIQUE (id_task, id_status, start_date)
    );
