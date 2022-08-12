# This Makefile is _not_ required! It is only intended for advanced users.
#
# Usage:
#
# make create-switch - Make a local Opam switch
# make devtools - Install OCaml LSP

OCAMLVERSION=4.12.1
PACKAGENAME=your_example

all: install
.PHONY: all

## -----------------------------------------------------------
## BEGIN Opam and Dune basics

create-switch: _opam/.opam-switch/switch-config
devtools: _opam/bin/ocamllsp
.PHONY: create-switch devtools

_opam/.opam-switch/switch-config:
	opam switch create . $(OCAMLVERSION) \
	  --yes \
	  --deps-only \
	  --repo default=https://opam.ocaml.org

_opam/bin/dune: _opam/.opam-switch/switch-config
	OPAMSWITCH="$$PWD" && if [ -x /usr/bin/cygpath ]; then OPAMSWITCH=$$(/usr/bin/cygpath -aw "$$OPAMSWITCH"); fi && \
	  opam install dune --yes

$(PACKAGENAME).opam: dune-project _opam/bin/dune
	OPAMSWITCH="$$PWD" && if [ -x /usr/bin/cygpath ]; then OPAMSWITCH=$$(/usr/bin/cygpath -aw "$$OPAMSWITCH"); fi && \
	  eval $$(opam env) && \
	  dune build $@ && \
	  touch $@

_opam/bin/ocamllsp: _opam/.opam-switch/switch-config
	OPAMSWITCH="$$PWD" && if [ -x /usr/bin/cygpath ]; then OPAMSWITCH=$$(/usr/bin/cygpath -aw "$$OPAMSWITCH"); fi && \
	  opam install ocaml-lsp-server ocamlformat-rpc --yes

## END Opam and Dune basics
## -----------------------------------------------------------

## -----------------------------------------------------------
## BEGIN Opam Regular

build: $(PACKAGENAME).opam _opam/bin/dune
	OPAMSWITCH="$$PWD" && if [ -x /usr/bin/cygpath ]; then OPAMSWITCH=$$(/usr/bin/cygpath -aw "$$OPAMSWITCH"); fi && \
	  eval $$(opam env) && \
	  dune build
.PHONY: build

install: _opam/.opam-switch/switch-config
	OPAMSWITCH="$$PWD" && if [ -x /usr/bin/cygpath ]; then OPAMSWITCH=$$(/usr/bin/cygpath -aw "$$OPAMSWITCH"); fi && \
	  opam install . --yes
.PHONY: install

## END Opam Regular
## -----------------------------------------------------------
