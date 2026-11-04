#import "template.typ": project

#show: project.with(
  title: "論文題目",
  degree: "卒業論文", // 学位を記載(卒論なら卒業論文、修論なら修士学位論文)
  is-master: false, // 修論のときにtrueにすると主査・副査を記載できる
  author: "著者",
  student-id: "学籍番号",
  supervisor: "指導教員",
  sub-chief: ("副査1", "副査2"), // is-master: falseのときは記入不要
  affiliation: "所属学科",
  date: "提出日"
)

// 各章の読み込み
// src/ 配下にあるファイルをここに#includeして内容をPDFに反映させる
#include "src/sample.typ"
#include "src/01_backgrounds.typ"
#include "src/02_related_work.typ"
#include "src/03_methodology.typ"
#include "src/04_experiments.typ"
#include "src/05_result.typ"

// 参考文献はreferences.bibにまとめる
// ここではACSの引用フォーマットを適用(適宜変更してください)
#bibliography("references.bib", style: "american-chemical-society")
