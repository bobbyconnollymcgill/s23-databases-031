
-- Create the "Patient Registration" table
create table patients (
    id              serial primary key not null,
    last_name       varchar(50) not null,
    other_last_name varchar(50),
    first_name      varchar(50) not null,
    middle_name     varchar(50),
    birth_date      date not null,
    gender          varchar(20), -- male, female, other, unknown
    health_card     varchar(50),
    email           varchar(255),
    street          varchar(255),
    apartment       varchar(10),
    city            varchar(50),
    province_state  varchar(50),
    zip_postal      varchar(50),
    country         varchar(50),
    main_phone      varchar(20),
    work_phone      varchar(20),
    cell_phone      varchar(20),
    emergency_contact_name  varchar(255),
    emergency_contact_phone varchar(20),
    check (birth_date <= CURRENT_TIMESTAMP),
    check (gender in ('male', 'female', 'non-binary', 'other', 'unkown'))
);

-- Enforcing unique health_card numbers, but allowing multiple nulls
CREATE UNIQUE INDEX idx_health_card ON patients (health_card) WHERE health_card IS NOT NULL;

-- 1-to-1 relationship table
create table patient_other_infos (
    id              serial primary key not null,
    patient_id      integer references patients(id) unique,
    sin             varchar(20),
    notes           varchar(5000)
);