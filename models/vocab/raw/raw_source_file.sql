{# 取得したファイルの記録 (data/gif/source_file.parquet、pipelines/source_file.py が書く)。取得したままの形 #}

select * from read_parquet('data/gif/source_file.parquet')
