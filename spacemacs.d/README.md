# Spacemacs Configuration

## JavaScript

Set a default Node version using [nvm](https://github.com/creationix/nvm):

``` bash
nvm alias default 8.0.0
```

Install the necessary npm packages:

``` bash
npm install -g tern js-beautify eslint
```

## Source Code Tagging

```
brew install global --with-pygments --with-ctags
```

Then to generate tags on the project, `cd` to the correct directory of the project and:

```
gtags
```

If the language is not supported:

```
gtags --gtagslabel=pygments
```
