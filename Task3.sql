insert into test_schema.metric (name, value, uom) values
('Dollar', 60, 'Ruble'),
('Yen', 0.5, 'Ruble');

insert into test_schema.history (m_id, value) values
(1, 60),
(2, 0.5);

insert into test_schema.organization (name)
values ('Сбербанк'), ('АльфаБанк');

insert into test_schema.org_m (org_id, mertic_id, status, min_value, max_value)
values 
(1, 1, 'Active', 45.0, 75.0),
(1, 2, 'Active', 0.1, 1.0),
(2, 1, 'Active', 42.0, 68.0),
(2, 2, 'Retired', 0.3, 0.8);

insert into test_schema.users (name)
values ('Насибуллин Ильнур');

update test_schema.org_m
set min_value = 50.0
where org_id = 1 and metric_id = 1;

insert into test_schema.audit(org_m_id, user_id, old_min_value, old_max_value, old_status, new_min_value, new_max_value, new_status)
values (1, 1, 45.0, 75.0, 1, 50.0, 75.0, 1);
