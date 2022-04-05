# copyright (c) 2022, guillaume bury

FLAGS=
BINDIR=_build/install/default/bin

all: build

watch:
	dune build $(FLAGS) -w @check

build:
	dune build $(FLAGS) @install

top:
	dune utop

doc:
	dune build $(FLAGS) @doc

test: build
	dune exec -- fourever --db=test/fourever.sqlite

clean:
	dune clean

.PHONY: all watch dune doc test clean
