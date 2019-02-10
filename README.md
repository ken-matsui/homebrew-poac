# homebrew-poac
[![Build Status](https://travis-ci.com/poacpm/homebrew-poac.svg?branch=master)](https://travis-ci.com/poacpm/homebrew-poac)

## Install
```bash
$ brew install poacpm/poac/poac
$ poac --help
```

## Future
* `> 30 forks`
* `> 30 watchers`
* `> 75 stars`

When the above conditions are satisfied, tap becomes unnecessary.

Please refer to [this PR](https://github.com/Homebrew/homebrew-core/pull/31860) for details.


## Contribute
```bash
$ git clone $THIS_REPO
$ cd homebrew-poac
#Invalidate ALIAS(alias cp='cp -i')
$ \cp -f poac.rb $(brew --repo)/Library/Taps/homebrew/homebrew-core/Formula/

$ brew tests
$ brew install --build-from-source poac
$ brew test poac
$ brew audit --strict poac

$ brew bump-formula-pr  # Update command
```

