# Haskell Configuration

Install ghc first:

```
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
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
