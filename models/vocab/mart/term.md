---
$schema: https://queria.io/schemas/table/v1.json
table: vocab.term
title: コアデータモデルの項目
description: |-
  GIF のコアデータモデルの項目です。1 行が 1 クラス（個人・法人・住所・施設など）の 1 項目です。

  - 同じ英語名（name など）が複数のクラスに出てきます
  - 拡張項目（section = extension）は item_number が NULL です
sources:
  - path: https://github.com/digital-go-jp/GIF/tree/main/430_コアデータモデル
fields:
  - name: version
    title: バージョン
    description: 取り込んだ GIF のタグ（v2.4 など）
  - name: source_path
    title: 取り込み元のファイル
  - name: class_name
    title: クラス
    description: 原典のシート名。個人・法人・住所・施設など
  - name: section
    title: 区分
    description: base（基礎項目）か extension（拡張項目）
  - name: item_number
    title: 項目番号
    description: クラスの中の原典の No.。拡張項目は NULL
  - name: term_ja
    title: 項目名
  - name: term_en
    title: 項目名（英語）
    description: 原典の英語名（camelCase）
  - name: snake_case_name
    title: 項目名（snake_case）
    description: term_en を snake_case にしたもの。Queria の列名の基準
  - name: description
    title: 説明
  - name: format
    title: 形式
    description: "文字列・数値など。pcd: で始まるものは vocab.code を指します"
  - name: example
    title: 記入例
  - name: reference
    title: 参考元
    description: 名称や形式の参考にした語彙（IMI、schema.org など）
  - name: source_sheet
    title: 元のシート
    description: この行を読んだ Excel のシート名です
  - name: source_row
    title: 元の行番号
    description: この行を読んだシートの行番号です（Excel の行番号と同じ、1 始まり）
  - name: source_sha256
    title: 元のファイルの SHA-256
    description: この行を読んだファイルの SHA-256 です。source_file の sha256 に当たります
---
