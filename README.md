# homebrew-poac
[![Build Status](https://travis-ci.org/poacpm/homebrew-poac.svg?branch=master)](https://travis-ci.org/poacpm/homebrew-poac)

## Install
```bash
$ brew install poac
$ poac --help
```

## Contribute
```bash
$ git clone $THIS_REPO
$ cd homebrew-poac
# Invalidate ALIAS(alias cp='cp -i')
$ \cp -f poac.rb $(brew --repo)/Library/Taps/homebrew/homebrew-core/Formula/
$ brew audit poac --strict
$ brew test poac
$ brew ...(publish(PR) command)
```

