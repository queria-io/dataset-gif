# dataset-gif

デジタル庁の[政府相互運用性フレームワーク（GIF）](https://www.digital.go.jp/policies/data_strategy_government_interoperability_framework)
が定める語彙を Queria のカタログ（[data.queria.io](https://data.queria.io/)）へ取り込むデータセットです。

Queria のデータセットは、列名と列の日本語名をこの語彙に揃えています。決め方は
[docs.queria.io のデータセットの規約](https://docs.queria.io/publish/conventions#列名)にあります。

## データ出典

GIF は GitHub（[digital-go-jp/GIF](https://github.com/digital-go-jp/GIF)）でタグを切って版を出します。
ビルドのたびに最新のタグを取り、次の Excel を表にします。取り込んだタグは `version` 列に入ります。

| 原典 | テーブル |
| --- | --- |
| `430_コアデータモデル/438_コアデータモデル_DMD.xlsx` | `vocab.term` |
| `430_コアデータモデル/438-1_コアデータモデル_コード一覧.xlsx` | `vocab.code` |
| `490_その他/491-2_コード_コード一覧_*.xlsx` | `vocab.code_system` |

解説書（docx）の本文は取り込みません。

GIF のリポジトリの LICENSE は CC0 1.0 ですが、配布物の XSD には CC BY 4.0 と書かれています。
どちらの読み方でも条件を満たすよう、CC BY 4.0 として出典（デジタル庁）を表示します。

## 収録テーブル

| テーブル | 内容 | 行数（v2.4） |
| --- | --- | ---: |
| `vocab.term` | コアデータモデルの項目。1行が1クラスの1項目 | 338 |
| `vocab.code` | コアデータモデルが使うコード一覧。1行が1コード一覧の1値 | 274 |
| `vocab.code_system` | 行政が使うコード体系の一覧。1行が1コード体系 | 702 |

`vocab.term.snake_case_name` は英語名を snake_case にしたもので、Queria の列名の候補になります。

```sql
SELECT class_name, term_ja, snake_case_name
FROM gif.vocab.term
WHERE term_ja LIKE '%郵便番号%';
```

## ビルド

```bash
git submodule update --init
uv sync
scripts/build.sh   # queria sync -- python main.py
```

毎月 3 日に GitHub Actions の Sync が回り、新しいタグがあれば取り込みます。
