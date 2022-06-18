# homebrew-poac

:warning: This formula for Poac has been merged into [homebrew-core](https://github.com/Homebrew/homebrew-core/pull/103610).
I strongly recommend installing Poac without using this tap.

[![GitHub Actions Homebrew](https://github.com/ken-matsui/homebrew-poac/workflows/Homebrew/badge.svg?branch=main)](https://github.com/ken-matsui/homebrew-poac/actions?query=workflow%3A%22Homebrew%22)

## Installation using tap

```bash
$ brew tap ken-matsui/poac
$ brew install poac
```

## Installation without tap

```bash
$ brew install ken-matsui/poac/poac
```

## Contribution

```bash
$ git clone https://github.com/ken-matsui/homebrew-poac.git
$ cd homebrew-poac
$ cp -f Formula/poac.rb $(brew --repo)/Library/Taps/homebrew/homebrew-core/Formula/

$ brew install --build-from-source --verbose --debug poac
$ brew test poac
$ brew audit --strict poac

$ brew bump-formula-pr poac --version=0.4.0
```
