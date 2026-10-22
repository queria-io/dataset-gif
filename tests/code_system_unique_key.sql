-- code_system の 1 行は (field, item_number) で決まる
select field, item_number, count(*) as n
from {{ ref('code_system') }}
group by field, item_number
having count(*) > 1
