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

db:
	dune build archive/gen.exe
	dune build -j 1 --no-buffer --display quiet archive/db.sqlite

test: build db
	dune exec -- fourever --db=_build/default/archive/db.sqlite

release:
	dune build $(FLAGS) --profile=release @install

clean:
	dune clean

.PHONY: all watch dune doc test clean
