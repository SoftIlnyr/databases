create table test_schema.metric (
	id serial primary key,
	name varchar not null,
	uom varchar not null,
	value float not null
);

create table test_schema.organization (
	id serial primary key,
	name varchar not null
);

create table test_schema.org_m (
	id serial primary key,
	org_id bigint not null references test_schema.organization (id),
	metric_id bigint not null references test_schema.metric (id),
	status varchar not null,
	min_value float not null,
	max_value float not null
);

create table test_schema.history (
	id serial primary key,
	m_id bigint not null references test_schema.metric (id),
	hist_date date not null default CURRENT_DATE,
	value float not null
);

create table test_schema.users (
	id serial primary key,
	name varchar not null,
	info varchar
);

create table test_schema.audit (
	id serial primary key,
	org_m_id bigint not null references test_schema.org_m (id),
	user_id bigint not null references test_schema.users (id),
	old_min_value float,
	old_max_value float,
	old_status varchar,
	new_min_value float,
	new_max_value float,
	new_status varchar
)
	


	
	
