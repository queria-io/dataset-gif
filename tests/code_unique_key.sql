-- code の 1 行は (code_list_no, code) で決まる
select code_list_no, code, count(*) as n
from {{ ref('code') }}
group by code_list_no, code
having count(*) > 1
