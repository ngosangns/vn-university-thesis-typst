#let textSize = 14pt
#let tabSize = 1cm
#let listHang = 2 * tabSize - 1.5em
#let enumHang = 2 * tabSize - 0.75em
// Typst >= 0.13 ignores negative `par.hanging-indent`, so list/enum items are rebuilt:
// body shifted left by `hang` (via negative body-indent in `set list/enum`) and the
// first line pushed back with an explicit space. Nested lists are shifted back via a larger
// `indent` (pad/block around a nested list overlaps the parent line). Rebuilt lists carry <hung> so the `show list/enum` rules skip them.
// Nested items are still bare `list.item`/`enum.item` children at this stage
// (grouping into list/enum happens later), so consecutive runs are regrouped.
#let hung(kind, items, indent: tabSize) = {
  let nested(kind, items, h) = {
    block(inset: (top: -(0.25 * textSize)))
    hung(kind, items, indent: tabSize + h)
    block(inset: (top: -(3 * textSize)))
    par("")
  }
  {
    let h = if kind == list { listHang } else { enumHang }
    let bodies = items.map(c => {
      let kids = if c.body.has("children") { c.body.children } else { (c.body,) }
      let out = ()
      let run = ()
      let run-kind = none
      for x in kids {
        let f = x.func()
        // whitespace between sibling items must not end the run
        if run.len() > 0 and (f == parbreak or f == [ ].func()) { continue }
        let k = if f == list.item { list } else if f == enum.item { enum } else { none }
        if k != none and (run-kind == none or run-kind == k) {
          run.push(x)
          run-kind = k
        } else {
          if run.len() > 0 {
            out.push(nested(run-kind, run, h))
            run = ()
            run-kind = none
          }
          if k != none {
            run.push(x)
            run-kind = k
          } else {
            out.push(x)
          }
        }
      }
      if run.len() > 0 { out.push(nested(run-kind, run, h)) }
      (c, std.h(h) + out.join())
    })
    if kind == list {
      [#list(..bodies.map(p => list.item(p.at(1))), indent: indent)<hung>]
    } else {
      [#enum(..bodies.map(p => enum.item(p.at(0).number, p.at(1))), indent: indent)<hung>]
    }
  }
}
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

  // Typst >= 0.13 ignores negative `par.hanging-indent`. To keep the 0.12 look
  // (wrapped lines start `hang` to the left of the first line) the item body is
  // shifted left by `hang` and its first line is pushed back by an explicit space.
  set list(
    indent: tabSize,
    body-indent: .75em - listHang,
    marker: ([•], [◦], [--]),
    tight: true,
  )

  set enum(
    indent: tabSize,
    body-indent: .75em - enumHang,
    tight: true,
  )

  show heading: it => {
    block(inset: (top: -(1 * textSize)))
    it
    block(inset: (top: -(2.5 * textSize)))
    par("")
  }

  // Items are rebuilt once (label <hung>) with the body shifted left by `hang` and
  // the first line pushed back by an explicit space. See `set list` above.
  show list: it => {
    if it.at("label", default: none) == <hung> { return it }
    block(inset: (top: -(0.25 * textSize)))
    hung(list, it.children)
    block(inset: (top: -(3 * textSize)))
    par("")
  }

  show enum: it => {
    if it.at("label", default: none) == <hung> { return it }
    block(inset: (top: -(0.25 * textSize)))
    hung(enum, it.children)
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

  // Outline entries: flat layout (no hanging indent), dense dot leader, tight spacing
  set outline.entry(fill: repeat[.])
  show outline.entry: it => {
    set block(above: 0pt, below: textSize)
    set par(justify: false, first-line-indent: 0pt)
    link(
      it.element.location(),
      block(
        it.prefix() + if it.element.func() == figure { [:] } + [ ] + it.body() + sym.wj + std.h(0.1em) + sym.wj + box(width: 1fr, repeat[.]) + sym.wj + std.h(0.1em) + sym.wj + it.page(),
      ),
    )
  }

  show bibliography: it => {
    block(inset: (top: (textSize)))
    set text(lang: "vi", region: "VN")
    it
  }

  body
}