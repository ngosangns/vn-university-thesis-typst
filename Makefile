FONT_PATH ?= .

.PHONY: build watch

build:
	typst compile --font-path $(FONT_PATH) main.typ main.pdf

watch:
	RUST_BACKTRACE=full typst watch --font-path $(FONT_PATH) main.typ main.pdf
