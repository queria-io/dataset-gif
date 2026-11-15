{# GIF のコアデータモデルのコード一覧（438-1_コアデータモデル_コード一覧.xlsx）。1行が1コード一覧の1値。
   pipelines/gif.py が最新のタグから data/gif/code.csv に書き出す。 #}

select
    version,
    source_path,
    cast(code_list_no as integer) as code_list_no,
    code_list_name,
    code_list_name_en,
    nullif(code_list_description, '') as code_list_description,
    code,
    value,
    nullif(description, '') as description,
    source_sheet,
    cast(source_row as integer) as source_row
from {{ ref('raw_code') }}
