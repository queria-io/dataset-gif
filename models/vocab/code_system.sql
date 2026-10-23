{# 行政が使うコード体系の一覧（491-2_コード_コード一覧_*.xlsx）。1行が1コード体系。
   pipelines/gif.py が最新のタグから data/gif/code_system.csv に書き出す。
   item_number は分野（シート）の中の並び順。原典の通し番号は式で、値を持たない。 #}

select
    version,
    source_path,
    field,
    cast(no as integer) as item_number,
    nullif(category, '') as category,
    name,
    nullif(data_url, '') as data_url,
    nullif(data_format, '') as data_format,
    nullif(description, '') as description,
    nullif(web_page, '') as web_page,
    nullif(publisher, '') as publisher
from read_csv('data/gif/code_system.csv', header = true, all_varchar = true)
