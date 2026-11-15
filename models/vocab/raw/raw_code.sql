{# コアデータモデルのコード一覧（data/gif/code.csv）。取得したままの形 #}

select *
from read_csv('data/gif/code.csv', header = true, all_varchar = true)
