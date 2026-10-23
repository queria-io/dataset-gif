-- term の 1 行は (class_name, term_ja) で決まる
select class_name, term_ja, count(*) as n
from {{ ref('term') }}
group by class_name, term_ja
having count(*) > 1
