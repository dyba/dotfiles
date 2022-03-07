# Haskell Configuration

Install ghc first:

```
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
```

You may need to install the `x86_64` version if you're running on a Macbook laptop with an M1 chip:

```shell
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | arch -x86_64 /bin/bash
```

See [https://gitlab.haskell.org/haskell/ghcup-hs/-/issues/101](https://gitlab.haskell.org/haskell/ghcup-hs/-/issues/101)

Additionally, you'll need to install `brew install llvm@12` and then expose the following environment variables:

```shell
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
```

Install pretty-simple globally:

```
stack ghci --package pretty-simple
```

or

```
cabal repl --build-depends pretty-simple
```

Other dependencies:

```
stack install hlint
stack install hoogle
```

## Hoogle
You need to run the following command before you can Hoogle:

```
hoogle generate
```

## GHCi Options

```
stack ghci --ghci-options "-interactive-print=Text.Pretty.Simple.pPrint" --package pretty-simple 
```

This will take over the `print` command and pretty-print globally.

## Dependencies

- [pretty-simple](https://hackage.haskell.org/package/pretty-simple)

## Multiline Expressions

Use the `:{` `:}` syntax:

```
:{
x :: [Char]
x = "Hello World"
:}
```
