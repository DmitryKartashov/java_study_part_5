

CREATE TABLE IF NOT EXISTS product_class
(
    id serial PRIMARY KEY ,
    value1 VARCHAR(100) UNIQUE NOT NULL,
    gbi_code VARCHAR(50),
    gbi_name VARCHAR(100),
    product_row_code VARCHAR(50),
    product_row_name VARCHAR(100),
    subclass_code VARCHAR(50),
    subclass_name VARCHAR(100)
);


CREATE TABLE IF NOT EXISTS product_register_type
(
    id serial PRIMARY KEY ,
    value1 VARCHAR(100) UNIQUE NOT NULL,
    register_type_code VARCHAR(100) UNIQUE NOT NULL,
    register_type_name VARCHAR(100),
    product_class_id BIGINT,
    account_type VARCHAR(100)
);

ALTER TABLE product_register_type
    ADD FOREIGN KEY (product_class_id) REFERENCES product_class (id);


CREATE TABLE IF NOT EXISTS register
(
    id serial PRIMARY KEY ,
    product_id BIGINT,
    type VARCHAR(100) NOT NULL,
    account_id BIGINT
);

ALTER TABLE register
    ADD FOREIGN KEY (type) REFERENCES product_register_type (value1);



CREATE TABLE IF NOT EXISTS account_pool(
                                           id serial PRIMARY KEY,
                                           branch_code VARCHAR(50),
                                           currency_code VARCHAR(30),
                                           mdm_code VARCHAR(50),
                                           priority_code VARCHAR(30),
                                           registry_type_code VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS account(
                                      id serial PRIMARY KEY,
                                      currency_iso_code VARCHAR(100),
                                      number VARCHAR(25),
                                      state VARCHAR(100),
                                      account_pool_id BIGINT
);

ALTER TABLE register
    ADD FOREIGN KEY (account_id) REFERENCES account (id);

ALTER TABLE account
    ADD FOREIGN KEY (account_pool_id) REFERENCES account_pool (id);


CREATE TABLE IF NOT EXISTS product
(
    id serial PRIMARY KEY,
    product_code_id BIGINT,
    client_id BIGINT,
    register_type_id BIGINT,
    number VARCHAR(50),
    priority BIGINT,
    date_of_conclusion TIMESTAMP,
    start_date_time TIMESTAMP,
    end_date_time TIMESTAMP,
    days BIGINT,
    penalty_rate DECIMAL,
    nso DECIMAL,
    threshold_amount DECIMAL,
    requisite_type VARCHAR(50),
    interest_rate_type VARCHAR(50),
    tax_rate DECIMAL,
    reason_close VARCHAR(100),
    state VARCHAR(50)
);

ALTER TABLE product
    ADD FOREIGN KEY (register_type_id) REFERENCES product_register_type (id);

ALTER TABLE register
    ADD FOREIGN KEY (product_id) REFERENCES product (id);

CREATE TABLE IF NOT EXISTS agreement
(
    id serial PRIMARY KEY,
    number VARCHAR(50),
    product_id BIGINT
);

ALTER TABLE agreement
    ADD FOREIGN KEY (product_id) REFERENCES product (id);
