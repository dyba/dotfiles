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

## NeoTree Icons

```
SPC SPC package-install
```

Install the following packages:

```
all-the-icons
all-the-icons-ivy
all-the-icons-gnus
all-the-icons-dired
```

Install [these fonts](https://github.com/domtronn/all-the-icons.el/tree/master/fonts).
