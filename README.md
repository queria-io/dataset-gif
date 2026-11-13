# 政府相互運用性フレームワーク（GIF）

デジタル庁の[政府相互運用性フレームワーク（GIF）](https://www.digital.go.jp/policies/data_strategy_government_interoperability_framework)が定める語彙を、SQL で検索できるテーブルにしたデータセットです。データの項目名・英語名・説明・形式と、コード一覧、行政が使うコード体系の一覧を収録しています。

列名や項目の英語名を国の語彙に統一したいとき、あるコード（地方公共団体コード、法人番号、医療機関コードなど）の定義と配布元を探したいときに使います。Queria のデータセットは、列名と列の日本語名をこの語彙に統一しています。決め方は [docs.queria.io のデータセットの規約](https://docs.queria.io/publish/conventions#列名)にあります。

## 出典と利用条件

GIF は GitHub（[digital-go-jp/GIF](https://github.com/digital-go-jp/GIF)）でタグを付けてバージョンを出します。ビルドのたびに最新のタグを取得し、次の Excel を加工しています。取り込んだタグは `version` 列に入ります。

| 原典 | テーブル |
| --- | --- |
| `430_コアデータモデル/438_コアデータモデル_DMD.xlsx` | `vocab.term` |
| `430_コアデータモデル/438-1_コアデータモデル_コード一覧.xlsx` | `vocab.code` |
| `490_その他/491-2_コード_コード一覧_*.xlsx` | `vocab.code_system` |

- 解説書（docx）の本文は収録していません
- GIF のリポジトリの LICENSE は CC0 1.0 ですが、配布物の XSD には CC BY 4.0 と書かれています。どちらの読み方でも条件を満たすよう、CC BY 4.0 として出典（デジタル庁）を表示しています

## テーブル

| テーブル | 内容 | 行数（v2.4） |
| --- | --- | ---: |
| `vocab.term` | コアデータモデルの項目。1 行が 1 クラスの 1 項目 | 338 |
| `vocab.code` | コアデータモデルが使うコード一覧。1 行が 1 コード一覧の 1 値 | 274 |
| `vocab.code_system` | 行政が使うコード体系の一覧。1 行が 1 コード体系 | 702 |

## 使い方

郵便番号に関する項目:

```sql
SELECT class_name, term_ja, snake_case_name
FROM gif.vocab.term
WHERE term_ja LIKE '%郵便番号%';
```

`vocab.term.snake_case_name` は英語名を snake_case にしたもの（`localGovernmentCode` → `local_government_code`）で、Queria の列名の候補になります。

## 収録範囲の注意

- `vocab.term` には、基礎項目（`section = 'base'`）と、実装データモデルを設計するときに必要に応じて使う拡張項目（`'extension'`）があります。拡張項目には原典の No. がなく、`item_number` は NULL です
- `vocab.term` の `format` が `pcd:` で始まるものは、`vocab.code` のコード一覧を指します
- `vocab.code_system` はコードの値そのものを持ちません。同じ名前のコード体系が別の組織から出ている行があります（通貨コードなど）。原典はデジタル庁が検索で集めたもので、網羅的ではありません
- `vocab.code_system` の `item_number` は取り込み時に振り直した番号です。原典の通し番号は多くのシートで式になっていて値を持たないためです

## ビルド

```bash
git submodule update --init
uv sync
scripts/build.sh   # fdl checkout → python main.py → fdl commit
```

毎月 3 日に GitHub Actions の Sync が実行され、新しいタグがあれば取り込みます。
