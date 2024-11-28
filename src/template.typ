#let textSize = 14pt
#let tabSize = 1cm
#let prefixh1 = "CHƯƠNG"

#let template(body) = {
  set page("a4", margin: (top: 2cm, right: 2cm, bottom: 2cm, left: 3cm))

  set text(size: textSize, font: ("Times New Roman"), fallback: false, region: "VN")

  set block(inset: 0pt, outset: 0pt, above: 0pt, below: 1.5 * textSize)

  set par(
        justify: true,
        leading: textSize, // 1.5 lines
        first-line-indent: tabSize,
    )

  set list(
    indent: tabSize,
    body-indent: .75em,
    marker: ([•], [◦], [--]),
    tight: true,
  )

  set enum(
    indent: tabSize,
    body-indent: .75em,
    tight: true,
  )

  show heading: it => {
    block(inset: (top: -(1 * textSize)))
    it
    block(inset: (top: -(2.5 * textSize)))
    par("")
  }

  show list: it => {
    block(inset: (top: -(0.25 * textSize)))
    set par(hanging-indent: -(2 * tabSize - 1.5em))
    it
    block(inset: (top: -(3 * textSize)))
    par("")
  }

  show enum: it => {
    block(inset: (top: -(0.25 * textSize)))
    set par(hanging-indent: -(2 * tabSize - 0.75em))
    it
    block(inset: (top: -(3 * textSize)))
    par("")
  }

  show figure: it => {
    it
    block(inset: (top: -(3 * textSize)))
    par("")
  }

  show table: it => {
    it
    block(inset: (top: -(3 * textSize)))
    par("")
  }

  show raw.where(block: true): it => {
    block(inset: (top: 0pt))
    set par(justify: false, leading: 8pt)
    set text(size: 8pt)
    grid(
      columns: (100%, 100%),
      column-gutter: -100%,
      block(radius: 0em, fill: luma(246), stroke: 1pt, width: 100%, inset: 1em, it),
    )
    block(inset: (top: -(3 * textSize)))
    par("")
  }

  show bibliography: it => {
    block(inset: (top: (textSize)))
    set text(lang: "vi", region: "VN")
    it
  }

  body
}