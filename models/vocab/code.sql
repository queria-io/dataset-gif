{# GIF のコアデータモデルのコード一覧（438-1_コアデータモデル_コード一覧.xlsx）。1行が1コード一覧の1値。
   pipelines/gif.py が最新のタグから data/gif/code.csv に書き出す。 #}

select
    version,
    source_path,
    cast(code_list_no as integer) as code_list_no,
    code_list_name,
    code_list_name_en,
    code,
    value,
    nullif(description, '') as description
from read_csv('data/gif/code.csv', header = true, all_varchar = true)
