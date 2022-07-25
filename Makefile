# copyright (c) 2022, guillaume bury

FLAGS=
BINDIR=_build/install/default/bin

all: build

watch:
	dune build $(FLAGS) -w @check

lib:
	dune build $(FLAGS)

top:
	dune utop

doc:
	dune build $(FLAGS) @doc

build:
	dune build $(FLAGS) archive/gen.exe
	dune build $(FLAGS) -j 1 --no-buffer --display quiet archive/db.sqlite
	dune build $(FLAGS) @install

test: build
	dune exec -- fourever --db=_build/default/archive/db.sqlite

release:
	dune build $(FLAGS) --profile=release @install

clean:
	dune clean

.PHONY: all watch dune doc test clean
