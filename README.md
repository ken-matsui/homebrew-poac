# homebrew-tap

[![GitHub Actions Homebrew](https://github.com/poacpm/homebrew-tap/workflows/Homebrew/badge.svg?branch=main)](https://github.com/poacpm/homebrew-tap/actions?query=workflow%3A%22Homebrew%22)

## Installation using tap

```bash
$ brew tap poacpm/tap
$ brew install poac
```

## Installation without tap

```bash
$ brew install poacpm/tap/poac
```

## Contribution

```bash
$ git clone https://github.com/poacpm/homebrew-tap.git
$ cd homebrew-tap
$ cp -f Formula/poac.rb $(brew --repo)/Library/Taps/homebrew/homebrew-core/Formula/

$ brew install --build-from-source --verbose --debug poac
$ brew test poac
$ brew audit --strict poac

$ brew bump-formula-pr poac --version=0.4.0
```
