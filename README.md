# Typst 卒論・修論テンプレート

Typst で卒業論文や修士論文を執筆するためのテンプレートリポジトリです。
表紙の自動生成、目次、章ごとのファイル分割管理、BibTeX 形式の参考文献参照、TODO メモ機能などを備えています。

---

## 特徴

- **卒論・修論両対応**: フラグ (`is-master`) の切り替えで指導教員のみ／主査・副査両方の表紙レイアウトに対応
- **章ごとのファイル分割**: `src/` 配下に章別のファイルを作成し、`main.typ` でインポート可能
- **日本語組版対応**: 日本語フォント（明朝・ゴシック）や行間、字下げ、見出しスタイルを設定済み
- **参考文献管理**: BibTeX (`references.bib`) による引用・参考文献リスト生成
- **便利機能**: 執筆中のメモを残せる `#todo()` 関数や、Tinymist による LSP / プレビュー環境対応

---

## 前提条件

- [Typst CLI](https://github.com/typst/typst)（バージョン 0.11 以降推奨）
- 必要なフォント（デフォルト設定）:
  - 明朝体 / セリフ: `Liberation Serif`, `Noto Serif CJK JP`
  - ゴシック体 / サンセリフ: `Liberation Sans`, `Noto Sans CJK JP`
  ※お使いの環境に合わせて `template.typ` 内で変更可能です。

---

## ディレクトリ構成

```text
.
├── cover.typ            # 表紙レイアウト定義
├── template.typ         # ページ余白・フォント・見出しなどの全体スタイル定義
├── main.typ             # メインファイル（メタデータ設定や各章・参考文献の読み込み）
├── references.bib       # BibTeX形式の参考文献ファイル
├── figures/             # 図表画像ディレクトリ
│   └── sample.png
├── src/                 # 各章の原稿ファイル
│   ├── common.typ       # 共通関数・マクロ（#todo など）
│   ├── sample.typ       # サンプル（見出し・引用・図表・TODOの使い方）
│   ├── 01_backgrounds.typ
│   ├── 02_related_work.typ
│   ├── 03_methodology.typ
│   ├── 04_experiments.typ
│   └── 05_result.typ
└── README.md
```

---

## 使い方

### 1. 論文情報の設定 (`main.typ`)

`main.typ` の冒頭にある `project` 関数の引数を編集します。

```typst
#import "template.typ": project

#show: project.with(
  title: "論文題目",
  // sub-title: "副題（任意）",
  degree: "卒業論文",             // 卒論なら「卒業論文」、修論なら「修士学位論文」など
  is-master: false,               // true にすると主査・副査の表示に切り替わります
  author: "著者氏名",
  student-id: "学籍番号",
  supervisor: "指導教員氏名",
  sub-chief: ("副査1", "副査2"),   // is-master: true の場合のみ入力
  affiliation: "所属学科・専攻",
  date: "提出日"
)
```

### 2. 本文の執筆 (`src/`)

- 各章の原稿は `src/` 配下の `.typ` ファイルに記述します。
- `main.typ` 内で `#include "src/xx.typ"` を指定して読み込みます。

#### よく使う記法 (`src/sample.typ` 参照)

- **見出し**:
  ```typst
  = 第1章 はじめに
  == 背景
  === 従来研究の課題
  ```

- **図の挿入と参照**:
  ```typst
  #figure(
    image("../figures/sample.png", height: 3cm),
    caption: [サンプルの画像です],
  ) <fig1>

  // 本文での参照
  詳細は @fig1 を参照してください。
  ```

- **参考文献の引用**:
  `references.bib` に記載した引用キーを `@キー名` で引用します。
  ```typst
  Einstein の研究 @Einstein1905 によると...
  ```

- **TODO メモ**:
  各ファイル冒頭で `#import "common.typ": *` を読み込むことで、PDF 上に赤字でメモを残せます。
  ```typst
  #todo("ここに追記する")
  ```

---

## コンパイル方法

### CLI でのビルド

- **PDF の生成**:
  ```bash
  typst compile main.typ
  ```

- **ファイルの変更監視（自動リロード・自動コンパイル）**:
  ```bash
  typst watch main.typ
  ```

### エディタ環境

- **VS Code**: [Tinymist Typst](https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist) 拡張機能の導入を推奨します（リアルタイムプレビューや補完が利用可能です）。
- その他のエディタでも、LSP（[Tinymist](https://github.com/Myriad-Dreamin/tinymist) 等）を導入することで快適に執筆できます。

---

## カスタマイズ

- **余白・フォントの変更**: `template.typ` の `set page(...)` や `set text(...)` を調整してください。
- **引用スタイル**: `main.typ` 末尾の `#bibliography("references.bib", style: "american-chemical-society")` の `style` 引数（例: `"ieee"`, `"apa"` など）を変更してください。
