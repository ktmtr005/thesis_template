// 各typファイルで使いたい共通パッケージをここに記入
// import "common.typ: *"でここに書いたパッケージや関数を使える
// 仮のTODOコメントを記入(TODO: とPDF上に表示される)
#let todo(body) = text(fill: red, weight: "bold")[TODO: #body]
