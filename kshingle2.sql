create or replace function ksingle_no_dupl (doc1 bigint, doc2 bigint, ksh bigint) returns real as $$
select (select count(word) as acount from (
    (select word from test_schema.genetics
    where kshingle = ksh and document_id = doc1)
    intersect
    (select word from test_schema.genetics
    where kshingle = ksh and document_id = doc2)
) a) ::real
/
(select count(word) as acount from (
    (select word from test_schema.genetics
    where kshingle = ksh and document_id = doc1)
    union
    (select word from test_schema.genetics
    where kshingle = ksh and document_id = doc2)
) b) ::real;
$$ language sql;

select 'k = 2' as variant, ksingle_no_dupl from ksingle_no_dupl (79, 80, 2)
union select 'k = 5' as variant, ksingle_no_dupl from ksingle_no_dupl (79, 80, 5)
union select 'k = 9' as variant, ksingle_no_dupl from ksingle_no_dupl (79, 80, 9)
order by variant;