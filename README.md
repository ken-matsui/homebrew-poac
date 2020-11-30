# homebrew-tap

[![GitHub Actions Homebrew](https://github.com/poacpm/homebrew-tap/workflows/Homebrew/badge.svg?branch=master)](https://github.com/poacpm/homebrew-tap/actions?query=workflow%3A%22Homebrew%22)

## Installation with tapping
```bash
$ brew tap poacpm/tap
$ brew install (poac|toml11|clipp)
```

## Installation without executing tap command
```bash
$ brew install poacpm/tap/(poac|toml11|clipp)
```

## Future
* `> 30 forks`
* `> 30 watchers`
* `> 75 stars`

When the above conditions are satisfied, tap becomes unnecessary.

Please refer to [this PR](https://github.com/Homebrew/homebrew-core/pull/31860) for details.


## Contribute
```bash
$ git clone git@github.com:poacpm/homebrew-tap.git
$ cd homebrew-tap
#Invalidate ALIAS(alias cp='cp -i')
$ \cp -f Formula/poac.rb $(brew --repo)/Library/Taps/homebrew/homebrew-core/Formula/

$ brew tests
$ brew install --build-from-source poac
$ brew test poac
$ brew audit --strict poac

$ brew bump-formula-pr  # Update command
```
