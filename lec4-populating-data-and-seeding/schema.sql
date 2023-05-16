


create table users_sessions (
    id          integer primary key,
    first_name  varchar(50) not null,
    last_name   varchar(50) not null,
    email       varchar(255) not null,
    gender      varchar(20) not null,
    ip_address  varchar(20) not null
)

create table patients (
    id              serial primary key,
    last_name       varchar(50) not null,
    first_name      varchar(50) not null,
    birth_date      date not null,
    gender          varchar(20), -- male, female, other, unknown
    health_card     varchar(50),
    email           varchar(255),
    phone_number    varchar(20),
    street          varchar(255),
    apartment       varchar(10),
    city            varchar(50),
    province_state  varchar(50),
    zip_postal      varchar(50),
    country         varchar(50),
    emergency_contact_name  varchar(255),
    emergency_contact_phone varchar(20),
    social_insurance_number varchar(20),
    general_note    varchar(5000),
    check (birth_date <= CURRENT_TIMESTAMP),
    check (gender in ('male', 'female', 'non-binary', 'other', 'unknown'))
);
