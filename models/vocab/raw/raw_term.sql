{# コアデータモデルの項目（data/gif/term.csv）。取得したままの形 #}

select *
from read_csv('data/gif/term.csv', header = true, all_varchar = true)
