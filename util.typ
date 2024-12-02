#import "template.typ": *

#let h1(children, numbering: true, pageBreak: true) = {
  if (pageBreak) [#pagebreak()]
  set align(center)
  heading(
    upper(text(size: textSize, weight: "bold", children)),
    level: 1,
    numbering: if (numbering) {
      (..nums) => text(
        size: textSize,
        weight: "bold",
        prefixh1 + " " + nums.pos().map(str).join(".") + ".",
      )
    } else {
      none
    },
  )
}

#let h2(children) = {
  block(inset: (top: (0.5 * textSize)))
  heading(
    level: 2,
    numbering: (..nums) => text(size: textSize, weight: "bold", nums.pos().map(str).join(".") + "."),
    text(size: textSize, weight: "bold", children),
  )
  block(inset: (top: -(2 * textSize)))
  par("")
}

#let h3(children) = {
  block(inset: (top: (0.5 * textSize)))
  heading(
    level: 3,
    numbering: (..nums) => text(
      size: textSize,
      style: "italic",
      weight: "regular",
      h(1cm) + nums.pos().map(str).join(".") + ".",
    ),
    text(size: textSize, style: "italic", weight: "regular", children),
  )
}

#let h4(children) = {
  block(inset: (top: (0.5 * textSize)))
  heading(
    level: 4,
    numbering: (..nums) => text(
      size: textSize,
      style: "italic",
      weight: "regular",
      h(1cm) + nums.pos().map(str).join(".") + ".",
    ),
    text(size: textSize, style: "italic", weight: "regular", children),
  )
}

#let img(src, cap: "", width: 100%) = {
  src = "images/" + src
  figure(
    [
      #block(inset: (top: 0pt))
      #image(src, width: width)
      #block(inset: (top: -(1 * textSize)))
    ],
    caption: cap,
    supplement: "Hình",
  )
}

#let tabl(..fields, cap: false) = {
  if type(cap) == "string" {
    block(inset: (top: -(2 * textSize)))
    figure(placement: none, caption: cap, supplement: "Bảng", table())
    block(inset: (top: -(1 * textSize)))
  }
  table(inset: 10pt, align: left, ..fields)
}
