alter table test_schema.metric 
add column var_name varchar,
add column formula varchar,
add column dependent boolean;

create table test_schema.metric_relation (
	id serial primary key,
	dep_id bigint not null,
	ref_id bigint not null
);
	
	
