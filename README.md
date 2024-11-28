# Vietnam University Thesis In Typst

## Installation

### Typst

- Repository: [Typst GitHub](https://github.com/typst/typst)
- MacOS: `brew install typst`
- Windows: `winget install --id Typst.Typst`

## Editing

Use VSCode with the **Tinymist Typst** and **LaTeX Workshop** extensions for an enhanced editing experience.

### Export to PDF with File Watch

To continuously export the report to a `.pdf` file while monitoring for changes, use the following command:

```sh
typst watch --font-path fonts ./src/main.typ main.pdf
```

**Note:** If you are using the LaTeX Workshop extension, execute the command `LaTeX Workshop: Refresh all LaTeX viewers` and set LaTeX Workshop as the default viewer for `.pdf` files to automatically see updates.
