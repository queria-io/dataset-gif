{# コード体系の一覧（data/gif/code_system.csv）。取得したままの形 #}

select *
from read_csv('data/gif/code_system.csv', header = true, all_varchar = true)
