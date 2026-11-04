#import "cover.typ": make-cover

#let project(
  title: "",
  sub-title: "",
  degree: "",
  is-master: false,
  author: "",
  student-id: "",
  supervisor: "",
  sub-chief: ("", ""),
  affiliation: "",
  date: "",
  body,
) = {
  // PDFのメタデータ設定
  set document(
    title: title,
    author: author,
    date:auto
  )

  // ページ設定
  set page(
    paper: "a4",
    margin: (top: 40mm, bottom: 30mm, left: 20mm, right: 20mm),
    header: none,
  )

  // フォント設定
  let serif = ("Liberation Serif", "Noto Serif CJK JP")
  let sans-serif = ("Liberation Sans", "Noto Sans CJK JP")
  set text(
    font: serif,
    size: 10pt,
    lang: "ja",
  )

  // 段落設定
  set par(
    leading: 0.75em,
    justify: true,
    first-line-indent: (
      amount: 1em,
      all: true,
    ),
  )

  // 見出しの番号付け
  set heading(numbering: "1.1.")

  // 見出しの見た目カスタマイズ(ゴシック体にし、前後の余白を調整)
  show heading: it => {
    set text(font: sans-serif, weight: "bold")
    if it.level == 1 {
      v(1.2em, weak: true)
      text(size: 12pt, it)
      v(0.8em, weak: true)
    } else {
      v(1em, weak: true)
      text(size: 10.5pt, it)
      v(0.6em, weak: true)
    }
  }
  // 用語リストの用語部分をゴシック体にする
  show terms.item: it => {
    text(font: sans-serif, weight: "bold")[#it.term]
    [: ]
    it.description
  }

  make-cover(
    title: title,
    sub-title: sub-title,
    degree: degree,
    is-master: is-master,
    author: author,
    student-id: student-id,
    supervisor: supervisor,
    sub-chief: sub-chief,
    affiliation: affiliation,
    date: date,
  )

  // 目次設定
  counter(page).update(1)
  set page(numbering: "1")
  outline()
  pagebreak()

  body
}
