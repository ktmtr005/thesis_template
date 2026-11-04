// タイトル付きの表紙を自動生成する関数
#let make-cover(
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
) = {
  // 表紙のみのページ設定（ヘッダー・フッター非表示）
  set page(
    paper: "a4",
    margin: (top: 40mm, bottom: 30mm, left: 20mm, right: 20mm),
    header: none,
    footer: none,
  )
  set text(size: 14pt)

  // 上下左右ともに中央揃えにする
  align(center + horizon)[
    #text(14pt)[#degree]
    #v(1cm)
    #text(16pt)[#title]
    #if sub-title != "" {
      v(0.5em)
      text(14pt)[#sub-title]
    }
    #v(1cm)
    #if is-master [
      指導教員
      #grid(
        columns: (auto, auto),
        gutter: 1.2em,
        align: (right, left),
        [主査:], [#supervisor],
        [副査:], [#sub-chief.at(0)],
        [副査:], [#sub-chief.at(1)],
      )
    ] else [
      #grid(
        columns: (auto, auto),
        gutter: 1.2em,
        align: (right, left),
        [指導教員:], [#supervisor]
      )
    ]
    #v(1cm)
    #date
    #v(1cm)
    #grid(
      columns: (auto, auto),
      gutter: 1.2em,
      align: (right, left),
      [所属:], [#affiliation],
      [著者:], [#author],
      [学籍番号:], [#student-id],
    )
  ]

  // 表紙の終わりで必ず改ページ
  pagebreak()
}
