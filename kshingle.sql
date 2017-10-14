create or replace function kshingle_dupl (doc1 bigint, doc2 bigint, ksh bigint) returns real as $$
select (select count(word) as acount from (
    (select word from test_schema.genetics
    where kshingle = ksh and document_id = doc1)
    intersect all
    (select word from test_schema.genetics
    where kshingle = ksh and document_id = doc2)
) a) ::real
/
(
(select count(word) as acount from (
    (select word from test_schema.genetics
    where kshingle = ksh and document_id = doc1)
    union all
    (select word from test_schema.genetics
    where kshingle = ksh and document_id = doc2)
) b) ::real
-
(select count(word) as acount from (
    (select word from test_schema.genetics
    where kshingle = ksh and document_id = doc1)
    intersect all
    (select word from test_schema.genetics
    where kshingle = ksh and document_id = doc2)
) b) ::real);
$$ language sql;

select 'k = 2' as variant, kshingle_dupl from kshingle_dupl (79, 80, 2)
union select 'k = 5' as variant, kshingle_dupl from kshingle_dupl (79, 80, 5)
union select 'k = 9' as variant, kshingle_dupl from kshingle_dupl (79, 80, 9)
order by variant;
