# homebrew-poac [![Build Status](https://travis-ci.com/poacpm/homebrew-poac.svg?branch=master)](https://travis-ci.com/poacpm/homebrew-poac)

## Installation
```bash
$ brew install poacpm/poac/poac
$ poac --help
```

## Contribution
```bash
$ git clone $THIS_REPO
$ cd homebrew-poac
#Invalidate ALIAS(alias cp='cp -i')
$ \cp -f poac.rb $(brew --repo)/Library/Taps/homebrew/homebrew-core/Formula/

$ brew tests
$ brew install --build-from-source poac
$ brew test poac
$ brew audit --strict poac
```
