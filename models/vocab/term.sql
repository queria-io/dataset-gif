{# GIF のコアデータモデル（438_コアデータモデル_DMD.xlsx）の項目。1行が1クラスの1項目。
   pipelines/gif.py が最新のタグから data/gif/term.csv に書き出す。
   snake_case_name は英語名を snake_case にしたもので、Queria の列名の候補になる。 #}

select
    version,
    source_path,
    class_name,
    section,
    try_cast(nullif(no, '') as integer) as item_number,
    term_ja,
    term_en,
    lower(regexp_replace(term_en, '([a-z0-9])([A-Z])', '\1_\2', 'g')) as snake_case_name,
    nullif(description, '') as description,
    nullif(format, '') as format,
    nullif(example, '') as example,
    nullif(reference, '') as reference
from read_csv('data/gif/term.csv', header = true, all_varchar = true)
